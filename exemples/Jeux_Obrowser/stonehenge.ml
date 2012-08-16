open Lib_enyo
open Enyo

(* code : -1 retour à la ligne, 0 case vide, 2 container, 3 resultat *)

let board_game = 
  [0;0;0;0;0;0;3;0;3;0;0;0;-1;
   0;0;0;3;0;2;0;2;0;3;0;0;-1;
   0;0;3;0;2;0;2;0;2;0;3;0;-1;
   0;3;0;2;0;2;0;2;0;2;0;3;-1;
   3;0;2;0;2;0;2;0;2;0;2;0;-1;
   0;3;0;2;0;2;0;2;0;2;0;3;-1;
   0;0;0;0;3;0;3;0;3;0;3;0;-1]

let match_elem = function
  | 0 -> button ~tag:"span" ~style:"width:30px; height:30px; background-color:gray" ()
  | 3 -> button ~style:"width:30px; height:30px; background-color:blue" ()
  | 2 -> button ~style:"width:30px; height:30px; background-color:green" ()
  | -1 -> button ~tag:"br" ()
  | _ -> assert false

let compo = List.map match_elem board_game

let app = control ~id:"graphic_box" ()

let app_instanc = instanciate app

let _ = renderIntoBody app_instanc
  