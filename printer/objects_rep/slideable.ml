open Struct_types
  
let _slideable = Type_gen (Control._control,
			   "Slideable",
			   [
			     Method ("toggleMinMax", [Unit; Unit]);
			     Method ("animateTo", [Int;Unit]);
			     Method ("animateToMax", [Int;Unit]);
			     Method ("animateToMin", [Int;Unit])
			   ],
			   [
			     Attribute("axis", String, false);
			     Attribute("value", Int, false);
			     Attribute("unit", String,false);
			     Attribute("min", Int,false);
			     Attribute("max", Int,false);
			     Attribute("accelerated", String,false);
			     Attribute("overMoving", Bool,false);
			     Attribute("draggable", Bool,false);
			     Attribute("preventDragPropagation", Bool,false)
			   ],
			   [])
  
