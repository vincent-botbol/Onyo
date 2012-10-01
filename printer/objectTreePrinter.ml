open Struct_types
open AttributesPrinter
open MethodsPrinter
open EventsPrinter
open ValuesPrinter
open Labels
open ConstructorsPrinter

type object_to_print = {name:string; dependances:string list;
			constructor_type:string; constructor_implem:string;
			method_list_types:string list; method_list_implem:string list}

type elements_to_print = {mutable constructors_type:string list;
			  mutable constructors_implem:string list;
			  methods_type:string list;
			  methods_implem:string list}

(* Problème dans les hash 
   méthodes string / int / bool de même noms
   Solution : hasher par le nom
   si collision => rajouter le type devant
*)

let expand_objects_tree tree =
  let rec expand_rec meth_list attr_list handlers_list = 
    function
    | Node(Type (obj_name, obj_methods, obj_attributes, obj_handlers),forest)
    | Node(Type_gen (_, obj_name, obj_methods, obj_attributes, obj_handlers), forest) ->
      let meth_list = obj_methods@meth_list
      and attr_list = obj_attributes@attr_list
      and handlers_list = obj_handlers@handlers_list in
      Node(
	Type(obj_name, meth_list, attr_list, handlers_list),
	(List.map (expand_rec meth_list attr_list handlers_list) forest))
  in
  expand_rec [] [] [] tree

let add_or_replace hash key value =
  try
    let old_value = Hashtbl.find hash key in
    Hashtbl.replace hash key (value::old_value)
  with
    Not_found -> Hashtbl.add hash key [value]

(* Construit un hash de type =>
   key : Attribute(name, type, bool)
   value: obj_name list
*)
let build_properties_hash tree = 
  let properties_hash = Hashtbl.create 100 in
  let rec build_rec = 
    function Node(root, forest) ->
      match root with
	Type (obj_name, obj_methods, obj_attributes, obj_handlers)
      | Type_gen (_, obj_name, obj_methods, obj_attributes, obj_handlers) ->
	List.iter
	  (function Attribute(name,attr_type, bool) as elem ->
	    add_or_replace properties_hash elem (variant_label_object obj_name))
	  obj_attributes;
	List.iter build_rec forest
  in
  build_rec tree;
  properties_hash

let build_methods_hash tree = 
  let methods_hash = Hashtbl.create 100 in
  let rec build_rec = 
    function Node(root, forest) ->
      match root with
	Type (obj_name, obj_methods, obj_attributes, obj_handlers)
      | Type_gen (_, obj_name, obj_methods, obj_attributes, obj_handlers) ->
	List.iter
	  (function Method(name,list_type) as elem ->
	    add_or_replace methods_hash elem (variant_label_object obj_name))
	  obj_methods;
	List.iter build_rec forest
  in
  build_rec tree;
  methods_hash

let get_occurences hash = 
  let occ_hash = Hashtbl.create 100 in
  Hashtbl.iter 
    (fun key value ->
      match key with
      | Attribute(name, _, _) as key ->
	  try
	    let (key',nb) = Hashtbl.find occ_hash name in
	    Hashtbl.replace occ_hash name (key::key', nb+1)
	  with
	    Not_found -> Hashtbl.add occ_hash name ([key] , 1)
    )
    hash;
  Hashtbl.iter
    (fun key value ->
      match value with
	(l, i) when i > 1 ->
	  List.iter 
	    (function Attribute(name, attr_type, b) as key -> 
	      try
		let oldvalue = Hashtbl.find hash key in
		Hashtbl.add hash (Attribute(name^"_"^(hash_string_of_value attr_type), attr_type, b)) oldvalue;
		Hashtbl.remove hash key
	      with
		Not_found -> assert false
	    )
	    l
      | _ -> ()
    )
    occ_hash;
  ()
    
let show_occurences occ_hash =
  Hashtbl.iter
    (fun key value ->
      match value with
	(_, x) when x > 1 -> Printf.printf "%s\n" key
      | _ -> ()
    )
    occ_hash
     
let generate_methods_type_from_hash meth_hash attr_hash =
  (Hashtbl.fold (fun meth list_dep acc -> 
    (generate_method_type meth list_dep)::acc)
     meth_hash [])
  @
    (Hashtbl.fold (fun attr list_dep acc ->
      (generate_attribute_accessor_type attr list_dep)::acc) attr_hash [])

let generate_methods_implems_from_hash meth_hash attr_hash =
  (Hashtbl.fold (fun meth list_dep acc -> 
    (generate_method_implem meth)::acc)
     meth_hash [])
  @
    (Hashtbl.fold (fun attr list_dep acc ->
      (generate_attribute_implem attr)::acc) attr_hash [])

(* 
   todo :Chercher les occurences dans l'arbre du résultat, après la génération des méthodes
*)

(* strat 1 : 
   Faire une structure intermédiaire histoire de pallier à ça
   strat 2 :
   Modifier la génération des méthodes
*)


let build_dep = function Node(root, forest) as tree ->
  let expanded_tree = expand_objects_tree tree in
  let meth_hash = build_methods_hash expanded_tree (* ici *) 
  and attr_hash = build_properties_hash expanded_tree in (* là *)
  get_occurences attr_hash;
  let rec build_rec (Node(root, forest)) elems_to_print =
    (match root with
      Type (name, obj_methods, obj_attributes, obj_handlers) ->
	elems_to_print.constructors_type <- 
	  (generate_constructor_type name obj_attributes obj_handlers)::elems_to_print.constructors_type;
	elems_to_print.constructors_implem <- 
	  (generate_constructor_implem name obj_attributes obj_handlers)::elems_to_print.constructors_implem;

    | _ -> assert false);
    List.iter (fun x -> build_rec x elems_to_print) forest
  in
  let elems_to_print = {constructors_type=[];
			constructors_implem=[];
			methods_type=generate_methods_type_from_hash meth_hash attr_hash;
			methods_implem=generate_methods_implems_from_hash meth_hash attr_hash} in
  build_rec expanded_tree elems_to_print;
  elems_to_print

let rec get_all_ids = function Node(root, forest) ->
  match root with
    Type (name, obj_methods, obj_attributes, obj_handlers)
  | Type_gen (_, name, obj_methods, obj_attributes, obj_handlers) ->
    List.fold_left (fun acc x -> x@acc) 
      [(variant_label_object name)]
      (List.map get_all_ids forest)
