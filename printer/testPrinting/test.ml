open Lib_enyo.Enyo
open Js.Unsafe

let f this sender event =
 setContent this (getName this ()); 
  fun_call (variable "console.log") [|inject this|];
  true

let b1 = button ~name:"B1" ~content:"Bouton 1" ~ontap:f ()
and b2 = button ~name:"B2" ~content:"Bouton 2" ~ontap:f ()

let bar = onyx_toolbar ~components:[b1;b2;b1;b2] ()

let control = control ~components:[bar] ()

let app = instanciate control
let _ = renderIntoBody app

let _ = setContent app "Bonjour"
