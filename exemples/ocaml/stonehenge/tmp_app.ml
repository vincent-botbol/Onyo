(* model *)

type joueur = bool
type case = Vide | Plein of joueur | Non_gagne | Gagne of joueur | Unused
type jeu = case array array

(* -1 : unused, 0 : vide, 1 : résultat *)
let squelette_jeu_vide = 
  [|
    [|-1;-1;-1;-1;-1;-1;1;-1;1;-1;-1;-1;|];
    [|-1;-1;-1;1;-1;0;-1;0;-1;1;-1;-1;|];
    [|-1;-1;1;-1;0;-1;0;-1;0;-1;1;-1;|];
    [|-1;1;-1;0;-1;0;-1;0;-1;0;-1;1;|];
    [|1;-1;0;-1;0;-1;0;-1;0;-1;0;-1;|];
    [|-1;1;-1;0;-1;0;-1;0;-1;0;-1;1;|];
    [|-1;-1;-1;-1;1;-1;1;-1;1;-1;1;-1|];
  |]

(* jeu_vide : unit -> jeu *)
let jeu_vide () =
  let jeu = Array.make_matrix 7 12 Unused in
  for i = 0 to 6 do
    for j = 0 to 11 do
      match squelette_jeu_vide.(i).(j) with
      | 0 -> Vide
      | 1 -> Non_gagne
      | -1 -> Unused
      | _ -> assert false
    done
  done;
  jeu

(* p1 = true, p2 = false *)
let joueur_actuel = ref true

(* vue *)
open Lib_enyo
open Enyo

let barre = onyx_toolbar ()

(* création du jeu *)
let lignes_jeu = 
  let comps = ref [] in
  for i = 1 to 7 do
    let l = ref [] in
    for j = 1 to 12 do
      l:= !l@[
	control ~tag:"span" ~content:" " ()
      ]
    done;
    comps:= !comps@[
      control ~tag:"div" ~components:(!l) ()
    ]
  done;
  control ~components:!comps ()

let zone_jeu = control ~components:[lignes_jeu] ()
(* fin création du jeu *)

let app  = instanciate control ~components:[barre; zone_jeu] ()

let _ = renderIntoBody (app)

(* maj_jeu *)
let mise_a_jour jeu =
  
  ()

let _ = jeu_vide ()

