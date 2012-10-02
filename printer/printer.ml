open ModulePrinter
open Struct_types
open ObjectTreePrinter
open Labels
open EventsPrinter

let object_tree_dependances = Enyo_tree_objects.objects_tree

let event_list_dependances = Enyo_tree_objects.events_list

let elems_to_print = build_dep object_tree_dependances

let all_ids = get_all_ids object_tree_dependances

let all_events = List.map (fun (Event(name,_)) -> "`"^(String.uppercase name)) event_list_dependances

let main file =
  begin
    output_string file "module Enyo : sig\n";

    (* module sig types *)
    output_string file ((generate_module_sig_types all_ids all_events)^"\n");

    (* module functions sig *)
    output_string file (generate_sig_functions ());
    output_string file "\n";

    (* constructors sig *)
    List.iter (fun x -> output_string file (x^"\n\n")) elems_to_print.constructors_type;
    output_string file "\n";

    (*js_obj functions sig *)
    List.iter (fun x -> output_string file (x^"\n\n")) elems_to_print.methods_type;
    output_string file "\n";

    (*events functions sig *)
    List.iter (fun x -> output_string file ((generate_values_getters_types x)^"\n")) event_list_dependances;
    output_string file "\n";

    (*debug*)
    output_string file "val renderIntoBody : any_id obj -> unit\n";

    (* Struct *)
    output_string file "end = struct\n";
    output_string file (generate_generate_oid_function ());
    output_string file "\n";
    output_string file "open Js\nopen Unsafe\n";
    (* module struct types *)
    output_string file (generate_module_struct_types all_ids all_events);
    output_string file "\n";

    (* module functions implem *)
    (* kind_it / instanciate / id / as_a / label_gen *)
    output_string file (generate_kind_it_function ());
    output_string file "\n";
    output_string file (generate_coerce_prop ());
    output_string file "\n";
    output_string file (generate_instanciate_function ());
    output_string file "\n";
    output_string file (generate_id_function all_ids);
    output_string file "\n";
    output_string file (generate_as_a_function ());
    output_string file "\n";
    output_string file (generate_label_generator all_ids);
    output_string file "\n";
    output_string file (generate_instance_function ());
    output_string file "\n";

    (*debug*)
    output_string file (generate_renderIntoBody_function ());
    output_string file "\n";
    
    (* constructors implem *)
    List.iter (fun x -> output_string file (x^"\n\n")) elems_to_print.constructors_implem;
    output_string file "\n";

    (* js_obj functions implem *)
    List.iter (fun x -> output_string file (x^"\n\n")) elems_to_print.methods_implem;
    output_string file "\n";

    (* events function implem *)
    List.iter (fun x -> output_string file ((generate_values_getters_implem x)^"\n")) event_list_dependances;
    output_string file "\n";

    output_string file "\n";
    output_string file "end\n";

  end


let _ = main stdout
