open Struct_types

let _control = Type_gen ( Uicomponent._uiComponent,
			  "Control",
			  [
			    Method ("addClass", [String; Unit]);
			    Method ("addContent", [String; Unit]);
			    Method ("addRemoveClass", [String; Bool; Unit]);
			    Method ("addStyles", [String; Unit]);
			    Method ("getClassAttribute", [Unit; String]);
			    Method ("hasClass", [String; Bool]);
			    Method ("hide", [Unit; Unit]);
			    Method ("removeClass", [String; Unit]);
			    Method ("render", [Unit; Unit]);
			    Method ("rendered", [Unit; Unit]);
			    Method ("renderInto", [Dom_node; Unit]);
			    Method ("setBounds", [Int; Int; Int; Int; Unit]);
			    Method ("show", [Bool; Unit]);
			    Method ("stylesToNode", [Unit; Unit]);
			    Method ("write", [Unit; Unit]);
			  ],
			  [
			    Attribute ("tag", String, false);
			    Attribute ("classes", String, true);
			    Attribute ("style", String, true);
			    Attribute ("content", String, true);
			    Attribute ("showing", Bool, true);
			    Attribute ("allowHtml", Bool, false);
			    Attribute ("src", String, true);
			    Attribute ("canGenerate", Bool, false);
			    Attribute ("fit", Bool, true);
			    Attribute ("isContainer", Bool, false);
			  ],
			  [Handler ("ontap", Gesture_event._gesture)]
)
