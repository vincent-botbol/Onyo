(*

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
module type AFFICHAGE = sig 
  type jeu 
  type coup
  val accueil: unit -> unit
  val fin: unit -> unit
  val gagne: unit -> unit
  val perd: unit -> unit
  val nul: unit -> unit
  val init: unit -> unit
  val affiche : bool -> coup -> jeu -> jeu -> unit
  val choix : bool ->  jeu -> coup
  val q_jouer : unit -> bool   
  val q_commencer : unit -> bool
  val q_continuer : unit -> bool
end ;;

*)

open Lib_enyo
open Enyo
open Stoneh

module Stone_Enyo = struct
  open Stone_rep
  type pierre = Stone_rep.pierre
  type menhir = Stone_rep.menhir
  type case = Stone_rep.case
  type jeu = Stone_rep.jeu
  type coup = Stone_rep.coup

  let accueil () =
    (*Graphics.open_graph
      (" " ^ (string_of_int (largeur + 10)) ^ "x" ^ 
       (string_of_int (hauteur + 10)) ^ "+50+50") ;
    Graphics.moveto (hauteur / 2) (largeur / 2) ;
    Graphics.set_color cBlue ;
    Graphics.draw_string "Stone henge" ;
    Graphics.set_color cBlack ;
    Graphics.moveto 2 2 ;
    Graphics.draw_string "Mixte Projets Maitrise & DESS GLA" ;
    ignore (wait_click ()) ;
    Graphics.clear_graph*) ()

  (* fin : unit -> unit *)
  (* on ferme le tout !  *)
  let fin () = ()
    
  (* gagne : unit -> unit  *)
  (* un message indiquant que la machine a gagne  *)
  let gagne () = 
    ()

  (* perd : unit -> unit  *)
  (* un message indiquant que la machine a perdu *)
  let perd () = 
    ()

  (* nul : unit -> unit  *)
  (* un message indiquant que personne ne peut gagner  *)
  let nul () = 
    ()

  (* init : unit -> unit *)
  (* dessine le plateau de jeu  *)
  let init () = let jeu = jeu_depart () in ()
	
  (*affiche le nouvel état*)
  let affiche joueur coup ancien_jeu nouveau_jeu = 
    ()

  let q_jouer () = 
    false

  (* q_commencer : unit -> bool *)
  (* demande si l'utilisateur desire jouer en premier ou non  *)
  let q_commencer () = 
    false

  (* q_continuer : unit -> bool *)
  (* demande si l'utilisateur desire rejouer un autre partie *)
  let q_continuer () = 
    false

  let choix joueur jeu = 
    (1,(P(-1)))

end


open Alphabeta 

module Stone_squeletteG = 
  FSquelette (Stone_rep) (Stone_Enyo) (Stone_eval)
    (FAlphabeta (Stone_rep) (Stone_eval)) ;;


module Stone_mainG = FMain(Stone_squeletteG);;

Stone_mainG.main () ;; 

