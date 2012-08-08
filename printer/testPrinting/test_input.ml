open Lib_enyo.Enyo
open Lwt
open Js 
open Unsafe

let cpt = ref 0

let clique_input this sender event =
  setStyle this "background-color:green";
  setValue this "On a cliqué :)";
  incr cpt;
  let _ =
    (Lwt_js.sleep 1.) >>=
      (fun _ -> 
	setValue this "On a pas cliqué :c"; 
	setStyle this "background-color:red";
	Lwt.return ()) in
  false

let click_control this sender event =
  (try 
     let le_sender = as_a `INPUT sender in
     (if !cpt > 0 && !cpt mod 5 = 0 then
	 log this ((string_of_int !cpt)^" triggered")
      else 
	 ());
     let comp_list = getComponents this () in
     let mon_control_clicks_instanciated = as_a `CONTROL (List.nth comp_list 1) in
     setContent mon_control_clicks_instanciated (string_of_int !cpt)
   with Bad_kind -> log this "bad kind");
  true

let mon_input = input ~value:"Prêt" ~ontap:clique_input ()
  
let mon_autre_control = control ~content:"Un champ :" ()  
let mon_control_clicks = control ~content:"0"
  (*~contentChanged:
  (fun this old_string -> ()
    (*setContent this ("Nombre de clicks reçus : "^(string_of_int !cpt))*)
  )*)
      
()
  
let mon_control = control 
  ~ontap:click_control
  ~components:[mon_autre_control; mon_control_clicks; mon_input; mon_input; mon_input] ~name:"App" ()
  
let mon_app = instanciate mon_control

let _ = renderIntoBody mon_app
