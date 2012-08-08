open Struct_types
open ValuesPrinter
open MethodsPrinter
open Labels

(* type attributes_rep = 
   Attribute of string * values_rep * bool (* generate a changed method? *)
*)

(* getContent / setContent / contentChanged *)
(* unit -> string / string -> unit / (string -> unit) -> unit *)

(*!! Dans ce cas : être sur de construire l'obj : handlers dans le corps de l'objet js !!*)

(*!! check le nom pour pas taper sur des keywords (i.e : type d'Input) !!*)

(* Séparer les events des attributes *)

(***** UTIL *****) 

(* Create the attribute's getter/setter methods
*)
(* attribute_method_list : attribute_rep -> method_rep list *)
let attribute_method_list = function Attribute (name, type_rep, changed_method) ->
  let upName = String.capitalize name in
  let getter = Method ("get"^upName, [Unit; type_rep]) and
      setter = Method ("set"^upName, [type_rep; Unit]) in
  [getter;setter]
    
    
(***** SIGNATURE GENERATION *****)
    
(* Generate the signature of an attribute's abstraction barrier
   i.e : 
   generate_attribute_accessor_type (Attribute ("content", String, true)) [ "`CONTROL"; "`OBJECT" ]
   => 
   "val getContent : [> `CONTROL | `OBJECT ] obj -> unit -> string
   val setContent : [> `CONTROL | `OBJECT ] obj -> string -> unit"
*)
(* generate_attribute_accessor_type : attribute_rep -> string list -> string *)
let generate_attribute_accessor_type attribute dependances =
  match attribute with Attribute (name, type_rep, changed_method) ->
    let methods_to_generate = attribute_method_list attribute in
    String.concat "\n" (List.map 
			  (fun meth -> generate_method_type meth dependances)
			  (methods_to_generate))
      
(* Generate the full type of an optionnal attribute's changedValue
   TO USE WITH A CONSTRUCTOR
   i.e : 
   generate_attribute_changed_method_type (Attribute ("content", String, true)) "control"
   => 
   "?contentChanged:([`CONTROL] obj -> string -> unit)"
*)
(* generate_attribute_changed_method_value_type : attribute_rep -> string -> string *)
exception Invalid_Attribute
let generate_attribute_changed_method_type attr obj_name = 
  match attr with Attribute (name, type_rep, true) ->
    let name = if isAnOCamlKeyword name then "_"^name else name in
    let depend_string = "["^(variant_label_object obj_name)^"] "^label_type_js_object in
    "?"^name^"Changed:("^depend_string^" -> "^
      (generate_values_type [type_rep; Unit])^")"
  | _ -> raise Invalid_Attribute
    
    
(***** IMPLEMENTATION GENERATION *****)
    
(* Generate the implementation of an attribute's abstraction barrier
   i.e:
   generate_attribute_implem (Attribute ("content", String, true))
   =>
   "let getContent this () =
   let value = method_call this "getContent" [||] in
   to_string value
   let setContent this chaine1 =
   let _ = method_call this "setContent" [|inject chaine1|] in
   ()"
*)
(* generate_attribute_implem : attribute_rep -> string *)
let generate_attribute_implem =
  function Attribute(name, type_rep, changed_method) as x ->
    let methods_to_generate = attribute_method_list x in    
    String.concat "\n" (List.map (generate_method_implem) methods_to_generate)
      
(* TEST *)      
(*
  let _ = print_string ((generate_attribute_type (Attribute ("content", String, false)) [ "`CONTROL"; "`OBJECT" ])^"\n")
  
  let _ = print_string (generate_attribute_implem (Attribute ("content", String, true))^"\n")
  
  let _ = print_string ((generate_attribute_changed_method_type (Attribute ("content", String, true)) [ "`CONTROL"; "`OBJECT" ])^"\n")
*)
      
