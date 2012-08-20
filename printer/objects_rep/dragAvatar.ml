open Struct_types

let _dragAvatar = Type_gen (Component._component,
			    "DragAvatar",
			    [
			      Method ("hide", [Unit; Unit]);
			      Method ("show", [Unit; Unit]);
			    ],
			    [
			      Attribute("showing", Bool, false);
			      Attribute("offsetX", Int, false);
			      Attribute("offsetY", Int, false)
			    ],
			    [])
