open Js
open Unsafe

let o = new_obj (variable "Object") [||];;

set o "test" (inject (string "bla"));;

let x = (get o "test") in
fun_call (variable "alert") [|inject  x |];;
