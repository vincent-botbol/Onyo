(*****************************************************************************)
(*****  Devellopement d'applications avec Objective Caml                 *****)
(*****                                                                   *****)
(*****  Application : Jeux a deux joueurs : Puissance 4 - graphique      *****)
(*****************************************************************************)

open Alphabeta 
open P4

module P4_graph = struct
  open P4_rep
  type jeu = P4_rep.jeu
  type coup = P4_rep.coup

  let r = 20          (* rayon du jeton *)
  let ec = 10         (* ecart entre deux jeton *)
  let dec = 30        (* centre du premier jeton *)
  let cote = 2*r + ec (* taille d'un jeton vu comme un carre *)
  let htexte = 25     (* place pour mettre le texte *)
  let largeur = col * cote + ec          (* largeur de la fenetre *)
  let hauteur = lig * cote + ec + htexte (* hauteur de la fenetre *)
  let hauteur_de_jeu = lig * cote + ec   (* hauteur de l'espace de jeu *)
  let hec = hauteur_de_jeu + 7  (* ligne d'ecriture *)
  let lec = 3                   (* colonne d'ecriture *)
  let marge = 4                 (* marge pour les boutons *)
  let xb1 = largeur / 2   (* position x du bouton1 *)
  let xb2 = xb1 + 30      (* position x du bouton2 *)
  let yb = hec - marge    (* position y des boutons *)
  let wb = 25             (* largeur des boutons *)
  let hb = 16             (* hauteur des boutons *)


  (* val t2e : int -> int *)
  (* convertie une coordonnee matrice en coordonnee graphique *)
  let t2e i = dec + (i-1)*cote

  (* les couleurs *)
  let cN = Graphics.black   (* trace *)
  let cA = Graphics.red     (* jeton du joueur humain *)
  let cB = Graphics.yellow  (* jeton de la machine *)
  let cF = Graphics.blue    (* couleur de fond pour le jeu *)
  (* val draw_table : unit -> unit :  trace une table vide *)
  let draw_table () =
    Graphics.clear_graph();
    Graphics.set_color cF;
    Graphics.fill_rect 0 0 largeur hauteur_de_jeu;
    Graphics.set_color cN;
    Graphics.moveto 0 hauteur_de_jeu;
    Graphics.lineto largeur hauteur_de_jeu;
    for l = 1 to lig do
      for c = 1 to col do
        Graphics.draw_circle (t2e c) (t2e l) r
      done
    done

  (* val draw_jeton : int -> int -> Graphics.color -> unit *)
  (* 'draw_jeton l c co' dessine un jeton de couleur co aux coordonnees l c *)
  let draw_jeton l c col =
    Graphics.set_color col;
    Graphics.fill_circle (t2e c) (t2e l) (r+1)


  (* val ajoute : Rep.item array array -> int -> Rep.coup *)
  (* 'ajoute m c' renvoie la ligne ou tombe le jeton jouer en c dans m *)
  let ajoute mat c =
    let l = ref lig in
    while !l > 0 & mat.(!l-1).(c-1) = Vide do
      decr l
    done;
    !l

  (* val conv : Graphics.status -> int *)
  (* convertit l'endroit ou on a clique en colonne de jeu *)
  let conv st =
    (st.Graphics.mouse_x - 5) / 50 + 1

  (* val wait_click : unit -> Graphics.status *)
  (* attend un click souris *)
  let wait_click () = Graphics.wait_next_event [Graphics.Button_down]

  (* val choixH : Rep.jeu -> Rep.coup *)
  (* rend le choix du joueur humain a partir d'une situation *)
  (* la fonction renvoie un coup possible *)
  let rec choix joueur  jeu  =
    let c = ref 0 in
    while not ( List.mem !c (coups_legaux joueur jeu) ) do
      c := conv ( wait_click() )
    done;
    !c

  (* val accueil : unit -> unit :  l'ecran d'accueil *)
  let accueil () =
    Graphics.open_graph
      (" "^ (string_of_int largeur) ^"x"^ (string_of_int hauteur) ^"+50+50");
    Graphics.moveto (hauteur/2) (largeur/2);
    Graphics.set_color cF;
    Graphics.draw_string "P4";
    Graphics.set_color cN;
    Graphics.moveto 2 2;
    Graphics.draw_string "par Romuald COEFFIER & Mathieu DESPIERRE";
    ignore (wait_click ());
    Graphics.clear_graph()


  (* val fin : unit -> unit ,  la fin du jeu *)
  let fin () = Graphics.close_graph()

  (* val draw_boutton : int -> int -> int -> int -> string -> unit *)
  (* 'draw_boutton x y w h s' dessine un bouton (rectangle) aux coordonnees *)
  (* x,y de largeur w de hauteur h avec l'etiquette s *)
  let draw_boutton x y w h s =
    Graphics.set_color cN;
    Graphics.moveto x y;
    Graphics.lineto x (y+h);
    Graphics.lineto (x+w) (y+h);
    Graphics.lineto (x+w) y;
    Graphics.lineto x y;
    Graphics.moveto (x+marge) (hec);
    Graphics.draw_string s

  (* val draw_message : string -> unit  * affiche le message s *)
  let draw_message s =
    Graphics.set_color cN;
    Graphics.moveto lec hec;
    Graphics.draw_string s

  (* val efface_message : unit -> unit  * efface la partie affichage *)
  let efface_message () =
    Graphics.set_color Graphics.white;
    Graphics.fill_rect 0 (hauteur_de_jeu+1) largeur htexte

  (* val question : string -> bool *)
  (* 'question s' pose la question s : la reponse est obtenue par  *)
  (*l'intermediaire de deux boutons, un 'oui' (=true) et un 'non' (=false) *)
  let question s =
    let rec attente () =
      let e = wait_click () in
      if (e.Graphics.mouse_y < (yb+hb)) & (e.Graphics.mouse_y > yb) then
	if (e.Graphics.mouse_x > xb1) & (e.Graphics.mouse_x < (xb1+wb)) then
          true
	else
          if (e.Graphics.mouse_x > xb2) & (e.Graphics.mouse_x < (xb2+wb)) then
            false
          else
            attente()
      else
	attente () in
    draw_message s;
    draw_boutton xb1 yb wb hb "oui";
    draw_boutton xb2 yb wb hb "non";
    attente()
      
  (* val q_commencer : unit -> bool *)
  (* demande avec la fonction 'question' si on veut commencer (oui=true) *)
  let q_commencer () =
    let b = question "Voulez-vous commencer ?" in
    efface_message();
    b

  (* val q_continuer : unit -> bool *)
  (* demande avec la fonction 'question' si on veut refaire une partie *)
  (* (oui=true) *)
  let q_continuer () =
    let b = question "Encore une partie ?" in
    efface_message();
    b

  let q_jouer () = 
    let b = question "Est-ce une machine qui joue?" in 
    efface_message ();
    b
  (* val gagne : unit -> unit *)
  (* val perd : unit -> unit *)
  (* val nul : unit -> unit *)
  (* trois fonctions suivant les trois cas *)
  let gagne () = 
    draw_message "Je gagne :-)" ; ignore (wait_click ()) ; efface_message()
  let perd () = 
    draw_message "Vous gagnez :-("; ignore (wait_click ()) ; efface_message()
  let nul () = 
    draw_message "Partie nulle" ; ignore (wait_click ()) ; efface_message()

  (* val init : unit -> unit *)
  (* init est appele a chaque debut de partie pour l'affichage *)
  let init  = draw_table

  let affiche b c aj nj  = 
    if b then draw_jeton (ajoute nj c) c cA
    else draw_jeton (ajoute nj c) c cB
  
  (* val drawH : int -> Rep.item array array -> unit *)
  (* affichage quand le joueur humain joue un coup cp dans la situation j *)
  let drawH cp j =  draw_jeton (ajoute j cp) cp cA

  (* val drawM : int -> cell array array -> unit*)
  (* affichage quand la machine joue un coup cp dans la situation j *)
  let drawM cp j =  draw_jeton (ajoute j cp) cp cB

end;;


module P4_squeletteG = 
  FSquelette (P4_rep) (P4_graph) (P4_eval) (FAlphabeta (P4_rep) (P4_eval)) ;;

module P4_mainG = FMain(P4_squeletteG) ;;

P4_mainG.main () ;;

