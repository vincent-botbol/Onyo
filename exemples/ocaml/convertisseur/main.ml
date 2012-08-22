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

let monInput = onyxInput ()

let monDecorator = onyxDecorator ~components:[monInput] ()

let label = control ~content:"en" ()

let labelC = option ~value:"0" ~content:"°C" ()
let labelF = option ~value:"1" ~content:"°F" ()
let labelK = option ~value:"2" ~content:"°K" ()

let select1 = select ~components:[labelC; labelF; labelK] ()
let select2 = select ~components:[labelC; labelF; labelK] ()

let boutonValid = button ~content:"convertir" ()

let result = control ()

let toolBar = onyx_toolbar ~components:[monDecorator; select1; label; select2; boutonValid; result] ()

let app = control  ~components:[toolBar] ()

let app_instance = instanciante app

let _ = renderIntoBody app_instance

open Js.Unsafe

let _ = fun_call (variable "alert") [| inject "bla" |]
