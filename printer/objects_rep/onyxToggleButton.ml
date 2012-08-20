open Struct_types

let _onyxToggleButton = Type_gen (Control._control,
		       "onyx.ToggleButton",
		       [],
		       [
			 Attribute("active", Bool, false);
			 Attribute("value", Bool, false);
			 Attribute("onContent", String, false);
			 Attribute("offContent", String, false);
			 Attribute("disabled", Bool, false)
		       ],
		       [])
