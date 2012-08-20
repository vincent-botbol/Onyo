open Struct_types

let _fittableLayout = Type_gen (Layout._layout,
		       "FittableLayout",
		       [
			 Method("reflow", [Unit; Unit])
		       ],
		       [],
		       [])
