open Lib_enyo
open Enyo

(*

open Js
open Unsafe

let app_name = "App";;

let my_alert str = 
  fun_call (variable "alert") [| inject str |];;

let creer_composant kind =
  let obj = new_obj (variable "Object") [||] in
  set obj "kind" (string kind);
  obj;;

let creer_container nom kind =
  let obj = creer_composant kind in
  set obj "name" (string nom);
  obj;;

let add_components obj array =
  set obj "components" array;;

let renderIntoBody js_object =
  let _ = fun_call (variable "enyo.kind") [|inject js_object|] in
  let enyo_obj = new_obj (variable app_name) [||] in
  let handler = (fun _ -> 
    let _ = meth_call enyo_obj "renderInto" [|inject (Dom_html.document##body)|] in
    Js._false
  )
  in
  Dom_html.window##onload <- Dom_html.handler handler;
  enyo_obj;;
    
let build_array liste = 
  let i = ref 0 in
  let rec append liste array =
    match liste with
      [] -> array
    | h::t -> (array_set array !i h); incr i; append t array
  in
  append liste (jsnew array_empty ());;

let creer_select name =
  let obj = creer_container name "Select" and
      value1 = new_obj (variable "Object") [||] and
      value2 = new_obj (variable "Object") [||] and
      value3 = new_obj (variable "Object") [||] in
  set value1 "content" (string "°C");
  set value2 "content" (string "°F");
  set value3 "content" (string "°K");
  set value1 "value" 0;
  set value2 "value" 1;
  set value3 "value" 2;
  add_components obj (build_array [value1;value2;value3]);
  obj;;

(* Conversion de température *)

let from_fahr_to_celsius x  = (x-.32.)/.1.8;;
let from_fahr_to_kelvin x  = (x+.459.67)/.1.8;;

let from_kelvin_to_celsius x = x -. 273.15;;
let from_kelvin_to_fahr x = x *. 1.8 -. 459.67;;

let from_celsius_to_fahr x = x*.1.8+.32.;;
let from_celsius_to_kelvin x = x +. 273.15;;

let monControl = creer_container app_name "Control";;
(*-*)
let maToolBar = creer_container "maToolBar" "onyx.Toolbar";;
set maToolBar "ontap" (string "clique");;
(*-*)
let monDecorator = creer_composant "onyx.InputDecorator";;

let monInput = creer_container "monInput" "onyx.Input";;

let monSelect1 = creer_select "select1";;

let monLabel = creer_composant "Control";;
set monLabel "content" (string "en");;

let monSelect2 = creer_select "select2";;

let monBouton = creer_composant "onyx.Button";;
set monBouton "content" (string "Convertir");;
set monBouton "ontap" (string "convert");;

let result = creer_container "resultat" "Control";;

let monPublished = new_obj (variable "Object") [||];;
set monPublished "nbClick" 0;;
set monPublished "color" "black";;
let tabCouleurs = [| "black"; "white"; "gray"; "green"; "blue";"pink"; "yellow"|];;

(* Ajout du published *)
set monControl "published" monPublished;;

(* Ajout des composants *)
add_components monDecorator (build_array [ monInput ]);;
add_components maToolBar (build_array [ monDecorator; monSelect1; monLabel; monSelect2; monBouton; result ]);;
add_components monControl (build_array [ maToolBar ]);;

(* Handler bouton *)
let convert cont ev = 
  let value = 
    fun_call 
      (variable "parseFloat") 
      [| inject 
	  (fun_call (variable "this.$.monInput.getValue") [||])
      |] and
      from = fun_call (variable "this.$.select1.getValue") [||] and
      _to = fun_call (variable "this.$.select2.getValue") [||] in
  let case = from+_to in
  let res = (
  match case with
  | 1 -> from_celsius_to_fahr value
  | 2 -> from_celsius_to_kelvin value
  | 10 -> from_fahr_to_celsius value
  | 12 -> from_fahr_to_kelvin value
  | 20 -> from_kelvin_to_celsius value
  | 21 -> from_kelvin_to_fahr value
  | _ ->  value
  ) in
  let _ = fun_call (variable "this.$.resultat.setContent") [|inject res|] in
  _true;;

(* Ajout du handler sur le control *)
let f container event = convert container event;;
set monControl "convert" f;;

(* fonction changeCouleur *)
let changeCouleur new_color =
  let _ = fun_call (variable "this.$.maToolBar.applyStyle") [| inject "background-color"; inject new_color |] in
  ()


(* Handler toolbar *)
(* Plus de problème de récupération de variable *)
(* Le getter/setter/changer n'était pas géneré avec le enyo.create *)
(* En revanche, en faisant en enyo.kind(mon_obj), les fonctions sont bien présentes. *)
let clique cont ev = 
  let nbClick = fun_call (variable "this.getNbClick") [| |] in
  let _ = fun_call (variable "this.setNbClick") [| inject (nbClick + 1)|] in
  (if (1+nbClick) mod 5 = 0 then
      changeCouleur (tabCouleurs.(Random.int (Array.length tabCouleurs)))
   else
      ());
  _true
;;

(* Ajout du handler et de la fonction sur le control *)
set monControl "clique" clique;;

(* Recupération de l'objet généré *)
let enyo_obj = renderIntoBody monControl;;
*)


(* Ajout des composants *)
(*add_components monDecorator (build_array [ monInput ]);;
add_components maToolBar (build_array [ monDecorator; monSelect1; monLabel; monSelect2; monBouton; result ]);;
add_components monControl (build_array [ maToolBar ]);;
*)

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

let app = control ~name:"App" ~components:[toolBar] ()

let instance = instanciante app

let _ = renderIntoBody instance
