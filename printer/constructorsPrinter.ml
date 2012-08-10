open Struct_types
open AttributesPrinter
open EventsPrinter
open ValuesPrinter
open Labels

(*
  Generate a constructor signature and implementation based on an object_rep
*)

(***** SIGNATURE *****)


(* Generate attributes and handlers signatures options for the constructor
   generate_optionnal_parameters_type 
          "button"
          [Attribute("content", String, true)]
          [Handler ("ontap", Gesture_event._gesture)]
   =>
   "?content:string -> ?ontap:([ `BUTTON ] obj -> any_id obj -> [`GESTURE ] obj -> bool) 
   
   -> ?contentChanged:([`BUTTON] obj -> string -> unit) -> unit -> [> `BUTTON ] kind"
*)
(* generate_optionnal_parameters_type : string -> attributes_rep list -> handlers_rep list -> string *)
let generate_optionnal_parameters_type obj_name attributes handlers =
  let obj_name = if isAnOCamlKeyword obj_name then "_"^obj_name else obj_name in
  let attributes_type_string =
    List.map 
      (function Attribute(name, attr_type, bool) (*as x*) -> 
	let name = if isAnOCamlKeyword name then "_"^name else name in
	"?"^name^":"^(generate_values_type (attr_type::[]))(*^ 
	  (if bool then " -> "^generate_attribute_changed_method_type x obj_name else "")*)
      )
      attributes
  and handlers_type_string =
    List.map
      (function handler ->
	generate_handler_optionnal_type obj_name handler
      )
      handlers
  in
  String.concat "\n\t-> " (List.append attributes_type_string handlers_type_string)

let generate_constructor_type obj_name attributes handlers =
  let obj_name = replace_char obj_name '.' '_' in
  let variant_name = variant_label_object obj_name in
  let obj_name = String.lowercase obj_name in
  let obj_name = if isAnOCamlKeyword obj_name then "_"^obj_name else obj_name in
  "val "^obj_name^":\n\t?components:any_id kind list"^
    (if attributes = [] then "" else 
	"\n\t-> "^generate_optionnal_parameters_type obj_name attributes handlers)^
    "\n\t-> unit -> [>"^variant_name^"] kind"

(***** IMPLEMENTATION *****)

let generate_sum_equivalence attr_type = 
  match attr_type with
  | String -> "String"
  | Int -> "Int"
  | Float -> "Float"
  | Bool -> "Bool"
  | Unit -> "Unit"
  | Component -> "Component"
  | Array list_type -> "Array"
  | Dom_node -> "Dom_node"
  					   
(*

*)
let generate_match_property obj_name  = function
  |Attribute(attr_name, attr_type, bool) -> 
    let refactor_attr_name = if isAnOCamlKeyword attr_name then "_"^attr_name else attr_name in
    let init_list = constructor_init_list_label 
    and value_name = constructor_value_name_label in
    let sum_equivalence = generate_sum_equivalence attr_type in
    let couple_value = "(\""^attr_name^"\","^sum_equivalence^" "^value_name^")" (*and
	closure_name_value = "(\""^attr_name^"\", String ("^(closure_label_name obj_name)^"()))"*) in 
    "(match "^refactor_attr_name^" with Some "^value_name^" -> "^
      init_list^" := "^couple_value^"::!"^init_list^" | None -> "^

      (if attr_name = "name" then
	  (*debug*)
	  (*init_list^" := "^closure_name_value^"::!"^init_list^");"*)
	  "());"
       else
	  "());"
      )(*^
      (if bool then 
	  let attr_name = attr_name^"Changed" in
	  let couple_value = "Changed (\""^attr_name
	    ^"\", (fun this -> function ("^sum_equivalence^" y) ->"^value_name^" this y | _ -> assert false))"
	  and propchangedlist_label = constructor_propertyChanged_list_label in
	  "\n"^"(match "^refactor_attr_name^"Changed"^" with Some "^value_name^" -> "^propchangedlist_label^":="^
	    couple_value^"::!"^propchangedlist_label^" | None -> ());"
       else
	  ""
      )*)

let generate_match_handler obj_name  = function
  |Handler(hand_name, event) ->
    let hand_name = if isAnOCamlKeyword hand_name then "_"^hand_name else hand_name in
    let handler_list = constructor_handler_list_label 
    and value_name = constructor_value_name_label in
    let couple_value = "Handler (\""^hand_name^"\","^value_name^")" in
    "(match "^hand_name^" with Some "^value_name^" -> "^
      handler_list^" := "^couple_value^"::!"^handler_list^" | None -> ());\n"

let generate_optionnal_parameters obj_name attributes handlers =
  let attributes_type_string =
    List.map 
      (function Attribute(name, _, bool) ->
	let name = if isAnOCamlKeyword name then "_"^name else name in	
	"?"^name(*^
	  (if bool then " ?"^name^"Changed" else "")*)
      )
      attributes
  and handlers_type_string =
    List.map 
      (function Handler(name, _) ->
	let name = if isAnOCamlKeyword name then "_"^name else name in
	"?"^name
      )
      handlers
  in
  String.concat "\n\t" (List.append attributes_type_string handlers_type_string)
    

let generate_constructor_let obj_name attributes handlers =
  let obj_name = replace_dots obj_name in
  let obj_name = String.lowercase obj_name in
  let obj_name = if isAnOCamlKeyword obj_name then "_"^obj_name else obj_name in
  "let "^(String.lowercase obj_name)^"\n\t?(components=[])"^
    (if (attributes = []) then "" else "\n\t"^(generate_optionnal_parameters obj_name attributes handlers))^
    "\n\t() ="

let generate_variables_setup obj_name =
  "let "^constructor_init_list_label^"= ref [(\"kind\", String \""^obj_name^"\")]\n"^
    (*"and "^constructor_propertyChanged_list_label^"= ref []\n"^*)
    "and "^constructor_handler_list_label^"= ref [] in"

let generate_result obj_name =
  "{id=\""^(String.uppercase obj_name)^"\"; components=components;"^
    constructor_init_list_label^"=(!"^constructor_init_list_label^");"^
    (*constructor_propertyChanged_list_label^"=(!"^constructor_propertyChanged_list_label^");"^*)
    constructor_handler_list_label^"=(!"^constructor_handler_list_label^")}"

(*
  generate_constructor_implem "Button" [Attribute("content", String, true)] [Handler ("ontap", Gesture_event._gesture)]
  =>
  let button ?(components=[]) ?content ?contentChanged ?ontap () =
  let prop_list= ref []
  and prop_changed_list= ref []
  and handler_list= ref [] in
  (match content with Some v -> prop_list := ("content",v)::!prop_list | None -> ());
  (match contentChanged with Some v -> prop_changed_list:=("contentChanged",v)::!prop_changed_list | None -> ());
  (match ontap with Some v -> handler_list := ("ontap",v)::!handler_list | None -> ());
  {components=components;prop_list;prop_changed_list;handler_list}

*)

let generate_constructor_implem obj_name attributes handlers =
  (generate_constructor_let obj_name attributes handlers)^"\n"^
    (generate_variables_setup obj_name)^"\n"^
    (if attributes = [] then "" else 
	(String.concat "\n" (List.map (generate_match_property obj_name) attributes)))^"\n"^
    (if handlers = [] then "" else 
	(String.concat "\n" (List.map (generate_match_handler obj_name) handlers)))^
    (generate_result obj_name)
    
  
(*
  let variant_name = variant_label_object obj_name in
  "val "^(String.lowercase obj_name)^": ["^variant_name^"] -> ?components:any_id kind list -> "^
    generate_optionnal_parameters_type obj_name attributes handlers^
    " -> unit -> [>"^variant_name^"] kind"
*)
(* TEST *)
(*
let _ = print_endline (generate_constructor_type 
			 "Button"
			 [Attribute("content", String, true)]
			 [Handler ("ontap", Gesture_event._gesture)])


let _ = print_endline (generate_match_property "Button" (Attribute("content", String, true)))
let _ = print_endline (generate_match_handler "Button" (Handler("ontap", Gesture_event._gesture)))
let _ = print_endline (generate_constructor_let "Button"
			 [Attribute("content", String, true)]
			 [Handler ("ontap", Gesture_event._gesture)])

let _ = print_endline ""
let _ = print_endline (generate_constructor_implem "Button"
			 [Attribute("content", String, true)]
			 [Handler ("ontap", Gesture_event._gesture)])
*)
