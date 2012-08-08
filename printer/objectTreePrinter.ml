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

let build_dep = function Node(root, forest) as tree ->
  let expanded_tree = expand_objects_tree tree in
  let meth_hash = build_methods_hash expanded_tree
  and attr_hash = build_properties_hash expanded_tree in
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

(* Todo : let get_all_ids = function Node(root,_) -> root.dependances*)

(*    
type elements_to_print = {constructors_type:string list;
			  constructors_implem:string list;
			  methods_type:string list;
			  methods_implem:string list}

type object_to_print = {name:string; dependances:string list;
			constructor_type:string; constructor_implem:string;
			method_list_types:string list; method_list_implem:string list}

(* Construit l'arbre de record de dépendance d'un arbre de représentation *)
(* objet_rep tree -> dependance tree *)
let build_dep = function tree ->
  let rec build_dep_rec full_attrs full_handlers = function (Node(root, forest)) ->
    match root with
      Type (name, obj_methods, obj_attributes, obj_handlers)
    | Type_gen (_, name, obj_methods, obj_attributes, obj_handlers) ->
      let full_attrs = obj_attributes@full_attrs
      and full_handlers = obj_handlers@full_handlers in
      let depforest = List.map (build_dep_rec full_attrs full_handlers) forest in
      let dependances = 
	let variant = variant_label_object name in
	List.fold_left
	  (fun acc x -> acc@x) [variant] 
	  (List.map (fun (Node(x,_)) -> x.dependances) depforest) in
      let meths_sig = 
	(List.map (fun x -> generate_method_type x dependances) obj_methods)
	@(List.map (fun x -> generate_attribute_accessor_type x dependances) obj_attributes)
      and meths_implem = 
	(List.map (generate_method_implem) obj_methods)
	@(List.map (generate_attribute_implem) obj_attributes)
      and cons_sig = generate_constructor_type name full_attrs full_handlers
      and cons_implem = generate_constructor_implem name full_attrs full_handlers in
      Node({name=name;
	    dependances=dependances;
	    constructor_type=cons_sig;
	    constructor_implem=cons_implem;
	    method_list_types=meths_sig;
	    method_list_implem=meths_implem},depforest) 
  in
  build_dep_rec [] [] tree
    
let get_all_ids = function Node(root,_) -> root.dependances
*)
