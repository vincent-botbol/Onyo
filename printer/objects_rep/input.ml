open Struct_types

let _input = Type_gen (Control._control,
		       "Input",
		       [],
		       [
			 Attribute ("disabled", Bool, true);
			 Attribute ("value", String, true);
			 Attribute ("placeholder", String, true);
			 Attribute ("type", String, true);
		       ],
		       [])
  
(* events : { onDisabledChanged:""} *)
(* implem à réfléchir *)
  
(* Printer Phantom implem *)
