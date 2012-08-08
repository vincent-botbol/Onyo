open Labels

open Struct_types

(* 
type values_rep = String | Int | Float | Bool | Unit 
   | Function of values_rep list | Component | Event 
   | Array of values_rep | Dom_node
*)

(***** VALUES SIGNATURE - TYPE GENERATION *****)

(* Generate from values list a string of types
   i.e:
   generate_values_type [Int; Function [Int; Bool]; Unit]
   => "int -> (int -> bool) -> unit"
*)
(* values_rep list -> string *)
let rec generate_values_type values =
  String.concat " -> " 
    (List.map (fun x -> match x with
    | String
    | Int
    | Float
    | Bool
    | Component
    | Dom_node
    | Unit -> string_type_of_value x
    | Array (arraytype) -> (string_type_of_value arraytype)^" list")
       values)

(***** VALUES IMPLEMENTATION - VARIABLES GENERATION *****)

(* Generate from values list a string list of variable names
   i.e:
   generate_variables : [Int; Int; Function [Float; Bool]]
   => "entier1 entier2 fun1"
   Used for : let meth_X js_obj entier1 entier2 fun1 = ...
*)
(* values_rep list -> string *)
let generate_variables values =
  String.concat " " (labels_of_values values)
