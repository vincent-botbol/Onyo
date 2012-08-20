open Struct_types

let _jsonpRequest = Type_gen (Async._async,
			      "JsonpRequest",
			      [
			      (* Method("go", [Component; Unit]) Non typable -> obj Json request *)
			      ],
			      [
				Attribute("url", String, false);
				(* Attribute("charset", String, false) -> nullable *)
				Attribute("callbackName", String, false);
				Attribute("cacheBust", Bool, false)
			      ],
			      [])
