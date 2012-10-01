open Struct_types
open Labels
open ValuesPrinter

(* type method_rep = Method of string * values_rep list *)


(***** SIGNATURE GENERATION *****)

(* Generate the signature of a method
   i.e:
   generate_method_type (Method ("bla", [Int; Float; Unit])) ["`OBJECT"; "`COMPONENT"]
   => val bla : [< `OBJECT | `COMPONENT ] -> int -> float -> unit
*)
(* method_rep -> string list-> string *)
let generate_method_type method_rep dependances =
  match method_rep with Method (name, list) ->
    "val "^name^" : [< "^(String.concat " | " dependances)^" ] "^label_type_js_object^" -> "^(generate_values_type list)

(***** IMPLEMENTATION GENERATION *****)

(* Return a list without its last element
   i.e:
   list_without_last [1;2;3]
   => [1;2]
*)
let rec list_without_last = function h::[] -> [] | [] -> [] | h::t -> h::list_without_last t

let rec prepare_inject label = function
  | Int ->label
  | Dom_node -> label
  | Component -> label
  | Unit -> label
  | Float -> "(float "^label^")"
  | Bool ->   "(bool "^label^")"
  | String ->  "(string "^label^")"
  | Array _ ->  "(array (Array.of_list "^label ^"))"

(* Generate the corpse of a method 
   i.e:
   generate_method_corpse (Method("bla", [Int; Float; Unit]))
   => let _ = meth_call js_obj "bla" [| inject entier1; inject float1 |] in ()
*)
(* method_rep -> string *)
let generate_method_corpse method_rep =
  match method_rep with
    Method (name, types) ->
      let variables = labels_of_values types in (* [entier1; entier2; etc..] sans le dernier param *)
      let injection_variables = List.map2 prepare_inject variables types in
      let inner_array_param_call = 
	if variables = [] ||  (match List.hd variables with "()" -> true | _ -> false) then
	  ""
	else 
	  "inject "^(String.concat "; inject " (list_without_last injection_variables)) in (* inject entier1; inject entier2 *)
      let return_value_type = List.hd (List.rev types) in
      let isUnit = match return_value_type with Unit -> true | _ -> false in
      "\tlet "^(if isUnit then "_" else label_method_value)^" = meth_call "^label_implem_js_object^" \""^
      (*ici*)name
      ^"\" [|"^inner_array_param_call^"|] in\n\t\t"^
	(match return_value_type with 
	| value_type -> conversion_function value_type)
	
	
(* Generate the implementation of a method
   i.e:
   generate_method_implem (Method("bla", [Int; Float; Bool]))
   => "let value = meth_call js_obj "bla" [| inject entier1; inject float1 |] in to_bool value"
*)
(* method_rep -> string list -> string *)
let generate_method_implem method_rep =
  match method_rep with  
    Method (name, types) -> let types = list_without_last types in
			    "let "^name^" "^label_implem_js_object^" "^
			      (match types with [] -> "" | _ ->(generate_variables types))^
			      " =\n"^(generate_method_corpse method_rep)

    

(***** TEST *****)

(*
let _ = print_string (generate_method_type (Method ("bla", [Int; Float; Bool])) ["`OBJECT"; "`COMPONENT"])
let _ = print_newline()
let _ = print_string (generate_method_implem (Method("bla", [Int; Float; Bool])))
let _ = print_newline()
*)
