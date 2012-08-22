// This program was compiled from OCaml by js_of_ocaml 1.0
function caml_raise_with_arg (tag, arg) { throw [0, tag, arg]; }
function caml_raise_with_string (tag, msg) {
  caml_raise_with_arg (tag, new MlWrappedString (msg));
}
function caml_invalid_argument (msg) {
  caml_raise_with_string(caml_global_data[4], msg);
}
function caml_array_bound_error () {
  caml_invalid_argument("index out of bounds");
}
function caml_str_repeat(n, s) {
  if (!n) { return ""; }
  if (n & 1) { return caml_str_repeat(n - 1, s) + s; }
  var r = caml_str_repeat(n >> 1, s);
  return r + r;
}
function MlString(param) {
  if (param != null) {
    this.bytes = this.fullBytes = param;
    this.last = this.len = param.length;
  }
}
MlString.prototype = {
  string:null,
  bytes:null,
  fullBytes:null,
  array:null,
  len:null,
  last:0,
  toJsString:function() {
    return this.string = decodeURIComponent (escape(this.getFullBytes()));
  },
  toBytes:function() {
    if (this.string != null)
      var b = unescape (encodeURIComponent (this.string));
    else {
      var b = "", a = this.array, l = a.length;
      for (var i = 0; i < l; i ++) b += String.fromCharCode (a[i]);
    }
    this.bytes = this.fullBytes = b;
    this.last = this.len = b.length;
    return b;
  },
  getBytes:function() {
    var b = this.bytes;
    if (b == null) b = this.toBytes();
    return b;
  },
  getFullBytes:function() {
    var b = this.fullBytes;
    if (b !== null) return b;
    b = this.bytes;
    if (b == null) b = this.toBytes ();
    if (this.last < this.len) {
      this.bytes = (b += caml_str_repeat(this.len - this.last, '\0'));
      this.last = this.len;
    }
    this.fullBytes = b;
    return b;
  },
  toArray:function() {
    var b = this.bytes;
    if (b == null) b = this.toBytes ();
    var a = [], l = this.last;
    for (var i = 0; i < l; i++) a[i] = b.charCodeAt(i);
    for (l = this.len; i < l; i++) a[i] = 0;
    this.string = this.bytes = this.fullBytes = null;
    this.last = this.len;
    this.array = a;
    return a;
  },
  getArray:function() {
    var a = this.array;
    if (!a) a = this.toArray();
    return a;
  },
  getLen:function() {
    var len = this.len;
    if (len !== null) return len;
    this.toBytes();
    return this.len;
  },
  toString:function() { var s = this.string; return s?s:this.toJsString(); },
  valueOf:function() { var s = this.string; return s?s:this.toJsString(); },
  blitToArray:function(i1, a2, i2, l) {
    var a1 = this.array;
    if (a1)
      for (var i = 0; i < l; i++) a2 [i2 + i] = a1 [i1 + i];
    else {
      var b = this.bytes;
      if (b == null) b = this.toBytes();
      var l1 = this.last - i1;
      if (l <= l1)
        for (var i = 0; i < l; i++) a2 [i2 + i] = b.charCodeAt(i1 + i);
      else {
        for (var i = 0; i < l1; i++) a2 [i2 + i] = b.charCodeAt(i1 + i);
        for (; i < l; i++) a2 [i2 + i] = 0;
      }
    }
  },
  get:function (i) {
    var a = this.array;
    if (a) return a[i];
    var b = this.bytes;
    if (b == null) b = this.toBytes();
    return (i<this.last)?b.charCodeAt(i):0;
  },
  safeGet:function (i) {
    if (!this.len) this.toBytes();
    if ((i < 0) || (i >= this.len)) caml_array_bound_error ();
    return this.get(i);
  },
  set:function (i, c) {
    var a = this.array;
    if (!a) {
      if (this.last == i) {
        this.bytes += String.fromCharCode (c & 0xff);
        this.last ++;
        return 0;
      }
      a = this.toArray();
    } else if (this.bytes != null) {
      this.bytes = this.fullBytes = this.string = null;
    }
    a[i] = c & 0xff;
    return 0;
  },
  safeSet:function (i, c) {
    if (this.len == null) this.toBytes ();
    if ((i < 0) || (i >= this.len)) caml_array_bound_error ();
    this.set(i, c);
  },
  fill:function (ofs, len, c) {
    if (ofs >= this.last && this.last && c == 0) return;
    var a = this.array;
    if (!a) a = this.toArray();
    else if (this.bytes != null) {
      this.bytes = this.fullBytes = this.string = null;
    }
    var l = ofs + len;
    for (var i = ofs; i < l; i++) a[i] = c;
  },
  compare:function (s2) {
    if (this.string != null && s2.string != null) {
      if (this.string < s2.string) return -1;
      if (this.string > s2.string) return 1;
      return 0;
    }
    var b1 = this.getFullBytes ();
    var b2 = s2.getFullBytes ();
    if (b1 < b2) return -1;
    if (b1 > b2) return 1;
    return 0;
  },
  equal:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string == s2.string;
    return this.getFullBytes () == s2.getFullBytes ();
  },
  lessThan:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string < s2.string;
    return this.getFullBytes () < s2.getFullBytes ();
  },
  lessEqual:function (s2) {
    if (this.string != null && s2.string != null)
      return this.string <= s2.string;
    return this.getFullBytes () <= s2.getFullBytes ();
  }
}
function MlWrappedString (s) { this.string = s; }
MlWrappedString.prototype = new MlString();
function MlMakeString (l) { this.bytes = ""; this.len = l; }
MlMakeString.prototype = new MlString ();
function caml_array_get (array, index) {
  if ((index < 0) || (index >= array.length - 1)) caml_array_bound_error();
  return array[index+1];
}
function caml_array_set (array, index, newval) {
  if ((index < 0) || (index >= array.length - 1)) caml_array_bound_error();
  array[index+1]=newval; return 0;
}
function caml_blit_string(s1, i1, s2, i2, len) {
  if (len === 0) return;
  if (i2 === s2.last && s2.bytes != null) {
    var b = s1.bytes;
    if (b == null) b = s1.toBytes ();
    if (i1 > 0 || s1.last > len) b = b.slice(i1, i1 + len);
    s2.bytes += b;
    s2.last += b.length;
    return;
  }
  var a = s2.array;
  if (!a) a = s2.toArray(); else { s2.bytes = s2.string = null; }
  s1.blitToArray (i1, a, i2, len);
}
function caml_call_gen(f, args) {
  if(f.fun)
    return caml_call_gen(f.fun, args);
  var n = f.length;
  var d = n - args.length;
  if (d == 0)
    return f.apply(null, args);
  else if (d < 0)
    return caml_call_gen(f.apply(null, args.slice(0,n)), args.slice(n));
  else
    return function (x){ return caml_call_gen(f, args.concat([x])); };
}
function caml_int64_compare(x,y) {
  var x3 = x[3] << 16;
  var y3 = y[3] << 16;
  if (x3 > y3) return 1;
  if (x3 < y3) return -1;
  if (x[2] > y[2]) return 1;
  if (x[2] < y[2]) return -1;
  if (x[1] > y[1]) return 1;
  if (x[1] < y[1]) return -1;
  return 0;
}
function caml_int_compare (a, b) {
  if (a < b) return (-1); if (a == b) return 0; return 1;
}
function caml_compare_val (a, b, total) {
  var stack = [];
  for(;;) {
    if (!(total && a === b)) {
      if (a instanceof MlString) {
        if (b instanceof MlString) {
            if (a != b) {
		var x = a.compare(b);
		if (x != 0) return x;
	    }
        } else
          return 1;
      } else if (a instanceof Array && a[0] === (a[0]|0)) {
        var ta = a[0];
        if (ta === 250) {
          a = a[1];
          continue;
        } else if (b instanceof Array && b[0] === (b[0]|0)) {
          var tb = b[0];
          if (tb === 250) {
            b = b[1];
            continue;
          } else if (ta != tb) {
            return (ta < tb)?-1:1;
          } else {
            switch (ta) {
            case 248: {
		var x = caml_int_compare(a[2], b[2]);
		if (x != 0) return x;
		break;
	    }
            case 255: {
		var x = caml_int64_compare(a, b);
		if (x != 0) return x;
		break;
	    }
            default:
              if (a.length != b.length) return (a.length < b.length)?-1:1;
              if (a.length > 1) stack.push(a, b, 1);
            }
          }
        } else
          return 1;
      } else if (b instanceof MlString ||
                 (b instanceof Array && b[0] === (b[0]|0))) {
        return -1;
      } else {
        if (a < b) return -1;
        if (a > b) return 1;
        if (total && a != b) {
          if (a == a) return 1;
          if (b == b) return -1;
        }
      }
    }
    if (stack.length == 0) return 0;
    var i = stack.pop();
    b = stack.pop();
    a = stack.pop();
    if (i + 1 < a.length) stack.push(a, b, i + 1);
    a = a[i];
    b = b[i];
  }
}
function caml_compare (a, b) { return caml_compare_val (a, b, true); }
function caml_create_string(len) {
  if (len < 0) caml_invalid_argument("String.create");
  return new MlMakeString(len);
}
function caml_equal (x, y) { return +(caml_compare_val(x,y,false) == 0); }
function caml_js_from_array(a) { return a.slice(1); }
function caml_js_to_array(a) { return [0].concat(a); }
function caml_js_var(x) { return eval(x.toString()); }
function caml_js_wrap_callback(f) {
  var toArray = Array.prototype.slice;
  return function () {
    var args = (arguments.length > 0)?toArray.call (arguments):[undefined];
    return caml_call_gen(f, args);
  }
}
function caml_js_wrap_meth_callback(f) {
  var toArray = Array.prototype.slice;
  return function () {
    var args = (arguments.length > 0)?toArray.call (arguments):[0];
    args.unshift (this);
    return caml_call_gen(f, args);
  }
}
function caml_make_vect (len, init) {
  var b = [0]; for (var i = 1; i <= len; i++) b[i] = init; return b;
}
function caml_ml_out_channels_list () { return 0; }
var caml_global_data = [0];
function caml_register_global (n, v) { caml_global_data[n + 1] = v; }
var caml_named_values = {};
function caml_register_named_value(nm,v) {
  caml_named_values[nm] = v; return 0;
}
function caml_string_equal(s1, s2) {
  var b1 = s1.fullBytes;
  var b2 = s2.fullBytes;
  if (b1 != null && b2 != null) return (b1 == b2)?1:0;
  return (s1.getFullBytes () == s2.getFullBytes ())?1:0;
}
function caml_string_notequal(s1, s2) { return 1-caml_string_equal(s1, s2); }
(function()
   {function _gh_
     (_h8_,
      _h9_,
      _h__,
      _h$_,
      _ia_,
      _ib_,
      _ic_,
      _id_,
      _ie_,
      _if_,
      _ig_,
      _ih_,
      _ii_,
      _ij_,
      _ik_,
      _il_,
      _im_,
      _in_,
      _io_,
      _ip_)
     {return _h8_.length==19
              ?_h8_
                (_h9_,
                 _h__,
                 _h$_,
                 _ia_,
                 _ib_,
                 _ic_,
                 _id_,
                 _ie_,
                 _if_,
                 _ig_,
                 _ih_,
                 _ii_,
                 _ij_,
                 _ik_,
                 _il_,
                 _im_,
                 _in_,
                 _io_,
                 _ip_)
              :caml_call_gen
                (_h8_,
                 [_h9_,
                  _h__,
                  _h$_,
                  _ia_,
                  _ib_,
                  _ic_,
                  _id_,
                  _ie_,
                  _if_,
                  _ig_,
                  _ih_,
                  _ii_,
                  _ij_,
                  _ik_,
                  _il_,
                  _im_,
                  _in_,
                  _io_,
                  _ip_]);}
    function _fw_(_hY_,_hZ_,_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_)
     {return _hY_.length==9
              ?_hY_(_hZ_,_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_)
              :caml_call_gen
                (_hY_,[_hZ_,_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_]);}
    function _dA_(_hV_,_hW_,_hX_)
     {return _hV_.length==2?_hV_(_hW_,_hX_):caml_call_gen(_hV_,[_hW_,_hX_]);}
    function _c8_(_hT_,_hU_)
     {return _hT_.length==1?_hT_(_hU_):caml_call_gen(_hT_,[_hU_]);}
    var
     _a_=[0,new MlString("Failure")],
     _b_=[0,new MlString("Invalid_argument")],
     _c_=[0,new MlString("Not_found")],
     _d_=[0,new MlString("Assert_failure")],
     taille_e_=[0,6,7];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_b_);
    caml_register_global(2,_a_);
    var
     _cH_=new MlString("Pervasives.do_at_exit"),
     _cG_=new MlString("List.combine"),
     _cF_=new MlString("nth"),
     _cE_=new MlString("List.nth"),
     _cD_=new MlString("String.sub"),
     _cC_=[0,[0,new MlString("kind"),[1,new MlString("Control")]],0],
     _cB_=new MlString("tag"),
     _cA_=new MlString("classes"),
     _cz_=new MlString("style"),
     _cy_=new MlString("content"),
     _cx_=new MlString("showing"),
     _cw_=new MlString("allowHtml"),
     _cv_=new MlString("src"),
     _cu_=new MlString("canGenerate"),
     _ct_=new MlString("fit"),
     _cs_=new MlString("isContainer"),
     _cr_=new MlString("container"),
     _cq_=new MlString("parent"),
     _cp_=new MlString("controlParentName"),
     _co_=new MlString("layoutKind"),
     _cn_=new MlString("name"),
     _cm_=new MlString("id"),
     _cl_=new MlString("owner"),
     _ck_=new MlString("ontap"),
     _cj_=new MlString("CONTROL"),
     _ci_=[0,[0,new MlString("kind"),[1,new MlString("Button")]],0],
     _ch_=new MlString("disabled"),
     _cg_=new MlString("active"),
     _cf_=new MlString("tag"),
     _ce_=new MlString("classes"),
     _cd_=new MlString("style"),
     _cc_=new MlString("content"),
     _cb_=new MlString("showing"),
     _ca_=new MlString("allowHtml"),
     _b$_=new MlString("src"),
     _b__=new MlString("canGenerate"),
     _b9_=new MlString("fit"),
     _b8_=new MlString("isContainer"),
     _b7_=new MlString("container"),
     _b6_=new MlString("parent"),
     _b5_=new MlString("controlParentName"),
     _b4_=new MlString("layoutKind"),
     _b3_=new MlString("name"),
     _b2_=new MlString("id"),
     _b1_=new MlString("owner"),
     _b0_=new MlString("ontap"),
     _bZ_=new MlString("BUTTON"),
     _bY_=[0,[0,new MlString("kind"),[1,new MlString("Image")]],0],
     _bX_=new MlString("noEvents"),
     _bW_=new MlString("tag"),
     _bV_=new MlString("classes"),
     _bU_=new MlString("style"),
     _bT_=new MlString("content"),
     _bS_=new MlString("showing"),
     _bR_=new MlString("allowHtml"),
     _bQ_=new MlString("src"),
     _bP_=new MlString("canGenerate"),
     _bO_=new MlString("fit"),
     _bN_=new MlString("isContainer"),
     _bM_=new MlString("container"),
     _bL_=new MlString("parent"),
     _bK_=new MlString("controlParentName"),
     _bJ_=new MlString("layoutKind"),
     _bI_=new MlString("name"),
     _bH_=new MlString("id"),
     _bG_=new MlString("owner"),
     _bF_=new MlString("ontap"),
     _bE_=new MlString("IMAGE"),
     _bD_=[0,[0,new MlString("kind"),[1,new MlString("onyx.Toolbar")]],0],
     _bC_=new MlString("tag"),
     _bB_=new MlString("classes"),
     _bA_=new MlString("style"),
     _bz_=new MlString("content"),
     _by_=new MlString("showing"),
     _bx_=new MlString("allowHtml"),
     _bw_=new MlString("src"),
     _bv_=new MlString("canGenerate"),
     _bu_=new MlString("fit"),
     _bt_=new MlString("isContainer"),
     _bs_=new MlString("container"),
     _br_=new MlString("parent"),
     _bq_=new MlString("controlParentName"),
     _bp_=new MlString("layoutKind"),
     _bo_=new MlString("name"),
     _bn_=new MlString("id"),
     _bm_=new MlString("owner"),
     _bl_=new MlString("ontap"),
     _bk_=new MlString("ONYX.TOOLBAR"),
     _bj_=new MlString(".AJAXCOMPONENT"),
     _bi_=new MlString(".UNUSED"),
     _bh_=new MlString("AJAX"),
     _bg_=new MlString("ANIMATOR"),
     _bf_=new MlString("ARRANGER"),
     _be_=new MlString("ASYNC"),
     _bd_=new MlString("BASELAYOUT"),
     _bc_=new MlString("BUTTON"),
     _bb_=new MlString("CANVAS"),
     _ba_=new MlString("CANVAS.CIRCLE"),
     _a$_=new MlString("CANVAS.CONTROL"),
     _a__=new MlString("CANVAS.IMAGE"),
     _a9_=new MlString("CANVAS.RECTANGLE"),
     _a8_=new MlString("CANVAS.SHAPE"),
     _a7_=new MlString("CANVAS.TEXT"),
     _a6_=new MlString("CARDARRANGER"),
     _a5_=new MlString("CARDSLIDEINARRANGER"),
     _a4_=new MlString("CAROUSELARRANGER"),
     _a3_=new MlString("CHECKBOX"),
     _a2_=new MlString("COLLAPSINGARRANGER"),
     _a1_=new MlString("COMPONENT"),
     _a0_=new MlString("CONTROL"),
     _aZ_=new MlString("DRAGAVATAR"),
     _aY_=new MlString("FITTABLECOLUMNS"),
     _aX_=new MlString("FITTABLELAYOUT"),
     _aW_=new MlString("FITTABLEROWS"),
     _aV_=new MlString("FLYWEIGHTREPEATER"),
     _aU_=new MlString("GROUP"),
     _aT_=new MlString("GROUPITEM"),
     _aS_=new MlString("IMAGE"),
     _aR_=new MlString("INPUT"),
     _aQ_=new MlString("JSONPREQUEST"),
     _aP_=new MlString("LAYOUT"),
     _aO_=new MlString("LEFTRIGHTARRANGER"),
     _aN_=new MlString("LIST"),
     _aM_=new MlString("NODE"),
     _aL_=new MlString("OBJECT"),
     _aK_=new MlString("ONYX.BUTTON"),
     _aJ_=new MlString("ONYX.CHECKBOX"),
     _aI_=new MlString("ONYX.DRAWER"),
     _aH_=new MlString("ONYX.FLYWEIGHTPICKER"),
     _aG_=new MlString("ONYX.GRABBER"),
     _aF_=new MlString("ONYX.GROUPBOX"),
     _aE_=new MlString("ONYX.GROUPBOXHEADER"),
     _aD_=new MlString("ONYX.ICON"),
     _aC_=new MlString("ONYX.ICONBUTTON"),
     _aB_=new MlString("ONYX.INPUTDECORATOR"),
     _aA_=new MlString("ONYX.ITEM"),
     _az_=new MlString("ONYX.MENU"),
     _ay_=new MlString("ONYX.MENUDECORATOR"),
     _ax_=new MlString("ONYX.MENUITEM"),
     _aw_=new MlString("ONYX.MORETOOLBAR"),
     _av_=new MlString("ONYX.PICKER"),
     _au_=new MlString("ONYX.PICKERDECORATOR"),
     _at_=new MlString("ONYX.POPUP"),
     _as_=new MlString("ONYX.PROGRESSBAR"),
     _ar_=new MlString("ONYX.PROGRESSBUTTON"),
     _aq_=new MlString("ONYX.RADIOGROUP"),
     _ap_=new MlString("ONYX.RICHTEXT"),
     _ao_=new MlString("ONYX.SCRIM"),
     _an_=new MlString("ONYX.SLIDER"),
     _am_=new MlString("ONYX.SPINNER"),
     _al_=new MlString("ONYX.TEXTAREA"),
     _ak_=new MlString("ONYX.TOGGLEBUTTON"),
     _aj_=new MlString("ONYX.TOOLBAR"),
     _ai_=new MlString("ONYX.TOOLTIP"),
     _ah_=new MlString("ONYX.TOOLTIPDECORATOR"),
     _ag_=new MlString("OPTION"),
     _af_=new MlString("OWNERPROXY"),
     _ae_=new MlString("PANELS"),
     _ad_=new MlString("POPUP"),
     _ac_=new MlString("PULLDOWNLIST"),
     _ab_=new MlString("REPEATER"),
     _aa_=new MlString("RICHTEXT"),
     _$_=new MlString("SCROLLER"),
     ___=new MlString("SCROLLMATH"),
     _Z_=new MlString("SCROLLSTRATEGY"),
     _Y_=new MlString("SCROLLTHUMB"),
     _X_=new MlString("SELECT"),
     _W_=new MlString("SELECTION"),
     _V_=new MlString("SIGNALS"),
     _U_=new MlString("SLIDEABLE"),
     _T_=new MlString("TEXTAREA"),
     _S_=new MlString("TOOLDECORATOR"),
     _R_=new MlString("TOPBOTTOMARRANGER"),
     _Q_=new MlString("TOUCHSCROLLSTRATEGY"),
     _P_=new MlString("TRANSLATESCROLLSTRATEGY"),
     _O_=new MlString("UICOMPONENT"),
     _N_=new MlString("WEBSERVICE"),
     _M_=[0,new MlString("lib_enyo.ml"),2160,31],
     _L_=new MlString("name"),
     _K_=[0,new MlString("lib_enyo.ml"),2064,12],
     _J_=new MlString("_default_app_name"),
     _I_=new MlString("_default_app_name"),
     _H_=new MlString("Lib_enyo.Enyo.Bad_kind"),
     _G_=new MlString("color:green"),
     _F_=new MlString("Au joueur 1 de jouer..."),
     _E_=new MlString("color:pink"),
     _D_=new MlString("Au joueur 2 de jouer..."),
     _C_=new MlString("color:blue"),
     _B_=new MlString("Match nul"),
     _A_=new MlString("color:yellow"),
     _z_=new MlString(" gagne la partie !"),
     _y_=new MlString("1"),
     _x_=new MlString("2"),
     _w_=new MlString("Le joueur "),
     _v_=new MlString("color:red"),
     _u_=new MlString("Coup non-valide"),
     _t_=new MlString("color:red"),
     _s_=new MlString("Partie termin\xc3\xa9e"),
     _r_=[0,new MlString("margin:10px -20px -15px 20px")],
     _q_=new MlString("Puissance4_onyo.Quatre"),
     _p_=new MlString("Puissance4_onyo.Valeur_nulle"),
     src_token_vide_o_=new MlString("img/vide.png"),
     src_token_j1_n_=new MlString("img/token1.png"),
     src_token_j2_m_=new MlString("img/token2.png"),
     _l_=[0,new MlString("br")],
     _k_=[0,new MlString("P-P-Puissance 4 !")],
     _j_=[0,new MlString("color:red")],
     _i_=[0,new MlString("p")],
     _h_=[0,new MlString("App")];
    function _g_(s_f_){throw [0,_b_,s_f_];}
    function _cV_(s1_cI_,s2_cK_)
     {var
       l1_cJ_=s1_cI_.getLen(),
       l2_cL_=s2_cK_.getLen(),
       s_cM_=caml_create_string(l1_cJ_+l2_cL_|0);
      caml_blit_string(s1_cI_,0,s_cM_,0,l1_cJ_);
      caml_blit_string(s2_cK_,0,s_cM_,l1_cJ_,l2_cL_);
      return s_cM_;}
    function _cO_(l1_cN_,l2_cP_)
     {if(l1_cN_)
       {var hd_cQ_=l1_cN_[1];return [0,hd_cQ_,_cO_(l1_cN_[2],l2_cP_)];}
      return l2_cP_;}
    function do_at_exit_cW_(param_cU_)
     {var param_cR_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_cR_)
         {var l_cS_=param_cR_[2];
          try {}catch(_cT_){}
          var param_cR_=l_cS_;
          continue;}
        return 0;}}
    caml_register_named_value(_cH_,do_at_exit_cW_);
    function _dC_(sx_cX_,sy_c3_,init_c2_)
     {var res_cY_=caml_make_vect(sx_cX_,[0]),_cZ_=0,_c0_=sx_cX_-1|0;
      if(!(_c0_<_cZ_))
       {var x_c1_=_cZ_;
        for(;;)
         {res_cY_[x_c1_+1]=caml_make_vect(sy_c3_,init_c2_);
          var _c4_=x_c1_+1|0;
          if(_c0_!==x_c1_){var x_c1_=_c4_;continue;}
          break;}}
      return res_cY_;}
    function _dD_(f_c7_,a_c5_)
     {var l_c6_=a_c5_.length-1;
      if(0===l_c6_)return [0];
      var
       r_c9_=caml_make_vect(l_c6_,_c8_(f_c7_,a_c5_[0+1])),
       _c__=1,
       _c$_=l_c6_-1|0;
      if(!(_c$_<_c__))
       {var i_da_=_c__;
        for(;;)
         {r_c9_[i_da_+1]=_c8_(f_c7_,a_c5_[i_da_+1]);
          var _db_=i_da_+1|0;
          if(_c$_!==i_da_){var i_da_=_db_;continue;}
          break;}}
      return r_c9_;}
    function _dE_(a_dc_)
     {var i_dd_=a_dc_.length-1-1|0,res_de_=0;
      for(;;)
       {if(0<=i_dd_)
         {var
           _dg_=[0,a_dc_[i_dd_+1],res_de_],
           _df_=i_dd_-1|0,
           i_dd_=_df_,
           res_de_=_dg_;
          continue;}
        return res_de_;}}
    function _dF_(l_dh_)
     {if(l_dh_)
       {var accu_di_=0,param_dj_=l_dh_,tl_dp_=l_dh_[2],hd_dm_=l_dh_[1];
        for(;;)
         {if(param_dj_)
           {var
             t_dl_=param_dj_[2],
             _dk_=accu_di_+1|0,
             accu_di_=_dk_,
             param_dj_=t_dl_;
            continue;}
          var a_dn_=caml_make_vect(accu_di_,hd_dm_),i_do_=1,param_dq_=tl_dp_;
          for(;;)
           {if(param_dq_)
             {var tl_dr_=param_dq_[2];
              a_dn_[i_do_+1]=param_dq_[1];
              var _ds_=i_do_+1|0,i_do_=_ds_,param_dq_=tl_dr_;
              continue;}
            return a_dn_;}}}
      return [0];}
    function _dG_(f_dz_,x_dt_,a_dw_)
     {var r_du_=[0,x_dt_],_dv_=0,_dx_=a_dw_.length-1-1|0;
      if(!(_dx_<_dv_))
       {var i_dy_=_dv_;
        for(;;)
         {r_du_[1]=_dA_(f_dz_,r_du_[1],a_dw_[i_dy_+1]);
          var _dB_=i_dy_+1|0;
          if(_dx_!==i_dy_){var i_dy_=_dB_;continue;}
          break;}}
      return r_du_[1];}
    function _dK_(f_dI_,param_dH_)
     {if(param_dH_)
       {var l_dJ_=param_dH_[2],r_dL_=_c8_(f_dI_,param_dH_[1]);
        return [0,r_dL_,_dK_(f_dI_,l_dJ_)];}
      return 0;}
    function _dV_(f_dO_,param_dM_)
     {var param_dN_=param_dM_;
      for(;;)
       {if(param_dN_)
         {var l_dP_=param_dN_[2];
          _c8_(f_dO_,param_dN_[1]);
          var param_dN_=l_dP_;
          continue;}
        return 0;}}
    function _dS_(l1_dQ_,l2_dR_)
     {if(l1_dQ_)
       {if(l2_dR_)
         {var a2_dU_=l2_dR_[1],a1_dT_=l1_dQ_[1];
          return [0,[0,a1_dT_,a2_dU_],_dS_(l1_dQ_[2],l2_dR_[2])];}}
      else
       if(!l2_dR_)return 0;
      return _g_(_cG_);}
    var
     _dW_=[0,0],
     undefined_d0_=undefined,
     _false_dZ_=false,
     array_constructor_dY_=Array;
    function _d1_(e_dX_)
     {return e_dX_ instanceof array_constructor_dY_
              ?0
              :[0,new MlWrappedString(e_dX_.toString())];}
    _dW_[1]=[0,_d1_,_dW_[1]];
    var window_d2_=window;
    window.HTMLElement===undefined_d0_;
    var Bad_kind_d3_=[0,_H_];
    function coerce_prop_d5_(param_d4_)
     {switch(param_d4_[0])
       {case 1:return param_d4_[1].toString();
        case 2:return param_d4_[1];
        case 3:return param_d4_[1];
        case 4:return param_d4_[1];
        case 5:return !!param_d4_[1];
        case 6:
         return caml_js_from_array(_dF_(_dK_(coerce_prop_d5_,param_d4_[1])));
        case 7:return param_d4_[1];
        default:return param_d4_[1];}}
    function as_a_eV_(id_type_d9_,obj_js_d6_)
     {var s_d7_=new MlWrappedString(obj_js_d6_._onyo_id);
      if(caml_string_notequal(s_d7_,_bj_))
       if(caml_string_notequal(s_d7_,_bi_))
        if(caml_string_notequal(s_d7_,_bh_))
         if(caml_string_notequal(s_d7_,_bg_))
          if(caml_string_notequal(s_d7_,_bf_))
           if(caml_string_notequal(s_d7_,_be_))
            if(caml_string_notequal(s_d7_,_bd_))
             if(caml_string_notequal(s_d7_,_bc_))
              if(caml_string_notequal(s_d7_,_bb_))
               if(caml_string_notequal(s_d7_,_ba_))
                if(caml_string_notequal(s_d7_,_a$_))
                 if(caml_string_notequal(s_d7_,_a__))
                  if(caml_string_notequal(s_d7_,_a9_))
                   if(caml_string_notequal(s_d7_,_a8_))
                    if(caml_string_notequal(s_d7_,_a7_))
                     if(caml_string_notequal(s_d7_,_a6_))
                      if(caml_string_notequal(s_d7_,_a5_))
                       if(caml_string_notequal(s_d7_,_a4_))
                        if(caml_string_notequal(s_d7_,_a3_))
                         if(caml_string_notequal(s_d7_,_a2_))
                          if(caml_string_notequal(s_d7_,_a1_))
                           if(caml_string_notequal(s_d7_,_a0_))
                            if(caml_string_notequal(s_d7_,_aZ_))
                             if(caml_string_notequal(s_d7_,_aY_))
                              if(caml_string_notequal(s_d7_,_aX_))
                               if(caml_string_notequal(s_d7_,_aW_))
                                if(caml_string_notequal(s_d7_,_aV_))
                                 if(caml_string_notequal(s_d7_,_aU_))
                                  if(caml_string_notequal(s_d7_,_aT_))
                                   if(caml_string_notequal(s_d7_,_aS_))
                                    if(caml_string_notequal(s_d7_,_aR_))
                                     if(caml_string_notequal(s_d7_,_aQ_))
                                      if(caml_string_notequal(s_d7_,_aP_))
                                       if(caml_string_notequal(s_d7_,_aO_))
                                        if(caml_string_notequal(s_d7_,_aN_))
                                         if(caml_string_notequal(s_d7_,_aM_))
                                          if(caml_string_notequal(s_d7_,_aL_))
                                           if(caml_string_notequal(s_d7_,_aK_))
                                            if(caml_string_notequal(s_d7_,_aJ_))
                                             if(caml_string_notequal(s_d7_,_aI_))
                                              if(caml_string_notequal(s_d7_,_aH_))
                                               if(caml_string_notequal(s_d7_,_aG_))
                                                if(caml_string_notequal(s_d7_,_aF_))
                                                 if(caml_string_notequal(s_d7_,_aE_))
                                                  if(caml_string_notequal(s_d7_,_aD_))
                                                   if(caml_string_notequal(s_d7_,_aC_))
                                                    if(caml_string_notequal(s_d7_,_aB_))
                                                     if(caml_string_notequal(s_d7_,_aA_))
                                                      if(caml_string_notequal(s_d7_,_az_))
                                                       if(caml_string_notequal(s_d7_,_ay_))
                                                        if(caml_string_notequal(s_d7_,_ax_))
                                                         if(caml_string_notequal(s_d7_,_aw_))
                                                          if(caml_string_notequal(s_d7_,_av_))
                                                           if(caml_string_notequal(s_d7_,_au_))
                                                            if(caml_string_notequal(s_d7_,_at_))
                                                             if(caml_string_notequal(s_d7_,_as_))
                                                              if(caml_string_notequal(s_d7_,_ar_))
                                                               if(caml_string_notequal(s_d7_,_aq_))
                                                                if(caml_string_notequal(s_d7_,_ap_))
                                                                 if(caml_string_notequal(s_d7_,_ao_))
                                                                  if(caml_string_notequal(s_d7_,_an_))
                                                                   if(caml_string_notequal(s_d7_,_am_))
                                                                    if(caml_string_notequal(s_d7_,_al_))
                                                                     if(caml_string_notequal(s_d7_,_ak_))
                                                                      if(caml_string_notequal(s_d7_,_aj_))
                                                                       if(caml_string_notequal(s_d7_,_ai_))
                                                                        if(caml_string_notequal(s_d7_,_ah_))
                                                                         if(caml_string_notequal(s_d7_,_ag_))
                                                                          if(caml_string_notequal(s_d7_,_af_))
                                                                           if(caml_string_notequal(s_d7_,_ae_))
                                                                            if(caml_string_notequal(s_d7_,_ad_))
                                                                             if(caml_string_notequal(s_d7_,_ac_))
                                                                              if(caml_string_notequal(s_d7_,_ab_))
                                                                               if(caml_string_notequal(s_d7_,_aa_))
                                                                                if(caml_string_notequal(s_d7_,_$_))
                                                                                 if(caml_string_notequal(s_d7_,___))
                                                                                  if(caml_string_notequal(s_d7_,_Z_))
                                                                                   if(caml_string_notequal(s_d7_,_Y_))
                                                                                    if(caml_string_notequal(s_d7_,_X_))
                                                                                     if(caml_string_notequal(s_d7_,_W_))
                                                                                      if(caml_string_notequal(s_d7_,_V_))
                                                                                       if(caml_string_notequal(s_d7_,_U_))
                                                                                        if(caml_string_notequal(s_d7_,_T_))
                                                                                         if(caml_string_notequal(s_d7_,_S_))
                                                                                          if(caml_string_notequal(s_d7_,_R_))
                                                                                           if(caml_string_notequal(s_d7_,_Q_))
                                                                                            if(caml_string_notequal(s_d7_,_P_))
                                                                                             if(caml_string_notequal(s_d7_,_O_))
                                                                                              {if(caml_string_notequal(s_d7_,_N_))throw [0,_d_,_M_];
                                                                                               var _d8_=-178100703;}
                                                                                             else
                                                                                              var _d8_=700591049;
                                                                                            else
                                                                                             var _d8_=622517550;
                                                                                           else
                                                                                            var _d8_=-533501601;
                                                                                          else
                                                                                           var _d8_=482052838;
                                                                                         else
                                                                                          var _d8_=-720019389;
                                                                                        else
                                                                                         var _d8_=840712890;
                                                                                       else
                                                                                        var _d8_=-789475541;
                                                                                      else
                                                                                       var _d8_=-1061797653;
                                                                                     else
                                                                                      var _d8_=158558252;
                                                                                    else
                                                                                     var _d8_=481675004;
                                                                                   else
                                                                                    var _d8_=478054089;
                                                                                  else
                                                                                   var _d8_=129868160;
                                                                                 else
                                                                                  var _d8_=222697557;
                                                                                else
                                                                                 var _d8_=-438657606;
                                                                               else
                                                                                var _d8_=608497865;
                                                                              else
                                                                               var _d8_=-371503992;
                                                                             else
                                                                              var _d8_=-155574651;
                                                                            else
                                                                             var _d8_=-998030836;
                                                                           else
                                                                            var _d8_=492557551;
                                                                          else
                                                                           var _d8_=963588443;
                                                                         else
                                                                          var _d8_=-570589323;
                                                                        else
                                                                         var _d8_=128080185;
                                                                       else
                                                                        var _d8_=248520994;
                                                                      else
                                                                       var _d8_=247624090;
                                                                     else
                                                                      var _d8_=488405991;
                                                                    else
                                                                     var _d8_=-279389797;
                                                                   else
                                                                    var _d8_=-662935560;
                                                                  else
                                                                   var _d8_=-342434110;
                                                                 else
                                                                  var _d8_=1025813669;
                                                                else
                                                                 var _d8_=-511604822;
                                                               else
                                                                var _d8_=-654804603;
                                                              else
                                                               var _d8_=769821440;
                                                             else
                                                              var _d8_=665336805;
                                                            else
                                                             var _d8_=182322315;
                                                           else
                                                            var _d8_=769989772;
                                                          else
                                                           var _d8_=-94432209;
                                                         else
                                                          var _d8_=-350313947;
                                                        else
                                                         var _d8_=-132649709;
                                                       else
                                                        var _d8_=-456700261;
                                                      else
                                                       var _d8_=275210240;
                                                     else
                                                      var _d8_=231595892;
                                                    else
                                                     var _d8_=-243836142;
                                                   else
                                                    var _d8_=-543035572;
                                                  else
                                                   var _d8_=230752730;
                                                 else
                                                  var _d8_=-154369958;
                                                else
                                                 var _d8_=678331149;
                                               else
                                                var _d8_=252002594;
                                              else
                                               var _d8_=358790936;
                                             else
                                              var _d8_=-613898734;
                                            else
                                             var _d8_=-1011353308;
                                           else
                                            var _d8_=-713917805;
                                          else
                                           var _d8_=-943576385;
                                         else
                                          var _d8_=868930050;
                                        else
                                         var _d8_=846455902;
                                       else
                                        var _d8_=283371291;
                                      else
                                       var _d8_=188439210;
                                     else
                                      var _d8_=169332487;
                                    else
                                     var _d8_=1007418346;
                                   else
                                    var _d8_=995579707;
                                  else
                                   var _d8_=-450825294;
                                 else
                                  var _d8_=400747295;
                                else
                                 var _d8_=-444281453;
                               else
                                var _d8_=469180470;
                              else
                               var _d8_=-340295929;
                             else
                              var _d8_=-11457088;
                            else
                             var _d8_=-532836595;
                           else
                            var _d8_=425017149;
                          else
                           var _d8_=179069085;
                         else
                          var _d8_=980626864;
                        else
                         var _d8_=108749379;
                       else
                        var _d8_=697727334;
                      else
                       var _d8_=-453591764;
                     else
                      var _d8_=-816822890;
                    else
                     var _d8_=855417012;
                   else
                    var _d8_=-661416678;
                  else
                   var _d8_=522665640;
                 else
                  var _d8_=434098516;
                else
                 var _d8_=109261206;
               else
                var _d8_=-512591401;
              else
               var _d8_=-356187944;
             else
              var _d8_=207818226;
            else
             var _d8_=-295834245;
           else
            var _d8_=606877468;
          else
           var _d8_=-1044181050;
         else
          var _d8_=-495449241;
        else
         var _d8_=724516384;
       else
        var _d8_=209475253;
      else
       var _d8_=-767144258;
      if(caml_equal(_d8_,id_type_d9_))return obj_js_d6_;
      throw [0,Bad_kind_d3_];}
    function _eW_
     (_opt__d__,
      noEvents_ec_,
      tag_ed_,
      classes_ee_,
      style_ef_,
      content_eg_,
      showing_eh_,
      allowHtml_ei_,
      src_ej_,
      canGenerate_ek_,
      fit_el_,
      isContainer_em_,
      container_en_,
      parent_eo_,
      controlParentName_ep_,
      layoutKind_eq_,
      name_er_,
      id_es_,
      owner_et_,
      ontap_eu_,
      param_ev_)
     {var
       components_d$_=_opt__d__?_opt__d__[1]:0,
       prop_list_ea_=[0,_bY_],
       handler_list_eb_=[0,0];
      if(noEvents_ec_)
       prop_list_ea_[1]=[0,[0,_bX_,[5,noEvents_ec_[1]]],prop_list_ea_[1]];
      if(tag_ed_)
       prop_list_ea_[1]=[0,[0,_bW_,[1,tag_ed_[1]]],prop_list_ea_[1]];
      if(classes_ee_)
       prop_list_ea_[1]=[0,[0,_bV_,[1,classes_ee_[1]]],prop_list_ea_[1]];
      if(style_ef_)
       prop_list_ea_[1]=[0,[0,_bU_,[1,style_ef_[1]]],prop_list_ea_[1]];
      if(content_eg_)
       prop_list_ea_[1]=[0,[0,_bT_,[1,content_eg_[1]]],prop_list_ea_[1]];
      if(showing_eh_)
       prop_list_ea_[1]=[0,[0,_bS_,[5,showing_eh_[1]]],prop_list_ea_[1]];
      if(allowHtml_ei_)
       prop_list_ea_[1]=[0,[0,_bR_,[5,allowHtml_ei_[1]]],prop_list_ea_[1]];
      if(src_ej_)
       prop_list_ea_[1]=[0,[0,_bQ_,[1,src_ej_[1]]],prop_list_ea_[1]];
      if(canGenerate_ek_)
       prop_list_ea_[1]=[0,[0,_bP_,[5,canGenerate_ek_[1]]],prop_list_ea_[1]];
      if(fit_el_)
       prop_list_ea_[1]=[0,[0,_bO_,[5,fit_el_[1]]],prop_list_ea_[1]];
      if(isContainer_em_)
       prop_list_ea_[1]=[0,[0,_bN_,[5,isContainer_em_[1]]],prop_list_ea_[1]];
      if(container_en_)
       prop_list_ea_[1]=[0,[0,_bM_,[7,container_en_[1]]],prop_list_ea_[1]];
      if(parent_eo_)
       prop_list_ea_[1]=[0,[0,_bL_,[7,parent_eo_[1]]],prop_list_ea_[1]];
      if(controlParentName_ep_)
       prop_list_ea_[1]=
       [0,[0,_bK_,[1,controlParentName_ep_[1]]],prop_list_ea_[1]];
      if(layoutKind_eq_)
       prop_list_ea_[1]=[0,[0,_bJ_,[1,layoutKind_eq_[1]]],prop_list_ea_[1]];
      if(name_er_)
       prop_list_ea_[1]=[0,[0,_bI_,[1,name_er_[1]]],prop_list_ea_[1]];
      if(id_es_)prop_list_ea_[1]=[0,[0,_bH_,[1,id_es_[1]]],prop_list_ea_[1]];
      if(owner_et_)
       prop_list_ea_[1]=[0,[0,_bG_,[7,owner_et_[1]]],prop_list_ea_[1]];
      if(ontap_eu_)
       handler_list_eb_[1]=[0,[0,_bF_,ontap_eu_[1]],handler_list_eb_[1]];
      return [0,_bE_,components_d$_,handler_list_eb_[1],prop_list_ea_[1]];}
    function _eX_
     (_opt__ew_,
      tag_eA_,
      classes_eB_,
      style_eC_,
      content_eD_,
      showing_eE_,
      allowHtml_eF_,
      src_eG_,
      canGenerate_eH_,
      fit_eI_,
      isContainer_eJ_,
      container_eK_,
      parent_eL_,
      controlParentName_eM_,
      layoutKind_eN_,
      name_eO_,
      id_eP_,
      owner_eQ_,
      ontap_eR_,
      param_eS_)
     {var
       components_ex_=_opt__ew_?_opt__ew_[1]:0,
       prop_list_ey_=[0,_cC_],
       handler_list_ez_=[0,0];
      if(tag_eA_)
       prop_list_ey_[1]=[0,[0,_cB_,[1,tag_eA_[1]]],prop_list_ey_[1]];
      if(classes_eB_)
       prop_list_ey_[1]=[0,[0,_cA_,[1,classes_eB_[1]]],prop_list_ey_[1]];
      if(style_eC_)
       prop_list_ey_[1]=[0,[0,_cz_,[1,style_eC_[1]]],prop_list_ey_[1]];
      if(content_eD_)
       prop_list_ey_[1]=[0,[0,_cy_,[1,content_eD_[1]]],prop_list_ey_[1]];
      if(showing_eE_)
       prop_list_ey_[1]=[0,[0,_cx_,[5,showing_eE_[1]]],prop_list_ey_[1]];
      if(allowHtml_eF_)
       prop_list_ey_[1]=[0,[0,_cw_,[5,allowHtml_eF_[1]]],prop_list_ey_[1]];
      if(src_eG_)
       prop_list_ey_[1]=[0,[0,_cv_,[1,src_eG_[1]]],prop_list_ey_[1]];
      if(canGenerate_eH_)
       prop_list_ey_[1]=[0,[0,_cu_,[5,canGenerate_eH_[1]]],prop_list_ey_[1]];
      if(fit_eI_)
       prop_list_ey_[1]=[0,[0,_ct_,[5,fit_eI_[1]]],prop_list_ey_[1]];
      if(isContainer_eJ_)
       prop_list_ey_[1]=[0,[0,_cs_,[5,isContainer_eJ_[1]]],prop_list_ey_[1]];
      if(container_eK_)
       prop_list_ey_[1]=[0,[0,_cr_,[7,container_eK_[1]]],prop_list_ey_[1]];
      if(parent_eL_)
       prop_list_ey_[1]=[0,[0,_cq_,[7,parent_eL_[1]]],prop_list_ey_[1]];
      if(controlParentName_eM_)
       prop_list_ey_[1]=
       [0,[0,_cp_,[1,controlParentName_eM_[1]]],prop_list_ey_[1]];
      if(layoutKind_eN_)
       prop_list_ey_[1]=[0,[0,_co_,[1,layoutKind_eN_[1]]],prop_list_ey_[1]];
      if(name_eO_)
       prop_list_ey_[1]=[0,[0,_cn_,[1,name_eO_[1]]],prop_list_ey_[1]];
      if(id_eP_)prop_list_ey_[1]=[0,[0,_cm_,[1,id_eP_[1]]],prop_list_ey_[1]];
      if(owner_eQ_)
       prop_list_ey_[1]=[0,[0,_cl_,[7,owner_eQ_[1]]],prop_list_ey_[1]];
      if(ontap_eR_)
       handler_list_ez_[1]=[0,[0,_ck_,ontap_eR_[1]],handler_list_ez_[1]];
      return [0,_cj_,components_ex_,handler_list_ez_[1],prop_list_ey_[1]];}
    function _eY_(this_eU_,chaine1_eT_)
     {this_eU_.setStyle(chaine1_eT_.toString());return 0;}
    var
     matrice_jeu_eZ_=_dC_(taille_e_[1],taille_e_[2],2),
     Quatre_e0_=[0,_q_],
     Valeur_nulle_e1_=[0,_p_];
    function eval_bloc_fk_
     (m_fd_,cmin_e3_,cmax_e2_,lmin_e6_,lmax_e5_,dx_ff_,dy_fe_)
     {if(!(cmax_e2_<cmin_e3_))
       {var c_e4_=cmin_e3_;
        for(;;)
         {if(!(lmax_e5_<lmin_e6_))
           {var l_e7_=lmin_e6_;
            for(;;)
             {var n_e8_=[0,0],e_e9_=[0,2],x_e__=[0,c_e4_],y_e$_=[0,l_e7_];
              try
               {var _fa_=1,_fb_=4;
                if(!(_fb_<_fa_))
                 {var i_fc_=_fa_;
                  for(;;)
                   {switch
                     (caml_array_get(caml_array_get(m_fd_,y_e$_[1]),x_e__[1]))
                     {case 1:
                       if(0===e_e9_[1])throw [0,Valeur_nulle_e1_];
                       n_e8_[1]+=1;
                       if(4===n_e8_[1])throw [0,Quatre_e0_,0];
                       e_e9_[1]=1;
                       break;
                      case 2:break;
                      default:
                       if(1===e_e9_[1])throw [0,Valeur_nulle_e1_];
                       n_e8_[1]+=1;
                       if(4===n_e8_[1])throw [0,Quatre_e0_,1];
                       e_e9_[1]=0;}
                    x_e__[1]=x_e__[1]+dy_fe_|0;
                    y_e$_[1]=y_e$_[1]+dx_ff_|0;
                    var _fg_=i_fc_+1|0;
                    if(_fb_!==i_fc_){var i_fc_=_fg_;continue;}
                    break;}}}
              catch(_fh_)
               {if(_fh_[1]!==Valeur_nulle_e1_&&_fh_[1]!==_b_)throw _fh_;}
              var _fi_=l_e7_+1|0;
              if(lmax_e5_!==l_e7_){var l_e7_=_fi_;continue;}
              break;}}
          var _fj_=c_e4_+1|0;
          if(cmax_e2_!==c_e4_){var c_e4_=_fj_;continue;}
          break;}}
      return 0;}
    var
     joueur_fl_=[0,1],
     partie_en_cours_fm_=[0,1],
     dernier_coup_est_valide_fn_=[0,0],
     _fo_=[0,src_token_vide_o_];
    function base_component_fx_(_fv_,_fu_,_ft_,_fs_,_fr_,_fq_,_fp_)
     {return _fw_(_eW_,_fv_,_fu_,_ft_,_fs_,_r_,_fr_,_fq_,_fp_,_fo_);}
    var comp_feed_line_fK_=_eW_(0,0,_l_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    function creer_callback_ontap_fM_
     (i_fy_,j_fz_,this_fG_,sender_fI_,event_fJ_)
     {try
       {var
         _fA_=
          2===caml_array_get(caml_array_get(matrice_jeu_eZ_,i_fy_),j_fz_)?1:0,
         _fB_=
          _fA_
           ?2!==
             caml_array_get(caml_array_get(matrice_jeu_eZ_,i_fy_-1|0),j_fz_)
             ?1
             :0
           :_fA_,
         _fC_=_fB_;}
      catch(_fD_){if(_fD_[1]!==_b_)throw _fD_;var _fC_=1;}
      if(_fC_&&partie_en_cours_fm_[1])
       {var _fE_=joueur_fl_[1]?0:1;
        caml_array_set(caml_array_get(matrice_jeu_eZ_,i_fy_),j_fz_,_fE_);
        var _fF_=joueur_fl_[1]?src_token_j1_n_:src_token_j2_m_;
        this_fG_.setSrc(_fF_.toString());
        joueur_fl_[1]=1-joueur_fl_[1];
        dernier_coup_est_valide_fn_[1]=1;
        var _fH_=1;}
      else
       var _fH_=0;
      if(!_fH_)dernier_coup_est_valide_fn_[1]=0;
      return 0;}
    var
     w_fL_=taille_e_[2],
     h_fN_=taille_e_[1],
     _fO_=0,
     _fP_=0,
     _fQ_=0,
     _fR_=0,
     _fS_=0,
     _fT_=0,
     _fU_=0,
     _fV_=0,
     _fW_=0,
     _fX_=0,
     _fY_=0,
     _fZ_=0,
     _f0_=0,
     _f1_=0,
     _f2_=0,
     _f3_=0,
     _f4_=0,
     _f5_=0,
     _f6_=0,
     _f7_=0,
     _f8_=0,
     components_f9_=_f8_?_f8_[1]:0,
     prop_list_f__=[0,_ci_],
     handler_list_f$_=[0,0];
    if(_f7_)prop_list_f__[1]=[0,[0,_ch_,[5,_f7_[1]]],prop_list_f__[1]];
    if(_f6_)prop_list_f__[1]=[0,[0,_cg_,[5,_f6_[1]]],prop_list_f__[1]];
    if(_f5_)prop_list_f__[1]=[0,[0,_cf_,[1,_f5_[1]]],prop_list_f__[1]];
    if(_f4_)prop_list_f__[1]=[0,[0,_ce_,[1,_f4_[1]]],prop_list_f__[1]];
    if(_f3_)prop_list_f__[1]=[0,[0,_cd_,[1,_f3_[1]]],prop_list_f__[1]];
    if(_f2_)prop_list_f__[1]=[0,[0,_cc_,[1,_f2_[1]]],prop_list_f__[1]];
    if(_f1_)prop_list_f__[1]=[0,[0,_cb_,[5,_f1_[1]]],prop_list_f__[1]];
    if(_f0_)prop_list_f__[1]=[0,[0,_ca_,[5,_f0_[1]]],prop_list_f__[1]];
    if(_fZ_)prop_list_f__[1]=[0,[0,_b$_,[1,_fZ_[1]]],prop_list_f__[1]];
    if(_fY_)prop_list_f__[1]=[0,[0,_b__,[5,_fY_[1]]],prop_list_f__[1]];
    if(_fX_)prop_list_f__[1]=[0,[0,_b9_,[5,_fX_[1]]],prop_list_f__[1]];
    if(_fW_)prop_list_f__[1]=[0,[0,_b8_,[5,_fW_[1]]],prop_list_f__[1]];
    if(_fV_)prop_list_f__[1]=[0,[0,_b7_,[7,_fV_[1]]],prop_list_f__[1]];
    if(_fU_)prop_list_f__[1]=[0,[0,_b6_,[7,_fU_[1]]],prop_list_f__[1]];
    if(_fT_)prop_list_f__[1]=[0,[0,_b5_,[1,_fT_[1]]],prop_list_f__[1]];
    if(_fS_)prop_list_f__[1]=[0,[0,_b4_,[1,_fS_[1]]],prop_list_f__[1]];
    if(_fR_)prop_list_f__[1]=[0,[0,_b3_,[1,_fR_[1]]],prop_list_f__[1]];
    if(_fQ_)prop_list_f__[1]=[0,[0,_b2_,[1,_fQ_[1]]],prop_list_f__[1]];
    if(_fP_)prop_list_f__[1]=[0,[0,_b1_,[7,_fP_[1]]],prop_list_f__[1]];
    if(_fO_)handler_list_f$_[1]=[0,[0,_b0_,_fO_[1]],handler_list_f$_[1]];
    var
     mat_ga_=
      _dC_
       (h_fN_,
        w_fL_,
        [0,_bZ_,components_f9_,handler_list_f$_[1],prop_list_f__[1]]),
     _gb_=0,
     _gc_=h_fN_-1|0;
    if(!(_gc_<_gb_))
     {var i_gd_=_gb_;
      for(;;)
       {var _ge_=0,_gf_=w_fL_-1|0;
        if(!(_gf_<_ge_))
         {var j_gg_=_ge_;
          for(;;)
           {var
             _gi_=
              _gh_
               (base_component_fx_,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                [0,_dA_(creer_callback_ontap_fM_,i_gd_,j_gg_)],
                0);
            caml_array_set(caml_array_get(mat_ga_,i_gd_),j_gg_,_gi_);
            var _gj_=j_gg_+1|0;
            if(_gf_!==j_gg_){var j_gg_=_gj_;continue;}
            break;}}
        var _gk_=i_gd_+1|0;
        if(_gc_!==i_gd_){var i_gd_=_gk_;continue;}
        break;}}
    var
     _gn_=0,
     my_components_gT_=
      _dG_
       (function(acc_gl_,array_gm_)
         {return _cO_(_dE_(array_gm_),[0,comp_feed_line_fK_,acc_gl_]);},
        _gn_,
        mat_ga_);
    function callback_ontap_main_control_gU_(this_gq_,sender_go_,y_gS_)
     {try
       {as_a_eV_(995579707,sender_go_);
        var _gp_=1,_gr_=_dE_(caml_js_to_array(this_gq_.getComponents()));
        if(0<=_gp_)
         {var l_gs_=_gr_,n_gt_=_gp_;
          for(;;)
           {if(!l_gs_)throw [0,_a_,_cF_];
            var l_gw_=l_gs_[2],a_gu_=l_gs_[1];
            if(0!==n_gt_){var _gx_=n_gt_-1|0,l_gs_=l_gw_,n_gt_=_gx_;continue;}
            var _gv_=a_gu_;
            break;}}
        else
         var _gv_=_g_(_cE_);
        var control_info_gy_=as_a_eV_(425017149,_gv_);
        if(dernier_coup_est_valide_fn_[1])
         {var
           _gG_=
            _dD_
             (_c8_(_dD_,function(param_gz_){return 2<=param_gz_?1:0;}),
              matrice_jeu_eZ_),
           _gF_=0;
          if
           (0===
            _dG_
             (function(x_gE_,y_gD_)
               {var _gC_=0;
                return x_gE_+
                       _dG_(function(_gA_,_gB_){return _gA_+_gB_|0;},_gC_,y_gD_)|
                       0;},
              _gF_,
              _gG_))
           var _gH_=0;
          else
           {var col_gI_=taille_e_[2],lig_gJ_=taille_e_[1];
            try
             {eval_bloc_fk_(matrice_jeu_eZ_,0,lig_gJ_-1|0,0,col_gI_-4|0,0,1);
              eval_bloc_fk_(matrice_jeu_eZ_,0,col_gI_-1|0,0,lig_gJ_-4|0,1,0);
              eval_bloc_fk_(matrice_jeu_eZ_,0,col_gI_-4|0,0,lig_gJ_-4|0,1,1);
              eval_bloc_fk_(matrice_jeu_eZ_,1,lig_gJ_-4|0,0,col_gI_-4|0,1,1);
              eval_bloc_fk_(matrice_jeu_eZ_,3,col_gI_-1|0,0,lig_gJ_-4|0,1,-1);
              eval_bloc_fk_(matrice_jeu_eZ_,1,lig_gJ_-4|0,3,col_gI_-1|0,1,-1);
              var _gK_=1,_gH_=_gK_;}
            catch(_gL_)
             {if(_gL_[1]!==Quatre_e0_)throw _gL_;var _gH_=[0,_gL_[2]];}}
          if(typeof _gH_==="number")
           var
            _gM_=
             0===_gH_
              ?(partie_en_cours_fm_[1]=0,_eY_(control_info_gy_,_C_),_B_)
              :joueur_fl_[1]
                ?(_eY_(control_info_gy_,_G_),_F_)
                :(_eY_(control_info_gy_,_E_),_D_);
          else
           {var b_gN_=_gH_[1];
            partie_en_cours_fm_[1]=0;
            _eY_(control_info_gy_,_A_);
            var _gO_=b_gN_?_y_:_x_,_gM_=_cV_(_w_,_cV_(_gO_,_z_));}
          var _gP_=_gM_;}
        else
         var
          _gP_=
           partie_en_cours_fm_[1]
            ?(_eY_(control_info_gy_,_v_),_u_)
            :(_eY_(control_info_gy_,_t_),_s_);
        control_info_gy_.setContent(_gP_.toString());
        var _gQ_=1;}
      catch(_gR_){if(_gR_[1]===Bad_kind_d3_)return 1;throw _gR_;}
      return _gQ_;}
    var
     _gV_=0,
     _gW_=0,
     _gX_=0,
     _gY_=0,
     _gZ_=0,
     _g0_=0,
     _g1_=0,
     _g2_=0,
     _g3_=0,
     _g4_=0,
     _g5_=0,
     _g6_=0,
     _g7_=0,
     _g8_=0,
     _g9_=0,
     _g__=0,
     _g$_=0,
     _ha_=0,
     _hb_=[0,_eX_(0,_i_,0,_j_,_k_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0],
     components_hc_=[0,_hb_]?_hb_:0,
     prop_list_hd_=[0,_bD_],
     handler_list_he_=[0,0];
    if(_ha_)prop_list_hd_[1]=[0,[0,_bC_,[1,_ha_[1]]],prop_list_hd_[1]];
    if(_g$_)prop_list_hd_[1]=[0,[0,_bB_,[1,_g$_[1]]],prop_list_hd_[1]];
    if(_g__)prop_list_hd_[1]=[0,[0,_bA_,[1,_g__[1]]],prop_list_hd_[1]];
    if(_g9_)prop_list_hd_[1]=[0,[0,_bz_,[1,_g9_[1]]],prop_list_hd_[1]];
    if(_g8_)prop_list_hd_[1]=[0,[0,_by_,[5,_g8_[1]]],prop_list_hd_[1]];
    if(_g7_)prop_list_hd_[1]=[0,[0,_bx_,[5,_g7_[1]]],prop_list_hd_[1]];
    if(_g6_)prop_list_hd_[1]=[0,[0,_bw_,[1,_g6_[1]]],prop_list_hd_[1]];
    if(_g5_)prop_list_hd_[1]=[0,[0,_bv_,[5,_g5_[1]]],prop_list_hd_[1]];
    if(_g4_)prop_list_hd_[1]=[0,[0,_bu_,[5,_g4_[1]]],prop_list_hd_[1]];
    if(_g3_)prop_list_hd_[1]=[0,[0,_bt_,[5,_g3_[1]]],prop_list_hd_[1]];
    if(_g2_)prop_list_hd_[1]=[0,[0,_bs_,[7,_g2_[1]]],prop_list_hd_[1]];
    if(_g1_)prop_list_hd_[1]=[0,[0,_br_,[7,_g1_[1]]],prop_list_hd_[1]];
    if(_g0_)prop_list_hd_[1]=[0,[0,_bq_,[1,_g0_[1]]],prop_list_hd_[1]];
    if(_gZ_)prop_list_hd_[1]=[0,[0,_bp_,[1,_gZ_[1]]],prop_list_hd_[1]];
    if(_gY_)prop_list_hd_[1]=[0,[0,_bo_,[1,_gY_[1]]],prop_list_hd_[1]];
    if(_gX_)prop_list_hd_[1]=[0,[0,_bn_,[1,_gX_[1]]],prop_list_hd_[1]];
    if(_gW_)prop_list_hd_[1]=[0,[0,_bm_,[7,_gW_[1]]],prop_list_hd_[1]];
    if(_gV_)handler_list_he_[1]=[0,[0,_bl_,_gV_[1]],handler_list_he_[1]];
    var
     mon_control_hf_=
      _eX_
       ([0,
         [0,
          [0,_bk_,components_hc_,handler_list_he_[1],prop_list_hd_[1]],
          my_components_gT_]],
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        _h_,
        0,
        0,
        [0,callback_ontap_main_control_gU_],
        0);
    function build_component_tree_hl_(kind_hh_)
     {var js_obj_hg_=new Object(),_hk_=kind_hh_[4];
      _dV_
       (function(param_hi_)
         {var x_hj_=param_hi_[1];
          return js_obj_hg_[x_hj_]=coerce_prop_d5_(param_hi_[2]);},
        _hk_);
      if(0!==kind_hh_[2])
       js_obj_hg_.components=
       caml_js_from_array(_dF_(_dK_(build_component_tree_hl_,kind_hh_[2])));
      if(0!==kind_hh_[3])
       {var
         _hn_=kind_hh_[3],
         handlers_name_ho_=
          _dK_(function(param_hm_){return param_hm_[1];},_hn_),
         handlers_name_func_hv_=
          _dK_
           (function(x_hp_)
             {var _hq_=x_hp_.getLen()-2|0,_hr_=2;
              if(0<=_hr_&&0<=_hq_&&!((x_hp_.getLen()-_hq_|0)<_hr_))
               {var r_ht_=caml_create_string(_hq_);
                caml_blit_string(x_hp_,_hr_,r_ht_,0,_hq_);
                var _hu_=r_ht_,_hs_=1;}
              else
               var _hs_=0;
              if(!_hs_)var _hu_=_g_(_cD_);
              return _hu_;},
            handlers_name_ho_),
         _hx_=kind_hh_[3],
         handlers_func_hz_=
          _dK_(function(param_hw_){return param_hw_[2];},_hx_),
         handler_obj_hy_=new Object(),
         _hB_=_dS_(handlers_name_ho_,handlers_name_func_hv_);
        _dV_
         (function(param_hA_)
           {return handler_obj_hy_[param_hA_[1]]=param_hA_[2].toString();},
          _hB_);
        js_obj_hg_.handlers=handler_obj_hy_;
        var _hD_=_dS_(handlers_name_func_hv_,handlers_func_hz_);
        _dV_
         (function(param_hC_)
           {return js_obj_hg_[param_hC_[1]]=
                   caml_js_wrap_meth_callback(param_hC_[2]);},
          _hD_);}
      js_obj_hg_._onyo_id=kind_hh_[1].toString();
      return js_obj_hg_;}
    var js_obj_hE_=build_component_tree_hl_(mon_control_hf_);
    try
     {var param_hF_=mon_control_hf_[4];
      for(;;)
       {if(!param_hF_)throw [0,_c_];
        var match_hG_=param_hF_[1],b_hH_=match_hG_[2],l_hI_=param_hF_[2];
        if(0!==caml_compare(match_hG_[1],_L_)){var param_hF_=l_hI_;continue;}
        if(1!==b_hH_[0])throw [0,_d_,_K_];
        var s_hJ_=b_hH_[1],name_hK_=s_hJ_;
        break;}}
    catch(_hL_)
     {if(_hL_[1]!==_c_)throw _hL_;
      js_obj_hE_.name=_J_.toString();
      var name_hK_=_I_;}
    enyo.kind(js_obj_hE_);
    var enyo_js_object_hM_=new (caml_js_var(name_hK_))();
    function _hO_(param_hN_)
     {enyo_js_object_hM_.renderInto(document.body);return _false_dZ_;}
    window_d2_.onload=
    caml_js_wrap_callback
     (function(e_hP_)
       {if(e_hP_)
         {var res_hQ_=_hO_(e_hP_);
          if(!(res_hQ_|0))e_hP_.preventDefault();
          return res_hQ_;}
        var _hR_=event,res_hS_=_hO_(_hR_);
        _hR_.returnValue=res_hS_;
        return res_hS_;});
    do_at_exit_cW_(0);
    return;}
  ());
