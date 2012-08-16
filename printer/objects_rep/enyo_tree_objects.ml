open Struct_types

let objects_tree : object_rep tree =
  Node (Any._any,
	[Node (Layout._layout,
	       [Node (Arranger._arranger,
		      [Node (CardArranger._cardArranger, [Node (CardSlideInArranger._cardSlideInArranger, [])]);
		       Node (CarouselArranger._carouselArranger, [Node (CollapsingArranger._collapsingArranger, [])]);
		       Node (LeftRightArranger._leftRightArranger, [Node (TopBottomArranger._topBottomArranger, [])])]);
		Node (BaseLayout._baseLayout, []); Node (FittableLayout._fittableLayout, [])]);
	 Node (Object._object,
	       [Node (Async._async, [Node (Ajax._ajax, []); Node (JsonpRequest._jsonpRequest, [])]);
		Node (Component._component,
		      [Node (AjaxComponent._ajaxComponent, [Node (WebService._webService, [])]);
		       Node (Animator._animator, []); Node (DragAvatar._dragAvatar, []);
		       Node (ScrollMath._scrollMath, []); Node (Selection._selection, []);
		       Node (Signals._signals, []);
		       Node (UiComponent._uiComponent,
			     [Node (CanvasControl._canvasControl,
				    [Node (CanvasImage._canvasImage, []);
				     Node (CanvasShape._canvasShape,
					   [Node (CanvasCircle._canvasCircle, []); Node (CanvasRectangle._canvasRectangle, []);
					    Node (CanvasText._canvasText, [])])]);
			      Node (Control._control,
				    [Node (Canvas._canvas, []); Node (FittableColumns._fittableColumns, []);
				     Node (FittableRows._fittableRows, []); Node (FlyweightRepeater._flyweightRepeater, []);
				     Node (Group._group, [Node (OnyxRadioGroup._onyxRadioGroup, [])]);
				     Node (GroupItem._groupItem,
					   [Node (ToolDecorator._toolDecorator,
						  [Node (Button._button,
							 [Node (OnyxButton._onyxButton, []); Node (OnyxMenuItem._onyxMenuItem, [])]);
						   Node (OnyxInputDecorator._onyxInputDecorator, [])])]);
				     Node (Image._image, []);
				     Node (Input._input,
					   [Node (Checkbox._checkbox, [Node (OnyxCheckbox._onyxCheckbox, [])]);
					    Node (RichText._richText, [Node (OnyxRichText._onyxRichText, [])]);
					    Node (TextArea._textArea, [Node (OnyxTextArea._onyxTextArea, [])])]);
				     Node (Node._node, []); Node (OnyxDrawer._onyxDrawer, []);
				     Node (OnyxGrabber._onyxGrabber, []); Node (OnyxGroupbox._onyxGroupbox, []);
				     Node (OnyxGroupboxHeader._onyxGroupboxHeader, []);
				     Node (OnyxIcon._onyxIcon, [Node (OnyxIconButton._onyxIconButton, [])]);
				     Node (OnyxItem._onyxItem, []); Node (OnyxMoreToolbar._onyxMoreToolbar, []);
				     Node (OnyxProgressBar._onyxProgressBar,
					   [Node (OnyxProgressButton._onyxProgressButton, []); Node (OnyxSlider._onyxSlider, [])]);
				     Node (OnyxScrim._onyxScrim, []); Node (OnyxSpinner._onyxSpinner, []);
				     Node (OnyxToggleButton._onyxToggleButton, []); Node (OnyxToolbar._onyxToolbar, []);
				     Node (OnyxTooltipDecorator._onyxTooltipDecorator,
					   [Node (OnyxMenuDecorator._onyxMenuDecorator,
						  [Node (OnyxPickerDecorator._onyxPickerDecorator, [])])]);
				     Node (Option._option, []); Node (OwnerProxy._ownerProxy, []);
				     Node (Panels._panels, []);
				     Node (Popup._popup,
					   [Node (OnyxPopup._onyxPopup,
						  [Node (OnyxMenu._onyxMenu,
							 [Node (OnyxPicker._onyxPicker, [Node (OnyxFlyweightPicker._onyxFlyweightPicker, [])])]);
						   Node (OnyxTooltip._onyxTooltip, [])])]);
				     Node (Repeater._repeater, []);
				     Node (Scroller._scroller, [Node (List_enyo._list_enyo, [Node (PulldownList._pulldownList, [])])]);
				     Node (ScrollStrategy._scrollStrategy,
					   [Node (TouchScrollStrategy._touchScrollStrategy,
						  [Node (TranslateScrollStrategy._translateScrollStrategy, [])])]);
				     Node (ScrollThumb._scrollThumb, []); Node (Select._select, []);
				     Node (Slideable._slideable, [])])])])])])
    
let events_list = [ Gesture_event._gesture ]
  
