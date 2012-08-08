module Kind :
  sig
    type +'a t
    type button = [`BUTTON]
    val button_kind : ... -> (*'a t *) button t
    val create  :'a t -> (* 'b *) 'a Component.t
  end
  = 
struct
  type +'a t = (string * value) list
  let button_kind .. = 
    ["onclick", convert onclick;
     ...]
      
  let create l = .. (* fabrique le composant *)
end
  
set_content : [< `BUTTON | `LABEL | ..] component ->
  string -> unit

set_onclick :
    'a component ->
      ('a component -> click event -> bool) -> unit

(* Extraction dynamique de type *)
extract_kind : 'a t -> [`Button | .. ]
check_kind : ([< .. ] as 'a) -> 'b t -> 'a t
