open Struct_types
  
let objects_tree : object_rep tree = 
  Node (Object._object,
	[Node (Component._component,
	       [Node (Uicomponent._uiComponent,
		      [Node (Control._control, 
			     [Node (Canvas._canvas, []);
			      Node (Input._input, []);
			      Node (Group_item._group_item, 
				    [Node (Tool_decorator._tool_decorator,
					   [Node (Button._button, 
						  [
						    Node (OnyxButton._onyxButton, [])
						  ])
					   ])
				    ]);
			      Node (Image._image, []);
			      Node (OnyxIcon._onyxIcon, 
				    [Node (OnyxIconButton._onyxIconButton, [])
				    ]);
			      Node (OnyxToolbar._onyxToolbar, [])
			     ]
		      )]
	       )]
	)]
  )

let events_list = [ Gesture_event._gesture ]
