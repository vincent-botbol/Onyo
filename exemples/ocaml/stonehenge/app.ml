(*
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
end
*)

open Lib_enyo
open Enyo
open Js
open Unsafe
open Stoneh

module Stone_Enyo = struct
  open Stone_rep
  type pierre = Stone_rep.pierre
  type menhir = Stone_rep.menhir
  type case = Stone_rep.case
  type jeu = Stone_rep.jeu
  type coup = Stone_rep.coup
    
  (*Enyo main components*)
  let bouton = button ~content:"valider" ~ontap:(fun this _ _ -> true) ()
  let barre = onyx_toolbar ~components:[bouton] ()
  let zone_jeu = control ~content:"blibli" ()
  let app = control ~components:[barre;zone_jeu] ()

  let accueil () =
    ()
      
  let question str =
    to_bool (fun_call (variable "confirm") [| inject (string str) |])
      
  let previens str =
    let _ = fun_call (variable "alert") [| inject (string str) |] in ()
								  
  (* fin : unit -> unit *)
  (* on ferme le tout !  *)
  let fin () = ()
    
  (* gagne : unit -> unit  *)
  (* un message indiquant que la machine a gagne  *)
  let gagne () = 
    previens "La machine a gagné"
      
  (* perd : unit -> unit  *)
  (* un message indiquant que la machine a perdu *)
  let perd () = 
    previens "La machine a perdu"
      
  (* nul : unit -> unit  *)
  (* un message indiquant que personne ne peut gagner  *)
  let nul () = 
    previens "Partie nulle"
      
  (* init : unit -> unit *)
  (* dessine le plateau de jeu  *)
  let init () = 
    (*let jeu = jeu_depart () in *)
    renderIntoBody (instanciate app)
      
    (*affiche le nouvel état*)
  let affiche joueur coup ancien_jeu nouveau_jeu =
    renderIntoBody (instanciate app)
      
  let q_jouer () = 
    question "Est-ce une machine qui joue?"
      
  (* q_commencer : unit -> bool *)
  (* demande si l'utilisateur desire jouer en premier ou non  *)
  let q_commencer () = 
    question "Voulez-vous commencer ?"
      
  (* q_continuer : unit -> bool *)
  (* demande si l'utilisateur desire rejouer un autre partie *)
  let q_continuer () = 
    question "Encore une partie ?"
      
  let choix joueur jeu = 
    (1,(P(-1)))
      
end
  
open Alphabeta 
  
module Stone_squeletteG = 
  FSquelette (Stone_rep) (Stone_Enyo) (Stone_eval)
    (FAlphabeta (Stone_rep) (Stone_eval)) ;;


module Stone_mainG = FMain(Stone_squeletteG);;

Stone_mainG.main ()
