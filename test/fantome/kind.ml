module Enyo : sig
  type any_id = [ `BUTTON | `LABEL | `SHEEP | `CONTROL ]
  type +'a kind (* constraint 'a = [< any_id] *)
  type +'a obj

  val instanciate : 'a kind -> 'a obj

  (* constructeurs *)
  val button : ?content:string -> unit -> [> `BUTTON ] kind
  val label : ?content:string -> unit -> [> `LABEL ] kind
  val sheep : ?color:[`WHITE | `BLACK] -> unit -> [> `SHEEP ] kind
  val control : ?content:string -> ?name:string -> unit -> [> `CONTROL ] kind
    
  (* opérations spécifiques *)
  val get_content : [> `BUTTON | `LABEL | `CONTROL ] obj -> string
  val get_color : [> `SHEEP ] obj -> [`WHITE | `BLACK]
  val get_name : [> `CONTROL ] obj -> string

  (* introspection *)
  exception Bad_kind
  val id : ([< any_id] as 'a) obj -> 'a
  val as_a : ([< any_id] as 'a) -> [< any_id] obj -> 'a obj
end = struct
  type any_id = [ `BUTTON | `LABEL | `SHEEP | `CONTROL ]
  type +'a kind = { id : 'a ; init_list : (string * string) list }
  type +'a obj = Obj of 'a kind (* pour l'exemple *)
      
  let instanciate kind = 
    Obj ({ id = kind.id ; init_list = kind.init_list })
    
  (* générateur de label *)
  let new_label name = 
    let i = ref (-1) in
    (fun () -> incr i; name ^ (string_of_int !i))
      
  let new_label_control = new_label "control"

  (* constructeurs *)
  let button ?(content = "") () =
    { id = `BUTTON ;
      init_list = [("content", content)] }
  let label ?(content = "") () =
    { id = `LABEL ;
      init_list = [("content", content)] }
  let sheep ?(color : [`WHITE | `BLACK] = `WHITE) () =
    { id = `SHEEP ;
      init_list = [("color", match color with `WHITE -> "white" | `BLACK -> "black")] }
  let control ?(content="") ?(name="#undef") () = 
    let name =
      if name = "#undef" then
	new_label_control ()
      else
	name
    in
    { id = `CONTROL ;
      init_list = [("content", content); ("name", name)] }
      
  (* opérations spécifiques *)
  let get_content (Obj obj) =
    List.assoc "content" obj.init_list
      
  let get_color (Obj obj) =
    match List.assoc "color" obj.init_list with
    | "black" -> `BLACK
    | "white" -> `WHITE
    | _ -> assert false
  let get_name (Obj obj) = 
    List.assoc "name" obj.init_list

  (* introspection *)
  exception Bad_kind
  let id (Obj obj) =
    obj.id
  let as_a id (Obj obj) =
    if (obj.id :> any_id) = (id :> any_id) then
      Obj { obj with id = id }
    else
      raise Bad_kind
end


(*** test ***)
let all_buttons l =
  (List.fold_left
     (fun r truc ->
      match Enyo.id truc with
      | `BUTTON -> Enyo.as_a `BUTTON truc :: r
      | `LABEL -> r
      | `SHEEP -> r
      | `CONTROL -> r)
    []
    l
   :> [ `BUTTON ] Enyo.obj list)

let generic_print l =
  Printf.printf "---\n" ;
  List.iter
    (fun truc ->
      match Enyo.id truc with
      | `BUTTON ->
	let button = Enyo.as_a `BUTTON truc in
	Printf.printf "je suis le bouton %s\n" (Enyo.get_content button)
      | `LABEL ->
	let label = Enyo.as_a `LABEL truc in
	Printf.printf "je suis l'étiquette %s\n" (Enyo.get_content label)
      | `SHEEP ->
	let mutton = Enyo.as_a `SHEEP truc in
	Printf.printf "je suis un mouton %s\n"
	  (match Enyo.get_color mutton with `WHITE -> "white" | `BLACK -> "black")
      | `CONTROL ->
	let cont = Enyo.as_a `CONTROL truc in
	Printf.printf "je suis le control %s contenant %s\n" (Enyo.get_name cont) (Enyo.get_content cont))
    l

let mouton1 = Enyo.sheep ~color:`BLACK ()

let all x l =
  List.fold_left
    (fun r truc ->
      if Enyo.id truc = (x :> Enyo.any_id) then
	(Enyo.as_a x truc)::r
      else 
	r)
    []
    l

let control1 = Enyo.control ~content:"bla" ()
let control2 = Enyo.control ~content:"bla" ~name:"controlator" ()
let control3 = Enyo.control ()

let test_list =
  let but_toto_kind = Enyo.button ~content:"toto" () in
  [ Enyo.instanciate but_toto_kind ;
    Enyo.instanciate control3;
    Enyo.instanciate but_toto_kind ;
    Enyo.instanciate (Enyo.label ~content:"bla" ());
    Enyo.instanciate control2;
    Enyo.instanciate mouton1;
    Enyo.instanciate control1
  ]

let _ = 
  begin 
    generic_print test_list;
    generic_print (all_buttons test_list);
    generic_print (all `SHEEP  test_list);
    generic_print (all `CONTROL  test_list);
  end
