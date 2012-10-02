module Enyo : sig
type any_id = [`SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT | `FITTABLELAYOUT | `BASELAYOUT | `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER | `COLLAPSINGARRANGER | `CAROUSELARRANGER | `CARDSLIDEINARRANGER | `CARDARRANGER | `ARRANGER | `LAYOUT | `_UNUSED]
type any_event = [`GESTURE]
type dom_node
type js_value
type handler
type +'a kind
type +'a obj

val instanciate : ([< any_id] as 'a) kind -> 'a obj
val id : ([< any_id] as 'a) obj -> 'a
exception Bad_kind
val as_a : ([< any_id] as 'a) -> [< any_id] obj -> 'a obj
val instance : 'a kind -> 'a obj
val slideable:
	?components:any_id kind list
	-> ?axis:string
	-> ?value:int
	-> ?unit:string
	-> ?min:int
	-> ?max:int
	-> ?accelerated:string
	-> ?overMoving:bool
	-> ?draggable:bool
	-> ?preventDragPropagation:bool
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
	-> ?ontap:([`SLIDEABLE] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`SLIDEABLE] kind

val _select:
	?components:any_id kind list
	-> ?selected:int
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
	-> ?ontap:([`SELECT] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`SELECT] kind

val scrollthumb:
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
	-> ?ontap:([`SCROLLTHUMB] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`SCROLLTHUMB] kind

val translatescrollstrategy:
	?components:any_id kind list
	-> ?overscroll:bool
	-> ?preventDragPropagation:bool
	-> ?vertical:string
	-> ?horizontal:string
	-> ?thumb:bool
	-> ?scrim:bool
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
	-> ?ontap:([`TRANSLATESCROLLSTRATEGY] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`TRANSLATESCROLLSTRATEGY] kind

val touchscrollstrategy:
	?components:any_id kind list
	-> ?overscroll:bool
	-> ?preventDragPropagation:bool
	-> ?vertical:string
	-> ?horizontal:string
	-> ?thumb:bool
	-> ?scrim:bool
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
	-> ?ontap:([`TOUCHSCROLLSTRATEGY] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`TOUCHSCROLLSTRATEGY] kind

val scrollstrategy:
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
	-> ?ontap:([`SCROLLSTRATEGY] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`SCROLLSTRATEGY] kind

val pulldownlist:
	?components:any_id kind list
	-> ?count:int
	-> ?rowsPerPage:int
	-> ?bottomUp:bool
	-> ?multiSelect:bool
	-> ?toggleSelected:bool
	-> ?fixedHeight:bool
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
	-> ?ontap:([`PULLDOWNLIST] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`PULLDOWNLIST] kind

val list:
	?components:any_id kind list
	-> ?count:int
	-> ?rowsPerPage:int
	-> ?bottomUp:bool
	-> ?multiSelect:bool
	-> ?toggleSelected:bool
	-> ?fixedHeight:bool
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
	-> ?ontap:([`LIST] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`LIST] kind

val scroller:
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
	-> ?ontap:([`SCROLLER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`SCROLLER] kind

val repeater:
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
	-> ?ontap:([`REPEATER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`REPEATER] kind

val onyx_tooltip:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`ONYX_TOOLTIP] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_TOOLTIP] kind

val onyx_flyweightpicker:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`ONYX_FLYWEIGHTPICKER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_FLYWEIGHTPICKER] kind

val onyx_picker:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`ONYX_PICKER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_PICKER] kind

val onyx_menu:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`ONYX_MENU] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_MENU] kind

val onyx_popup:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`ONYX_POPUP] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_POPUP] kind

val popup:
	?components:any_id kind list
	-> ?modal:bool
	-> ?autoDismiss:bool
	-> ?floating:bool
	-> ?centered:bool
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
	-> ?ontap:([`POPUP] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`POPUP] kind

val panels:
	?components:any_id kind list
	-> ?index:int
	-> ?draggable:bool
	-> ?animate:bool
	-> ?wrap:bool
	-> ?arrangerKind:string
	-> ?narrowFit:bool
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
	-> ?ontap:([`PANELS] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`PANELS] kind

val ownerproxy:
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
	-> ?ontap:([`OWNERPROXY] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`OWNERPROXY] kind

val option:
	?components:any_id kind list
	-> ?value:string
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
	-> ?ontap:([`OPTION] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`OPTION] kind

val onyx_pickerdecorator:
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
	-> ?ontap:([`ONYX_PICKERDECORATOR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_PICKERDECORATOR] kind

val onyx_menudecorator:
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
	-> ?ontap:([`ONYX_MENUDECORATOR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_MENUDECORATOR] kind

val onyx_tooltipdecorator:
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
	-> ?ontap:([`ONYX_TOOLTIPDECORATOR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_TOOLTIPDECORATOR] kind

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

val onyx_togglebutton:
	?components:any_id kind list
	-> ?active:bool
	-> ?value:bool
	-> ?onContent:string
	-> ?offContent:string
	-> ?disabled:bool
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
	-> ?ontap:([`ONYX_TOGGLEBUTTON] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_TOGGLEBUTTON] kind

val onyx_spinner:
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
	-> ?ontap:([`ONYX_SPINNER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_SPINNER] kind

val onyx_scrim:
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
	-> ?ontap:([`ONYX_SCRIM] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_SCRIM] kind

val onyx_slider:
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
	-> ?ontap:([`ONYX_SLIDER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_SLIDER] kind

val onyx_progressbutton:
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
	-> ?ontap:([`ONYX_PROGRESSBUTTON] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_PROGRESSBUTTON] kind

val onyx_progressbar:
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
	-> ?ontap:([`ONYX_PROGRESSBAR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_PROGRESSBAR] kind

val onyx_moretoolbar:
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
	-> ?ontap:([`ONYX_MORETOOLBAR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_MORETOOLBAR] kind

val onyx_item:
	?components:any_id kind list
	-> ?tapHighlight:bool
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
	-> ?ontap:([`ONYX_ITEM] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_ITEM] kind

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

val onyx_groupboxheader:
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
	-> ?ontap:([`ONYX_GROUPBOXHEADER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_GROUPBOXHEADER] kind

val onyx_groupbox:
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
	-> ?ontap:([`ONYX_GROUPBOX] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_GROUPBOX] kind

val onyx_grabber:
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
	-> ?ontap:([`ONYX_GRABBER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_GRABBER] kind

val onyx_drawer:
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
	-> ?ontap:([`ONYX_DRAWER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_DRAWER] kind

val node:
	?components:any_id kind list
	-> ?expandable:bool
	-> ?expanded:bool
	-> ?icon:string
	-> ?onlyIconExpands:bool
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
	-> ?ontap:([`NODE] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`NODE] kind

val onyx_textarea:
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
	-> ?ontap:([`ONYX_TEXTAREA] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_TEXTAREA] kind

val textarea:
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
	-> ?ontap:([`TEXTAREA] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`TEXTAREA] kind

val onyx_richtext:
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
	-> ?ontap:([`ONYX_RICHTEXT] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_RICHTEXT] kind

val richtext:
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
	-> ?ontap:([`RICHTEXT] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`RICHTEXT] kind

val onyx_checkbox:
	?components:any_id kind list
	-> ?checked:bool
	-> ?active:bool
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
	-> ?ontap:([`ONYX_CHECKBOX] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_CHECKBOX] kind

val checkbox:
	?components:any_id kind list
	-> ?checked:bool
	-> ?active:bool
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
	-> ?ontap:([`CHECKBOX] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`CHECKBOX] kind

val onyx_input:
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
	-> ?ontap:([`ONYX_INPUT] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_INPUT] kind

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

val onyx_inputdecorator:
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
	-> ?ontap:([`ONYX_INPUTDECORATOR] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_INPUTDECORATOR] kind

val onyx_menuitem:
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
	-> ?ontap:([`ONYX_MENUITEM] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_MENUITEM] kind

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

val onyx_radiogroup:
	?components:any_id kind list
	-> ?highlander:bool
	-> ?active:any_id obj
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
	-> ?ontap:([`ONYX_RADIOGROUP] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`ONYX_RADIOGROUP] kind

val group:
	?components:any_id kind list
	-> ?highlander:bool
	-> ?active:any_id obj
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
	-> ?ontap:([`GROUP] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`GROUP] kind

val flyweightrepeater:
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
	-> ?ontap:([`FLYWEIGHTREPEATER] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`FLYWEIGHTREPEATER] kind

val fittablerows:
	?components:any_id kind list
	-> ?layoutKind:string
	-> ?noStretch:bool
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
	-> ?ontap:([`FITTABLEROWS] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`FITTABLEROWS] kind

val fittablecolumns:
	?components:any_id kind list
	-> ?layoutKind:string
	-> ?noStretch:bool
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
	-> ?ontap:([`FITTABLECOLUMNS] obj -> any_id obj -> [`GESTURE] obj -> bool)
	-> unit -> [>`FITTABLECOLUMNS] kind

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

val canvas_text:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_TEXT] kind

val canvas_rectangle:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_RECTANGLE] kind

val canvas_circle:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_CIRCLE] kind

val canvas_shape:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_SHAPE] kind

val canvas_image:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_IMAGE] kind

val canvas_control:
	?components:any_id kind list
	-> ?container:any_id obj
	-> ?parent:any_id obj
	-> ?controlParentName:string
	-> ?layoutKind:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`CANVAS_CONTROL] kind

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

val signals:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`SIGNALS] kind

val selection:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`SELECTION] kind

val scrollmath:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`SCROLLMATH] kind

val dragavatar:
	?components:any_id kind list
	-> ?showing:bool
	-> ?offsetX:int
	-> ?offsetY:int
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`DRAGAVATAR] kind

val animator:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`ANIMATOR] kind

val webservice:
	?components:any_id kind list
	-> ?jsonp:bool
	-> ?callbackName:string
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`WEBSERVICE] kind

val _ajaxcomponent:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`_AJAXCOMPONENT] kind

val component:
	?components:any_id kind list
	-> ?name:string
	-> ?id:string
	-> ?owner:any_id obj
	-> unit -> [>`COMPONENT] kind

val jsonprequest:
	?components:any_id kind list
	-> ?url:string
	-> ?callbackName:string
	-> ?cacheBust:bool
	-> unit -> [>`JSONPREQUEST] kind

val ajax:
	?components:any_id kind list
	-> unit -> [>`AJAX] kind

val async:
	?components:any_id kind list
	-> unit -> [>`ASYNC] kind

val _object:
	?components:any_id kind list
	-> unit -> [>`OBJECT] kind

val fittablelayout:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`FITTABLELAYOUT] kind

val baselayout:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`BASELAYOUT] kind

val topbottomarranger:
	?components:any_id kind list
	-> ?margin:int
	-> ?layoutClass:string
	-> unit -> [>`TOPBOTTOMARRANGER] kind

val leftrightarranger:
	?components:any_id kind list
	-> ?margin:int
	-> ?layoutClass:string
	-> unit -> [>`LEFTRIGHTARRANGER] kind

val collapsingarranger:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`COLLAPSINGARRANGER] kind

val carouselarranger:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`CAROUSELARRANGER] kind

val cardslideinarranger:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`CARDSLIDEINARRANGER] kind

val cardarranger:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`CARDARRANGER] kind

val arranger:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`ARRANGER] kind

val layout:
	?components:any_id kind list
	-> ?layoutClass:string
	-> unit -> [>`LAYOUT] kind

val _unused:
	?components:any_id kind list
	-> unit -> [>`_UNUSED] kind


val refresh : [< `PULLDOWNLIST | `LIST ] obj -> unit -> unit

val scrollToEnd : [< `PULLDOWNLIST | `LIST ] obj -> unit -> unit

val hide : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `DRAGAVATAR ] obj -> unit -> unit

val stylesToNode : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> unit

val show : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val setScrollTop : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val destroy : [< `SLIDEABLE | `SLIDEABLE | `SELECT | `SELECT | `SCROLLTHUMB | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `PULLDOWNLIST | `LIST | `LIST | `SCROLLER | `SCROLLER | `REPEATER | `REPEATER | `ONYX_TOOLTIP | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_MENU | `ONYX_POPUP | `ONYX_POPUP | `POPUP | `POPUP | `PANELS | `PANELS | `OWNERPROXY | `OWNERPROXY | `OPTION | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_GRABBER | `ONYX_DRAWER | `ONYX_DRAWER | `NODE | `NODE | `ONYX_TEXTAREA | `ONYX_TEXTAREA | `TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `ONYX_RICHTEXT | `RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `ONYX_CHECKBOX | `CHECKBOX | `CHECKBOX | `ONYX_INPUT | `ONYX_INPUT | `INPUT | `INPUT | `IMAGE | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_MENUITEM | `ONYX_BUTTON | `ONYX_BUTTON | `BUTTON | `BUTTON | `TOOLDECORATOR | `TOOLDECORATOR | `GROUPITEM | `GROUPITEM | `ONYX_RADIOGROUP | `ONYX_RADIOGROUP | `GROUP | `GROUP | `FLYWEIGHTREPEATER | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLEROWS | `FITTABLECOLUMNS | `FITTABLECOLUMNS | `CANVAS | `CANVAS | `CONTROL | `CONTROL | `CANVAS_TEXT | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_IMAGE | `CANVAS_CONTROL | `CANVAS_CONTROL | `UICOMPONENT | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> unit

val warn : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT ] obj -> string -> unit

val reset : [< `PULLDOWNLIST | `LIST ] obj -> unit -> unit

val getSelection : [< `PULLDOWNLIST | `LIST ] obj -> unit -> any_id obj

val destroyComponents : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> unit

val addRemoveClass : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> bool -> unit

val scrollToBottom : [< `PULLDOWNLIST | `LIST ] obj -> unit -> unit

val getScrollPosition : [< `PULLDOWNLIST | `LIST ] obj -> unit -> int

val getScrollTop : [< `PULLDOWNLIST | `LIST ] obj -> unit -> int

val addClass : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getValue : [< `SELECT ] obj -> string -> unit

val makeId : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> unit

val animateToMax : [< `SLIDEABLE ] obj -> int -> unit

val hasClass : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> bool

val isSelected : [< `PULLDOWNLIST | `LIST ] obj -> int -> bool

val destroyObject : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT ] obj -> string -> unit

val addStyles : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val setBounds : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> int -> int -> int -> int -> unit

val getComponents : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> any_id obj list

val getClassAttribute : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string

val log : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT ] obj -> string -> unit

val renderRow : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val start : [< `ONYX_SPINNER ] obj -> unit -> unit

val stop : [< `ONYX_SPINNER ] obj -> unit -> unit

val lockRow : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val select : [< `PULLDOWNLIST | `LIST ] obj -> int -> any_id obj -> unit

val scrollToStart : [< `PULLDOWNLIST | `LIST ] obj -> unit -> unit

val update : [< `CANVAS ] obj -> unit -> unit

val removeClass : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val setScrollPosition : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val rendered : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> unit

val addComponent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> any_id obj -> unit

val getControls : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj list

val renderInto : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> dom_node -> unit

val prepareRow : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val write : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> unit

val animateTo : [< `SLIDEABLE ] obj -> int -> unit

val reflow : [< `FITTABLELAYOUT ] obj -> unit -> unit

val show : [< `DRAGAVATAR ] obj -> unit -> unit

val toggleMinMax : [< `SLIDEABLE ] obj -> unit -> unit

val error : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT ] obj -> string -> unit

val send : [< `WEBSERVICE ] obj -> string -> unit

val addContent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val animateToMin : [< `SLIDEABLE ] obj -> int -> unit

val render : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> unit

val toggle : [< `ONYX_SPINNER ] obj -> unit -> unit

val getCacheBust : [< `JSONPREQUEST ] obj -> unit -> bool
val setCacheBust : [< `JSONPREQUEST ] obj -> bool -> unit

val getExpandable : [< `NODE ] obj -> unit -> bool
val setExpandable : [< `NODE ] obj -> bool -> unit

val getOnlyIconExpands : [< `NODE ] obj -> unit -> bool
val setOnlyIconExpands : [< `NODE ] obj -> bool -> unit

val getActive_bool : [< `ONYX_ICONBUTTON | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM ] obj -> unit -> bool
val setActive_bool : [< `ONYX_ICONBUTTON | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM ] obj -> bool -> unit

val getId : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> string
val setId : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> string -> unit

val getLayoutKind_string : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> unit -> string
val setLayoutKind_string : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> string -> unit

val getWrap : [< `PANELS ] obj -> unit -> bool
val setWrap : [< `PANELS ] obj -> bool -> unit

val getActive_bool : [< `ONYX_TOGGLEBUTTON | `ONYX_CHECKBOX | `CHECKBOX ] obj -> unit -> bool
val setActive_bool : [< `ONYX_TOGGLEBUTTON | `ONYX_CHECKBOX | `CHECKBOX ] obj -> bool -> unit

val getShowing_bool : [< `DRAGAVATAR ] obj -> unit -> bool
val setShowing_bool : [< `DRAGAVATAR ] obj -> bool -> unit

val getMultiSelect : [< `PULLDOWNLIST | `LIST ] obj -> unit -> bool
val setMultiSelect : [< `PULLDOWNLIST | `LIST ] obj -> bool -> unit

val getDisabled_bool : [< `ONYX_TOGGLEBUTTON ] obj -> unit -> bool
val setDisabled_bool : [< `ONYX_TOGGLEBUTTON ] obj -> bool -> unit

val getOffsetY : [< `DRAGAVATAR ] obj -> unit -> int
val setOffsetY : [< `DRAGAVATAR ] obj -> int -> unit

val getOffsetX : [< `DRAGAVATAR ] obj -> unit -> int
val setOffsetX : [< `DRAGAVATAR ] obj -> int -> unit

val getDraggable : [< `SLIDEABLE | `PANELS ] obj -> unit -> bool
val setDraggable : [< `SLIDEABLE | `PANELS ] obj -> bool -> unit

val getModal : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> unit -> bool
val setModal : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> bool -> unit

val getValue_string : [< `OPTION ] obj -> unit -> string
val setValue_string : [< `OPTION ] obj -> string -> unit

val getName : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> string
val setName : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> string -> unit

val getOnContent : [< `ONYX_TOGGLEBUTTON ] obj -> unit -> string
val setOnContent : [< `ONYX_TOGGLEBUTTON ] obj -> string -> unit

val getThumb : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> bool
val setThumb : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> bool -> unit

val getControlParentName : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> unit -> string
val setControlParentName : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> string -> unit

val getChecked : [< `ONYX_CHECKBOX | `CHECKBOX ] obj -> unit -> bool
val setChecked : [< `ONYX_CHECKBOX | `CHECKBOX ] obj -> bool -> unit

val getSelected : [< `SELECT ] obj -> unit -> int
val setSelected : [< `SELECT ] obj -> int -> unit

val getMax : [< `SLIDEABLE ] obj -> unit -> int
val setMax : [< `SLIDEABLE ] obj -> int -> unit

val getActive_obj : [< `ONYX_RADIOGROUP | `GROUP ] obj -> unit -> any_id obj
val setActive_obj : [< `ONYX_RADIOGROUP | `GROUP ] obj -> any_id obj -> unit

val getStyle : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string
val setStyle : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getCount : [< `PULLDOWNLIST | `LIST ] obj -> unit -> int
val setCount : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val getAutoDismiss : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> unit -> bool
val setAutoDismiss : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> bool -> unit

val getOwner : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> unit -> any_id obj
val setOwner : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT ] obj -> any_id obj -> unit

val getParent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj
val setParent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> any_id obj -> unit

val getType : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> unit -> string
val setType : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> string -> unit

val getBottomUp : [< `PULLDOWNLIST | `LIST ] obj -> unit -> bool
val setBottomUp : [< `PULLDOWNLIST | `LIST ] obj -> bool -> unit

val getFixedHeight : [< `PULLDOWNLIST | `LIST ] obj -> unit -> bool
val setFixedHeight : [< `PULLDOWNLIST | `LIST ] obj -> bool -> unit

val getPreventDragPropagation : [< `SLIDEABLE | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> bool
val setPreventDragPropagation : [< `SLIDEABLE | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> bool -> unit

val getJsonp : [< `WEBSERVICE ] obj -> unit -> bool
val setJsonp : [< `WEBSERVICE ] obj -> bool -> unit

val getContent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string
val setContent : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getAnimate : [< `PANELS ] obj -> unit -> bool
val setAnimate : [< `PANELS ] obj -> bool -> unit

val getRowsPerPage : [< `PULLDOWNLIST | `LIST ] obj -> unit -> int
val setRowsPerPage : [< `PULLDOWNLIST | `LIST ] obj -> int -> unit

val getHighlander : [< `ONYX_RADIOGROUP | `GROUP ] obj -> unit -> bool
val setHighlander : [< `ONYX_RADIOGROUP | `GROUP ] obj -> bool -> unit

val getIcon : [< `NODE ] obj -> unit -> string
val setIcon : [< `NODE ] obj -> string -> unit

val getAxis : [< `SLIDEABLE ] obj -> unit -> string
val setAxis : [< `SLIDEABLE ] obj -> string -> unit

val getFit : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> bool
val setFit : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val getValue_bool : [< `ONYX_TOGGLEBUTTON ] obj -> unit -> bool
val setValue_bool : [< `ONYX_TOGGLEBUTTON ] obj -> bool -> unit

val getOffContent : [< `ONYX_TOGGLEBUTTON ] obj -> unit -> string
val setOffContent : [< `ONYX_TOGGLEBUTTON ] obj -> string -> unit

val getPlaceholder : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> unit -> string
val setPlaceholder : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> string -> unit

val getOverscroll : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> bool
val setOverscroll : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> bool -> unit

val getAllowHtml : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> bool
val setAllowHtml : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val getNoEvents : [< `IMAGE ] obj -> unit -> bool
val setNoEvents : [< `IMAGE ] obj -> bool -> unit

val getCallbackName_string : [< `WEBSERVICE ] obj -> unit -> string
val setCallbackName_string : [< `WEBSERVICE ] obj -> string -> unit

val getToggleSelected : [< `PULLDOWNLIST | `LIST ] obj -> unit -> bool
val setToggleSelected : [< `PULLDOWNLIST | `LIST ] obj -> bool -> unit

val getVertical : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> string
val setVertical : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> string -> unit

val getContainer : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> unit -> any_id obj
val setContainer : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT ] obj -> any_id obj -> unit

val getOverMoving : [< `SLIDEABLE ] obj -> unit -> bool
val setOverMoving : [< `SLIDEABLE ] obj -> bool -> unit

val getCallbackName_string : [< `JSONPREQUEST ] obj -> unit -> string
val setCallbackName_string : [< `JSONPREQUEST ] obj -> string -> unit

val getNarrowFit : [< `PANELS ] obj -> unit -> bool
val setNarrowFit : [< `PANELS ] obj -> bool -> unit

val getIndex : [< `PANELS ] obj -> unit -> int
val setIndex : [< `PANELS ] obj -> int -> unit

val getFloating : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> unit -> bool
val setFloating : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> bool -> unit

val getExpanded : [< `NODE ] obj -> unit -> bool
val setExpanded : [< `NODE ] obj -> bool -> unit

val getAccelerated : [< `SLIDEABLE ] obj -> unit -> string
val setAccelerated : [< `SLIDEABLE ] obj -> string -> unit

val getDisabled_bool : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON ] obj -> unit -> bool
val setDisabled_bool : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON ] obj -> bool -> unit

val getUnit : [< `SLIDEABLE ] obj -> unit -> string
val setUnit : [< `SLIDEABLE ] obj -> string -> unit

val getMargin : [< `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER ] obj -> unit -> int
val setMargin : [< `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER ] obj -> int -> unit

val getTag : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string
val setTag : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getArrangerKind : [< `PANELS ] obj -> unit -> string
val setArrangerKind : [< `PANELS ] obj -> string -> unit

val getSrc : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string
val setSrc : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getValue_int : [< `SLIDEABLE ] obj -> unit -> int
val setValue_int : [< `SLIDEABLE ] obj -> int -> unit

val getMin : [< `SLIDEABLE ] obj -> unit -> int
val setMin : [< `SLIDEABLE ] obj -> int -> unit

val getTapHighlight : [< `ONYX_ITEM ] obj -> unit -> bool
val setTapHighlight : [< `ONYX_ITEM ] obj -> bool -> unit

val getUrl : [< `JSONPREQUEST ] obj -> unit -> string
val setUrl : [< `JSONPREQUEST ] obj -> string -> unit

val getScrim : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> bool
val setScrim : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> bool -> unit

val getLayoutClass : [< `FITTABLELAYOUT | `BASELAYOUT | `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER | `COLLAPSINGARRANGER | `CAROUSELARRANGER | `CARDSLIDEINARRANGER | `CARDARRANGER | `ARRANGER | `LAYOUT ] obj -> unit -> string
val setLayoutClass : [< `FITTABLELAYOUT | `BASELAYOUT | `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER | `COLLAPSINGARRANGER | `CAROUSELARRANGER | `CARDSLIDEINARRANGER | `CARDARRANGER | `ARRANGER | `LAYOUT ] obj -> string -> unit

val getShowing_bool : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> bool
val setShowing_bool : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val getNoStretch : [< `FITTABLEROWS | `FITTABLECOLUMNS ] obj -> unit -> bool
val setNoStretch : [< `FITTABLEROWS | `FITTABLECOLUMNS ] obj -> bool -> unit

val getClasses : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> string
val setClasses : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> string -> unit

val getCentered : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> unit -> bool
val setCentered : [< `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP ] obj -> bool -> unit

val getIsContainer : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> bool
val setIsContainer : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val getHorizontal : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> unit -> string
val setHorizontal : [< `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY ] obj -> string -> unit

val getCanGenerate : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> unit -> bool
val setCanGenerate : [< `SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL ] obj -> bool -> unit

val getValue_string : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> unit -> string
val setValue_string : [< `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT ] obj -> string -> unit

val getLayoutKind_string : [< `FITTABLEROWS | `FITTABLECOLUMNS ] obj -> unit -> string
val setLayoutKind_string : [< `FITTABLEROWS | `FITTABLECOLUMNS ] obj -> string -> unit


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
end = struct
let gen_oid = let toto = ref 0 in fun () -> incr toto ; Printf.sprintf "_OID_%04X" !toto 

open Js
open Unsafe
type any_id = [`SLIDEABLE | `SELECT | `SCROLLTHUMB | `TRANSLATESCROLLSTRATEGY | `TOUCHSCROLLSTRATEGY | `SCROLLSTRATEGY | `PULLDOWNLIST | `LIST | `SCROLLER | `REPEATER | `ONYX_TOOLTIP | `ONYX_FLYWEIGHTPICKER | `ONYX_PICKER | `ONYX_MENU | `ONYX_POPUP | `POPUP | `PANELS | `OWNERPROXY | `OPTION | `ONYX_PICKERDECORATOR | `ONYX_MENUDECORATOR | `ONYX_TOOLTIPDECORATOR | `ONYX_TOOLBAR | `ONYX_TOGGLEBUTTON | `ONYX_SPINNER | `ONYX_SCRIM | `ONYX_SLIDER | `ONYX_PROGRESSBUTTON | `ONYX_PROGRESSBAR | `ONYX_MORETOOLBAR | `ONYX_ITEM | `ONYX_ICONBUTTON | `ONYX_ICON | `ONYX_GROUPBOXHEADER | `ONYX_GROUPBOX | `ONYX_GRABBER | `ONYX_DRAWER | `NODE | `ONYX_TEXTAREA | `TEXTAREA | `ONYX_RICHTEXT | `RICHTEXT | `ONYX_CHECKBOX | `CHECKBOX | `ONYX_INPUT | `INPUT | `IMAGE | `ONYX_INPUTDECORATOR | `ONYX_MENUITEM | `ONYX_BUTTON | `BUTTON | `TOOLDECORATOR | `GROUPITEM | `ONYX_RADIOGROUP | `GROUP | `FLYWEIGHTREPEATER | `FITTABLEROWS | `FITTABLECOLUMNS | `CANVAS | `CONTROL | `CANVAS_TEXT | `CANVAS_RECTANGLE | `CANVAS_CIRCLE | `CANVAS_SHAPE | `CANVAS_IMAGE | `CANVAS_CONTROL | `UICOMPONENT | `SIGNALS | `SELECTION | `SCROLLMATH | `DRAGAVATAR | `ANIMATOR | `WEBSERVICE | `_AJAXCOMPONENT | `COMPONENT | `JSONPREQUEST | `AJAX | `ASYNC | `OBJECT | `FITTABLELAYOUT | `BASELAYOUT | `TOPBOTTOMARRANGER | `LEFTRIGHTARRANGER | `COLLAPSINGARRANGER | `CAROUSELARRANGER | `CARDSLIDEINARRANGER | `CARDARRANGER | `ARRANGER | `LAYOUT | `_UNUSED]
type any_event = [`GESTURE]
type dom_node = Dom_html.bodyElement Js.t
type js_value = Int of int | String of string | Char of char | Float of float | Dom_node of dom_node | Bool of bool | Array of js_value list | Component of any_id obj 
and handler = Handler of string * (any_id obj -> any_id obj -> any_event obj -> bool)
and +'a kind = {id:string; oid:string; components: any_id kind list;handler_list:handler list; prop_list : (string * js_value) list }
and +'a obj = Js.Unsafe.any
exception Bad_kind

let kind_it name obj_js =
    let enyo_js_object = 
      let _ = fun_call (variable "enyo.kind") [| inject obj_js |] in
      new_obj (variable name) [||]
    in
    set (variable "window") "_FIXME" enyo_js_object ;
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
      set js_obj "_hidden_id" (string (kind.id));
      set js_obj "name" (string (kind.oid));
      js_obj in
      let js_obj = (build_component_tree kind) in
      let name = try 
		   match List.assoc "name" kind.prop_list with 
		     String s -> s 
		   | _ -> assert false
        with
	  Not_found -> set js_obj "name" (string "_default_app_name");
	    "_default_app_name" in
      kind_it name js_obj
let id (obj_js : ([<any_id] as 'a) obj) : 'a =
      let s = to_string (get obj_js "_hidden_id") in
      Obj.magic (match s with
| "SLIDEABLE" -> `SLIDEABLE
| "SELECT" -> `SELECT
| "SCROLLTHUMB" -> `SCROLLTHUMB
| "TRANSLATESCROLLSTRATEGY" -> `TRANSLATESCROLLSTRATEGY
| "TOUCHSCROLLSTRATEGY" -> `TOUCHSCROLLSTRATEGY
| "SCROLLSTRATEGY" -> `SCROLLSTRATEGY
| "PULLDOWNLIST" -> `PULLDOWNLIST
| "LIST" -> `LIST
| "SCROLLER" -> `SCROLLER
| "REPEATER" -> `REPEATER
| "ONYX.TOOLTIP" -> `ONYX_TOOLTIP
| "ONYX.FLYWEIGHTPICKER" -> `ONYX_FLYWEIGHTPICKER
| "ONYX.PICKER" -> `ONYX_PICKER
| "ONYX.MENU" -> `ONYX_MENU
| "ONYX.POPUP" -> `ONYX_POPUP
| "POPUP" -> `POPUP
| "PANELS" -> `PANELS
| "OWNERPROXY" -> `OWNERPROXY
| "OPTION" -> `OPTION
| "ONYX.PICKERDECORATOR" -> `ONYX_PICKERDECORATOR
| "ONYX.MENUDECORATOR" -> `ONYX_MENUDECORATOR
| "ONYX.TOOLTIPDECORATOR" -> `ONYX_TOOLTIPDECORATOR
| "ONYX.TOOLBAR" -> `ONYX_TOOLBAR
| "ONYX.TOGGLEBUTTON" -> `ONYX_TOGGLEBUTTON
| "ONYX.SPINNER" -> `ONYX_SPINNER
| "ONYX.SCRIM" -> `ONYX_SCRIM
| "ONYX.SLIDER" -> `ONYX_SLIDER
| "ONYX.PROGRESSBUTTON" -> `ONYX_PROGRESSBUTTON
| "ONYX.PROGRESSBAR" -> `ONYX_PROGRESSBAR
| "ONYX.MORETOOLBAR" -> `ONYX_MORETOOLBAR
| "ONYX.ITEM" -> `ONYX_ITEM
| "ONYX.ICONBUTTON" -> `ONYX_ICONBUTTON
| "ONYX.ICON" -> `ONYX_ICON
| "ONYX.GROUPBOXHEADER" -> `ONYX_GROUPBOXHEADER
| "ONYX.GROUPBOX" -> `ONYX_GROUPBOX
| "ONYX.GRABBER" -> `ONYX_GRABBER
| "ONYX.DRAWER" -> `ONYX_DRAWER
| "NODE" -> `NODE
| "ONYX.TEXTAREA" -> `ONYX_TEXTAREA
| "TEXTAREA" -> `TEXTAREA
| "ONYX.RICHTEXT" -> `ONYX_RICHTEXT
| "RICHTEXT" -> `RICHTEXT
| "ONYX.CHECKBOX" -> `ONYX_CHECKBOX
| "CHECKBOX" -> `CHECKBOX
| "ONYX.INPUT" -> `ONYX_INPUT
| "INPUT" -> `INPUT
| "IMAGE" -> `IMAGE
| "ONYX.INPUTDECORATOR" -> `ONYX_INPUTDECORATOR
| "ONYX.MENUITEM" -> `ONYX_MENUITEM
| "ONYX.BUTTON" -> `ONYX_BUTTON
| "BUTTON" -> `BUTTON
| "TOOLDECORATOR" -> `TOOLDECORATOR
| "GROUPITEM" -> `GROUPITEM
| "ONYX.RADIOGROUP" -> `ONYX_RADIOGROUP
| "GROUP" -> `GROUP
| "FLYWEIGHTREPEATER" -> `FLYWEIGHTREPEATER
| "FITTABLEROWS" -> `FITTABLEROWS
| "FITTABLECOLUMNS" -> `FITTABLECOLUMNS
| "CANVAS" -> `CANVAS
| "CONTROL" -> `CONTROL
| "CANVAS.TEXT" -> `CANVAS_TEXT
| "CANVAS.RECTANGLE" -> `CANVAS_RECTANGLE
| "CANVAS.CIRCLE" -> `CANVAS_CIRCLE
| "CANVAS.SHAPE" -> `CANVAS_SHAPE
| "CANVAS.IMAGE" -> `CANVAS_IMAGE
| "CANVAS.CONTROL" -> `CANVAS_CONTROL
| "UICOMPONENT" -> `UICOMPONENT
| "SIGNALS" -> `SIGNALS
| "SELECTION" -> `SELECTION
| "SCROLLMATH" -> `SCROLLMATH
| "DRAGAVATAR" -> `DRAGAVATAR
| "ANIMATOR" -> `ANIMATOR
| "WEBSERVICE" -> `WEBSERVICE
| ".AJAXCOMPONENT" -> `_AJAXCOMPONENT
| "COMPONENT" -> `COMPONENT
| "JSONPREQUEST" -> `JSONPREQUEST
| "AJAX" -> `AJAX
| "ASYNC" -> `ASYNC
| "OBJECT" -> `OBJECT
| "FITTABLELAYOUT" -> `FITTABLELAYOUT
| "BASELAYOUT" -> `BASELAYOUT
| "TOPBOTTOMARRANGER" -> `TOPBOTTOMARRANGER
| "LEFTRIGHTARRANGER" -> `LEFTRIGHTARRANGER
| "COLLAPSINGARRANGER" -> `COLLAPSINGARRANGER
| "CAROUSELARRANGER" -> `CAROUSELARRANGER
| "CARDSLIDEINARRANGER" -> `CARDSLIDEINARRANGER
| "CARDARRANGER" -> `CARDARRANGER
| "ARRANGER" -> `ARRANGER
| "LAYOUT" -> `LAYOUT
| ".UNUSED" -> `_UNUSED | _ -> assert false)

let as_a id_type obj_js =
    if ((id obj_js) :> any_id) = (id_type :> any_id) then
      obj_js
    else
      raise Bad_kind

let new_label name =
    let i = ref (-1) in
    (fun () -> incr i; name ^ (string_of_int !i))

let new_label_slideable = new_label "slideable"
let new_label_select = new_label "select"
let new_label_scrollthumb = new_label "scrollthumb"
let new_label_translatescrollstrategy = new_label "translatescrollstrategy"
let new_label_touchscrollstrategy = new_label "touchscrollstrategy"
let new_label_scrollstrategy = new_label "scrollstrategy"
let new_label_pulldownlist = new_label "pulldownlist"
let new_label_list = new_label "list"
let new_label_scroller = new_label "scroller"
let new_label_repeater = new_label "repeater"
let new_label_onyx_tooltip = new_label "onyx_tooltip"
let new_label_onyx_flyweightpicker = new_label "onyx_flyweightpicker"
let new_label_onyx_picker = new_label "onyx_picker"
let new_label_onyx_menu = new_label "onyx_menu"
let new_label_onyx_popup = new_label "onyx_popup"
let new_label_popup = new_label "popup"
let new_label_panels = new_label "panels"
let new_label_ownerproxy = new_label "ownerproxy"
let new_label_option = new_label "option"
let new_label_onyx_pickerdecorator = new_label "onyx_pickerdecorator"
let new_label_onyx_menudecorator = new_label "onyx_menudecorator"
let new_label_onyx_tooltipdecorator = new_label "onyx_tooltipdecorator"
let new_label_onyx_toolbar = new_label "onyx_toolbar"
let new_label_onyx_togglebutton = new_label "onyx_togglebutton"
let new_label_onyx_spinner = new_label "onyx_spinner"
let new_label_onyx_scrim = new_label "onyx_scrim"
let new_label_onyx_slider = new_label "onyx_slider"
let new_label_onyx_progressbutton = new_label "onyx_progressbutton"
let new_label_onyx_progressbar = new_label "onyx_progressbar"
let new_label_onyx_moretoolbar = new_label "onyx_moretoolbar"
let new_label_onyx_item = new_label "onyx_item"
let new_label_onyx_iconbutton = new_label "onyx_iconbutton"
let new_label_onyx_icon = new_label "onyx_icon"
let new_label_onyx_groupboxheader = new_label "onyx_groupboxheader"
let new_label_onyx_groupbox = new_label "onyx_groupbox"
let new_label_onyx_grabber = new_label "onyx_grabber"
let new_label_onyx_drawer = new_label "onyx_drawer"
let new_label_node = new_label "node"
let new_label_onyx_textarea = new_label "onyx_textarea"
let new_label_textarea = new_label "textarea"
let new_label_onyx_richtext = new_label "onyx_richtext"
let new_label_richtext = new_label "richtext"
let new_label_onyx_checkbox = new_label "onyx_checkbox"
let new_label_checkbox = new_label "checkbox"
let new_label_onyx_input = new_label "onyx_input"
let new_label_input = new_label "input"
let new_label_image = new_label "image"
let new_label_onyx_inputdecorator = new_label "onyx_inputdecorator"
let new_label_onyx_menuitem = new_label "onyx_menuitem"
let new_label_onyx_button = new_label "onyx_button"
let new_label_button = new_label "button"
let new_label_tooldecorator = new_label "tooldecorator"
let new_label_groupitem = new_label "groupitem"
let new_label_onyx_radiogroup = new_label "onyx_radiogroup"
let new_label_group = new_label "group"
let new_label_flyweightrepeater = new_label "flyweightrepeater"
let new_label_fittablerows = new_label "fittablerows"
let new_label_fittablecolumns = new_label "fittablecolumns"
let new_label_canvas = new_label "canvas"
let new_label_control = new_label "control"
let new_label_canvas_text = new_label "canvas_text"
let new_label_canvas_rectangle = new_label "canvas_rectangle"
let new_label_canvas_circle = new_label "canvas_circle"
let new_label_canvas_shape = new_label "canvas_shape"
let new_label_canvas_image = new_label "canvas_image"
let new_label_canvas_control = new_label "canvas_control"
let new_label_uicomponent = new_label "uicomponent"
let new_label_signals = new_label "signals"
let new_label_selection = new_label "selection"
let new_label_scrollmath = new_label "scrollmath"
let new_label_dragavatar = new_label "dragavatar"
let new_label_animator = new_label "animator"
let new_label_webservice = new_label "webservice"
let new_label__ajaxcomponent = new_label "_ajaxcomponent"
let new_label_component = new_label "component"
let new_label_jsonprequest = new_label "jsonprequest"
let new_label_ajax = new_label "ajax"
let new_label_async = new_label "async"
let new_label_object = new_label "object"
let new_label_fittablelayout = new_label "fittablelayout"
let new_label_baselayout = new_label "baselayout"
let new_label_topbottomarranger = new_label "topbottomarranger"
let new_label_leftrightarranger = new_label "leftrightarranger"
let new_label_collapsingarranger = new_label "collapsingarranger"
let new_label_carouselarranger = new_label "carouselarranger"
let new_label_cardslideinarranger = new_label "cardslideinarranger"
let new_label_cardarranger = new_label "cardarranger"
let new_label_arranger = new_label "arranger"
let new_label_layout = new_label "layout"
let new_label__unused = new_label "_unused"

let instance kind = Js.Unsafe.get (Js.Unsafe.get (Js.Unsafe.variable "_FIXME") "$") kind.oid 

let renderIntoBody obj_js =
     Dom_html.window##onload <- Dom_html.handler
      (fun _ -> let _ = meth_call obj_js "renderInto" [| inject (variable "document.body") |] in Js._false)
let slideable
	?(components=[])
	?axis
	?value
	?unit
	?min
	?max
	?accelerated
	?overMoving
	?draggable
	?preventDragPropagation
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
let prop_list= ref [("kind", String "Slideable")]
and handler_list= ref [] in
(match axis with Some v -> prop_list := ("axis",String v)::!prop_list | None -> ());
(match value with Some v -> prop_list := ("value",Int v)::!prop_list | None -> ());
(match unit with Some v -> prop_list := ("unit",String v)::!prop_list | None -> ());
(match min with Some v -> prop_list := ("min",Int v)::!prop_list | None -> ());
(match max with Some v -> prop_list := ("max",Int v)::!prop_list | None -> ());
(match accelerated with Some v -> prop_list := ("accelerated",String v)::!prop_list | None -> ());
(match overMoving with Some v -> prop_list := ("overMoving",Bool v)::!prop_list | None -> ());
(match draggable with Some v -> prop_list := ("draggable",Bool v)::!prop_list | None -> ());
(match preventDragPropagation with Some v -> prop_list := ("preventDragPropagation",Bool v)::!prop_list | None -> ());
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
{id="SLIDEABLE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let _select
	?(components=[])
	?selected
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
let prop_list= ref [("kind", String "Select")]
and handler_list= ref [] in
(match selected with Some v -> prop_list := ("selected",Int v)::!prop_list | None -> ());
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
{id="SELECT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let scrollthumb
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
let prop_list= ref [("kind", String "ScrollThumb")]
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
{id="SCROLLTHUMB"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let translatescrollstrategy
	?(components=[])
	?overscroll
	?preventDragPropagation
	?vertical
	?horizontal
	?thumb
	?scrim
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
let prop_list= ref [("kind", String "TranslateScrollStrategy")]
and handler_list= ref [] in
(match overscroll with Some v -> prop_list := ("overscroll",Bool v)::!prop_list | None -> ());
(match preventDragPropagation with Some v -> prop_list := ("preventDragPropagation",Bool v)::!prop_list | None -> ());
(match vertical with Some v -> prop_list := ("vertical",String v)::!prop_list | None -> ());
(match horizontal with Some v -> prop_list := ("horizontal",String v)::!prop_list | None -> ());
(match thumb with Some v -> prop_list := ("thumb",Bool v)::!prop_list | None -> ());
(match scrim with Some v -> prop_list := ("scrim",Bool v)::!prop_list | None -> ());
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
{id="TRANSLATESCROLLSTRATEGY"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let touchscrollstrategy
	?(components=[])
	?overscroll
	?preventDragPropagation
	?vertical
	?horizontal
	?thumb
	?scrim
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
let prop_list= ref [("kind", String "TouchScrollStrategy")]
and handler_list= ref [] in
(match overscroll with Some v -> prop_list := ("overscroll",Bool v)::!prop_list | None -> ());
(match preventDragPropagation with Some v -> prop_list := ("preventDragPropagation",Bool v)::!prop_list | None -> ());
(match vertical with Some v -> prop_list := ("vertical",String v)::!prop_list | None -> ());
(match horizontal with Some v -> prop_list := ("horizontal",String v)::!prop_list | None -> ());
(match thumb with Some v -> prop_list := ("thumb",Bool v)::!prop_list | None -> ());
(match scrim with Some v -> prop_list := ("scrim",Bool v)::!prop_list | None -> ());
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
{id="TOUCHSCROLLSTRATEGY"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let scrollstrategy
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
let prop_list= ref [("kind", String "ScrollStrategy")]
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
{id="SCROLLSTRATEGY"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let pulldownlist
	?(components=[])
	?count
	?rowsPerPage
	?bottomUp
	?multiSelect
	?toggleSelected
	?fixedHeight
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
let prop_list= ref [("kind", String "PulldownList")]
and handler_list= ref [] in
(match count with Some v -> prop_list := ("count",Int v)::!prop_list | None -> ());
(match rowsPerPage with Some v -> prop_list := ("rowsPerPage",Int v)::!prop_list | None -> ());
(match bottomUp with Some v -> prop_list := ("bottomUp",Bool v)::!prop_list | None -> ());
(match multiSelect with Some v -> prop_list := ("multiSelect",Bool v)::!prop_list | None -> ());
(match toggleSelected with Some v -> prop_list := ("toggleSelected",Bool v)::!prop_list | None -> ());
(match fixedHeight with Some v -> prop_list := ("fixedHeight",Bool v)::!prop_list | None -> ());
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
{id="PULLDOWNLIST"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let list
	?(components=[])
	?count
	?rowsPerPage
	?bottomUp
	?multiSelect
	?toggleSelected
	?fixedHeight
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
let prop_list= ref [("kind", String "List")]
and handler_list= ref [] in
(match count with Some v -> prop_list := ("count",Int v)::!prop_list | None -> ());
(match rowsPerPage with Some v -> prop_list := ("rowsPerPage",Int v)::!prop_list | None -> ());
(match bottomUp with Some v -> prop_list := ("bottomUp",Bool v)::!prop_list | None -> ());
(match multiSelect with Some v -> prop_list := ("multiSelect",Bool v)::!prop_list | None -> ());
(match toggleSelected with Some v -> prop_list := ("toggleSelected",Bool v)::!prop_list | None -> ());
(match fixedHeight with Some v -> prop_list := ("fixedHeight",Bool v)::!prop_list | None -> ());
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
{id="LIST"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let scroller
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
let prop_list= ref [("kind", String "Scroller")]
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
{id="SCROLLER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let repeater
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
let prop_list= ref [("kind", String "Repeater")]
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
{id="REPEATER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_tooltip
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "onyx.Tooltip")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="ONYX.TOOLTIP"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_flyweightpicker
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "onyx.FlyweightPicker")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="ONYX.FLYWEIGHTPICKER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_picker
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "onyx.Picker")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="ONYX.PICKER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_menu
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "onyx.Menu")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="ONYX.MENU"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_popup
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "onyx.Popup")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="ONYX.POPUP"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let popup
	?(components=[])
	?modal
	?autoDismiss
	?floating
	?centered
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
let prop_list= ref [("kind", String "Popup")]
and handler_list= ref [] in
(match modal with Some v -> prop_list := ("modal",Bool v)::!prop_list | None -> ());
(match autoDismiss with Some v -> prop_list := ("autoDismiss",Bool v)::!prop_list | None -> ());
(match floating with Some v -> prop_list := ("floating",Bool v)::!prop_list | None -> ());
(match centered with Some v -> prop_list := ("centered",Bool v)::!prop_list | None -> ());
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
{id="POPUP"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let panels
	?(components=[])
	?index
	?draggable
	?animate
	?wrap
	?arrangerKind
	?narrowFit
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
let prop_list= ref [("kind", String "Panels")]
and handler_list= ref [] in
(match index with Some v -> prop_list := ("index",Int v)::!prop_list | None -> ());
(match draggable with Some v -> prop_list := ("draggable",Bool v)::!prop_list | None -> ());
(match animate with Some v -> prop_list := ("animate",Bool v)::!prop_list | None -> ());
(match wrap with Some v -> prop_list := ("wrap",Bool v)::!prop_list | None -> ());
(match arrangerKind with Some v -> prop_list := ("arrangerKind",String v)::!prop_list | None -> ());
(match narrowFit with Some v -> prop_list := ("narrowFit",Bool v)::!prop_list | None -> ());
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
{id="PANELS"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let ownerproxy
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
let prop_list= ref [("kind", String "OwnerProxy")]
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
{id="OWNERPROXY"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let option
	?(components=[])
	?value
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
let prop_list= ref [("kind", String "Option")]
and handler_list= ref [] in
(match value with Some v -> prop_list := ("value",String v)::!prop_list | None -> ());
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
{id="OPTION"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_pickerdecorator
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
let prop_list= ref [("kind", String "onyx.PickerDecorator")]
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
{id="ONYX.PICKERDECORATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_menudecorator
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
let prop_list= ref [("kind", String "onyx.MenuDecorator")]
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
{id="ONYX.MENUDECORATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_tooltipdecorator
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
let prop_list= ref [("kind", String "onyx.TooltipDecorator")]
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
{id="ONYX.TOOLTIPDECORATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="ONYX.TOOLBAR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_togglebutton
	?(components=[])
	?active
	?value
	?onContent
	?offContent
	?disabled
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
let prop_list= ref [("kind", String "onyx.ToggleButton")]
and handler_list= ref [] in
(match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
(match value with Some v -> prop_list := ("value",Bool v)::!prop_list | None -> ());
(match onContent with Some v -> prop_list := ("onContent",String v)::!prop_list | None -> ());
(match offContent with Some v -> prop_list := ("offContent",String v)::!prop_list | None -> ());
(match disabled with Some v -> prop_list := ("disabled",Bool v)::!prop_list | None -> ());
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
{id="ONYX.TOGGLEBUTTON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_spinner
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
let prop_list= ref [("kind", String "onyx.Spinner")]
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
{id="ONYX.SPINNER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_scrim
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
let prop_list= ref [("kind", String "onyx.Scrim")]
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
{id="ONYX.SCRIM"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_slider
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
let prop_list= ref [("kind", String "onyx.Slider")]
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
{id="ONYX.SLIDER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_progressbutton
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
let prop_list= ref [("kind", String "onyx.ProgressButton")]
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
{id="ONYX.PROGRESSBUTTON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_progressbar
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
let prop_list= ref [("kind", String "onyx.ProgressBar")]
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
{id="ONYX.PROGRESSBAR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_moretoolbar
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
let prop_list= ref [("kind", String "onyx.MoreToolbar")]
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
{id="ONYX.MORETOOLBAR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_item
	?(components=[])
	?tapHighlight
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
let prop_list= ref [("kind", String "onyx.Item")]
and handler_list= ref [] in
(match tapHighlight with Some v -> prop_list := ("tapHighlight",Bool v)::!prop_list | None -> ());
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
{id="ONYX.ITEM"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="ONYX.ICONBUTTON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="ONYX.ICON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_groupboxheader
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
let prop_list= ref [("kind", String "onyx.GroupboxHeader")]
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
{id="ONYX.GROUPBOXHEADER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_groupbox
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
let prop_list= ref [("kind", String "onyx.Groupbox")]
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
{id="ONYX.GROUPBOX"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_grabber
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
let prop_list= ref [("kind", String "onyx.Grabber")]
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
{id="ONYX.GRABBER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_drawer
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
let prop_list= ref [("kind", String "onyx.Drawer")]
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
{id="ONYX.DRAWER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let node
	?(components=[])
	?expandable
	?expanded
	?icon
	?onlyIconExpands
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
let prop_list= ref [("kind", String "Node")]
and handler_list= ref [] in
(match expandable with Some v -> prop_list := ("expandable",Bool v)::!prop_list | None -> ());
(match expanded with Some v -> prop_list := ("expanded",Bool v)::!prop_list | None -> ());
(match icon with Some v -> prop_list := ("icon",String v)::!prop_list | None -> ());
(match onlyIconExpands with Some v -> prop_list := ("onlyIconExpands",Bool v)::!prop_list | None -> ());
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
{id="NODE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_textarea
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
let prop_list= ref [("kind", String "onyx.TextArea")]
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
{id="ONYX.TEXTAREA"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let textarea
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
let prop_list= ref [("kind", String "TextArea")]
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
{id="TEXTAREA"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_richtext
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
let prop_list= ref [("kind", String "onyx.RichText")]
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
{id="ONYX.RICHTEXT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let richtext
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
let prop_list= ref [("kind", String "RichText")]
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
{id="RICHTEXT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_checkbox
	?(components=[])
	?checked
	?active
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
let prop_list= ref [("kind", String "onyx.Checkbox")]
and handler_list= ref [] in
(match checked with Some v -> prop_list := ("checked",Bool v)::!prop_list | None -> ());
(match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
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
{id="ONYX.CHECKBOX"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let checkbox
	?(components=[])
	?checked
	?active
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
let prop_list= ref [("kind", String "Checkbox")]
and handler_list= ref [] in
(match checked with Some v -> prop_list := ("checked",Bool v)::!prop_list | None -> ());
(match active with Some v -> prop_list := ("active",Bool v)::!prop_list | None -> ());
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
{id="CHECKBOX"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_input
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
let prop_list= ref [("kind", String "onyx.Input")]
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
{id="ONYX.INPUT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="INPUT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="IMAGE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_inputdecorator
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
let prop_list= ref [("kind", String "onyx.InputDecorator")]
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
{id="ONYX.INPUTDECORATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_menuitem
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
let prop_list= ref [("kind", String "onyx.MenuItem")]
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
{id="ONYX.MENUITEM"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="ONYX.BUTTON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="BUTTON"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="TOOLDECORATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="GROUPITEM"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let onyx_radiogroup
	?(components=[])
	?highlander
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
let prop_list= ref [("kind", String "onyx.RadioGroup")]
and handler_list= ref [] in
(match highlander with Some v -> prop_list := ("highlander",Bool v)::!prop_list | None -> ());
(match active with Some v -> prop_list := ("active",Component v)::!prop_list | None -> ());
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
{id="ONYX.RADIOGROUP"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let group
	?(components=[])
	?highlander
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
let prop_list= ref [("kind", String "Group")]
and handler_list= ref [] in
(match highlander with Some v -> prop_list := ("highlander",Bool v)::!prop_list | None -> ());
(match active with Some v -> prop_list := ("active",Component v)::!prop_list | None -> ());
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
{id="GROUP"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let flyweightrepeater
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
let prop_list= ref [("kind", String "FlyweightRepeater")]
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
{id="FLYWEIGHTREPEATER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let fittablerows
	?(components=[])
	?layoutKind
	?noStretch
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
let prop_list= ref [("kind", String "FittableRows")]
and handler_list= ref [] in
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match noStretch with Some v -> prop_list := ("noStretch",Bool v)::!prop_list | None -> ());
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
{id="FITTABLEROWS"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let fittablecolumns
	?(components=[])
	?layoutKind
	?noStretch
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
let prop_list= ref [("kind", String "FittableColumns")]
and handler_list= ref [] in
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match noStretch with Some v -> prop_list := ("noStretch",Bool v)::!prop_list | None -> ());
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
{id="FITTABLECOLUMNS"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="CANVAS"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
{id="CONTROL"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_text
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Text")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.TEXT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_rectangle
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Rectangle")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.RECTANGLE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_circle
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Circle")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.CIRCLE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_shape
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Shape")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.SHAPE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_image
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Image")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.IMAGE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let canvas_control
	?(components=[])
	?container
	?parent
	?controlParentName
	?layoutKind
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "canvas.Control")]
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="CANVAS.CONTROL"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

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
and handler_list= ref [] in
(match container with Some v -> prop_list := ("container",Component v)::!prop_list | None -> ());
(match parent with Some v -> prop_list := ("parent",Component v)::!prop_list | None -> ());
(match controlParentName with Some v -> prop_list := ("controlParentName",String v)::!prop_list | None -> ());
(match layoutKind with Some v -> prop_list := ("layoutKind",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="UICOMPONENT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let signals
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "Signals")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="SIGNALS"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let selection
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "Selection")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="SELECTION"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let scrollmath
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "ScrollMath")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="SCROLLMATH"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let dragavatar
	?(components=[])
	?showing
	?offsetX
	?offsetY
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "DragAvatar")]
and handler_list= ref [] in
(match showing with Some v -> prop_list := ("showing",Bool v)::!prop_list | None -> ());
(match offsetX with Some v -> prop_list := ("offsetX",Int v)::!prop_list | None -> ());
(match offsetY with Some v -> prop_list := ("offsetY",Int v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="DRAGAVATAR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let animator
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "Animator")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="ANIMATOR"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let webservice
	?(components=[])
	?jsonp
	?callbackName
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "WebService")]
and handler_list= ref [] in
(match jsonp with Some v -> prop_list := ("jsonp",Bool v)::!prop_list | None -> ());
(match callbackName with Some v -> prop_list := ("callbackName",String v)::!prop_list | None -> ());
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="WEBSERVICE"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let _ajaxcomponent
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "_AjaxComponent")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="_AJAXCOMPONENT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let component
	?(components=[])
	?name
	?id
	?owner
	() =
let prop_list= ref [("kind", String "Component")]
and handler_list= ref [] in
(match name with Some v -> prop_list := ("name",String v)::!prop_list | None -> ());
(match id with Some v -> prop_list := ("id",String v)::!prop_list | None -> ());
(match owner with Some v -> prop_list := ("owner",Component v)::!prop_list | None -> ());
{id="COMPONENT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let jsonprequest
	?(components=[])
	?url
	?callbackName
	?cacheBust
	() =
let prop_list= ref [("kind", String "JsonpRequest")]
and handler_list= ref [] in
(match url with Some v -> prop_list := ("url",String v)::!prop_list | None -> ());
(match callbackName with Some v -> prop_list := ("callbackName",String v)::!prop_list | None -> ());
(match cacheBust with Some v -> prop_list := ("cacheBust",Bool v)::!prop_list | None -> ());
{id="JSONPREQUEST"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let ajax
	?(components=[])
	() =
let prop_list= ref [("kind", String "Ajax")]
and handler_list= ref [] in

{id="AJAX"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let async
	?(components=[])
	() =
let prop_list= ref [("kind", String "Async")]
and handler_list= ref [] in

{id="ASYNC"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let _object
	?(components=[])
	() =
let prop_list= ref [("kind", String "Object")]
and handler_list= ref [] in

{id="OBJECT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let fittablelayout
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "FittableLayout")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="FITTABLELAYOUT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let baselayout
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "BaseLayout")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="BASELAYOUT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let topbottomarranger
	?(components=[])
	?margin
	?layoutClass
	() =
let prop_list= ref [("kind", String "TopBottomArranger")]
and handler_list= ref [] in
(match margin with Some v -> prop_list := ("margin",Int v)::!prop_list | None -> ());
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="TOPBOTTOMARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let leftrightarranger
	?(components=[])
	?margin
	?layoutClass
	() =
let prop_list= ref [("kind", String "LeftRightArranger")]
and handler_list= ref [] in
(match margin with Some v -> prop_list := ("margin",Int v)::!prop_list | None -> ());
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="LEFTRIGHTARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let collapsingarranger
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "CollapsingArranger")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="COLLAPSINGARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let carouselarranger
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "CarouselArranger")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="CAROUSELARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let cardslideinarranger
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "CardSlideInArranger")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="CARDSLIDEINARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let cardarranger
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "CardArranger")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="CARDARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let arranger
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "Arranger")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="ARRANGER"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let layout
	?(components=[])
	?layoutClass
	() =
let prop_list= ref [("kind", String "Layout")]
and handler_list= ref [] in
(match layoutClass with Some v -> prop_list := ("layoutClass",String v)::!prop_list | None -> ());
{id="LAYOUT"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}

let _unused
	?(components=[])
	() =
let prop_list= ref [("kind", String "_unused")]
and handler_list= ref [] in

{id="_UNUSED"; oid=gen_oid (); components=components;prop_list=(!prop_list);handler_list=(!handler_list)}


let refresh this () =
	let _ = meth_call this "refresh" [||] in
		()

let scrollToEnd this () =
	let _ = meth_call this "scrollToEnd" [||] in
		()

let hide this () =
	let _ = meth_call this "hide" [||] in
		()

let stylesToNode this () =
	let _ = meth_call this "stylesToNode" [||] in
		()

let show this predicat1 =
	let _ = meth_call this "show" [|inject (bool predicat1)|] in
		()

let setScrollTop this entier1 =
	let _ = meth_call this "setScrollTop" [|inject entier1|] in
		()

let destroy this () =
	let _ = meth_call this "destroy" [||] in
		()

let warn this chaine1 =
	let _ = meth_call this "warn" [|inject (string chaine1)|] in
		()

let reset this () =
	let _ = meth_call this "reset" [||] in
		()

let getSelection this () =
	let value = meth_call this "getSelection" [||] in
		value

let destroyComponents this () =
	let _ = meth_call this "destroyComponents" [||] in
		()

let addRemoveClass this chaine1 predicat1 =
	let _ = meth_call this "addRemoveClass" [|inject (string chaine1); inject (bool predicat1)|] in
		()

let scrollToBottom this () =
	let _ = meth_call this "scrollToBottom" [||] in
		()

let getScrollPosition this () =
	let value = meth_call this "getScrollPosition" [||] in
		value

let getScrollTop this () =
	let value = meth_call this "getScrollTop" [||] in
		value

let addClass this chaine1 =
	let _ = meth_call this "addClass" [|inject (string chaine1)|] in
		()

let getValue this chaine1 =
	let _ = meth_call this "getValue" [|inject (string chaine1)|] in
		()

let makeId this () =
	let _ = meth_call this "makeId" [||] in
		()

let animateToMax this entier1 =
	let _ = meth_call this "animateToMax" [|inject entier1|] in
		()

let hasClass this chaine1 =
	let value = meth_call this "hasClass" [|inject (string chaine1)|] in
		to_bool value

let isSelected this entier1 =
	let value = meth_call this "isSelected" [|inject entier1|] in
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

let renderRow this entier1 =
	let _ = meth_call this "renderRow" [|inject entier1|] in
		()

let start this () =
	let _ = meth_call this "start" [||] in
		()

let stop this () =
	let _ = meth_call this "stop" [||] in
		()

let lockRow this entier1 =
	let _ = meth_call this "lockRow" [|inject entier1|] in
		()

let select this entier1 obj_js1 =
	let _ = meth_call this "select" [|inject entier1; inject obj_js1|] in
		()

let scrollToStart this () =
	let _ = meth_call this "scrollToStart" [||] in
		()

let update this () =
	let _ = meth_call this "update" [||] in
		()

let removeClass this chaine1 =
	let _ = meth_call this "removeClass" [|inject (string chaine1)|] in
		()

let setScrollPosition this entier1 =
	let _ = meth_call this "setScrollPosition" [|inject entier1|] in
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

let prepareRow this entier1 =
	let _ = meth_call this "prepareRow" [|inject entier1|] in
		()

let write this () =
	let _ = meth_call this "write" [||] in
		()

let animateTo this entier1 =
	let _ = meth_call this "animateTo" [|inject entier1|] in
		()

let reflow this () =
	let _ = meth_call this "reflow" [||] in
		()

let show this () =
	let _ = meth_call this "show" [||] in
		()

let toggleMinMax this () =
	let _ = meth_call this "toggleMinMax" [||] in
		()

let error this chaine1 =
	let _ = meth_call this "error" [|inject (string chaine1)|] in
		()

let send this chaine1 =
	let _ = meth_call this "send" [|inject (string chaine1)|] in
		()

let addContent this chaine1 =
	let _ = meth_call this "addContent" [|inject (string chaine1)|] in
		()

let animateToMin this entier1 =
	let _ = meth_call this "animateToMin" [|inject entier1|] in
		()

let render this () =
	let _ = meth_call this "render" [||] in
		()

let toggle this () =
	let _ = meth_call this "toggle" [||] in
		()

let getCacheBust this () =
	let value = meth_call this "getCacheBust" [||] in
		to_bool value
let setCacheBust this predicat1 =
	let _ = meth_call this "setCacheBust" [|inject (bool predicat1)|] in
		()

let getExpandable this () =
	let value = meth_call this "getExpandable" [||] in
		to_bool value
let setExpandable this predicat1 =
	let _ = meth_call this "setExpandable" [|inject (bool predicat1)|] in
		()

let getOnlyIconExpands this () =
	let value = meth_call this "getOnlyIconExpands" [||] in
		to_bool value
let setOnlyIconExpands this predicat1 =
	let _ = meth_call this "setOnlyIconExpands" [|inject (bool predicat1)|] in
		()

let getActive_bool this () =
	let value = meth_call this "getActive_bool" [||] in
		to_bool value
let setActive_bool this predicat1 =
	let _ = meth_call this "setActive_bool" [|inject (bool predicat1)|] in
		()

let getId this () =
	let value = meth_call this "getId" [||] in
		to_string value
let setId this chaine1 =
	let _ = meth_call this "setId" [|inject (string chaine1)|] in
		()

let getLayoutKind_string this () =
	let value = meth_call this "getLayoutKind_string" [||] in
		to_string value
let setLayoutKind_string this chaine1 =
	let _ = meth_call this "setLayoutKind_string" [|inject (string chaine1)|] in
		()

let getWrap this () =
	let value = meth_call this "getWrap" [||] in
		to_bool value
let setWrap this predicat1 =
	let _ = meth_call this "setWrap" [|inject (bool predicat1)|] in
		()

let getActive_bool this () =
	let value = meth_call this "getActive_bool" [||] in
		to_bool value
let setActive_bool this predicat1 =
	let _ = meth_call this "setActive_bool" [|inject (bool predicat1)|] in
		()

let getShowing_bool this () =
	let value = meth_call this "getShowing_bool" [||] in
		to_bool value
let setShowing_bool this predicat1 =
	let _ = meth_call this "setShowing_bool" [|inject (bool predicat1)|] in
		()

let getMultiSelect this () =
	let value = meth_call this "getMultiSelect" [||] in
		to_bool value
let setMultiSelect this predicat1 =
	let _ = meth_call this "setMultiSelect" [|inject (bool predicat1)|] in
		()

let getDisabled_bool this () =
	let value = meth_call this "getDisabled_bool" [||] in
		to_bool value
let setDisabled_bool this predicat1 =
	let _ = meth_call this "setDisabled_bool" [|inject (bool predicat1)|] in
		()

let getOffsetY this () =
	let value = meth_call this "getOffsetY" [||] in
		value
let setOffsetY this entier1 =
	let _ = meth_call this "setOffsetY" [|inject entier1|] in
		()

let getOffsetX this () =
	let value = meth_call this "getOffsetX" [||] in
		value
let setOffsetX this entier1 =
	let _ = meth_call this "setOffsetX" [|inject entier1|] in
		()

let getDraggable this () =
	let value = meth_call this "getDraggable" [||] in
		to_bool value
let setDraggable this predicat1 =
	let _ = meth_call this "setDraggable" [|inject (bool predicat1)|] in
		()

let getModal this () =
	let value = meth_call this "getModal" [||] in
		to_bool value
let setModal this predicat1 =
	let _ = meth_call this "setModal" [|inject (bool predicat1)|] in
		()

let getValue_string this () =
	let value = meth_call this "getValue_string" [||] in
		to_string value
let setValue_string this chaine1 =
	let _ = meth_call this "setValue_string" [|inject (string chaine1)|] in
		()

let getName this () =
	let value = meth_call this "getName" [||] in
		to_string value
let setName this chaine1 =
	let _ = meth_call this "setName" [|inject (string chaine1)|] in
		()

let getOnContent this () =
	let value = meth_call this "getOnContent" [||] in
		to_string value
let setOnContent this chaine1 =
	let _ = meth_call this "setOnContent" [|inject (string chaine1)|] in
		()

let getThumb this () =
	let value = meth_call this "getThumb" [||] in
		to_bool value
let setThumb this predicat1 =
	let _ = meth_call this "setThumb" [|inject (bool predicat1)|] in
		()

let getControlParentName this () =
	let value = meth_call this "getControlParentName" [||] in
		to_string value
let setControlParentName this chaine1 =
	let _ = meth_call this "setControlParentName" [|inject (string chaine1)|] in
		()

let getChecked this () =
	let value = meth_call this "getChecked" [||] in
		to_bool value
let setChecked this predicat1 =
	let _ = meth_call this "setChecked" [|inject (bool predicat1)|] in
		()

let getSelected this () =
	let value = meth_call this "getSelected" [||] in
		value
let setSelected this entier1 =
	let _ = meth_call this "setSelected" [|inject entier1|] in
		()

let getMax this () =
	let value = meth_call this "getMax" [||] in
		value
let setMax this entier1 =
	let _ = meth_call this "setMax" [|inject entier1|] in
		()

let getActive_obj this () =
	let value = meth_call this "getActive_obj" [||] in
		value
let setActive_obj this obj_js1 =
	let _ = meth_call this "setActive_obj" [|inject obj_js1|] in
		()

let getStyle this () =
	let value = meth_call this "getStyle" [||] in
		to_string value
let setStyle this chaine1 =
	let _ = meth_call this "setStyle" [|inject (string chaine1)|] in
		()

let getCount this () =
	let value = meth_call this "getCount" [||] in
		value
let setCount this entier1 =
	let _ = meth_call this "setCount" [|inject entier1|] in
		()

let getAutoDismiss this () =
	let value = meth_call this "getAutoDismiss" [||] in
		to_bool value
let setAutoDismiss this predicat1 =
	let _ = meth_call this "setAutoDismiss" [|inject (bool predicat1)|] in
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

let getBottomUp this () =
	let value = meth_call this "getBottomUp" [||] in
		to_bool value
let setBottomUp this predicat1 =
	let _ = meth_call this "setBottomUp" [|inject (bool predicat1)|] in
		()

let getFixedHeight this () =
	let value = meth_call this "getFixedHeight" [||] in
		to_bool value
let setFixedHeight this predicat1 =
	let _ = meth_call this "setFixedHeight" [|inject (bool predicat1)|] in
		()

let getPreventDragPropagation this () =
	let value = meth_call this "getPreventDragPropagation" [||] in
		to_bool value
let setPreventDragPropagation this predicat1 =
	let _ = meth_call this "setPreventDragPropagation" [|inject (bool predicat1)|] in
		()

let getJsonp this () =
	let value = meth_call this "getJsonp" [||] in
		to_bool value
let setJsonp this predicat1 =
	let _ = meth_call this "setJsonp" [|inject (bool predicat1)|] in
		()

let getContent this () =
	let value = meth_call this "getContent" [||] in
		to_string value
let setContent this chaine1 =
	let _ = meth_call this "setContent" [|inject (string chaine1)|] in
		()

let getAnimate this () =
	let value = meth_call this "getAnimate" [||] in
		to_bool value
let setAnimate this predicat1 =
	let _ = meth_call this "setAnimate" [|inject (bool predicat1)|] in
		()

let getRowsPerPage this () =
	let value = meth_call this "getRowsPerPage" [||] in
		value
let setRowsPerPage this entier1 =
	let _ = meth_call this "setRowsPerPage" [|inject entier1|] in
		()

let getHighlander this () =
	let value = meth_call this "getHighlander" [||] in
		to_bool value
let setHighlander this predicat1 =
	let _ = meth_call this "setHighlander" [|inject (bool predicat1)|] in
		()

let getIcon this () =
	let value = meth_call this "getIcon" [||] in
		to_string value
let setIcon this chaine1 =
	let _ = meth_call this "setIcon" [|inject (string chaine1)|] in
		()

let getAxis this () =
	let value = meth_call this "getAxis" [||] in
		to_string value
let setAxis this chaine1 =
	let _ = meth_call this "setAxis" [|inject (string chaine1)|] in
		()

let getFit this () =
	let value = meth_call this "getFit" [||] in
		to_bool value
let setFit this predicat1 =
	let _ = meth_call this "setFit" [|inject (bool predicat1)|] in
		()

let getValue_bool this () =
	let value = meth_call this "getValue_bool" [||] in
		to_bool value
let setValue_bool this predicat1 =
	let _ = meth_call this "setValue_bool" [|inject (bool predicat1)|] in
		()

let getOffContent this () =
	let value = meth_call this "getOffContent" [||] in
		to_string value
let setOffContent this chaine1 =
	let _ = meth_call this "setOffContent" [|inject (string chaine1)|] in
		()

let getPlaceholder this () =
	let value = meth_call this "getPlaceholder" [||] in
		to_string value
let setPlaceholder this chaine1 =
	let _ = meth_call this "setPlaceholder" [|inject (string chaine1)|] in
		()

let getOverscroll this () =
	let value = meth_call this "getOverscroll" [||] in
		to_bool value
let setOverscroll this predicat1 =
	let _ = meth_call this "setOverscroll" [|inject (bool predicat1)|] in
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

let getCallbackName_string this () =
	let value = meth_call this "getCallbackName_string" [||] in
		to_string value
let setCallbackName_string this chaine1 =
	let _ = meth_call this "setCallbackName_string" [|inject (string chaine1)|] in
		()

let getToggleSelected this () =
	let value = meth_call this "getToggleSelected" [||] in
		to_bool value
let setToggleSelected this predicat1 =
	let _ = meth_call this "setToggleSelected" [|inject (bool predicat1)|] in
		()

let getVertical this () =
	let value = meth_call this "getVertical" [||] in
		to_string value
let setVertical this chaine1 =
	let _ = meth_call this "setVertical" [|inject (string chaine1)|] in
		()

let getContainer this () =
	let value = meth_call this "getContainer" [||] in
		value
let setContainer this obj_js1 =
	let _ = meth_call this "setContainer" [|inject obj_js1|] in
		()

let getOverMoving this () =
	let value = meth_call this "getOverMoving" [||] in
		to_bool value
let setOverMoving this predicat1 =
	let _ = meth_call this "setOverMoving" [|inject (bool predicat1)|] in
		()

let getCallbackName_string this () =
	let value = meth_call this "getCallbackName_string" [||] in
		to_string value
let setCallbackName_string this chaine1 =
	let _ = meth_call this "setCallbackName_string" [|inject (string chaine1)|] in
		()

let getNarrowFit this () =
	let value = meth_call this "getNarrowFit" [||] in
		to_bool value
let setNarrowFit this predicat1 =
	let _ = meth_call this "setNarrowFit" [|inject (bool predicat1)|] in
		()

let getIndex this () =
	let value = meth_call this "getIndex" [||] in
		value
let setIndex this entier1 =
	let _ = meth_call this "setIndex" [|inject entier1|] in
		()

let getFloating this () =
	let value = meth_call this "getFloating" [||] in
		to_bool value
let setFloating this predicat1 =
	let _ = meth_call this "setFloating" [|inject (bool predicat1)|] in
		()

let getExpanded this () =
	let value = meth_call this "getExpanded" [||] in
		to_bool value
let setExpanded this predicat1 =
	let _ = meth_call this "setExpanded" [|inject (bool predicat1)|] in
		()

let getAccelerated this () =
	let value = meth_call this "getAccelerated" [||] in
		to_string value
let setAccelerated this chaine1 =
	let _ = meth_call this "setAccelerated" [|inject (string chaine1)|] in
		()

let getDisabled_bool this () =
	let value = meth_call this "getDisabled_bool" [||] in
		to_bool value
let setDisabled_bool this predicat1 =
	let _ = meth_call this "setDisabled_bool" [|inject (bool predicat1)|] in
		()

let getUnit this () =
	let value = meth_call this "getUnit" [||] in
		to_string value
let setUnit this chaine1 =
	let _ = meth_call this "setUnit" [|inject (string chaine1)|] in
		()

let getMargin this () =
	let value = meth_call this "getMargin" [||] in
		value
let setMargin this entier1 =
	let _ = meth_call this "setMargin" [|inject entier1|] in
		()

let getTag this () =
	let value = meth_call this "getTag" [||] in
		to_string value
let setTag this chaine1 =
	let _ = meth_call this "setTag" [|inject (string chaine1)|] in
		()

let getArrangerKind this () =
	let value = meth_call this "getArrangerKind" [||] in
		to_string value
let setArrangerKind this chaine1 =
	let _ = meth_call this "setArrangerKind" [|inject (string chaine1)|] in
		()

let getSrc this () =
	let value = meth_call this "getSrc" [||] in
		to_string value
let setSrc this chaine1 =
	let _ = meth_call this "setSrc" [|inject (string chaine1)|] in
		()

let getValue_int this () =
	let value = meth_call this "getValue_int" [||] in
		value
let setValue_int this entier1 =
	let _ = meth_call this "setValue_int" [|inject entier1|] in
		()

let getMin this () =
	let value = meth_call this "getMin" [||] in
		value
let setMin this entier1 =
	let _ = meth_call this "setMin" [|inject entier1|] in
		()

let getTapHighlight this () =
	let value = meth_call this "getTapHighlight" [||] in
		to_bool value
let setTapHighlight this predicat1 =
	let _ = meth_call this "setTapHighlight" [|inject (bool predicat1)|] in
		()

let getUrl this () =
	let value = meth_call this "getUrl" [||] in
		to_string value
let setUrl this chaine1 =
	let _ = meth_call this "setUrl" [|inject (string chaine1)|] in
		()

let getScrim this () =
	let value = meth_call this "getScrim" [||] in
		to_bool value
let setScrim this predicat1 =
	let _ = meth_call this "setScrim" [|inject (bool predicat1)|] in
		()

let getLayoutClass this () =
	let value = meth_call this "getLayoutClass" [||] in
		to_string value
let setLayoutClass this chaine1 =
	let _ = meth_call this "setLayoutClass" [|inject (string chaine1)|] in
		()

let getShowing_bool this () =
	let value = meth_call this "getShowing_bool" [||] in
		to_bool value
let setShowing_bool this predicat1 =
	let _ = meth_call this "setShowing_bool" [|inject (bool predicat1)|] in
		()

let getNoStretch this () =
	let value = meth_call this "getNoStretch" [||] in
		to_bool value
let setNoStretch this predicat1 =
	let _ = meth_call this "setNoStretch" [|inject (bool predicat1)|] in
		()

let getClasses this () =
	let value = meth_call this "getClasses" [||] in
		to_string value
let setClasses this chaine1 =
	let _ = meth_call this "setClasses" [|inject (string chaine1)|] in
		()

let getCentered this () =
	let value = meth_call this "getCentered" [||] in
		to_bool value
let setCentered this predicat1 =
	let _ = meth_call this "setCentered" [|inject (bool predicat1)|] in
		()

let getIsContainer this () =
	let value = meth_call this "getIsContainer" [||] in
		to_bool value
let setIsContainer this predicat1 =
	let _ = meth_call this "setIsContainer" [|inject (bool predicat1)|] in
		()

let getHorizontal this () =
	let value = meth_call this "getHorizontal" [||] in
		to_string value
let setHorizontal this chaine1 =
	let _ = meth_call this "setHorizontal" [|inject (string chaine1)|] in
		()

let getCanGenerate this () =
	let value = meth_call this "getCanGenerate" [||] in
		to_bool value
let setCanGenerate this predicat1 =
	let _ = meth_call this "setCanGenerate" [|inject (bool predicat1)|] in
		()

let getValue_string this () =
	let value = meth_call this "getValue_string" [||] in
		to_string value
let setValue_string this chaine1 =
	let _ = meth_call this "setValue_string" [|inject (string chaine1)|] in
		()

let getLayoutKind_string this () =
	let value = meth_call this "getLayoutKind_string" [||] in
		to_string value
let setLayoutKind_string this chaine1 =
	let _ = meth_call this "setLayoutKind_string" [|inject (string chaine1)|] in
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
