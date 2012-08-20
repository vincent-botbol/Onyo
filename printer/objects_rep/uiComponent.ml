open Struct_types

let _uiComponent = Type_gen ( Component._component,
			      "UiComponent", 			    
			      [
				Method ("destroy", [Unit; Unit]);
				Method ("getControls", [Unit; Array (Component)]);				
			      ],
			      [		       
				Attribute ("container", Component, true);
				Attribute ("parent", Component, true);
				Attribute ("controlParentName", String, false);
				Attribute ("layoutKind", String, true);
			      ],
			      [(*Handler ("onresize", Html_event._html)*) ]
)
