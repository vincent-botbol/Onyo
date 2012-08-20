open Struct_types

let _group = Type_gen (Control._control,
		       "Group",
		       [],
		       [
			 Attribute("highlander", Bool, false);
			 Attribute("active", Component, false) (* nullable *)
		       ],
		       [])
  
