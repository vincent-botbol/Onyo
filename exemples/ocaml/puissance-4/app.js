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
   {function _gi_
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
      _ip_,
      _iq_)
     {return _h9_.length==19
              ?_h9_
                (_h__,
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
                 _ip_,
                 _iq_)
              :caml_call_gen
                (_h9_,
                 [_h__,
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
                  _ip_,
                  _iq_]);}
    function _fx_(_hZ_,_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_,_h8_)
     {return _hZ_.length==9
              ?_hZ_(_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_,_h8_)
              :caml_call_gen
                (_hZ_,[_h0_,_h1_,_h2_,_h3_,_h4_,_h5_,_h6_,_h7_,_h8_]);}
    function _dB_(_hW_,_hX_,_hY_)
     {return _hW_.length==2?_hW_(_hX_,_hY_):caml_call_gen(_hW_,[_hX_,_hY_]);}
    function _c9_(_hU_,_hV_)
     {return _hU_.length==1?_hU_(_hV_):caml_call_gen(_hU_,[_hV_]);}
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
     _cI_=new MlString("Pervasives.do_at_exit"),
     _cH_=new MlString("List.combine"),
     _cG_=new MlString("nth"),
     _cF_=new MlString("List.nth"),
     _cE_=new MlString("String.sub"),
     _cD_=[0,[0,new MlString("kind"),[1,new MlString("Control")]],0],
     _cC_=new MlString("tag"),
     _cB_=new MlString("classes"),
     _cA_=new MlString("style"),
     _cz_=new MlString("content"),
     _cy_=new MlString("showing"),
     _cx_=new MlString("allowHtml"),
     _cw_=new MlString("src"),
     _cv_=new MlString("canGenerate"),
     _cu_=new MlString("fit"),
     _ct_=new MlString("isContainer"),
     _cs_=new MlString("container"),
     _cr_=new MlString("parent"),
     _cq_=new MlString("controlParentName"),
     _cp_=new MlString("layoutKind"),
     _co_=new MlString("name"),
     _cn_=new MlString("id"),
     _cm_=new MlString("owner"),
     _cl_=new MlString("ontap"),
     _ck_=new MlString("CONTROL"),
     _cj_=[0,[0,new MlString("kind"),[1,new MlString("Button")]],0],
     _ci_=new MlString("disabled"),
     _ch_=new MlString("active"),
     _cg_=new MlString("tag"),
     _cf_=new MlString("classes"),
     _ce_=new MlString("style"),
     _cd_=new MlString("content"),
     _cc_=new MlString("showing"),
     _cb_=new MlString("allowHtml"),
     _ca_=new MlString("src"),
     _b$_=new MlString("canGenerate"),
     _b__=new MlString("fit"),
     _b9_=new MlString("isContainer"),
     _b8_=new MlString("container"),
     _b7_=new MlString("parent"),
     _b6_=new MlString("controlParentName"),
     _b5_=new MlString("layoutKind"),
     _b4_=new MlString("name"),
     _b3_=new MlString("id"),
     _b2_=new MlString("owner"),
     _b1_=new MlString("ontap"),
     _b0_=new MlString("BUTTON"),
     _bZ_=[0,[0,new MlString("kind"),[1,new MlString("Image")]],0],
     _bY_=new MlString("noEvents"),
     _bX_=new MlString("tag"),
     _bW_=new MlString("classes"),
     _bV_=new MlString("style"),
     _bU_=new MlString("content"),
     _bT_=new MlString("showing"),
     _bS_=new MlString("allowHtml"),
     _bR_=new MlString("src"),
     _bQ_=new MlString("canGenerate"),
     _bP_=new MlString("fit"),
     _bO_=new MlString("isContainer"),
     _bN_=new MlString("container"),
     _bM_=new MlString("parent"),
     _bL_=new MlString("controlParentName"),
     _bK_=new MlString("layoutKind"),
     _bJ_=new MlString("name"),
     _bI_=new MlString("id"),
     _bH_=new MlString("owner"),
     _bG_=new MlString("ontap"),
     _bF_=new MlString("IMAGE"),
     _bE_=[0,[0,new MlString("kind"),[1,new MlString("onyx.Toolbar")]],0],
     _bD_=new MlString("tag"),
     _bC_=new MlString("classes"),
     _bB_=new MlString("style"),
     _bA_=new MlString("content"),
     _bz_=new MlString("showing"),
     _by_=new MlString("allowHtml"),
     _bx_=new MlString("src"),
     _bw_=new MlString("canGenerate"),
     _bv_=new MlString("fit"),
     _bu_=new MlString("isContainer"),
     _bt_=new MlString("container"),
     _bs_=new MlString("parent"),
     _br_=new MlString("controlParentName"),
     _bq_=new MlString("layoutKind"),
     _bp_=new MlString("name"),
     _bo_=new MlString("id"),
     _bn_=new MlString("owner"),
     _bm_=new MlString("ontap"),
     _bl_=new MlString("ONYX.TOOLBAR"),
     _bk_=new MlString(".AJAXCOMPONENT"),
     _bj_=new MlString(".UNUSED"),
     _bi_=new MlString("AJAX"),
     _bh_=new MlString("ANIMATOR"),
     _bg_=new MlString("ARRANGER"),
     _bf_=new MlString("ASYNC"),
     _be_=new MlString("BASELAYOUT"),
     _bd_=new MlString("BUTTON"),
     _bc_=new MlString("CANVAS"),
     _bb_=new MlString("CANVAS.CIRCLE"),
     _ba_=new MlString("CANVAS.CONTROL"),
     _a$_=new MlString("CANVAS.IMAGE"),
     _a__=new MlString("CANVAS.RECTANGLE"),
     _a9_=new MlString("CANVAS.SHAPE"),
     _a8_=new MlString("CANVAS.TEXT"),
     _a7_=new MlString("CARDARRANGER"),
     _a6_=new MlString("CARDSLIDEINARRANGER"),
     _a5_=new MlString("CAROUSELARRANGER"),
     _a4_=new MlString("CHECKBOX"),
     _a3_=new MlString("COLLAPSINGARRANGER"),
     _a2_=new MlString("COMPONENT"),
     _a1_=new MlString("CONTROL"),
     _a0_=new MlString("DRAGAVATAR"),
     _aZ_=new MlString("FITTABLECOLUMNS"),
     _aY_=new MlString("FITTABLELAYOUT"),
     _aX_=new MlString("FITTABLEROWS"),
     _aW_=new MlString("FLYWEIGHTREPEATER"),
     _aV_=new MlString("GROUP"),
     _aU_=new MlString("GROUPITEM"),
     _aT_=new MlString("IMAGE"),
     _aS_=new MlString("INPUT"),
     _aR_=new MlString("JSONPREQUEST"),
     _aQ_=new MlString("LAYOUT"),
     _aP_=new MlString("LEFTRIGHTARRANGER"),
     _aO_=new MlString("LIST"),
     _aN_=new MlString("NODE"),
     _aM_=new MlString("OBJECT"),
     _aL_=new MlString("ONYX.BUTTON"),
     _aK_=new MlString("ONYX.CHECKBOX"),
     _aJ_=new MlString("ONYX.DRAWER"),
     _aI_=new MlString("ONYX.FLYWEIGHTPICKER"),
     _aH_=new MlString("ONYX.GRABBER"),
     _aG_=new MlString("ONYX.GROUPBOX"),
     _aF_=new MlString("ONYX.GROUPBOXHEADER"),
     _aE_=new MlString("ONYX.ICON"),
     _aD_=new MlString("ONYX.ICONBUTTON"),
     _aC_=new MlString("ONYX.INPUT"),
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
     _M_=[0,new MlString("lib_enyo.ml"),2187,31],
     _L_=new MlString("name"),
     _K_=[0,new MlString("lib_enyo.ml"),2090,12],
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
     _q_=new MlString("App.Quatre"),
     _p_=new MlString("App.Valeur_nulle"),
     src_token_vide_o_=new MlString("img/vide.jpg"),
     src_token_j1_n_=new MlString("img/token1.jpg"),
     src_token_j2_m_=new MlString("img/token2.jpg"),
     _l_=[0,new MlString("br")],
     _k_=[0,new MlString("P-P-Puissance 4 !")],
     _j_=[0,new MlString("color:red")],
     _i_=[0,new MlString("p")],
     _h_=[0,new MlString("App")];
    function _g_(s_f_){throw [0,_b_,s_f_];}
    function _cW_(s1_cJ_,s2_cL_)
     {var
       l1_cK_=s1_cJ_.getLen(),
       l2_cM_=s2_cL_.getLen(),
       s_cN_=caml_create_string(l1_cK_+l2_cM_|0);
      caml_blit_string(s1_cJ_,0,s_cN_,0,l1_cK_);
      caml_blit_string(s2_cL_,0,s_cN_,l1_cK_,l2_cM_);
      return s_cN_;}
    function _cP_(l1_cO_,l2_cQ_)
     {if(l1_cO_)
       {var hd_cR_=l1_cO_[1];return [0,hd_cR_,_cP_(l1_cO_[2],l2_cQ_)];}
      return l2_cQ_;}
    function do_at_exit_cX_(param_cV_)
     {var param_cS_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_cS_)
         {var l_cT_=param_cS_[2];
          try {}catch(_cU_){}
          var param_cS_=l_cT_;
          continue;}
        return 0;}}
    caml_register_named_value(_cI_,do_at_exit_cX_);
    function _dD_(sx_cY_,sy_c4_,init_c3_)
     {var res_cZ_=caml_make_vect(sx_cY_,[0]),_c0_=0,_c1_=sx_cY_-1|0;
      if(!(_c1_<_c0_))
       {var x_c2_=_c0_;
        for(;;)
         {res_cZ_[x_c2_+1]=caml_make_vect(sy_c4_,init_c3_);
          var _c5_=x_c2_+1|0;
          if(_c1_!==x_c2_){var x_c2_=_c5_;continue;}
          break;}}
      return res_cZ_;}
    function _dE_(f_c8_,a_c6_)
     {var l_c7_=a_c6_.length-1;
      if(0===l_c7_)return [0];
      var
       r_c__=caml_make_vect(l_c7_,_c9_(f_c8_,a_c6_[0+1])),
       _c$_=1,
       _da_=l_c7_-1|0;
      if(!(_da_<_c$_))
       {var i_db_=_c$_;
        for(;;)
         {r_c__[i_db_+1]=_c9_(f_c8_,a_c6_[i_db_+1]);
          var _dc_=i_db_+1|0;
          if(_da_!==i_db_){var i_db_=_dc_;continue;}
          break;}}
      return r_c__;}
    function _dF_(a_dd_)
     {var i_de_=a_dd_.length-1-1|0,res_df_=0;
      for(;;)
       {if(0<=i_de_)
         {var
           _dh_=[0,a_dd_[i_de_+1],res_df_],
           _dg_=i_de_-1|0,
           i_de_=_dg_,
           res_df_=_dh_;
          continue;}
        return res_df_;}}
    function _dG_(l_di_)
     {if(l_di_)
       {var accu_dj_=0,param_dk_=l_di_,tl_dq_=l_di_[2],hd_dn_=l_di_[1];
        for(;;)
         {if(param_dk_)
           {var
             t_dm_=param_dk_[2],
             _dl_=accu_dj_+1|0,
             accu_dj_=_dl_,
             param_dk_=t_dm_;
            continue;}
          var a_do_=caml_make_vect(accu_dj_,hd_dn_),i_dp_=1,param_dr_=tl_dq_;
          for(;;)
           {if(param_dr_)
             {var tl_ds_=param_dr_[2];
              a_do_[i_dp_+1]=param_dr_[1];
              var _dt_=i_dp_+1|0,i_dp_=_dt_,param_dr_=tl_ds_;
              continue;}
            return a_do_;}}}
      return [0];}
    function _dH_(f_dA_,x_du_,a_dx_)
     {var r_dv_=[0,x_du_],_dw_=0,_dy_=a_dx_.length-1-1|0;
      if(!(_dy_<_dw_))
       {var i_dz_=_dw_;
        for(;;)
         {r_dv_[1]=_dB_(f_dA_,r_dv_[1],a_dx_[i_dz_+1]);
          var _dC_=i_dz_+1|0;
          if(_dy_!==i_dz_){var i_dz_=_dC_;continue;}
          break;}}
      return r_dv_[1];}
    function _dL_(f_dJ_,param_dI_)
     {if(param_dI_)
       {var l_dK_=param_dI_[2],r_dM_=_c9_(f_dJ_,param_dI_[1]);
        return [0,r_dM_,_dL_(f_dJ_,l_dK_)];}
      return 0;}
    function _dW_(f_dP_,param_dN_)
     {var param_dO_=param_dN_;
      for(;;)
       {if(param_dO_)
         {var l_dQ_=param_dO_[2];
          _c9_(f_dP_,param_dO_[1]);
          var param_dO_=l_dQ_;
          continue;}
        return 0;}}
    function _dT_(l1_dR_,l2_dS_)
     {if(l1_dR_)
       {if(l2_dS_)
         {var a2_dV_=l2_dS_[1],a1_dU_=l1_dR_[1];
          return [0,[0,a1_dU_,a2_dV_],_dT_(l1_dR_[2],l2_dS_[2])];}}
      else
       if(!l2_dS_)return 0;
      return _g_(_cH_);}
    var
     _dX_=[0,0],
     undefined_d1_=undefined,
     _false_d0_=false,
     array_constructor_dZ_=Array;
    function _d2_(e_dY_)
     {return e_dY_ instanceof array_constructor_dZ_
              ?0
              :[0,new MlWrappedString(e_dY_.toString())];}
    _dX_[1]=[0,_d2_,_dX_[1]];
    var window_d3_=window;
    window.HTMLElement===undefined_d1_;
    var Bad_kind_d4_=[0,_H_];
    function coerce_prop_d6_(param_d5_)
     {switch(param_d5_[0])
       {case 1:return param_d5_[1].toString();
        case 2:return param_d5_[1];
        case 3:return param_d5_[1];
        case 4:return param_d5_[1];
        case 5:return !!param_d5_[1];
        case 6:
         return caml_js_from_array(_dG_(_dL_(coerce_prop_d6_,param_d5_[1])));
        case 7:return param_d5_[1];
        default:return param_d5_[1];}}
    function as_a_eW_(id_type_d__,obj_js_d7_)
     {var s_d8_=new MlWrappedString(obj_js_d7_._hidden_id);
      if(caml_string_notequal(s_d8_,_bk_))
       if(caml_string_notequal(s_d8_,_bj_))
        if(caml_string_notequal(s_d8_,_bi_))
         if(caml_string_notequal(s_d8_,_bh_))
          if(caml_string_notequal(s_d8_,_bg_))
           if(caml_string_notequal(s_d8_,_bf_))
            if(caml_string_notequal(s_d8_,_be_))
             if(caml_string_notequal(s_d8_,_bd_))
              if(caml_string_notequal(s_d8_,_bc_))
               if(caml_string_notequal(s_d8_,_bb_))
                if(caml_string_notequal(s_d8_,_ba_))
                 if(caml_string_notequal(s_d8_,_a$_))
                  if(caml_string_notequal(s_d8_,_a__))
                   if(caml_string_notequal(s_d8_,_a9_))
                    if(caml_string_notequal(s_d8_,_a8_))
                     if(caml_string_notequal(s_d8_,_a7_))
                      if(caml_string_notequal(s_d8_,_a6_))
                       if(caml_string_notequal(s_d8_,_a5_))
                        if(caml_string_notequal(s_d8_,_a4_))
                         if(caml_string_notequal(s_d8_,_a3_))
                          if(caml_string_notequal(s_d8_,_a2_))
                           if(caml_string_notequal(s_d8_,_a1_))
                            if(caml_string_notequal(s_d8_,_a0_))
                             if(caml_string_notequal(s_d8_,_aZ_))
                              if(caml_string_notequal(s_d8_,_aY_))
                               if(caml_string_notequal(s_d8_,_aX_))
                                if(caml_string_notequal(s_d8_,_aW_))
                                 if(caml_string_notequal(s_d8_,_aV_))
                                  if(caml_string_notequal(s_d8_,_aU_))
                                   if(caml_string_notequal(s_d8_,_aT_))
                                    if(caml_string_notequal(s_d8_,_aS_))
                                     if(caml_string_notequal(s_d8_,_aR_))
                                      if(caml_string_notequal(s_d8_,_aQ_))
                                       if(caml_string_notequal(s_d8_,_aP_))
                                        if(caml_string_notequal(s_d8_,_aO_))
                                         if(caml_string_notequal(s_d8_,_aN_))
                                          if(caml_string_notequal(s_d8_,_aM_))
                                           if(caml_string_notequal(s_d8_,_aL_))
                                            if(caml_string_notequal(s_d8_,_aK_))
                                             if(caml_string_notequal(s_d8_,_aJ_))
                                              if(caml_string_notequal(s_d8_,_aI_))
                                               if(caml_string_notequal(s_d8_,_aH_))
                                                if(caml_string_notequal(s_d8_,_aG_))
                                                 if(caml_string_notequal(s_d8_,_aF_))
                                                  if(caml_string_notequal(s_d8_,_aE_))
                                                   if(caml_string_notequal(s_d8_,_aD_))
                                                    if(caml_string_notequal(s_d8_,_aC_))
                                                     if(caml_string_notequal(s_d8_,_aB_))
                                                      if(caml_string_notequal(s_d8_,_aA_))
                                                       if(caml_string_notequal(s_d8_,_az_))
                                                        if(caml_string_notequal(s_d8_,_ay_))
                                                         if(caml_string_notequal(s_d8_,_ax_))
                                                          if(caml_string_notequal(s_d8_,_aw_))
                                                           if(caml_string_notequal(s_d8_,_av_))
                                                            if(caml_string_notequal(s_d8_,_au_))
                                                             if(caml_string_notequal(s_d8_,_at_))
                                                              if(caml_string_notequal(s_d8_,_as_))
                                                               if(caml_string_notequal(s_d8_,_ar_))
                                                                if(caml_string_notequal(s_d8_,_aq_))
                                                                 if(caml_string_notequal(s_d8_,_ap_))
                                                                  if(caml_string_notequal(s_d8_,_ao_))
                                                                   if(caml_string_notequal(s_d8_,_an_))
                                                                    if(caml_string_notequal(s_d8_,_am_))
                                                                     if(caml_string_notequal(s_d8_,_al_))
                                                                      if(caml_string_notequal(s_d8_,_ak_))
                                                                       if(caml_string_notequal(s_d8_,_aj_))
                                                                        if(caml_string_notequal(s_d8_,_ai_))
                                                                         if(caml_string_notequal(s_d8_,_ah_))
                                                                          if(caml_string_notequal(s_d8_,_ag_))
                                                                           if(caml_string_notequal(s_d8_,_af_))
                                                                            if(caml_string_notequal(s_d8_,_ae_))
                                                                             if(caml_string_notequal(s_d8_,_ad_))
                                                                              if(caml_string_notequal(s_d8_,_ac_))
                                                                               if(caml_string_notequal(s_d8_,_ab_))
                                                                                if(caml_string_notequal(s_d8_,_aa_))
                                                                                 if(caml_string_notequal(s_d8_,_$_))
                                                                                  if(caml_string_notequal(s_d8_,___))
                                                                                   if(caml_string_notequal(s_d8_,_Z_))
                                                                                    if(caml_string_notequal(s_d8_,_Y_))
                                                                                     if(caml_string_notequal(s_d8_,_X_))
                                                                                      if(caml_string_notequal(s_d8_,_W_))
                                                                                       if(caml_string_notequal(s_d8_,_V_))
                                                                                        if(caml_string_notequal(s_d8_,_U_))
                                                                                         if(caml_string_notequal(s_d8_,_T_))
                                                                                          if(caml_string_notequal(s_d8_,_S_))
                                                                                           if(caml_string_notequal(s_d8_,_R_))
                                                                                            if(caml_string_notequal(s_d8_,_Q_))
                                                                                             if(caml_string_notequal(s_d8_,_P_))
                                                                                              if(caml_string_notequal(s_d8_,_O_))
                                                                                               {if(caml_string_notequal(s_d8_,_N_))throw [0,_d_,_M_];
                                                                                                var _d9_=-178100703;}
                                                                                              else
                                                                                               var _d9_=700591049;
                                                                                             else
                                                                                              var _d9_=622517550;
                                                                                            else
                                                                                             var _d9_=-533501601;
                                                                                           else
                                                                                            var _d9_=482052838;
                                                                                          else
                                                                                           var _d9_=-720019389;
                                                                                         else
                                                                                          var _d9_=840712890;
                                                                                        else
                                                                                         var _d9_=-789475541;
                                                                                       else
                                                                                        var _d9_=-1061797653;
                                                                                      else
                                                                                       var _d9_=158558252;
                                                                                     else
                                                                                      var _d9_=481675004;
                                                                                    else
                                                                                     var _d9_=478054089;
                                                                                   else
                                                                                    var _d9_=129868160;
                                                                                  else
                                                                                   var _d9_=222697557;
                                                                                 else
                                                                                  var _d9_=-438657606;
                                                                                else
                                                                                 var _d9_=608497865;
                                                                               else
                                                                                var _d9_=-371503992;
                                                                              else
                                                                               var _d9_=-155574651;
                                                                             else
                                                                              var _d9_=-998030836;
                                                                            else
                                                                             var _d9_=492557551;
                                                                           else
                                                                            var _d9_=963588443;
                                                                          else
                                                                           var _d9_=-570589323;
                                                                         else
                                                                          var _d9_=128080185;
                                                                        else
                                                                         var _d9_=248520994;
                                                                       else
                                                                        var _d9_=247624090;
                                                                      else
                                                                       var _d9_=488405991;
                                                                     else
                                                                      var _d9_=-279389797;
                                                                    else
                                                                     var _d9_=-662935560;
                                                                   else
                                                                    var _d9_=-342434110;
                                                                  else
                                                                   var _d9_=1025813669;
                                                                 else
                                                                  var _d9_=-511604822;
                                                                else
                                                                 var _d9_=-654804603;
                                                               else
                                                                var _d9_=769821440;
                                                              else
                                                               var _d9_=665336805;
                                                             else
                                                              var _d9_=182322315;
                                                            else
                                                             var _d9_=769989772;
                                                           else
                                                            var _d9_=-94432209;
                                                          else
                                                           var _d9_=-350313947;
                                                         else
                                                          var _d9_=-132649709;
                                                        else
                                                         var _d9_=-456700261;
                                                       else
                                                        var _d9_=275210240;
                                                      else
                                                       var _d9_=231595892;
                                                     else
                                                      var _d9_=-243836142;
                                                    else
                                                     var _d9_=40287849;
                                                   else
                                                    var _d9_=-543035572;
                                                  else
                                                   var _d9_=230752730;
                                                 else
                                                  var _d9_=-154369958;
                                                else
                                                 var _d9_=678331149;
                                               else
                                                var _d9_=252002594;
                                              else
                                               var _d9_=358790936;
                                             else
                                              var _d9_=-613898734;
                                            else
                                             var _d9_=-1011353308;
                                           else
                                            var _d9_=-713917805;
                                          else
                                           var _d9_=-943576385;
                                         else
                                          var _d9_=868930050;
                                        else
                                         var _d9_=846455902;
                                       else
                                        var _d9_=283371291;
                                      else
                                       var _d9_=188439210;
                                     else
                                      var _d9_=169332487;
                                    else
                                     var _d9_=1007418346;
                                   else
                                    var _d9_=995579707;
                                  else
                                   var _d9_=-450825294;
                                 else
                                  var _d9_=400747295;
                                else
                                 var _d9_=-444281453;
                               else
                                var _d9_=469180470;
                              else
                               var _d9_=-340295929;
                             else
                              var _d9_=-11457088;
                            else
                             var _d9_=-532836595;
                           else
                            var _d9_=425017149;
                          else
                           var _d9_=179069085;
                         else
                          var _d9_=980626864;
                        else
                         var _d9_=108749379;
                       else
                        var _d9_=697727334;
                      else
                       var _d9_=-453591764;
                     else
                      var _d9_=-816822890;
                    else
                     var _d9_=855417012;
                   else
                    var _d9_=-661416678;
                  else
                   var _d9_=522665640;
                 else
                  var _d9_=434098516;
                else
                 var _d9_=109261206;
               else
                var _d9_=-512591401;
              else
               var _d9_=-356187944;
             else
              var _d9_=207818226;
            else
             var _d9_=-295834245;
           else
            var _d9_=606877468;
          else
           var _d9_=-1044181050;
         else
          var _d9_=-495449241;
        else
         var _d9_=724516384;
       else
        var _d9_=209475253;
      else
       var _d9_=-767144258;
      if(caml_equal(_d9_,id_type_d__))return obj_js_d7_;
      throw [0,Bad_kind_d4_];}
    function _eX_
     (_opt__d$_,
      noEvents_ed_,
      tag_ee_,
      classes_ef_,
      style_eg_,
      content_eh_,
      showing_ei_,
      allowHtml_ej_,
      src_ek_,
      canGenerate_el_,
      fit_em_,
      isContainer_en_,
      container_eo_,
      parent_ep_,
      controlParentName_eq_,
      layoutKind_er_,
      name_es_,
      id_et_,
      owner_eu_,
      ontap_ev_,
      param_ew_)
     {var
       components_ea_=_opt__d$_?_opt__d$_[1]:0,
       prop_list_eb_=[0,_bZ_],
       handler_list_ec_=[0,0];
      if(noEvents_ed_)
       prop_list_eb_[1]=[0,[0,_bY_,[5,noEvents_ed_[1]]],prop_list_eb_[1]];
      if(tag_ee_)
       prop_list_eb_[1]=[0,[0,_bX_,[1,tag_ee_[1]]],prop_list_eb_[1]];
      if(classes_ef_)
       prop_list_eb_[1]=[0,[0,_bW_,[1,classes_ef_[1]]],prop_list_eb_[1]];
      if(style_eg_)
       prop_list_eb_[1]=[0,[0,_bV_,[1,style_eg_[1]]],prop_list_eb_[1]];
      if(content_eh_)
       prop_list_eb_[1]=[0,[0,_bU_,[1,content_eh_[1]]],prop_list_eb_[1]];
      if(showing_ei_)
       prop_list_eb_[1]=[0,[0,_bT_,[5,showing_ei_[1]]],prop_list_eb_[1]];
      if(allowHtml_ej_)
       prop_list_eb_[1]=[0,[0,_bS_,[5,allowHtml_ej_[1]]],prop_list_eb_[1]];
      if(src_ek_)
       prop_list_eb_[1]=[0,[0,_bR_,[1,src_ek_[1]]],prop_list_eb_[1]];
      if(canGenerate_el_)
       prop_list_eb_[1]=[0,[0,_bQ_,[5,canGenerate_el_[1]]],prop_list_eb_[1]];
      if(fit_em_)
       prop_list_eb_[1]=[0,[0,_bP_,[5,fit_em_[1]]],prop_list_eb_[1]];
      if(isContainer_en_)
       prop_list_eb_[1]=[0,[0,_bO_,[5,isContainer_en_[1]]],prop_list_eb_[1]];
      if(container_eo_)
       prop_list_eb_[1]=[0,[0,_bN_,[7,container_eo_[1]]],prop_list_eb_[1]];
      if(parent_ep_)
       prop_list_eb_[1]=[0,[0,_bM_,[7,parent_ep_[1]]],prop_list_eb_[1]];
      if(controlParentName_eq_)
       prop_list_eb_[1]=
       [0,[0,_bL_,[1,controlParentName_eq_[1]]],prop_list_eb_[1]];
      if(layoutKind_er_)
       prop_list_eb_[1]=[0,[0,_bK_,[1,layoutKind_er_[1]]],prop_list_eb_[1]];
      if(name_es_)
       prop_list_eb_[1]=[0,[0,_bJ_,[1,name_es_[1]]],prop_list_eb_[1]];
      if(id_et_)prop_list_eb_[1]=[0,[0,_bI_,[1,id_et_[1]]],prop_list_eb_[1]];
      if(owner_eu_)
       prop_list_eb_[1]=[0,[0,_bH_,[7,owner_eu_[1]]],prop_list_eb_[1]];
      if(ontap_ev_)
       handler_list_ec_[1]=[0,[0,_bG_,ontap_ev_[1]],handler_list_ec_[1]];
      return [0,_bF_,components_ea_,handler_list_ec_[1],prop_list_eb_[1]];}
    function _eY_
     (_opt__ex_,
      tag_eB_,
      classes_eC_,
      style_eD_,
      content_eE_,
      showing_eF_,
      allowHtml_eG_,
      src_eH_,
      canGenerate_eI_,
      fit_eJ_,
      isContainer_eK_,
      container_eL_,
      parent_eM_,
      controlParentName_eN_,
      layoutKind_eO_,
      name_eP_,
      id_eQ_,
      owner_eR_,
      ontap_eS_,
      param_eT_)
     {var
       components_ey_=_opt__ex_?_opt__ex_[1]:0,
       prop_list_ez_=[0,_cD_],
       handler_list_eA_=[0,0];
      if(tag_eB_)
       prop_list_ez_[1]=[0,[0,_cC_,[1,tag_eB_[1]]],prop_list_ez_[1]];
      if(classes_eC_)
       prop_list_ez_[1]=[0,[0,_cB_,[1,classes_eC_[1]]],prop_list_ez_[1]];
      if(style_eD_)
       prop_list_ez_[1]=[0,[0,_cA_,[1,style_eD_[1]]],prop_list_ez_[1]];
      if(content_eE_)
       prop_list_ez_[1]=[0,[0,_cz_,[1,content_eE_[1]]],prop_list_ez_[1]];
      if(showing_eF_)
       prop_list_ez_[1]=[0,[0,_cy_,[5,showing_eF_[1]]],prop_list_ez_[1]];
      if(allowHtml_eG_)
       prop_list_ez_[1]=[0,[0,_cx_,[5,allowHtml_eG_[1]]],prop_list_ez_[1]];
      if(src_eH_)
       prop_list_ez_[1]=[0,[0,_cw_,[1,src_eH_[1]]],prop_list_ez_[1]];
      if(canGenerate_eI_)
       prop_list_ez_[1]=[0,[0,_cv_,[5,canGenerate_eI_[1]]],prop_list_ez_[1]];
      if(fit_eJ_)
       prop_list_ez_[1]=[0,[0,_cu_,[5,fit_eJ_[1]]],prop_list_ez_[1]];
      if(isContainer_eK_)
       prop_list_ez_[1]=[0,[0,_ct_,[5,isContainer_eK_[1]]],prop_list_ez_[1]];
      if(container_eL_)
       prop_list_ez_[1]=[0,[0,_cs_,[7,container_eL_[1]]],prop_list_ez_[1]];
      if(parent_eM_)
       prop_list_ez_[1]=[0,[0,_cr_,[7,parent_eM_[1]]],prop_list_ez_[1]];
      if(controlParentName_eN_)
       prop_list_ez_[1]=
       [0,[0,_cq_,[1,controlParentName_eN_[1]]],prop_list_ez_[1]];
      if(layoutKind_eO_)
       prop_list_ez_[1]=[0,[0,_cp_,[1,layoutKind_eO_[1]]],prop_list_ez_[1]];
      if(name_eP_)
       prop_list_ez_[1]=[0,[0,_co_,[1,name_eP_[1]]],prop_list_ez_[1]];
      if(id_eQ_)prop_list_ez_[1]=[0,[0,_cn_,[1,id_eQ_[1]]],prop_list_ez_[1]];
      if(owner_eR_)
       prop_list_ez_[1]=[0,[0,_cm_,[7,owner_eR_[1]]],prop_list_ez_[1]];
      if(ontap_eS_)
       handler_list_eA_[1]=[0,[0,_cl_,ontap_eS_[1]],handler_list_eA_[1]];
      return [0,_ck_,components_ey_,handler_list_eA_[1],prop_list_ez_[1]];}
    function _eZ_(this_eV_,chaine1_eU_)
     {this_eV_.setStyle(chaine1_eU_.toString());return 0;}
    var
     matrice_jeu_e0_=_dD_(taille_e_[1],taille_e_[2],2),
     Quatre_e1_=[0,_q_],
     Valeur_nulle_e2_=[0,_p_];
    function eval_bloc_fl_
     (m_fe_,cmin_e4_,cmax_e3_,lmin_e7_,lmax_e6_,dx_fg_,dy_ff_)
     {if(!(cmax_e3_<cmin_e4_))
       {var c_e5_=cmin_e4_;
        for(;;)
         {if(!(lmax_e6_<lmin_e7_))
           {var l_e8_=lmin_e7_;
            for(;;)
             {var n_e9_=[0,0],e_e__=[0,2],x_e$_=[0,c_e5_],y_fa_=[0,l_e8_];
              try
               {var _fb_=1,_fc_=4;
                if(!(_fc_<_fb_))
                 {var i_fd_=_fb_;
                  for(;;)
                   {switch
                     (caml_array_get(caml_array_get(m_fe_,y_fa_[1]),x_e$_[1]))
                     {case 1:
                       if(0===e_e__[1])throw [0,Valeur_nulle_e2_];
                       n_e9_[1]+=1;
                       if(4===n_e9_[1])throw [0,Quatre_e1_,0];
                       e_e__[1]=1;
                       break;
                      case 2:break;
                      default:
                       if(1===e_e__[1])throw [0,Valeur_nulle_e2_];
                       n_e9_[1]+=1;
                       if(4===n_e9_[1])throw [0,Quatre_e1_,1];
                       e_e__[1]=0;}
                    x_e$_[1]=x_e$_[1]+dy_ff_|0;
                    y_fa_[1]=y_fa_[1]+dx_fg_|0;
                    var _fh_=i_fd_+1|0;
                    if(_fc_!==i_fd_){var i_fd_=_fh_;continue;}
                    break;}}}
              catch(_fi_)
               {if(_fi_[1]!==Valeur_nulle_e2_&&_fi_[1]!==_b_)throw _fi_;}
              var _fj_=l_e8_+1|0;
              if(lmax_e6_!==l_e8_){var l_e8_=_fj_;continue;}
              break;}}
          var _fk_=c_e5_+1|0;
          if(cmax_e3_!==c_e5_){var c_e5_=_fk_;continue;}
          break;}}
      return 0;}
    var
     joueur_fm_=[0,1],
     partie_en_cours_fn_=[0,1],
     dernier_coup_est_valide_fo_=[0,0],
     _fp_=[0,src_token_vide_o_];
    function base_component_fy_(_fw_,_fv_,_fu_,_ft_,_fs_,_fr_,_fq_)
     {return _fx_(_eX_,_fw_,_fv_,_fu_,_ft_,_r_,_fs_,_fr_,_fq_,_fp_);}
    var comp_feed_line_fL_=_eX_(0,0,_l_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    function creer_callback_ontap_fN_
     (i_fz_,j_fA_,this_fH_,sender_fJ_,event_fK_)
     {try
       {var
         _fB_=
          2===caml_array_get(caml_array_get(matrice_jeu_e0_,i_fz_),j_fA_)?1:0,
         _fC_=
          _fB_
           ?2!==
             caml_array_get(caml_array_get(matrice_jeu_e0_,i_fz_-1|0),j_fA_)
             ?1
             :0
           :_fB_,
         _fD_=_fC_;}
      catch(_fE_){if(_fE_[1]!==_b_)throw _fE_;var _fD_=1;}
      if(_fD_&&partie_en_cours_fn_[1])
       {var _fF_=joueur_fm_[1]?0:1;
        caml_array_set(caml_array_get(matrice_jeu_e0_,i_fz_),j_fA_,_fF_);
        var _fG_=joueur_fm_[1]?src_token_j1_n_:src_token_j2_m_;
        this_fH_.setSrc(_fG_.toString());
        joueur_fm_[1]=1-joueur_fm_[1];
        dernier_coup_est_valide_fo_[1]=1;
        var _fI_=1;}
      else
       var _fI_=0;
      if(!_fI_)dernier_coup_est_valide_fo_[1]=0;
      return 0;}
    var
     w_fM_=taille_e_[2],
     h_fO_=taille_e_[1],
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
     _f9_=0,
     components_f__=_f9_?_f9_[1]:0,
     prop_list_f$_=[0,_cj_],
     handler_list_ga_=[0,0];
    if(_f8_)prop_list_f$_[1]=[0,[0,_ci_,[5,_f8_[1]]],prop_list_f$_[1]];
    if(_f7_)prop_list_f$_[1]=[0,[0,_ch_,[5,_f7_[1]]],prop_list_f$_[1]];
    if(_f6_)prop_list_f$_[1]=[0,[0,_cg_,[1,_f6_[1]]],prop_list_f$_[1]];
    if(_f5_)prop_list_f$_[1]=[0,[0,_cf_,[1,_f5_[1]]],prop_list_f$_[1]];
    if(_f4_)prop_list_f$_[1]=[0,[0,_ce_,[1,_f4_[1]]],prop_list_f$_[1]];
    if(_f3_)prop_list_f$_[1]=[0,[0,_cd_,[1,_f3_[1]]],prop_list_f$_[1]];
    if(_f2_)prop_list_f$_[1]=[0,[0,_cc_,[5,_f2_[1]]],prop_list_f$_[1]];
    if(_f1_)prop_list_f$_[1]=[0,[0,_cb_,[5,_f1_[1]]],prop_list_f$_[1]];
    if(_f0_)prop_list_f$_[1]=[0,[0,_ca_,[1,_f0_[1]]],prop_list_f$_[1]];
    if(_fZ_)prop_list_f$_[1]=[0,[0,_b$_,[5,_fZ_[1]]],prop_list_f$_[1]];
    if(_fY_)prop_list_f$_[1]=[0,[0,_b__,[5,_fY_[1]]],prop_list_f$_[1]];
    if(_fX_)prop_list_f$_[1]=[0,[0,_b9_,[5,_fX_[1]]],prop_list_f$_[1]];
    if(_fW_)prop_list_f$_[1]=[0,[0,_b8_,[7,_fW_[1]]],prop_list_f$_[1]];
    if(_fV_)prop_list_f$_[1]=[0,[0,_b7_,[7,_fV_[1]]],prop_list_f$_[1]];
    if(_fU_)prop_list_f$_[1]=[0,[0,_b6_,[1,_fU_[1]]],prop_list_f$_[1]];
    if(_fT_)prop_list_f$_[1]=[0,[0,_b5_,[1,_fT_[1]]],prop_list_f$_[1]];
    if(_fS_)prop_list_f$_[1]=[0,[0,_b4_,[1,_fS_[1]]],prop_list_f$_[1]];
    if(_fR_)prop_list_f$_[1]=[0,[0,_b3_,[1,_fR_[1]]],prop_list_f$_[1]];
    if(_fQ_)prop_list_f$_[1]=[0,[0,_b2_,[7,_fQ_[1]]],prop_list_f$_[1]];
    if(_fP_)handler_list_ga_[1]=[0,[0,_b1_,_fP_[1]],handler_list_ga_[1]];
    var
     mat_gb_=
      _dD_
       (h_fO_,
        w_fM_,
        [0,_b0_,components_f__,handler_list_ga_[1],prop_list_f$_[1]]),
     _gc_=0,
     _gd_=h_fO_-1|0;
    if(!(_gd_<_gc_))
     {var i_ge_=_gc_;
      for(;;)
       {var _gf_=0,_gg_=w_fM_-1|0;
        if(!(_gg_<_gf_))
         {var j_gh_=_gf_;
          for(;;)
           {var
             _gj_=
              _gi_
               (base_component_fy_,
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
                [0,_dB_(creer_callback_ontap_fN_,i_ge_,j_gh_)],
                0);
            caml_array_set(caml_array_get(mat_gb_,i_ge_),j_gh_,_gj_);
            var _gk_=j_gh_+1|0;
            if(_gg_!==j_gh_){var j_gh_=_gk_;continue;}
            break;}}
        var _gl_=i_ge_+1|0;
        if(_gd_!==i_ge_){var i_ge_=_gl_;continue;}
        break;}}
    var
     _go_=0,
     my_components_gU_=
      _dH_
       (function(acc_gm_,array_gn_)
         {return _cP_(_dF_(array_gn_),[0,comp_feed_line_fL_,acc_gm_]);},
        _go_,
        mat_gb_);
    function callback_ontap_main_control_gV_(this_gr_,sender_gp_,y_gT_)
     {try
       {as_a_eW_(995579707,sender_gp_);
        var _gq_=1,_gs_=_dF_(caml_js_to_array(this_gr_.getComponents()));
        if(0<=_gq_)
         {var l_gt_=_gs_,n_gu_=_gq_;
          for(;;)
           {if(!l_gt_)throw [0,_a_,_cG_];
            var l_gx_=l_gt_[2],a_gv_=l_gt_[1];
            if(0!==n_gu_){var _gy_=n_gu_-1|0,l_gt_=l_gx_,n_gu_=_gy_;continue;}
            var _gw_=a_gv_;
            break;}}
        else
         var _gw_=_g_(_cF_);
        var control_info_gz_=as_a_eW_(425017149,_gw_);
        if(dernier_coup_est_valide_fo_[1])
         {var
           _gH_=
            _dE_
             (_c9_(_dE_,function(param_gA_){return 2<=param_gA_?1:0;}),
              matrice_jeu_e0_),
           _gG_=0;
          if
           (0===
            _dH_
             (function(x_gF_,y_gE_)
               {var _gD_=0;
                return x_gF_+
                       _dH_(function(_gB_,_gC_){return _gB_+_gC_|0;},_gD_,y_gE_)|
                       0;},
              _gG_,
              _gH_))
           var _gI_=0;
          else
           {var col_gJ_=taille_e_[2],lig_gK_=taille_e_[1];
            try
             {eval_bloc_fl_(matrice_jeu_e0_,0,lig_gK_-1|0,0,col_gJ_-4|0,0,1);
              eval_bloc_fl_(matrice_jeu_e0_,0,col_gJ_-1|0,0,lig_gK_-4|0,1,0);
              eval_bloc_fl_(matrice_jeu_e0_,0,col_gJ_-4|0,0,lig_gK_-4|0,1,1);
              eval_bloc_fl_(matrice_jeu_e0_,1,lig_gK_-4|0,0,col_gJ_-4|0,1,1);
              eval_bloc_fl_(matrice_jeu_e0_,3,col_gJ_-1|0,0,lig_gK_-4|0,1,-1);
              eval_bloc_fl_(matrice_jeu_e0_,1,lig_gK_-4|0,3,col_gJ_-1|0,1,-1);
              var _gL_=1,_gI_=_gL_;}
            catch(_gM_)
             {if(_gM_[1]!==Quatre_e1_)throw _gM_;var _gI_=[0,_gM_[2]];}}
          if(typeof _gI_==="number")
           var
            _gN_=
             0===_gI_
              ?(partie_en_cours_fn_[1]=0,_eZ_(control_info_gz_,_C_),_B_)
              :joueur_fm_[1]
                ?(_eZ_(control_info_gz_,_G_),_F_)
                :(_eZ_(control_info_gz_,_E_),_D_);
          else
           {var b_gO_=_gI_[1];
            partie_en_cours_fn_[1]=0;
            _eZ_(control_info_gz_,_A_);
            var _gP_=b_gO_?_y_:_x_,_gN_=_cW_(_w_,_cW_(_gP_,_z_));}
          var _gQ_=_gN_;}
        else
         var
          _gQ_=
           partie_en_cours_fn_[1]
            ?(_eZ_(control_info_gz_,_v_),_u_)
            :(_eZ_(control_info_gz_,_t_),_s_);
        control_info_gz_.setContent(_gQ_.toString());
        var _gR_=1;}
      catch(_gS_){if(_gS_[1]===Bad_kind_d4_)return 1;throw _gS_;}
      return _gR_;}
    var
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
     _hb_=0,
     _hc_=[0,_eY_(0,_i_,0,_j_,_k_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0],
     components_hd_=[0,_hc_]?_hc_:0,
     prop_list_he_=[0,_bE_],
     handler_list_hf_=[0,0];
    if(_hb_)prop_list_he_[1]=[0,[0,_bD_,[1,_hb_[1]]],prop_list_he_[1]];
    if(_ha_)prop_list_he_[1]=[0,[0,_bC_,[1,_ha_[1]]],prop_list_he_[1]];
    if(_g$_)prop_list_he_[1]=[0,[0,_bB_,[1,_g$_[1]]],prop_list_he_[1]];
    if(_g__)prop_list_he_[1]=[0,[0,_bA_,[1,_g__[1]]],prop_list_he_[1]];
    if(_g9_)prop_list_he_[1]=[0,[0,_bz_,[5,_g9_[1]]],prop_list_he_[1]];
    if(_g8_)prop_list_he_[1]=[0,[0,_by_,[5,_g8_[1]]],prop_list_he_[1]];
    if(_g7_)prop_list_he_[1]=[0,[0,_bx_,[1,_g7_[1]]],prop_list_he_[1]];
    if(_g6_)prop_list_he_[1]=[0,[0,_bw_,[5,_g6_[1]]],prop_list_he_[1]];
    if(_g5_)prop_list_he_[1]=[0,[0,_bv_,[5,_g5_[1]]],prop_list_he_[1]];
    if(_g4_)prop_list_he_[1]=[0,[0,_bu_,[5,_g4_[1]]],prop_list_he_[1]];
    if(_g3_)prop_list_he_[1]=[0,[0,_bt_,[7,_g3_[1]]],prop_list_he_[1]];
    if(_g2_)prop_list_he_[1]=[0,[0,_bs_,[7,_g2_[1]]],prop_list_he_[1]];
    if(_g1_)prop_list_he_[1]=[0,[0,_br_,[1,_g1_[1]]],prop_list_he_[1]];
    if(_g0_)prop_list_he_[1]=[0,[0,_bq_,[1,_g0_[1]]],prop_list_he_[1]];
    if(_gZ_)prop_list_he_[1]=[0,[0,_bp_,[1,_gZ_[1]]],prop_list_he_[1]];
    if(_gY_)prop_list_he_[1]=[0,[0,_bo_,[1,_gY_[1]]],prop_list_he_[1]];
    if(_gX_)prop_list_he_[1]=[0,[0,_bn_,[7,_gX_[1]]],prop_list_he_[1]];
    if(_gW_)handler_list_hf_[1]=[0,[0,_bm_,_gW_[1]],handler_list_hf_[1]];
    var
     mon_control_hg_=
      _eY_
       ([0,
         [0,
          [0,_bl_,components_hd_,handler_list_hf_[1],prop_list_he_[1]],
          my_components_gU_]],
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
        [0,callback_ontap_main_control_gV_],
        0);
    function build_component_tree_hm_(kind_hi_)
     {var js_obj_hh_=new Object(),_hl_=kind_hi_[4];
      _dW_
       (function(param_hj_)
         {var x_hk_=param_hj_[1];
          return js_obj_hh_[x_hk_]=coerce_prop_d6_(param_hj_[2]);},
        _hl_);
      if(0!==kind_hi_[2])
       js_obj_hh_.components=
       caml_js_from_array(_dG_(_dL_(build_component_tree_hm_,kind_hi_[2])));
      if(0!==kind_hi_[3])
       {var
         _ho_=kind_hi_[3],
         handlers_name_hp_=
          _dL_(function(param_hn_){return param_hn_[1];},_ho_),
         handlers_name_func_hw_=
          _dL_
           (function(x_hq_)
             {var _hr_=x_hq_.getLen()-2|0,_hs_=2;
              if(0<=_hs_&&0<=_hr_&&!((x_hq_.getLen()-_hr_|0)<_hs_))
               {var r_hu_=caml_create_string(_hr_);
                caml_blit_string(x_hq_,_hs_,r_hu_,0,_hr_);
                var _hv_=r_hu_,_ht_=1;}
              else
               var _ht_=0;
              if(!_ht_)var _hv_=_g_(_cE_);
              return _hv_;},
            handlers_name_hp_),
         _hy_=kind_hi_[3],
         handlers_func_hA_=
          _dL_(function(param_hx_){return param_hx_[2];},_hy_),
         handler_obj_hz_=new Object(),
         _hC_=_dT_(handlers_name_hp_,handlers_name_func_hw_);
        _dW_
         (function(param_hB_)
           {return handler_obj_hz_[param_hB_[1]]=param_hB_[2].toString();},
          _hC_);
        js_obj_hh_.handlers=handler_obj_hz_;
        var _hE_=_dT_(handlers_name_func_hw_,handlers_func_hA_);
        _dW_
         (function(param_hD_)
           {return js_obj_hh_[param_hD_[1]]=
                   caml_js_wrap_meth_callback(param_hD_[2]);},
          _hE_);}
      js_obj_hh_._hidden_id=kind_hi_[1].toString();
      return js_obj_hh_;}
    var js_obj_hF_=build_component_tree_hm_(mon_control_hg_);
    try
     {var param_hG_=mon_control_hg_[4];
      for(;;)
       {if(!param_hG_)throw [0,_c_];
        var match_hH_=param_hG_[1],b_hI_=match_hH_[2],l_hJ_=param_hG_[2];
        if(0!==caml_compare(match_hH_[1],_L_)){var param_hG_=l_hJ_;continue;}
        if(1!==b_hI_[0])throw [0,_d_,_K_];
        var s_hK_=b_hI_[1],name_hL_=s_hK_;
        break;}}
    catch(_hM_)
     {if(_hM_[1]!==_c_)throw _hM_;
      js_obj_hF_.name=_J_.toString();
      var name_hL_=_I_;}
    enyo.kind(js_obj_hF_);
    var enyo_js_object_hN_=new (caml_js_var(name_hL_))();
    function _hP_(param_hO_)
     {enyo_js_object_hN_.renderInto(document.body);return _false_d0_;}
    window_d3_.onload=
    caml_js_wrap_callback
     (function(e_hQ_)
       {if(e_hQ_)
         {var res_hR_=_hP_(e_hQ_);
          if(!(res_hR_|0))e_hQ_.preventDefault();
          return res_hR_;}
        var _hS_=event,res_hT_=_hP_(_hS_);
        _hS_.returnValue=res_hT_;
        return res_hT_;});
    do_at_exit_cX_(0);
    return;}
  ());
