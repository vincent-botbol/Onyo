open Alphabeta 
open P4
open Lib_enyo.Enyo
open Js

module P4_js
(*: sig
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
end
*)= struct
  open P4_rep
  type jeu = P4_rep.jeu
  type coup = P4_rep.coup

  let accueil () = ()
  let fin () = ()

  let question s = to_bool (Dom_html.window##confirm(s))
  let q_commencer () = question "Voulez-vous commencer ?"
  let q_continuer () = question "Encore une partie ?"
  let q_jouer () = question "Est-ce une machine qui joue ?"
    
  let gagne () = Dom_html.window##alert("Joueur 1 gagne")
  let perd () = Dom_html.window##alert("Joueur 2 gagne")
  let nul () = Dom_html.window##alert("Match nul")
    
  let init () =
    (* Oh la grosse fonction qui va falloir faire *)
    ()
    
      

end ;;


module P4_squelette = 
  FSquelette (P4_rep) (P4_js) (P4_eval)  (FAlphabeta (P4_rep) (P4_eval)) ;;

module P4_main = FMain(P4_squelette) ;;

P4_main.main () ;;
