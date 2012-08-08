module Enyo : sig
  type any_id = [`ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT]
  type any_event = [`GESTURE]
  type dom_node
  type js_value
  type handler
  type value_changed
  type +'a kind
  type +'a obj
  
  val instanciate : ([< any_id] as 'a) kind -> 'a obj
  val id : ([< any_id] as 'a) obj -> 'a
  exception Bad_kind
  val as_a : ([< any_id] as 'a) -> [< any_id] obj -> 'a obj
    
  val onyx_toolbar:
    ?components:any_id kind list
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`ONYX_TOOLBAR] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`ONYX_TOOLBAR] kind
    
  val onyx_iconbutton:
    ?components:any_id kind list
    -> ?active:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`ONYX_ICONBUTTON] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`ONYX_ICONBUTTON] kind
    
  val onyx_icon:
    ?components:any_id kind list
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`ONYX_ICON] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`ONYX_ICON] kind
    
  val image:
    ?components:any_id kind list
    -> ?noEvents:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`IMAGE] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`IMAGE] kind
    
  val onyx_button:
    ?components:any_id kind list
    -> ?disabled:bool
    -> ?active:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`ONYX_BUTTON] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`ONYX_BUTTON] kind
    
  val button:
    ?components:any_id kind list
    -> ?disabled:bool
    -> ?active:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`BUTTON] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`BUTTON] kind
    
  val tooldecorator:
    ?components:any_id kind list
    -> ?active:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`TOOLDECORATOR] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`TOOLDECORATOR] kind
    
  val groupitem:
    ?components:any_id kind list
    -> ?active:bool
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`GROUPITEM] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`GROUPITEM] kind
    
  val input:
    ?components:any_id kind list
    -> ?disabled:bool
    -> ?value:string
    -> ?placeholder:string
    -> ?_type:string
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`INPUT] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`INPUT] kind
    
  val canvas:
    ?components:any_id kind list
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`CANVAS] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`CANVAS] kind
    
  val control:
    ?components:any_id kind list
    -> ?tag:string
    -> ?classes:string
    -> ?style:string
    -> ?content:string
    -> ?showing:bool
    -> ?allowHtml:bool
    -> ?src:string
    -> ?canGenerate:bool
    -> ?fit:bool
    -> ?isContainer:bool
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> ?ontap:([`CONTROL] obj -> any_id obj -> [`GESTURE] obj -> bool)
    -> unit -> [>`CONTROL] kind
    
  val uicomponent:
    ?components:any_id kind list
    -> ?container:any_id obj
    -> ?parent:any_id obj
    -> ?controlParentName:string
    -> ?layoutKind:string
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> unit -> [>`UICOMPONENT] kind
    
  val component:
    ?components:any_id kind list
    -> ?name:string
    -> ?id:string
    -> ?owner:any_id obj
    -> unit -> [>`COMPONENT] kind
    
  val _object:
    ?components:any_id kind list
    -> unit -> [>`OBJECT] kind
    
    
  val hide : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> unit
    
  val stylesToNode : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> unit
    
  val show : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
  val destroy : [< `ONYX_TOOLBAR | `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_ICON | `IMAGE | `IMAGE | `ONYX_BUTTON | `ONYX_BUTTON | `BUTTON | `BUTTON | `TOOLDECORATOR | `TOOLDECORATOR | `GROUPITEM | `GROUPITEM | `INPUT | `INPUT | `CANVAS | `CANVAS | `CONTROL | `CONTROL | `UICOMPONENT | `UICOMPONENT | `COMPONENT ] obj -> unit -> unit
    
  val warn : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT ] obj -> string -> unit
    
  val destroyComponents : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> unit
    
  val addRemoveClass : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> bool -> unit
    
  val addClass : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val makeId : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> unit
    
  val hasClass : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> bool
    
  val destroyObject : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT ] obj -> string -> unit
    
  val addStyles : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val setBounds : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> int -> int -> int -> int -> unit
    
  val getComponents : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> any_id obj list
    
  val getClassAttribute : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
    
  val log : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT ] obj -> string -> unit
    
  val update : [< `CANVAS ] obj -> unit -> unit
    
  val removeClass : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val rendered : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> unit
    
  val addComponent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> any_id obj -> unit
    
  val getControls : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj list
    
  val renderInto : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> dom_node -> unit
    
  val write : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> unit
    
  val error : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT ] obj -> string -> unit
    
  val addContent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val render : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> unit
    
  val getId : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> string
  val setId : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> string -> unit
    
  val getValue : [< `INPUT ] obj -> unit -> string
  val setValue : [< `INPUT ] obj -> string -> unit
    
  val getName : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> string
  val setName : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> string -> unit
    
  val getControlParentName : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> unit -> string
  val setControlParentName : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> string -> unit
    
  val getDisabled : [< `ONYX_BUTTON | `BUTTON | `INPUT ] obj -> unit -> bool
  val setDisabled : [< `ONYX_BUTTON | `BUTTON | `INPUT ] obj -> bool -> unit
    
  val getStyle : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
  val setStyle : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val getOwner : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> unit -> any_id obj
  val setOwner : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT ] obj -> any_id obj -> unit
    
  val getParent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj
  val setParent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> any_id obj -> unit
    
  val getType : [< `INPUT ] obj -> unit -> string
  val setType : [< `INPUT ] obj -> string -> unit
    
  val getActive : [< `ONYX_ICONBUTTON | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM ] obj -> unit -> bool
  val setActive : [< `ONYX_ICONBUTTON | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM ] obj -> bool -> unit
    
  val getContent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
  val setContent : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val getFit : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> bool
  val setFit : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
  val getPlaceholder : [< `INPUT ] obj -> unit -> string
  val setPlaceholder : [< `INPUT ] obj -> string -> unit
    
  val getAllowHtml : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> bool
  val setAllowHtml : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
  val getNoEvents : [< `IMAGE ] obj -> unit -> bool
  val setNoEvents : [< `IMAGE ] obj -> bool -> unit
    
  val getContainer : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj
  val setContainer : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> any_id obj -> unit
    
  val getShowing : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> bool
  val setShowing : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
  val getTag : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
  val setTag : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val getLayoutKind : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> unit -> string
  val setLayoutKind : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT ] obj -> string -> unit
    
  val getSrc : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
  val setSrc : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit

  val getClasses : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> string
  val setClasses : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> string -> unit
    
  val getIsContainer : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> bool
  val setIsContainer : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
  val getCanGenerate : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> unit -> bool
  val setCanGenerate : [< `ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL ] obj -> bool -> unit
    
    
  val gesture_screenX : [`GESTURE] obj-> int
  val gesture_screenY : [`GESTURE] obj-> int
  val gesture_clientX : [`GESTURE] obj-> int
  val gesture_clientY : [`GESTURE] obj-> int
  val gesture_identifier : [`GESTURE] obj-> int
  val gesture_detail : [`GESTURE] obj-> int
  val gesture_ctrlKey : [`GESTURE] obj-> bool
  val gesture_shiftKey : [`GESTURE] obj-> bool
  val gesture_altKey : [`GESTURE] obj-> bool
  val gesture_metaKey : [`GESTURE] obj-> bool
    
  val renderIntoBody : any_id obj -> unit

  val getInstanciatedKind : [< any_id] obj -> ([< any_id] as 'a) kind -> 'a obj

end = struct
  open Js
  open Unsafe
  type any_id = [`ONYX_TOOLBAR | `ONYX_ICONBUTTON | `ONYX_ICON | `IMAGE | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `INPUT | `CANVAS | `CONTROL | `UICOMPONENT | `COMPONENT | `OBJECT]
  type any_event = [`GESTURE]
  type dom_node = Dom_html.bodyElement Js.t
  type js_value = Int of int | String of string | Char of char | Float of float | Dom_node of dom_node | Bool of bool | Array of js_value list | Component of any_id obj 
  and handler = Handler of string * (any_id obj -> any_id obj -> any_event obj -> bool)
  and value_changed = Changed of string * (any_id obj -> js_value -> unit)
  and +'a kind = {id:string; components: any_id kind list;prop_changed_list:value_changed list; handler_list:handler list; prop_list : (string * js_value) list }
  and +'a obj = Js.Unsafe.any
  exception Bad_kind
  exception Bad_component
    
  (* getInstanciatedKind : any_id obj -> any_id as 'a kind -> 'a obj *)
  let getInstanciatedKind mainComponent subKind =
    let isMainComponent = to_bool (get mainComponent "_onyo_isRootComponent") in
    match isMainComponent with 
      false -> raise Bad_component
    | true -> let subKind_name = 
		try 
		  match (List.assoc "name" subKind.prop_list) with
		  | String s -> s
		  | _ -> assert false
		with Not_found -> raise Bad_component
	      in 
	      let hash = get mainComponent "$" in
	      get hash subKind_name
	      
  let kind_it name obj_js =
    let enyo_js_object = 
      let _ = fun_call (variable "enyo.kind") [| inject obj_js |] in
      new_obj (variable name) [||]
    in
    enyo_js_object
      
  let rec coerce_prop = function
    | Int v -> inject v
    | Char v -> inject v
    | Dom_node v -> inject v
    | Component v -> inject v
    | Float f -> inject (float f)
    | Bool b ->  inject (bool b)
    | String s -> inject (string s)
    | Array v -> inject (array (Array.of_list (List.map coerce_prop v)))
      
  let instanciate (kind:([< any_id] as 'a) kind) : 'a obj =
    let rec build_component_tree : 'a. ([< any_id] as 'a) kind -> Js.Unsafe.any = fun kind ->
      let js_obj = new_obj (variable "Object") [||] in
      List.iter (fun (x,y) -> set js_obj x (coerce_prop y)) kind.prop_list;
      (if kind.components != []  then
	  let array_component = Array.of_list (List.map build_component_tree kind.components) in
	  set js_obj "components" (array array_component));
      (if kind.handler_list != [] then
	  let handlers_name = List.map (fun (Handler (x,_)) -> x) kind.handler_list in
	  let handlers_name_func = List.map
	    (fun x -> String.sub x 2 ((String.length x) - 2))
	    handlers_name in
	  let handlers_func = List.map (fun (Handler (_,y)) -> y) kind.handler_list in
	  let handler_obj = new_obj (variable "Object") [||] in
	  List.iter 
	    (fun (name,fname) -> set handler_obj name (string fname)) 
	    (List.combine handlers_name handlers_name_func);
	  set js_obj "handlers" handler_obj;
	  List.iter 
	    (fun (fname,f) -> set js_obj fname (wrap_meth_callback f))
	    (List.combine handlers_name_func handlers_func)
      );
      set js_obj "_onyo_id" (string (kind.id));
      js_obj in
    let js_obj = (build_component_tree kind) in
    let name = try 
		 match List.assoc "name" kind.prop_list with 
		   String s -> s 
		 | _ -> assert false
      with
	Not_found -> set js_obj "name" (string "_default_app_name");
	  "_default_app_name" in
    (* Pour s'assurer que c'est bien le root *)
    set js_obj "_onyo_isRootComponent" (bool true);
    kind_it name js_obj

  let id (obj_js : ([<any_id] as 'a) obj) : 'a =
    let s = to_string (get obj_js "_onyo_id") in
    Obj.magic (match s with
    | "ONYX.TOOLBAR" -> `ONYX_TOOLBAR
    | "ONYX.ICONBUTTON" -> `ONYX_ICONBUTTON
    | "ONYX.ICON" -> `ONYX_ICON
    | "IMAGE" -> `IMAGE
    | "ONYX.BUTTON" -> `ONYX_BUTTON
    | "BUTTON" -> `BUTTON
    | "TOOLDECORATOR" -> `TOOLDECORATOR
    | "GROUPITEM" -> `GROUPITEM
    | "INPUT" -> `INPUT
    | "CANVAS" -> `CANVAS
    | "CONTROL" -> `CONTROL
    | "UICOMPONENT" -> `UICOMPONENT
    | "COMPONENT" -> `COMPONENT
    | "OBJECT" -> `OBJECT | _ -> assert false)
      
  let as_a id_type obj_js =
    if ((id obj_js) :> any_id) = (id_type :> any_id) then
      obj_js
    else
      raise Bad_kind
	
  let new_label name =
    let i = ref (-1) in
    (fun () -> incr i; name ^ (string_of_int !i))
      
  let new_label_onyx_toolbar = new_label "onyx_toolbar"
  let new_label_onyx_iconbutton = new_label "onyx_iconbutton"
  let new_label_onyx_icon = new_label "onyx_icon"
  let new_label_image = new_label "image"
  let new_label_onyx_button = new_label "onyx_button"
  let new_label_button = new_label "button"
  let new_label_tooldecorator = new_label "tooldecorator"
  let new_label_groupitem = new_label "groupitem"
  let new_label_input = new_label "input"
  let new_label_canvas = new_label "canvas"
  let new_label_control = new_label "control"
  let new_label_uicomponent = new_label "uicomponent"
  let new_label_component = new_label "component"
  let new_label_object = new_label "object"
    
  let renderIntoBody obj_js =
    Dom_html.window##onload <- Dom_html.handler
      (fun _ -> let _ = meth_call obj_js "renderInto" [| inject (variable "document.body") |] in Js._false)
  let onyx_toolbar
      ?(components=[])
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "onyx.Toolbar")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="ONYX.TOOLBAR"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let onyx_iconbutton
      ?(components=[])
      ?active
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "onyx.IconButton")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="ONYX.ICONBUTTON"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let onyx_icon
      ?(components=[])
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "onyx.Icon")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="ONYX.ICON"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let image
      ?(components=[])
      ?noEvents
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "Image")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match noEvents with Some v -> prop_list := ("noEvents",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="IMAGE"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let onyx_button
      ?(components=[])
      ?disabled
      ?active
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "onyx.Button")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match disabled with Some v -> prop_list := ("disabled",Bool v)::!prop_list | None -> ());
    (match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="ONYX.BUTTON"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let button
      ?(components=[])
      ?disabled
      ?active
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "Button")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match disabled with Some v -> prop_list := ("disabled",Bool v)::!prop_list | None -> ());
    (match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="BUTTON"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let tooldecorator
      ?(components=[])
      ?active
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "ToolDecorator")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="TOOLDECORATOR"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let groupitem
      ?(components=[])
      ?active
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "GroupItem")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="GROUPITEM"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let input
      ?(components=[])
      ?disabled
      ?value
      ?placeholder
      ?_type
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "Input")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match disabled with Some v -> prop_list := ("disabled",Bool v)::!prop_list | None -> ());
    (match value with Some v -> prop_list := ("value",String v)::!prop_list | None -> ());
    (match placeholder with Some v -> prop_list := ("placeholder",String v)::!prop_list | None -> ());
    (match _type with Some v -> prop_list := ("type",String v)::!prop_list | None -> ());
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="INPUT"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let canvas
      ?(components=[])
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "Canvas")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="CANVAS"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let control
      ?(components=[])
      ?tag
      ?classes
      ?style
      ?content
      ?showing
      ?allowHtml
      ?src
      ?canGenerate
      ?fit
      ?isContainer
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      ?ontap
      () =
    let prop_list= ref [("kind", String "Control")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match tag with Some v -> prop_list := ("tag",String v)::!prop_list | None -> ());
    (match classes with Some v -> prop_list := ("classes",String v)::!prop_list | None -> ());
    (match style with Some v -> prop_list := ("style",String v)::!prop_list | None -> ());
    (match content with Some v -> prop_list := ("content",String v)::!prop_list | None -> ());
    (match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
    (match allowHtml with Some v -> prop_list := ("allowHtml",Bool v)::!prop_list | None -> ());
    (match src with Some v -> prop_list := ("src",String v)::!prop_list | None -> ());
    (match canGenerate with Some v -> prop_list := ("canGenerate",Bool v)::!prop_list | None -> ());
    (match fit with Some v -> prop_list := ("fit",Bool v)::!prop_list | None -> ());
    (match isContainer with Some v -> prop_list := ("isContainer",Bool v)::!prop_list | None -> ());
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    (match ontap with Some v -> handler_list := Handler ("ontap",v)::!handler_list | None -> ());
    {id="CONTROL"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let uicomponent
      ?(components=[])
      ?container
      ?parent
      ?controlParentName
      ?layoutKind
      ?name
      ?id
      ?owner
      () =
    let prop_list= ref [("kind", String "UiComponent")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
    (match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
    (match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
    (match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    {id="UICOMPONENT"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let component
      ?(components=[])
      ?name
      ?id
      ?owner
      () =
    let prop_list= ref [("kind", String "Component")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    (match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
    (match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
    (match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
    {id="COMPONENT"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
  let _object
      ?(components=[])
      () =
    let prop_list= ref [("kind", String "Object")]
    and prop_changed_list= ref []
    and handler_list= ref [] in
    {id="OBJECT"; components=components;prop_list=(!prop_list);prop_changed_list=(!prop_changed_list);handler_list=(!handler_list)}
      
      
  let hide this () =
    let _ = meth_call this "hide" [||] in
    ()
      
  let stylesToNode this () =
    let _ = meth_call this "stylesToNode" [||] in
    ()
      
  let show this predicat1 =
    let _ = meth_call this "show" [|inject (bool predicat1)|] in
    ()
      
  let destroy this () =
    let _ = meth_call this "destroy" [||] in
    ()
      
  let warn this chaine1 =
    let _ = meth_call this "warn" [|inject (string chaine1)|] in
    ()
      
  let destroyComponents this () =
    let _ = meth_call this "destroyComponents" [||] in
    ()
      
  let addRemoveClass this chaine1 predicat1 =
    let _ = meth_call this "addRemoveClass" [|inject (string chaine1); inject (bool predicat1)|] in
    ()
      
  let addClass this chaine1 =
    let _ = meth_call this "addClass" [|inject (string chaine1)|] in
    ()
      
  let makeId this () =
    let _ = meth_call this "makeId" [||] in
    ()
      
  let hasClass this chaine1 =
    let value = meth_call this "hasClass" [|inject (string chaine1)|] in
    to_bool value
      
  let destroyObject this chaine1 =
    let _ = meth_call this "destroyObject" [|inject (string chaine1)|] in
    ()
      
  let addStyles this chaine1 =
    let _ = meth_call this "addStyles" [|inject (string chaine1)|] in
    ()
      
  let setBounds this entier1 entier2 entier3 entier4 =
    let _ = meth_call this "setBounds" [|inject entier1; inject entier2; inject entier3; inject entier4|] in
    ()
      
  let getComponents this () =
    let value = meth_call this "getComponents" [||] in
    Array.to_list (to_array value)
      
  let getClassAttribute this () =
    let value = meth_call this "getClassAttribute" [||] in
    to_string value
      
  let log this chaine1 =
    let _ = meth_call this "log" [|inject (string chaine1)|] in
    ()
      
  let update this () =
    let _ = meth_call this "update" [||] in
    ()
      
  let removeClass this chaine1 =
    let _ = meth_call this "removeClass" [|inject (string chaine1)|] in
    ()
      
  let rendered this () =
    let _ = meth_call this "rendered" [||] in
    ()
      
  let addComponent this obj_js1 =
    let _ = meth_call this "addComponent" [|inject obj_js1|] in
    ()
      
  let getControls this () =
    let value = meth_call this "getControls" [||] in
    Array.to_list (to_array value)
      
  let renderInto this noeud_dom1 =
    let _ = meth_call this "renderInto" [|inject noeud_dom1|] in
    ()
      
  let write this () =
    let _ = meth_call this "write" [||] in
    ()
      
  let error this chaine1 =
    let _ = meth_call this "error" [|inject (string chaine1)|] in
    ()
      
  let addContent this chaine1 =
    let _ = meth_call this "addContent" [|inject (string chaine1)|] in
    ()
      
  let render this () =
    let _ = meth_call this "render" [||] in
    ()
      
  let getId this () =
    let value = meth_call this "getId" [||] in
    to_string value
  let setId this chaine1 =
    let _ = meth_call this "setId" [|inject (string chaine1)|] in
    ()
      
  let getValue this () =
    let value = meth_call this "getValue" [||] in
    to_string value
  let setValue this chaine1 =
    let _ = meth_call this "setValue" [|inject (string chaine1)|] in
    ()
      
  let getName this () =
    let value = meth_call this "getName" [||] in
    to_string value
  let setName this chaine1 =
    let _ = meth_call this "setName" [|inject (string chaine1)|] in
    ()
      
  let getControlParentName this () =
    let value = meth_call this "getControlParentName" [||] in
    to_string value
  let setControlParentName this chaine1 =
    let _ = meth_call this "setControlParentName" [|inject (string chaine1)|] in
    ()
      
  let getDisabled this () =
    let value = meth_call this "getDisabled" [||] in
    to_bool value
  let setDisabled this predicat1 =
    let _ = meth_call this "setDisabled" [|inject (bool predicat1)|] in
    ()
      
  let getStyle this () =
    let value = meth_call this "getStyle" [||] in
    to_string value
  let setStyle this chaine1 =
    let _ = meth_call this "setStyle" [|inject (string chaine1)|] in
    ()
      
  let getOwner this () =
    let value = meth_call this "getOwner" [||] in
    value
  let setOwner this obj_js1 =
    let _ = meth_call this "setOwner" [|inject obj_js1|] in
    ()
      
  let getParent this () =
    let value = meth_call this "getParent" [||] in
    value
  let setParent this obj_js1 =
    let _ = meth_call this "setParent" [|inject obj_js1|] in
    ()
      
  let getType this () =
    let value = meth_call this "getType" [||] in
    to_string value
  let setType this chaine1 =
    let _ = meth_call this "setType" [|inject (string chaine1)|] in
    ()
      
  let getActive this () =
    let value = meth_call this "getActive" [||] in
    to_bool value
  let setActive this predicat1 =
    let _ = meth_call this "setActive" [|inject (bool predicat1)|] in
    ()
      
  let getContent this () =
    let value = meth_call this "getContent" [||] in
    to_string value
  let setContent this chaine1 =
    let _ = meth_call this "setContent" [|inject (string chaine1)|] in
    ()
      
  let getFit this () =
    let value = meth_call this "getFit" [||] in
    to_bool value
  let setFit this predicat1 =
    let _ = meth_call this "setFit" [|inject (bool predicat1)|] in
    ()
      
  let getPlaceholder this () =
    let value = meth_call this "getPlaceholder" [||] in
    to_string value
  let setPlaceholder this chaine1 =
    let _ = meth_call this "setPlaceholder" [|inject (string chaine1)|] in
    ()
      
  let getAllowHtml this () =
    let value = meth_call this "getAllowHtml" [||] in
    to_bool value
  let setAllowHtml this predicat1 =
    let _ = meth_call this "setAllowHtml" [|inject (bool predicat1)|] in
    ()
      
  let getNoEvents this () =
    let value = meth_call this "getNoEvents" [||] in
    to_bool value
  let setNoEvents this predicat1 =
    let _ = meth_call this "setNoEvents" [|inject (bool predicat1)|] in
    ()
      
  let getContainer this () =
    let value = meth_call this "getContainer" [||] in
    value
  let setContainer this obj_js1 =
    let _ = meth_call this "setContainer" [|inject obj_js1|] in
    ()
      
  let getShowing this () =
    let value = meth_call this "getShowing" [||] in
    to_bool value
  let setShowing this predicat1 =
    let _ = meth_call this "setShowing" [|inject (bool predicat1)|] in
    ()
      
  let getTag this () =
    let value = meth_call this "getTag" [||] in
    to_string value
  let setTag this chaine1 =
    let _ = meth_call this "setTag" [|inject (string chaine1)|] in
    ()
      
  let getLayoutKind this () =
    let value = meth_call this "getLayoutKind" [||] in
    to_string value
  let setLayoutKind this chaine1 =
    let _ = meth_call this "setLayoutKind" [|inject (string chaine1)|] in
    ()
      
  let getSrc this () =
    let value = meth_call this "getSrc" [||] in
    to_string value
  let setSrc this chaine1 =
    let _ = meth_call this "setSrc" [|inject (string chaine1)|] in
    ()
      
  let getClasses this () =
    let value = meth_call this "getClasses" [||] in
    to_string value
  let setClasses this chaine1 =
    let _ = meth_call this "setClasses" [|inject (string chaine1)|] in
    ()
      
  let getIsContainer this () =
    let value = meth_call this "getIsContainer" [||] in
    to_bool value
  let setIsContainer this predicat1 =
    let _ = meth_call this "setIsContainer" [|inject (bool predicat1)|] in
    ()
      
  let getCanGenerate this () =
    let value = meth_call this "getCanGenerate" [||] in
    to_bool value
  let setCanGenerate this predicat1 =
    let _ = meth_call this "setCanGenerate" [|inject (bool predicat1)|] in
    ()
      
  let gesture_screenX gesture_event =
    let value = get gesture_event "screenX" in
    value
  let gesture_screenY gesture_event =
    let value = get gesture_event "screenY" in
    value
  let gesture_clientX gesture_event =
    let value = get gesture_event "clientX" in
    value
  let gesture_clientY gesture_event =
    let value = get gesture_event "clientY" in
    value
  let gesture_identifier gesture_event =
    let value = get gesture_event "identifier" in
    value
  let gesture_detail gesture_event =
    let value = get gesture_event "detail" in
    value
  let gesture_ctrlKey gesture_event =
    let value = get gesture_event "ctrlKey" in
    to_bool value
  let gesture_shiftKey gesture_event =
    let value = get gesture_event "shiftKey" in
    to_bool value
  let gesture_altKey gesture_event =
    let value = get gesture_event "altKey" in
    to_bool value
  let gesture_metaKey gesture_event =
    let value = get gesture_event "metaKey" in
    to_bool value
            
end
  
