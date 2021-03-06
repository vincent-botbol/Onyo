open Lib_enyo
open Enyo

(* Conversion de température *)
let from_fahr_to_celsius x  = (x-.32.)/.1.8;;
let from_fahr_to_kelvin x  = (x+.459.67)/.1.8;;
let from_kelvin_to_celsius x = x -. 273.15;;
let from_kelvin_to_fahr x = x *. 1.8 -. 459.67;;
let from_celsius_to_fahr x = x*.1.8+.32.;;
let from_celsius_to_kelvin x = x +. 273.15;;

(* Conversion de température *)
let from_fahr_to_celsius x  = (x-.32.)/.1.8;;
let from_fahr_to_kelvin x  = (x+.459.67)/.1.8;;
let from_kelvin_to_celsius x = x -. 273.15;;
let from_kelvin_to_fahr x = x *. 1.8 -. 459.67;;
let from_celsius_to_fahr x = x*.1.8+.32.;;
let from_celsius_to_kelvin x = x +. 273.15;;

let tmp = ref 0
let origin = ref 0
let target = ref 0
let button_click = ref false

open Js
open Unsafe
let debug () = 
  fun_call (variable "alert") [| inject "bla" |]

(* faire une fonction quand même pour le bouton, sinon ça va pas transmettre *)
(* fonction de conversion => click button *)
let convert this sender event =
  if !button_click then
    (  button_click := false;
       try 
	 let l = getComponents this () in
	 let moninput = as_a `ONYX_INPUT (List.nth l 2) in
	 let result = as_a `CONTROL (List.hd (List.rev l)) in
	 setContent result "test";
	 let valeur = float_of_string (getValue moninput ()) in
	 let nouvelle_valeur = 
	   match (!origin, !target) with
	     (0,0) | (1,1) | (2,2) -> valeur
	   | (0,1) -> from_celsius_to_fahr valeur
	   | (0,2) -> from_celsius_to_kelvin valeur
	   | (1,0) -> from_fahr_to_celsius valeur
	   | (1,2) -> from_fahr_to_kelvin valeur
	   | (2,0) -> from_kelvin_to_celsius valeur
	   | (2,1) -> from_kelvin_to_fahr valeur
	   | _ -> assert false
	 in
	 setContent result ("Résultat : "^(string_of_float nouvelle_valeur));
	 true
       with
	 Bad_kind -> true
       | Failure _ -> true
    )
  else
    true

(* fonction de changement de degrés => changement select *)

let monInput = onyx_input ()

let monDecorator = onyx_inputdecorator ~components:[monInput] ()

let label = control ~content:"en" ()

let labelC = option ~value:"0" ~content:"°C" ~ontap:(fun _ _ _ -> tmp := 0; false) ()
let labelF = option ~value:"1" ~content:"°F" ~ontap:(fun _ _ _ -> tmp := 1; false) ()
let labelK = option ~value:"2" ~content:"°K" ~ontap:(fun _ _ _ -> tmp := 2; false) ()

let select1 = _select ~components:[labelC; labelF; labelK] ~ontap:(fun _ _ _ -> origin := !tmp; true) ()
let select2 = _select ~components:[labelC; labelF; labelK] ~ontap:(fun _ _ _ -> target := !tmp; true) ()

let boutonValid = button ~content:"convertir" ~ontap:(fun _ _ _ -> button_click := true; false)  ()

let result = control ~content:"Résultat : n/a" ()

let toolBar = onyx_toolbar ~components:[monDecorator; select1; label; select2; boutonValid; result] ()

let app = control ~ontap:convert ~components:[toolBar] ()

let app_instance = instanciate app

let _ = renderIntoBody app_instance
