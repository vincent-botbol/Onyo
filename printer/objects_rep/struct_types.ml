type values_rep =  String | Int | Float | Bool | Unit 
		   | Component | Array of values_rep | Dom_node

type method_rep = Method of string * values_rep list

type attributes_rep = Attribute of string * values_rep * bool (* bool => Generate propChanged function? *)

type event_rep = Event of string * attributes_rep list

type handler_rep = Handler of string * event_rep

type object_rep = Type of string * method_rep list * attributes_rep list * handler_rep list
		  | Type_gen of object_rep * string * method_rep list * attributes_rep list * handler_rep list


type 'a tree = Node of 'a * 'a tree list
			
