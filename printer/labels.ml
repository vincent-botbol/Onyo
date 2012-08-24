open Struct_types

(* value_rep -> string *)
let string_type_of_value = function 
  | String -> "string"
  | Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | Unit -> "unit"
  | Component -> "any_id obj"
  | Dom_node -> "dom_node"
  | _ -> ""
    
let label_implem_js_object =
  "this"

let label_method_value =
  "value"

let label_event_arg = function Event (name, _)->
  (String.lowercase name)^"_event"

let generate_label label =
  let x = ref 0 in
  let f = function () -> incr x; label^(string_of_int !x)
  in f

(* value list -> string list *)
let labels_of_values_implem values =
  let gen_label_string = generate_label "chaine" and
      gen_label_int = generate_label "entier" and
      gen_label_float = generate_label "reel" and
      gen_label_bool = generate_label "predicat" and
      gen_label_array = generate_label "liste" and
      gen_label_dom_node = generate_label "noeud_dom" and
      gen_label_obj = generate_label "obj_js" in
  let rec gener_rec values =
    List.map (function
    | String -> gen_label_string ()
    | Int -> gen_label_int ()
    | Float -> gen_label_float ()
    | Bool -> gen_label_bool ()
    | Unit -> "()"
    | Component -> gen_label_obj ()
    | Array (arraytype) -> gen_label_array ()
    | Dom_node -> gen_label_dom_node ())
      values in
  gener_rec values


(* value list -> string list *)
let labels_of_values values =
  let gen_label_string = generate_label "chaine" and
      gen_label_int = generate_label "entier" and
      gen_label_float = generate_label "reel" and
      gen_label_bool = generate_label "predicat" and
      gen_label_array = generate_label "liste" and
      gen_label_dom_node = generate_label "noeud_dom" and
      gen_label_obj = generate_label "obj_js" in
  let rec gener_rec values =
    List.map (function
    | String -> gen_label_string ()
    | Int -> gen_label_int ()
    | Float -> gen_label_float ()
    | Bool -> gen_label_bool ()
    | Unit -> "()"
    | Component -> gen_label_obj ()
    | Array (arraytype) -> gen_label_array ()
    | Dom_node -> gen_label_dom_node ())
      values in
  gener_rec values


let conversion_arg value_type label = 
  match value_type with
  | String -> "to_string "^label
  | Float -> "to_float "^label
  | Bool -> "to_bool "^label
  | Array x -> "Array.to_list (to_array "^label^")"
  | Unit -> "()"
  | _ -> label



let conversion_function value_type =
  conversion_arg value_type label_method_value

let rec replace_char str oldchar newchar = 
  try
      let index = String.index str oldchar in
      let copy = (String.copy str) in
      copy.[index] <- newchar; 
      replace_char copy oldchar newchar
  with Not_found -> str

let replace_dots str = replace_char str '.' '_'

let variant_label_event = function Event (str, _) -> "`"^(String.uppercase (replace_dots str))
let variant_label_object = 
  function str -> "`"^(String.uppercase (replace_dots str))

let closure_label_name obj_name =
  "new_label_"^(String.lowercase (replace_dots obj_name))

let constructor_init_list_label = "prop_list"
let constructor_propertyChanged_list_label = "prop_changed_list"
let constructor_handler_list_label = "handler_list"

let constructor_value_name_label = "v"

(* Module generation *)

let module_name =
  "Enyo"

let label_type_any_id =
  "any_id"

let label_type_any_event =
  "any_event"

let label_type_handler =
  "handler"

let label_type_changed =
  "value_changed"

let label_type_dom_node =
  "dom_node"

let label_type_js_value =
  "js_value"

let label_type_kind =
  "kind"

let label_type_js_object =
  "obj"

let label_type_js_of_ocaml_object =
  "Js.Unsafe.any"

let label_introspection =
  "_hidden_id"

let label_default_app_name =
  "_default_app_name"

(* UTILITY *)

let isAnOCamlKeyword name = match name with
  | "and"
  | "as"
  | "assert"
  | "begin"
  | "class"
  | "constraint"
  | "do"
  | "done"
  | "downto"
  | "else"
  | "end"
  | "exception"
  | "external"
  | "false"
  | "for"
  | "fun"
  | "function"
  | "functor"
  | "if"
  | "in"
  | "include"
  | "inherit"
  | "inherit!"
  | "initializer"
  | "lazy"
  | "let"
  | "match"
  | "method"
  | "method!"
  | "module"
  | "mutable"
  | "new"
  | "object"
  | "of"
  | "open"
  | "or"
  | "private"
  | "rec"
  | "sig"
  | "struct"
  | "then"
  | "to"
  | "true"
  | "try"
  | "type"
  | "val"
  | "val!"
  | "virtual"
  | "when"
  | "while"
  | "with" -> true 
  | _ -> false

let replace_underscore str =
  if str.[0] = '_' then
    String.sub str 1 ((String.length str) - 1)
  else 
    str
