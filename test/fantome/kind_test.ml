open Js
open Unsafe

module Enyo : sig
  type any_id = [ `CONTROL | `INPUT | `BUTTON ]
  type any_event = [ `GESTURE ]
  type handler
  type +'a kind (* constraint 'a = [< any_id] *)
  type +'a obj
  
  val instanciate : ([< any_id] as 'a) kind -> 'a obj
  val render_it : 'a obj -> unit

  (* constructeurs *)
  val control : ?components:any_id kind list -> ?content:string -> ?name:string -> unit -> [> `CONTROL ] kind
  val input : ?components:any_id kind list -> ?content:string -> ?name:string -> ?value:string-> 
    ?input_type:string -> unit -> [> `INPUT ] kind
  val button : ?components:any_id kind list -> ?content:string -> ?name:string -> 
    ?ontap:([ `BUTTON ] obj -> any_id obj -> [`GESTURE ] obj -> bool) -> unit -> [> `BUTTON ] kind

  (* opérations spécifiques *)
  val get_content : [< `CONTROL | `INPUT | `BUTTON ] obj -> string
  val get_name : [< `CONTROL | `INPUT ] obj -> string
  val get_components : any_id obj -> any_id kind list
  val set_content : [< `CONTROL | `INPUT | `BUTTON ] obj -> string -> unit

  (* Test sur event souris *)
  val get_screenX: [ `GESTURE ] obj -> int
    
  (* introspection *)
  exception Bad_kind
  val id : ([< any_id] as 'a) obj -> 'a
  val as_a : ([< any_id] as 'a) -> [< any_id] obj -> 'a obj
end = struct
  type any_id = [ `CONTROL | `INPUT | `BUTTON ]
  type any_event = [ `GESTURE ]
  type dom_node = Dom.node
  type js_value = Int of int | String of string | Char of char | Float of float | Dom_node of dom_node | Bool of bool | Array of js_value list
  type handler = Handler of string * (any_id obj -> any_id obj -> any_event obj -> bool)
  and value_changed = Changed of string * (any_id obj -> js_value -> unit)
  and +'a kind = {id:string; components: any_id kind list;prop_changed_list:value_changed list; handler_list:handler list; prop_list : (string * js_value) list }
  and +'a obj = Js.Unsafe.any
    
  let kind_it kind obj_js =
    (***** POUR INTROSPECTION *****)
    set obj_js "_onyo_id" (string (kind.id));
    (***** PRENDRE EN CONSIDERATION : rajouter une fonction (any_id kind -> string)  *****)
    let enyo_js_object = 
      let _ = fun_call (variable "enyo.kind") [| inject obj_js |] in
      new_obj (variable 
                  (match (List.assoc "name" kind.prop_list) with
                   String s->s|_->assert false)) [||]
    in
    enyo_js_object

  let rec coerce_prop value = 
    match value with
    | Int v -> inject v
    | Char v -> inject v
    | Dom_node v -> inject v
    | Float f -> inject (float f)
    | Bool b ->  inject (bool b)
    | String s -> inject (string s)
    | Array v -> inject (array (Array.of_list (List.map coerce_prop v)))
      
  let instanciate (kind:([< any_id] as 'a) kind) : 'a obj =
    let rec build_component_tree : 'a. ([< any_id] as 'a) kind -> Js.Unsafe.any = fun kind ->
      let js_obj = new_obj (variable "Object") [||] in
      List.iter (fun (x,y) -> set js_obj x (coerce_prop y)) kind.prop_list;
      (if kind.components != []  then
	  let array_component = Array.of_list (List.map build_component_tree kind.components) in
	  set js_obj "components" (array array_component));
      (if kind.handler_list != [] then
	  let handlers_name = List.map (fun (Handler (x,_)) -> x) kind.handler_list in
	  let handlers_name_func = List.map 
	    (fun x -> String.sub x 2 ((String.length x) - 2)) (*Map sur array type [0; 'bla'; ..]*)
	    handlers_name in
	  let handlers_func = List.map (fun (Handler (_,y)) -> y) kind.handler_list in
	  let handler_obj = new_obj (variable "Object") [||] in
	  (* Ajoute le handler contenant les events sur l'objet *)
	  List.iter 
	    (fun (name,fname) -> set handler_obj name (string fname)) 
	    (List.combine handlers_name handlers_name_func);
	  js_obj##handlers <- handler_obj;
	  (* Ajoute les fonctions de traitement sur l'objet *)
	  List.iter 
	    (fun (fname,f) -> set js_obj fname (wrap_meth_callback f))
	    (List.combine handlers_name_func handlers_func)
      );
      js_obj in
    kind_it kind (build_component_tree kind)

  let render_it obj_enyo_js =
    Dom_html.window##onload <- Dom_html.handler
      (fun _ -> let _ = meth_call obj_enyo_js "renderInto" [| inject (variable "document.body") |] in Js._false)
      
  (* générateur de label *)
  let new_label name =
    let i = ref (-1) in
    (fun () -> incr i; name ^ (string_of_int !i))

  let new_label_control = new_label "control"
  let new_label_button =  new_label "button"


  let control ?(components=[]) ?content ?name () = 
    let name = match name with Some v -> v | None -> new_label_control ()
    and content = match content with Some v -> v | None -> ""
    in
    { id="CONTROL"; components=components; handler_list=[];
      prop_list = [("kind", String "Control"); ("content", String content); ("name", String name)]; prop_changed_list=[] }
      
  let input ?(components=[]) ?content ?name ?value ?input_type () = 
    let name = match name with Some v -> v | None -> new_label_control ()
    and content = match content with Some v -> v | None -> ""
    and value = match value with Some v -> v | None -> ""
    and input_type = match input_type with Some v -> v | None -> "text"
    in
    { id="INPUT"; components=components; handler_list=[];
      prop_list = [("kind", String "Input"); ("value", String value); ("content", String content); 
		   ("name", String name); ("type", String input_type)]; prop_changed_list=[] }

  let button ?(components=[]) ?content ?name ?ontap () =
    let name = match name with Some v -> v | None -> new_label_button ()
    and content = match content with Some v -> v | None -> ""
    and ontap = match ontap with Some v -> v | None -> (fun (o:any_id obj) (x:any_id obj) (y:any_event obj) -> false)
    in
    let handlers = [Handler ("ontap", ontap)] in
    { id="BUTTON"; components=components; handler_list=handlers;
      prop_list = [("kind", String "Button"); ("content", String content); ("name", String name)];prop_changed_list=[] }
      
  (* opérations spécifiques *)
  let get_content obj_js =
    let s = meth_call obj_js (variable "getContent") [||] in
    to_string s

  let get_name obj_js = 
   let s = meth_call obj_js (variable "getName") [||] in
    to_string s
      
  let get_components obj_js =
    assert false

  let set_content obj_js new_value =
    let _ = meth_call obj_js "setContent" [| inject new_value |] in ()

  (* Test event *)
  let get_screenX event_js =
    let v = get event_js "screenX" in
    v

  (* introspection *)
  exception Bad_kind

  let id (obj_js : ([< any_id] as 'a) obj) : 'a =
    let s = to_string (get obj_js "_onyo_id") in    
    Obj.magic (match s with
    | "BUTTON" -> `BUTTON
    | "INPUT" -> `INPUT
    | _ -> `CONTROL)
      
  let as_a id_type obj_js =
    if ((id obj_js) :> any_id) = (id_type :> any_id) then
      obj_js
    else
      raise Bad_kind
end

open Enyo

let change_content_handler this sender event =
  let r = Random.int (1 lsl 20) in 
  set_content this (string_of_int r);
  fun_call (variable "alert") [| inject ("Position x = "^(string_of_int (get_screenX event))) |];
  true

let mon_bouton = button ~ontap:change_content_handler ~content:"Touch me, touch me, touch me" ()

let mon_control = control ~name:"Bla" ~components:[mon_bouton] ()

let mon_control_js =instanciate mon_control

let _ = render_it (mon_control_js)

(* pas nécessaire :/ *)
(*let cont_js = as_a `CONTROL mon_control_js

let _  =  set_content cont_js "BLOU"
*)
