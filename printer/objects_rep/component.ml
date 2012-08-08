open Struct_types

  
let _component = Type_gen (Object._object,
			   "Component",
			   [  
			     Method ("addComponent", [Component; Unit]);
			     Method ("destroy", [Unit;Unit]);
			     Method ("destroyComponents", [Unit;Unit]);
			     Method ("getComponents", [Unit; Array (Component)]);
			     Method ("makeId", [Unit; Unit])
			   ],
			   [
			     Attribute ("name", String, false);
			     Attribute ("id", String, false);
			     Attribute ("owner", Component, true)
			   ],
			   [])
  
  
(* protected *)
(*
  Method ("adjustComponentProps", [Props; Unit]);
  Method ("bubbleDelegation", [ delegate; String; String; Event; Component]);
  Method ("constructed", [Props; ?]);
  Method ("constructor", [Unit; Unit]);
  Method ("create", [Unit; Unit]);
  Method ("createChrome", [inComponents; Unit]);
  Method ("createClientComponents", [inComponents; Unit]);
  Method ("decorateEvent", [Delegate; String; String; Event; Component; Unit]);
  Method ("dispatch", [String; Event; Component; Unit]);
  Method ("dispatchEvent", [String; Event; Component; Unit]);
  Method ("getBubbleTarget", [Unit; Unit]);
  Method ("getInstanceOwner", [Unit; Unit]);
  Method ("importProps", [Props; Unit]);
  Method ("toString", [Unit; Unit]);
  Method ("waterfall", [String; String; Component; Unit]);
  Method ("waterfallDown", [String; String; Component; Unit]);
*)
(* polymorphiques *)
(*
  Method ("bubble", [String; Event; Component]);
  Method ("createComponent", [Props; Props; Unit]);
  Method ("createComponents", [Props array; Props; Unit]);
  Method ("dispatchBubble", [String; Event; Component; Unit]);
*)
