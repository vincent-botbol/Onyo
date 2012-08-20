open Struct_types

let _node = Type_gen (Control._control,
		      "Node",
		      [],
		      [
			Attribute("expandable", Bool, false);
			Attribute("expanded", Bool, false);
			Attribute("icon", String, false);
			Attribute("onlyIconExpands", Bool, false)
		      ],
		      [])
  
