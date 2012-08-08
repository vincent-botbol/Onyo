module Truc : sig
  type +'a t
  type any = [ `BUTTON | `LABEL | `SHEEP ]
  val button : unit -> [> `BUTTON ] t
  val label : unit -> [> `LABEL ] t
  val sheep : unit -> [> `SHEEP ] t
  exception Unknown_kind
  exception Bad_kind
  val extract_kind : [< any] t -> any

  val is_button : [< any > `BUTTON ] t -> bool
  val as_button : ([< any > `BUTTON ] as 'a) t -> 'a t
  
  (* val button_operation : [< any > `BUTTON] t -> .... *)
  (* val set_content : [< any > `BUTTON | `LABEL ] t -> .... *)
end = struct
  type 'a t = { kind : string }
  type any = [ `BUTTON | `LABEL | `SHEEP ]
  let button () = { kind = "button" }
  let label () = { kind = "label" }
  let sheep () = { kind = "sheep" }
  exception Unknown_kind
  exception Bad_kind
  let extract_kind truc =
    match truc.kind with
    | "button" -> `BUTTON
    | "label" -> `LABEL
    | "sheep" -> `SHEEP
    | _ -> raise Unknown_kind
  let is_button truc =
    match extract_kind truc with
    | `BUTTON -> true
    | _ -> false
  let as_button truc =
    match extract_kind truc with
    | `BUTTON -> truc
    | _ -> raise Bad_kind
end

let toto =
  let but1 = Truc.button () in
  let lbl = Truc.label () in
  [but1 ; lbl]

let test =
  List.map
    (fun truc ->
      match Truc.extract_kind truc with
      | `BUTTON -> "je suis un bouton"
      | `LABEL -> "je suis une étiquette"
      | `SHEEP -> "je suis un mouton")
    toto

let all_buttons l =
  List.fold_left
    (fun r truc ->
      match Truc.extract_kind truc with
      | `BUTTON -> Truc.as_button truc :: r
      | `LABEL -> r
      | `SHEEP -> r)
    []
    l

let all_buttons_really l =
  (all_buttons l :> [ `BUTTON ] Truc.t list)
