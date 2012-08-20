open Struct_types

let _touchScrollStrategy = Type_gen (ScrollStrategy._scrollStrategy,
				     "TouchScrollStrategy",
				     [],
				     [
				       Attribute ("overscroll", Bool, false);
				       Attribute("preventDragPropagation", Bool, false);
				       Attribute("vertical", String, false);
				       Attribute("horizontal", String, false);
				       Attribute("thumb", Bool, false);
				       Attribute("scrim", Bool, false)
				     ],
				     [])
