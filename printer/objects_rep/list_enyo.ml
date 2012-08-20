open Struct_types

let _list_enyo = Type_gen (Scroller._scroller,
			   "List",
			   [
			     Method ("getScrollPosition", [Unit; Int]);
			     Method ("getScrollTop", [Unit; Int]);
			     Method ("getSelection", [Unit; Component]);
			     Method ("isSelected", [Int; Bool]);
			     Method ("lockRow", [Int; Unit]);
			     Method ("prepareRow", [Int; Unit]);
			     Method ("refresh", [Unit; Unit]);
			     Method ("renderRow", [Int; Unit]);
			     Method ("reset", [Unit; Unit]);
			     Method ("scrollToBottom", [Unit; Unit]);
			     Method ("scrollToEnd", [Unit; Unit]);
			     Method ("scrollToStart", [Unit; Unit]);
			     Method ("select", [Int; Component; Unit]);
			     Method ("setScrollPosition", [Int; Unit]);
			     Method ("setScrollTop", [Int; Unit])
			   ],
			   [
			     Attribute("count", Int,false);
			     Attribute("rowsPerPage", Int,false);
			     Attribute("bottomUp", Bool,false);
			     Attribute("multiSelect", Bool,false);
			     Attribute("toggleSelected", Bool,false);
			     Attribute("fixedHeight", Bool,false);
			   ],
			   [])
