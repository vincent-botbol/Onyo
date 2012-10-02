type config = {nbcols : int;
	       nblignes : int;
	       nbmines : int
	      }

let config_par_defaut = {nbcols=10; nblignes=10; nbmines=10}

type case = Empty | Num of int | Mine
type vue_case = Affiche of case | Cache of case | Drapeau of case

type plateau = vue_case array array

exception Gagne
exception Perdu

let () = Random.self_init ()

let calc_nb_mines_autour plateau (i,j) =
	List.fold_left (+) 0
	  (List.map
	  (
	   fun (x,y) ->
	      try 
		match plateau.(x).(y) with
		  Cache(Mine) -> 1
		| _ -> 0
	      with
		Invalid_argument _ -> 0
	  ) 
	  [((i-1),(j-1));((i-1),(j));((i-1),(j+1))
	  ;((i),(j-1));               ((i),(j+1))
	  ;((i+1),(j-1));((i+1),(j));((i+1),(j+1))])
	  
let insert_nums plateau (height,width) =
  for i = 0 to height - 1 do
    for j = 0 to width - 1 do
      match plateau.(i).(j)  with
      | Cache(Mine) -> ()
      | Cache(Empty) -> plateau.(i).(j) <-
	(match calc_nb_mines_autour plateau (i,j) with 0 -> Cache(Empty) | n -> Cache(Num(n)))
      | _ -> assert false
    done
  done

let affiche_mines plateau (height, width) =
  for i = 0 to height - 1 do
    for j = 0 to width - 1 do
      match plateau.(i).(j) with
	Cache(Mine) -> plateau.(i).(j) <- Affiche(Mine)
      | _ -> ()
    done
  done

let a_gagne plateau (height, width) =
  try 
    for i = 0 to height - 1 do
      for j = 0 to width - 1 do
	match plateau.(i).(j) with
	  Cache(Num(_)) -> raise Exit
	| _ -> ()
      done 
    done;
    true
  with
    Exit -> false

let rec revele_case plateau ((height,width) as dim) (i,j) =
  (try
    match plateau.(i).(j) with
    | Affiche(_) | Drapeau(_) -> ()
    | Cache(Mine) -> affiche_mines plateau dim; raise Perdu
    | Cache(Num(x)) -> plateau.(i).(j) <- Affiche(Num(x))
    | Cache(Empty) -> plateau.(i).(j) <- Affiche(Empty);
      List.iter (revele_case plateau dim) [((i-1),(j-1));((i-1),(j));((i-1),(j+1))
					  ;((i),(j-1));               ((i),(j+1))
					  ;((i+1),(j-1));((i+1),(j));((i+1),(j+1))]
   with
     Invalid_argument _ -> ()
  );
  if a_gagne plateau dim then
    raise Gagne
      
let poser_drapeau plateau (i,j) =
  match plateau.(i).(j) with
  | Cache(x) -> plateau.(i).(j) <- Drapeau(x)
  | Drapeau(x) -> plateau.(i).(j) <- Cache(x)
  | _ -> ()

(* crée et initialise le plateau de jeu *)
let creer_jeu ?config:(config=config_par_defaut) (x,y) =
  let plateau = Array.make_matrix
    config.nblignes
    config.nbcols 
    (Cache (Empty))
  in
  let cpt = ref 0 in
  while !cpt < config.nbmines do
    let (i,j) = (Random.int config.nblignes, Random.int config.nbcols) in
    if x = i && y = j then
      ()
    else
      match plateau.(i).(j) with
      | Cache(Empty) -> plateau.(i).(j) <- Cache(Mine); incr cpt
      | Cache(Mine) -> ()
      | _ -> assert false
  done;
  insert_nums plateau (config.nblignes, config.nbcols);
  revele_case plateau (config.nblignes, config.nbcols) (x,y); (* safe => pas de mine sur le premier coup *)
  plateau    


    
  
