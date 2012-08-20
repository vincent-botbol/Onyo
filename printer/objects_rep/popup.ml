open Struct_types

let _popup = Type_gen (Control._control,
		       "Popup",
		       [],
		       [
			 Attribute("modal", Bool,false);
			 Attribute("autoDismiss", Bool, false);
			 Attribute("floating", Bool,false);
			 Attribute("centered", Bool,false);
		       ],
		       [])
  
