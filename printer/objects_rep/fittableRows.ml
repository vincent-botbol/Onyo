open Struct_types

let _fittableRows = Type_gen (Control._control,
			      "FittableRows",
			      [],
			      [Attribute("layoutKind", String, false);
			       Attribute("noStretch", Bool, false)
			      ],
			      [])
