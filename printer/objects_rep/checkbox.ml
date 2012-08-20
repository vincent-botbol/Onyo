open Struct_types

let _checkbox = Type_gen (Input._input,
		       "Checkbox",
		       [],
		       [
			 Attribute("checked", Bool, false);
			 Attribute("active", Bool, false)
		       ],
		       [])
