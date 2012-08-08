open Struct_types

let _gesture = Event ("Gesture",
			[
			  Attribute ("screenX", Int, false);
			  Attribute ("screenY", Int, false);
			  Attribute ("clientX", Int, false);
			  Attribute ("clientY", Int, false);
			  Attribute ("identifier", Int, false);
			  Attribute ("detail", Int, false);
			  Attribute ("ctrlKey", Bool, false);
			  Attribute ("shiftKey", Bool, false);
			  Attribute ("altKey", Bool, false);
			  Attribute ("metaKey", Bool, false)
			])		     
