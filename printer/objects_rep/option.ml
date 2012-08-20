open Struct_types

let _option = Type_gen (Control._control,
		       "Option",
		       [],
		       [
			 Attribute("value", String, false);
		       ],
		       [])
