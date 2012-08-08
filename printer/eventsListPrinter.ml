open Struct_types
open EventsPrinter

type event_to_print = {name:string; methods_type:string; methods_implem:string}

let build_event = function Event(name, attrs) as e -> {name=name;
						       methods_type=generate_values_getters_types e;
						       methods_implem=generate_values_getters_implem e}
  
let build_list_event = function event_list -> List.map build_event event_list

let generate_names = function event_list -> List.map (fun (Event(name,_)) -> "`"^(String.uppercase name)) event_list


(**** TEST ****)

(*

let _ = List.map print_endline (generate_names Enyo_tree_objects.events_list)

*)
