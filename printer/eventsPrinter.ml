open Struct_types
open Labels
open MethodsPrinter
(* Générer un setter pour les handlers ? Oui, pourquoi pas.*)
(* set<eventName> : obj -> (this -> obj2 -> event_spec -> bool) -> unit *)
(* Pas pour l'instant en tout cas *)

(* contentChanged au constructeur ? *)
(* oui mais rien à voir.*)

(*
  Objectif du printer d'event : 
  Passer à la signature du constructeur un ?ontap:(fun o -> comp -> event -> bool) 
  
  Le constructeur peut gérer ça correctement.  
*)

(*
  generate_handler_optionnal_type "Button" (Handler ("ontap", Gesture_event._gesture))
  =>
  "?ontap:([`BUTTON] obj -> any_obj -> [`GESTURE] obj -> bool)"
*)
(*  generate_handler_optionnal_type: handler_rep -> string *)
let generate_handler_optionnal_type obj_name (Handler(name, event)) =
  "?"^name^":(["^(variant_label_object obj_name)^"] obj -> any_id obj -> ["^
    (variant_label_event event)^"] obj -> bool)"


(***** VALUES ACCESSORS SIGNATURES *****)

(* Generate the event's values accessor
   i.e:
   generate_values_getters_types Gesture_event._gesture
   =>
   "val gesture_screenX : [`GESTURE] -> int
   val gesture_screenY : [`GESTURE] -> int
   val gesture_clientX : [`GESTURE] -> int
   val gesture_clientY : [`GESTURE] -> int
   val gesture_button : [`GESTURE] -> int
   ..."
*)
(* generate_values_getters_types : event_rep -> string *)
let generate_values_getters_types = function Event (name, attrs) as event ->
  let name_down = String.lowercase name in
  let generate_get = function 
  Attribute (name, value_type, _) ->
    "val "^name_down^"_"^name^" : ["^(variant_label_event event)^"] "^label_type_js_object^"-> "^(string_type_of_value value_type)    
  in
  String.concat "\n" (List.map generate_get attrs)

(***** VALUES ACCESSORS IMPLEMENTATION *****)

(* Generate the event's values accessor
   i.e:
   generate_values_getters_implem Gesture_event._gesture
   =>
   "let gesture_clientX gesture_event =
	let value = get gesture_event clientX in
		value
   let gesture_clientY gesture_event =
	let value = get gesture_event clientY in
		value
   let gesture_button gesture_event =
	let value = get gesture_event button in
		value
   let gesture_ctrlKey gesture_event =
	let value = get gesture_event ctrlKey in
		to_bool value"
*)
(* generate_values_getters_implem : event_rep -> string *)
let generate_values_getters_implem = function Event (name, attrs) as event ->
  let name_down = String.lowercase name in
  let generate_get = function 
  Attribute (name, value_type, _) ->
    let event_arg = label_event_arg event in
    "let "^name_down^"_"^name^" "^event_arg^" =\n\t"^
      "let "^label_method_value^" = get "^event_arg^" \""^name^"\" in\n\t\t"^
      (conversion_function value_type)
  in
  String.concat "\n" (List.map generate_get attrs)


(***** TEST *****)
(*
let _ = print_endline (generate_values_getters_types Gesture_event._gesture)

let _ =  print_endline (generate_values_getters_implem Gesture_event._gesture)
  
let _ = print_endline (generate_handler_optionnal_type "Button" (Handler ("ontap", Gesture_event._gesture)))
*)
