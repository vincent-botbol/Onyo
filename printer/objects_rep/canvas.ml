open Struct_types

let _canvas = Type_gen (Control._control,
			"Canvas",
			[
			  Method("update", [Unit; Unit])
			],
			[
			(*
			  Attribute ("attribute_width", Int, true);
			  Attribute ("attribute_height", Int, true);
			*)
			],
			[])
  
(* Polymorphiques *)
(*
  Method ("applyStyle", [String; jsvalue option; Unit]);
  Method ("getAttribute", [String; jsvalue]);
  Method ("getBounds", [Unit; Object 
  [Attributes("left", Int, 0); Attributes("top", Int, 0); Attributes("width", Int, 0); Attributes("height", Int, 0)]);
  Method ("setAttributes", [String; jsvalue; Unit]);
  Attribute ("attributes", Object[Attributes..]);  
  Method ("hasNode", [Unit; Dom_node]);
*)	
  
