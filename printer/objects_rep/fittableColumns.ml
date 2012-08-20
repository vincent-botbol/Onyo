open Struct_types

let _fittableColumns = Type_gen (Control._control,
				 "FittableColumns",
				 [],
				 [
				   Attribute("layoutKind", String, false);
				   Attribute("noStretch", Bool, false)
				 ],
				 [])
