open Struct_types

let _panels = Type_gen (Control._control,
		       "Panels",
		       [],
		       [
			 Attribute("index", Int, false);
			 Attribute("draggable", Bool, false);
			 Attribute("animate", Bool, false);
			 Attribute("wrap", Bool, false);
			 Attribute("arrangerKind", String, false);
			 Attribute("narrowFit", Bool,false)
		       ],
		       [])
