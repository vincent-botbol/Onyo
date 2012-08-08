open Struct_types

let _object = Type("Object", 
		   [
		     Method ("destroyObject", [String; Unit]);		     
		     Method ("error", [String; Unit]);		     
		     Method ("log", [String;Unit]);
		     Method ("warn", [String;Unit])		   
		   ],
		   [],
		   [])
(* protected *)
(*
  Method ("constructor", [Unit; Unit]);
  Method ("setProperty", [String; t; Unit]);
*)
(* polymorphiques *)
(* 
   Method ("getProperty", [String; t]);		     
   Method ("setPropertyValue", [String; t; Function [Unit;Unit]; Unit]);
*)
