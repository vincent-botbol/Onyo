open Lib_enyo.Enyo
open Lwt

let taille = (6,7)

(* Modèle *)
type cell = A | B | Vide

let matrice_jeu = match taille with (h,w) -> Array.make_matrix h w Vide

let est_coup_valide i j =
  try 
    matrice_jeu.(i).(j) = Vide  && matrice_jeu.(i-1).(j) != Vide
  with
  | Invalid_argument _ -> true
    
    
type resultat = Win of bool | Nul | None (* Win b => Victoire de b | Nul => match nul | None -> Pas de gagnant *)

exception Quatre of bool
exception Valeur_nulle 
let moinsI = -10000
let plusI = 10000
    
let eval_quatre m l_dep c_dep delta_l delta_c =
  let n = ref 0 and e = ref Vide 
  and x = ref c_dep  and  y = ref l_dep 
  in try 
       for i = 1 to 4 do 
         ( match m.(!y).(!x) with 
           A -> if !e = B then raise Valeur_nulle ;
             incr n ;
             if !n = 4 then raise (Quatre true) ;
             e := A
         | B -> if !e = A then raise Valeur_nulle ;
           incr n ;
           if !n = 4 then raise (Quatre false);
           e := B; 
         | Vide -> ());
         x := !x + delta_c ;
         y := !y + delta_l  
       done  
    with 
      Valeur_nulle
    | Invalid_argument _ -> ()
	
let eval_bloc m cmin cmax lmin lmax dx dy = 
  for c=cmin to cmax do
    for l=lmin to lmax do 
      eval_quatre m l c dx dy
    done
  done
    
let evaluer m =
  let nbCaseVide = Array.fold_left (fun x y -> x + (Array.fold_left (+) 0 y)) 0
    (Array.map (Array.map (function A | B -> 0 | Vide -> 1)) m)
  in if nbCaseVide = 0 then Nul else
  let (lig,col) = taille in
  try
    (* lignes *)
    eval_bloc m  0 (lig-1) 0 (col-4) 0 1 ;
    (* colonnes *)
    eval_bloc m  0 (col-1) 0 (lig-4) 1 0 ;
    (* diagonales partant de la premiere ligne (à droite) *)
    eval_bloc m 0 (col-4) 0 (lig-4) 1 1 ;
    (* diagonales partant de la premiere colonne (à droite) *)
    eval_bloc m  1 (lig-4) 0 (col-4) 1 1 ;
    (* diagonales partant de la premiere ligne (à gauche) *)
    eval_bloc m  3 (col-1) 0 (lig-4) 1 (-1) ;
    (* diagonales partant de la derniere colonne (à gauche) *)
    eval_bloc m 1 (lig-4) 3 (col-1) 1 (-1) ;
    None
  with Quatre b -> Win b

    
let eval_matrice () = evaluer matrice_jeu
  
let joueur = ref true (* true => j1 | false => j2 *)
let partie_en_cours = ref true

(* Vue *)

let dernier_coup_est_valide = ref false

let src_token_vide = "img/vide.png"
let src_token_j1 = "img/token1.png"
let src_token_j2 = "img/token2.png"

let base_component = image ~style:"margin:10px -20px -15px 20px" ~src:src_token_vide
let comp_feed_line = image ~tag:"br" ()

(*
  Teste si le coup est valide puis 
  actualise l'image avec le pion du joueur concerné
*)
let creer_callback_ontap i j = fun this sender event ->
  if est_coup_valide i j && !partie_en_cours then(
    matrice_jeu.(i).(j) <- if !joueur then A else B;
    setSrc this (if !joueur then src_token_j1 else src_token_j2);
    joueur:=not !joueur;
    dernier_coup_est_valide:=true
  ) else(
    dernier_coup_est_valide:=false
  );
  false (* pour prévenir l'app d'évaluer la situation *)
      
let creer_cellule i j =
  base_component ~ontap:(creer_callback_ontap i j) ()

let creer_matrice_cellules () =
  match taille with (h,w) ->
    let mat = Array.make_matrix h w (button ()) in
    for i = 0 to h-1 do
      for j = 0 to w-1 do
	mat.(i).(j) <- creer_cellule i j
      done
    done;
    mat

let my_components =
  match taille with (h,w) ->
    let mat = creer_matrice_cellules () in
    Array.fold_left (fun acc array -> (Array.to_list array)@(comp_feed_line::acc)) [] mat

(*
  Evalue le jeu et met à jour le control info
*)
let callback_ontap_main_control this sender y =
  try
    let _ = as_a `IMAGE sender in (* Si c'est une image qui a envoyé le click => alors on peut évaluer *) (* nb : ça craint du boudin *)
    let control_info = as_a `CONTROL (List.nth (getComponents this ()) 1) in
    setContent control_info (
      if !dernier_coup_est_valide then
	(match eval_matrice () with
	  Win b -> partie_en_cours:=false; setStyle control_info "color:yellow"; "Le joueur "^(if b then "1" else "2")^" gagne la partie !"
	| Nul -> partie_en_cours:=false; setStyle control_info "color:blue"; "Match nul"
	| None -> 
	  if !joueur then
	    (setStyle control_info "color:green";
	     "Au joueur 1 de jouer...")
	  else
	    (setStyle control_info "color:pink";
	     "Au joueur 2 de jouer...")
	)
      else if !partie_en_cours then (
	setStyle control_info "color:red";
	"Coup non-valide")
      else (
	setStyle control_info "color:red";
	"Partie terminée")
    ); true
  with
    Bad_kind -> true

let infos = control ~tag:"p" ~style:"color:red" ~content:"P-P-Puissance 4 !" ()
let toolbar = onyx_toolbar ~components:[infos] ()
  
let mon_control = control
  ~name:"App" ~ontap:callback_ontap_main_control 
  ~components:(toolbar::my_components) ()

let mon_app = instanciate mon_control

let _ = renderIntoBody mon_app
