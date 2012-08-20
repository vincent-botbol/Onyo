open Struct_types

let _onyxSpinner = Type_gen (Control._control,
			     "onyx.Spinner",
			     [
			       Method ("start", [Unit; Unit]);
			       Method ("stop", [Unit; Unit]);
			       Method ("toggle", [Unit; Unit])
			     ],
			     [],
			     [])
  
