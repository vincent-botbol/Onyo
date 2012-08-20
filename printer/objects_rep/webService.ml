open Struct_types

let _webService = Type_gen (AjaxComponent._ajaxComponent,
			    "WebService",
			    [
			      Method("send", [String; Unit])
			    ],
			    [
			      Attribute ("jsonp", Bool, true);
			      Attribute ("callbackName", String, true)
			    ],
			    [
			      (*
				OnResponse
				OnError
			      *)
			    ])
