open Struct_types

let _select = Type_gen (Control._control,
			"Select",
			[
			  Method ("getValue", [String; Unit])
			],
			[
			  Attribute("selected", Int, false)			  
			],
			[])
  
