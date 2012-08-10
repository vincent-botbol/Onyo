open Struct_types
open Labels

(* Passer des [ "`NAMEX" ; "`NAMEY" ] *)

let generate_module_sig_types list_obj_name list_event_name = 
  "type "^label_type_any_id^" = ["^(String.concat " | " list_obj_name)^"]\n"
  ^"type "^label_type_any_event^" = ["^(String.concat " | " list_event_name)^"]\n"
  ^"type "^label_type_dom_node^"\n"
  ^"type "^label_type_js_value^"\n"
  ^"type "^label_type_handler^"\n"
  (*^"type "^label_type_changed^"\n"*)
  ^"type +'a "^label_type_kind^"\n"
  ^"type +'a "^label_type_js_object^"\n"

let generate_module_struct_types list_obj_name list_event_name =
  "type "^label_type_any_id^" = ["^(String.concat " | " list_obj_name)^"]\n"
  ^"type "^label_type_any_event^" = ["^(String.concat " | " list_event_name)^"]\n"
  ^"type "^label_type_dom_node^" = Dom_html.bodyElement Js.t\n"
  ^"type "^label_type_js_value^" = Int of int | String of string | Char of char | Float of float | Dom_node of dom_node | Bool of bool | Array of "^label_type_js_value^" list | Component of "^label_type_any_id^" "^label_type_js_object^" \n"
  ^"and "^label_type_handler^" = Handler of string * ("^label_type_any_id^" "^label_type_js_object^" -> "^label_type_any_id^" "^label_type_js_object^" -> "^label_type_any_event^" "^label_type_js_object^" -> bool)\n"
  (*^"and "^label_type_changed^" = Changed of string * ("^label_type_any_id^" "^label_type_js_object^" -> "^label_type_js_value^" -> unit)\n"*)
  ^"and +'a "^label_type_kind^" = {id:string; components: "^label_type_any_id^" "^label_type_kind^" list;"
  (*^constructor_propertyChanged_list_label^":"^label_type_changed^" list; "*)
  ^constructor_handler_list_label^":"^label_type_handler^" list; "^constructor_init_list_label^" : (string * "^label_type_js_value^") list }\n"
  ^"and +'a "^label_type_js_object^" = "^label_type_js_of_ocaml_object^"\n"
  ^"exception Bad_kind\n"

let generate_sig_functions () =
  "val instanciate : ([< "^label_type_any_id^"] as 'a) kind -> 'a "^label_type_js_object^"\n"
  ^"val id : ([< "^label_type_any_id^"] as 'a) "^label_type_js_object^" -> 'a\n"
  ^"exception Bad_kind\n"
  ^"val as_a : ([< "^label_type_any_id^"] as 'a) -> [< "^label_type_any_id^"] "^label_type_js_object^" -> 'a "
  ^label_type_js_object^"\n" 

let generate_kind_it_function () =
  "let kind_it name obj_js =
    let enyo_js_object = 
      let _ = fun_call (variable \"enyo.kind\") [| inject obj_js |] in
      new_obj (variable name) [||]
    in
    enyo_js_object\n"

(* debug *)
let generate_renderIntoBody_function ()=
  "let renderIntoBody obj_js =
     Dom_html.window##onload <- Dom_html.handler
      (fun _ -> let _ = meth_call obj_js \"renderInto\" [| inject (variable \"document.body\") |] in Js._false)"

let generate_coerce_prop () =
  "let rec coerce_prop = function
    | Int v -> inject v
    | Char v -> inject v
    | Dom_node v -> inject v
    | Component v -> inject v
    | Float f -> inject (float f)
    | Bool b ->  inject (bool b)
    | String s -> inject (string s)
    | Array v -> inject (array (Array.of_list (List.map coerce_prop v)))\n"
    
(* type js_value : Int of int | String of string | Char of char | Float of float | 
Dom_node of dom_node | Bool of bool | Unit | Array of js_value list
type handler = Handler of string * (any_id obj -> any_id obj -> any_event obj ->
 bool)
*)
(* entrée :   {id:string; components: any_id kind list;prop_changed_list:value_
changed list; handler_list:handler list; prop_list : (string * js_value) list } *)
let generate_instanciate_function () = 
  "let instanciate (kind:([< "^label_type_any_id^"] as 'a) "^label_type_kind^") : 'a obj =
    let rec build_component_tree : 'a. ([< "^label_type_any_id^"] as 'a) "^label_type_kind^" -> Js.Unsafe.any = fun kind ->
      let js_obj = new_obj (variable \"Object\") [||] in
      List.iter (fun (x,y) -> set js_obj x (coerce_prop y)) kind."^constructor_init_list_label^";
      (if kind.components != []  then
	  let array_component = Array.of_list (List.map build_component_tree kind.components) in
	  set js_obj \"components\" (array array_component));
      (if kind."^constructor_handler_list_label^" != [] then
	  let handlers_name = List.map (fun (Handler (x,_)) -> x) kind."^constructor_handler_list_label^" in
	  let handlers_name_func = List.map
	    (fun x -> String.sub x 2 ((String.length x) - 2))
	    handlers_name in
	  let handlers_func = List.map (fun (Handler (_,y)) -> y) kind."^constructor_handler_list_label^" in
	  let handler_obj = new_obj (variable \"Object\") [||] in
	  List.iter 
	    (fun (name,fname) -> set handler_obj name (string fname)) 
	    (List.combine handlers_name handlers_name_func);
	  set js_obj \"handlers\" handler_obj;
	  List.iter 
	    (fun (fname,f) -> set js_obj fname (wrap_meth_callback f))
	    (List.combine handlers_name_func handlers_func)
      );
      set js_obj \""^label_introspection^"\" (string (kind.id));
      js_obj in
      let js_obj = (build_component_tree kind) in
      let name = try 
		   match List.assoc \"name\" kind."^constructor_init_list_label^" with 
		     String s -> s 
		   | _ -> assert false
        with
	  Not_found -> set js_obj \"name\" (string \""^label_default_app_name^"\");
	    \""^label_default_app_name^"\" in
      kind_it name js_obj"

let generate_id_function list_obj_name =
  let upper_filtered_name_list = List.map 
    (fun str -> String.uppercase (String.sub str 1 ((String.length str) - 1)))
    list_obj_name in
  "let id (obj_js : ([<"^label_type_any_id^"] as 'a) "^label_type_js_object^") : 'a =
      let s = to_string (get obj_js \""^label_introspection^"\") in
      Obj.magic (match s with\n"^
    (String.concat "\n" 
       (List.map (fun (x,y) -> 
	 let name = replace_char x '_' '.' in	 
	 "| \""^name^"\" -> "^y) 
	  (List.combine upper_filtered_name_list list_obj_name)))^" | _ -> assert false)\n"
    
let generate_as_a_function () =        
  "let as_a id_type obj_js =
    if ((id obj_js) :> "^label_type_any_id^") = (id_type :> "^label_type_any_id^") then
      obj_js
    else
      raise Bad_kind\n"

let generate_label_generator list_obj_name =
  "let new_label name =
    let i = ref (-1) in
    (fun () -> incr i; name ^ (string_of_int !i))\n\n"^
    (String.concat "\n" (List.map 
			   (fun str -> 
			     let name = String.lowercase (String.sub str 1 ((String.length str) - 1)) in
			     "let new_label_"^name^" = new_label \""^name^"\""
			   ) 
			   list_obj_name))^"\n"
