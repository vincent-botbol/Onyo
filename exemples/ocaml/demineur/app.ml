open Demineur

let height = config_par_defaut.nblignes and width = config_par_defaut.nbcols

let plateau_par_defaut () = (Array.make_matrix height width (Cache(Empty)))
let plateau = ref (plateau_par_defaut ())
let a_joue = ref false

(* Vue *)
open Lib_enyo.Enyo

type instr = None | RAZ | Drapeau of int * int | Creuser of int * int
let curr_instr = ref None

type mode = Dig | Flag
let curr_mode = ref Dig

let recommencer = onyx_button 
  ~ontap:(fun _ _ _ -> curr_instr:=RAZ; false) 
  ~content:"Remise à zéro" ()

let output = control ~content:"" ()

let menu_bar = onyx_toolbar ~components:[recommencer; output] ()

let creer_button i j = 
  onyx_button ~content:"-" ~style:"width:5px; color:red" 
    ~ontap:(fun this _ ev -> 
      (match (gesture_ctrlKey ev,!curr_mode) with
	true, _ | _, Flag -> curr_instr := Drapeau (i,j)
      | _ -> curr_instr := Creuser (i,j));
      false
    )
    ()

let creer_grille h w = 
  let grille = ref [] in
  for i = h-1 downto 0  do
    grille:=(control ~tag:"br" ())::!grille;
    for j = w-1 downto 0 do
      grille:=(creer_button i j)::!grille;
    done 
  done;
  !grille  

let recuperer_bouton app i j =
  let liste_comps = getComponents app () and
      decalage = 3 (* bar + recommencer + label *)
  in
  as_a `ONYX_BUTTON (List.nth liste_comps (decalage+(width+1)*i+j))

let afficher_plateau app =
  for i = 0 to height - 1 do
    for j = 0 to width - 1 do
      let bouton = recuperer_bouton app i j in
      match !plateau.(i).(j) with
	Affiche (case) -> 
	  (match case with 
	    Empty -> setContent bouton "0"; setDisabled_bool bouton true
	  | Num(n) -> setContent bouton (string_of_int n); setDisabled_bool bouton true
	  | Mine -> setContent bouton "X"
	  )
      | Cache (_) -> setContent bouton "-"; setDisabled_bool bouton false
      | Demineur.Drapeau (_) -> setContent bouton "F"
    done
  done
    
let handler_app this _ _ =
  (  
    try 
      match !curr_instr with
	None -> ()
      | RAZ -> a_joue:=false; plateau := plateau_par_defaut ()
      | Drapeau (i,j) -> plante_enleve_drapeau !plateau (i,j)
      | Creuser (i,j) -> 
	if !a_joue then
	  revele_case !plateau (height,width) (i,j)
	else
	  (plateau := creer_jeu ~config:config_par_defaut (i,j);
	   a_joue := true);
    with
    | Gagne -> setContent (as_a `CONTROL (List.nth (getComponents this ()) 2)) "Bravo, vous avez gagné !" 
    | Perdu -> setContent (as_a `CONTROL (List.nth (getComponents this ()) 2)) "Désolé, vous avez perdu..."
  );
  afficher_plateau this;
  true

let app = control
  ~ontap:handler_app
  ~components:(menu_bar::(creer_grille height width))
  ~style:"text-align:center" ()

let () = renderIntoBody (instanciate app)
