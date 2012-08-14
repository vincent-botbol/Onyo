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
function caml_js_from_array(a) { return a.slice(1); }
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
(function()
   {function _aC_(_cm_,_cn_)
     {return _cm_.length==1?_cm_(_cn_):caml_call_gen(_cm_,[_cn_]);}
    var
     _a_=[0,new MlString("Invalid_argument")],
     _b_=[0,new MlString("Not_found")],
     _c_=[0,new MlString("Assert_failure")],
     _d_=[0,new MlString("graphic_box")];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_a_);
    caml_register_global(2,[0,new MlString("Failure")]);
    var
     _ah_=new MlString("Pervasives.do_at_exit"),
     _ag_=new MlString("List.combine"),
     _af_=new MlString("String.sub"),
     _ae_=[0,[0,new MlString("kind"),[1,new MlString("Control")]],0],
     _ad_=new MlString("tag"),
     _ac_=new MlString("classes"),
     _ab_=new MlString("style"),
     _aa_=new MlString("content"),
     _$_=new MlString("showing"),
     ___=new MlString("allowHtml"),
     _Z_=new MlString("src"),
     _Y_=new MlString("canGenerate"),
     _X_=new MlString("fit"),
     _W_=new MlString("isContainer"),
     _V_=new MlString("container"),
     _U_=new MlString("parent"),
     _T_=new MlString("controlParentName"),
     _S_=new MlString("layoutKind"),
     _R_=new MlString("name"),
     _Q_=new MlString("id"),
     _P_=new MlString("owner"),
     _O_=new MlString("ontap"),
     _N_=new MlString("CONTROL"),
     _M_=[0,[0,new MlString("kind"),[1,new MlString("Button")]],0],
     _L_=new MlString("disabled"),
     _K_=new MlString("active"),
     _J_=new MlString("tag"),
     _I_=new MlString("classes"),
     _H_=new MlString("style"),
     _G_=new MlString("content"),
     _F_=new MlString("showing"),
     _E_=new MlString("allowHtml"),
     _D_=new MlString("src"),
     _C_=new MlString("canGenerate"),
     _B_=new MlString("fit"),
     _A_=new MlString("isContainer"),
     _z_=new MlString("container"),
     _y_=new MlString("parent"),
     _x_=new MlString("controlParentName"),
     _w_=new MlString("layoutKind"),
     _v_=new MlString("name"),
     _u_=new MlString("id"),
     _t_=new MlString("owner"),
     _s_=new MlString("ontap"),
     _r_=new MlString("BUTTON"),
     _q_=new MlString("name"),
     _p_=[0,new MlString("lib_enyo.ml"),505,12],
     _o_=new MlString("_default_app_name"),
     _n_=new MlString("_default_app_name"),
     _m_=[0,new MlString("br")],
     _l_=[0,new MlString("width:30px; height:30px; background-color:gray")],
     _k_=[0,new MlString("span")],
     _j_=[0,new MlString("width:30px; height:30px; background-color:green")],
     _i_=[0,new MlString("width:30px; height:30px; background-color:blue")],
     _h_=[0,new MlString("stonehenge.ml"),20,9],
     board_game_g_=
      [0,
       0,
       [0,
        0,
        [0,
         0,
         [0,
          0,
          [0,
           0,
           [0,
            0,
            [0,
             3,
             [0,
              0,
              [0,
               3,
               [0,
                0,
                [0,
                 0,
                 [0,
                  0,
                  [0,
                   -1,
                   [0,
                    0,
                    [0,
                     0,
                     [0,
                      0,
                      [0,
                       3,
                       [0,
                        0,
                        [0,
                         2,
                         [0,
                          0,
                          [0,
                           2,
                           [0,
                            0,
                            [0,
                             3,
                             [0,
                              0,
                              [0,
                               0,
                               [0,
                                -1,
                                [0,
                                 0,
                                 [0,
                                  0,
                                  [0,
                                   3,
                                   [0,
                                    0,
                                    [0,
                                     2,
                                     [0,
                                      0,
                                      [0,
                                       2,
                                       [0,
                                        0,
                                        [0,
                                         2,
                                         [0,
                                          0,
                                          [0,
                                           3,
                                           [0,
                                            0,
                                            [0,
                                             -1,
                                             [0,
                                              0,
                                              [0,
                                               3,
                                               [0,
                                                0,
                                                [0,
                                                 2,
                                                 [0,
                                                  0,
                                                  [0,
                                                   2,
                                                   [0,
                                                    0,
                                                    [0,
                                                     2,
                                                     [0,
                                                      0,
                                                      [0,
                                                       2,
                                                       [0,
                                                        0,
                                                        [0,
                                                         3,
                                                         [0,
                                                          -1,
                                                          [0,
                                                           3,
                                                           [0,
                                                            0,
                                                            [0,
                                                             2,
                                                             [0,
                                                              0,
                                                              [0,
                                                               2,
                                                               [0,
                                                                0,
                                                                [0,
                                                                 2,
                                                                 [0,
                                                                  0,
                                                                  [0,
                                                                   2,
                                                                   [0,
                                                                    0,
                                                                    [0,
                                                                     2,
                                                                     [0,
                                                                      0,
                                                                      [0,
                                                                       -1,
                                                                       [0,
                                                                        0,
                                                                        [0,
                                                                         3,
                                                                         [0,
                                                                          0,
                                                                          [0,
                                                                           2,
                                                                           [0,
                                                                            0,
                                                                            [0,
                                                                             2,
                                                                             [0,
                                                                              0,
                                                                              [0,
                                                                               2,
                                                                               [0,
                                                                                0,
                                                                                [0,
                                                                                 2,
                                                                                 [0,
                                                                                  0,
                                                                                  [0,
                                                                                   3,
                                                                                   [0,
                                                                                    -1,
                                                                                    [0,
                                                                                     0,
                                                                                     [0,
                                                                                      0,
                                                                                      [0,
                                                                                       0,
                                                                                       [0,
                                                                                        0,
                                                                                        [0,3,[0,0,[0,3,[0,0,[0,3,[0,0,[0,3,[0,0,[0,-1,0]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]];
    function _f_(s_e_){throw [0,_a_,s_e_];}
    function do_at_exit_am_(param_al_)
     {var param_ai_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_ai_)
         {var l_aj_=param_ai_[2];
          try {}catch(_ak_){}
          var param_ai_=l_aj_;
          continue;}
        return 0;}}
    caml_register_named_value(_ah_,do_at_exit_am_);
    function _az_(l_an_)
     {if(l_an_)
       {var accu_ao_=0,param_ap_=l_an_,tl_av_=l_an_[2],hd_as_=l_an_[1];
        for(;;)
         {if(param_ap_)
           {var
             t_ar_=param_ap_[2],
             _aq_=accu_ao_+1|0,
             accu_ao_=_aq_,
             param_ap_=t_ar_;
            continue;}
          var a_at_=caml_make_vect(accu_ao_,hd_as_),i_au_=1,param_aw_=tl_av_;
          for(;;)
           {if(param_aw_)
             {var tl_ax_=param_aw_[2];
              a_at_[i_au_+1]=param_aw_[1];
              var _ay_=i_au_+1|0,i_au_=_ay_,param_aw_=tl_ax_;
              continue;}
            return a_at_;}}}
      return [0];}
    function _aE_(f_aB_,param_aA_)
     {if(param_aA_)
       {var l_aD_=param_aA_[2],r_aF_=_aC_(f_aB_,param_aA_[1]);
        return [0,r_aF_,_aE_(f_aB_,l_aD_)];}
      return 0;}
    function _aP_(f_aI_,param_aG_)
     {var param_aH_=param_aG_;
      for(;;)
       {if(param_aH_)
         {var l_aJ_=param_aH_[2];
          _aC_(f_aI_,param_aH_[1]);
          var param_aH_=l_aJ_;
          continue;}
        return 0;}}
    function _aM_(l1_aK_,l2_aL_)
     {if(l1_aK_)
       {if(l2_aL_)
         {var a2_aO_=l2_aL_[1],a1_aN_=l1_aK_[1];
          return [0,[0,a1_aN_,a2_aO_],_aM_(l1_aK_[2],l2_aL_[2])];}}
      else
       if(!l2_aL_)return 0;
      return _f_(_ag_);}
    var
     _aQ_=[0,0],
     undefined_aU_=undefined,
     _false_aT_=false,
     array_constructor_aS_=Array;
    function _aV_(e_aR_)
     {return e_aR_ instanceof array_constructor_aS_
              ?0
              :[0,new MlWrappedString(e_aR_.toString())];}
    _aQ_[1]=[0,_aV_,_aQ_[1]];
    var window_aW_=window;
    window.HTMLElement===undefined_aU_;
    function coerce_prop_aY_(param_aX_)
     {switch(param_aX_[0])
       {case 1:return param_aX_[1].toString();
        case 2:return param_aX_[1];
        case 3:return param_aX_[1];
        case 4:return param_aX_[1];
        case 5:return !!param_aX_[1];
        case 6:
         return caml_js_from_array(_az_(_aE_(coerce_prop_aY_,param_aX_[1])));
        case 7:return param_aX_[1];
        default:return param_aX_[1];}}
    function _bm_
     (_opt__aZ_,
      disabled_a3_,
      active_a4_,
      tag_a5_,
      classes_a6_,
      style_a7_,
      content_a8_,
      showing_a9_,
      allowHtml_a__,
      src_a$_,
      canGenerate_ba_,
      fit_bb_,
      isContainer_bc_,
      container_bd_,
      parent_be_,
      controlParentName_bf_,
      layoutKind_bg_,
      name_bh_,
      id_bi_,
      owner_bj_,
      ontap_bk_,
      param_bl_)
     {var
       components_a0_=_opt__aZ_?_opt__aZ_[1]:0,
       prop_list_a1_=[0,_M_],
       handler_list_a2_=[0,0];
      if(disabled_a3_)
       prop_list_a1_[1]=[0,[0,_L_,[5,disabled_a3_[1]]],prop_list_a1_[1]];
      if(active_a4_)
       prop_list_a1_[1]=[0,[0,_K_,[5,active_a4_[1]]],prop_list_a1_[1]];
      if(tag_a5_)prop_list_a1_[1]=[0,[0,_J_,[1,tag_a5_[1]]],prop_list_a1_[1]];
      if(classes_a6_)
       prop_list_a1_[1]=[0,[0,_I_,[1,classes_a6_[1]]],prop_list_a1_[1]];
      if(style_a7_)
       prop_list_a1_[1]=[0,[0,_H_,[1,style_a7_[1]]],prop_list_a1_[1]];
      if(content_a8_)
       prop_list_a1_[1]=[0,[0,_G_,[1,content_a8_[1]]],prop_list_a1_[1]];
      if(showing_a9_)
       prop_list_a1_[1]=[0,[0,_F_,[5,showing_a9_[1]]],prop_list_a1_[1]];
      if(allowHtml_a__)
       prop_list_a1_[1]=[0,[0,_E_,[5,allowHtml_a__[1]]],prop_list_a1_[1]];
      if(src_a$_)prop_list_a1_[1]=[0,[0,_D_,[1,src_a$_[1]]],prop_list_a1_[1]];
      if(canGenerate_ba_)
       prop_list_a1_[1]=[0,[0,_C_,[5,canGenerate_ba_[1]]],prop_list_a1_[1]];
      if(fit_bb_)prop_list_a1_[1]=[0,[0,_B_,[5,fit_bb_[1]]],prop_list_a1_[1]];
      if(isContainer_bc_)
       prop_list_a1_[1]=[0,[0,_A_,[5,isContainer_bc_[1]]],prop_list_a1_[1]];
      if(container_bd_)
       prop_list_a1_[1]=[0,[0,_z_,[7,container_bd_[1]]],prop_list_a1_[1]];
      if(parent_be_)
       prop_list_a1_[1]=[0,[0,_y_,[7,parent_be_[1]]],prop_list_a1_[1]];
      if(controlParentName_bf_)
       prop_list_a1_[1]=
       [0,[0,_x_,[1,controlParentName_bf_[1]]],prop_list_a1_[1]];
      if(layoutKind_bg_)
       prop_list_a1_[1]=[0,[0,_w_,[1,layoutKind_bg_[1]]],prop_list_a1_[1]];
      if(name_bh_)
       prop_list_a1_[1]=[0,[0,_v_,[1,name_bh_[1]]],prop_list_a1_[1]];
      if(id_bi_)prop_list_a1_[1]=[0,[0,_u_,[1,id_bi_[1]]],prop_list_a1_[1]];
      if(owner_bj_)
       prop_list_a1_[1]=[0,[0,_t_,[7,owner_bj_[1]]],prop_list_a1_[1]];
      if(ontap_bk_)
       handler_list_a2_[1]=[0,[0,_s_,ontap_bk_[1]],handler_list_a2_[1]];
      return [0,_r_,components_a0_,handler_list_a2_[1],prop_list_a1_[1]];}
    _aE_
     (function(param_bn_)
       {var _bo_=param_bn_+1|0;
        if(!(_bo_<0||4<_bo_))
         switch(_bo_)
          {case 1:
            return _bm_(0,0,0,_k_,0,_l_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
           case 2:break;
           case 3:return _bm_(0,0,0,0,0,_j_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
           case 4:return _bm_(0,0,0,0,0,_i_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
           default:return _bm_(0,0,0,_m_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);}
        throw [0,_c_,_h_];},
      board_game_g_);
    var
     _bp_=0,
     _bq_=0,
     _br_=0,
     _bs_=0,
     _bt_=0,
     _bu_=0,
     _bv_=0,
     _bw_=0,
     _bx_=0,
     _by_=0,
     _bz_=0,
     _bA_=0,
     _bB_=0,
     _bC_=0,
     _bD_=0,
     _bE_=0,
     _bF_=0,
     _bG_=0,
     components_bH_=_bG_?_bG_[1]:0,
     prop_list_bI_=[0,_ae_],
     handler_list_bJ_=[0,0];
    if(_bF_)prop_list_bI_[1]=[0,[0,_ad_,[1,_bF_[1]]],prop_list_bI_[1]];
    if(_bE_)prop_list_bI_[1]=[0,[0,_ac_,[1,_bE_[1]]],prop_list_bI_[1]];
    if(_bD_)prop_list_bI_[1]=[0,[0,_ab_,[1,_bD_[1]]],prop_list_bI_[1]];
    if(_bC_)prop_list_bI_[1]=[0,[0,_aa_,[1,_bC_[1]]],prop_list_bI_[1]];
    if(_bB_)prop_list_bI_[1]=[0,[0,_$_,[5,_bB_[1]]],prop_list_bI_[1]];
    if(_bA_)prop_list_bI_[1]=[0,[0,___,[5,_bA_[1]]],prop_list_bI_[1]];
    if(_bz_)prop_list_bI_[1]=[0,[0,_Z_,[1,_bz_[1]]],prop_list_bI_[1]];
    if(_by_)prop_list_bI_[1]=[0,[0,_Y_,[5,_by_[1]]],prop_list_bI_[1]];
    if(_bx_)prop_list_bI_[1]=[0,[0,_X_,[5,_bx_[1]]],prop_list_bI_[1]];
    if(_bw_)prop_list_bI_[1]=[0,[0,_W_,[5,_bw_[1]]],prop_list_bI_[1]];
    if(_bv_)prop_list_bI_[1]=[0,[0,_V_,[7,_bv_[1]]],prop_list_bI_[1]];
    if(_bu_)prop_list_bI_[1]=[0,[0,_U_,[7,_bu_[1]]],prop_list_bI_[1]];
    if(_bt_)prop_list_bI_[1]=[0,[0,_T_,[1,_bt_[1]]],prop_list_bI_[1]];
    if(_bs_)prop_list_bI_[1]=[0,[0,_S_,[1,_bs_[1]]],prop_list_bI_[1]];
    if(_br_)prop_list_bI_[1]=[0,[0,_R_,[1,_br_[1]]],prop_list_bI_[1]];
    if(_d_)prop_list_bI_[1]=[0,[0,_Q_,[1,_d_[1]]],prop_list_bI_[1]];
    if(_bq_)prop_list_bI_[1]=[0,[0,_P_,[7,_bq_[1]]],prop_list_bI_[1]];
    if(_bp_)handler_list_bJ_[1]=[0,[0,_O_,_bp_[1]],handler_list_bJ_[1]];
    var _bK_=[0,_N_,components_bH_,handler_list_bJ_[1],prop_list_bI_[1]];
    function build_component_tree_bQ_(kind_bM_)
     {var js_obj_bL_=new Object(),_bP_=kind_bM_[4];
      _aP_
       (function(param_bN_)
         {var x_bO_=param_bN_[1];
          return js_obj_bL_[x_bO_]=coerce_prop_aY_(param_bN_[2]);},
        _bP_);
      if(0!==kind_bM_[2])
       js_obj_bL_.components=
       caml_js_from_array(_az_(_aE_(build_component_tree_bQ_,kind_bM_[2])));
      if(0!==kind_bM_[3])
       {var
         _bS_=kind_bM_[3],
         handlers_name_bT_=
          _aE_(function(param_bR_){return param_bR_[1];},_bS_),
         handlers_name_func_b0_=
          _aE_
           (function(x_bU_)
             {var _bV_=x_bU_.getLen()-2|0,_bW_=2;
              if(0<=_bW_&&0<=_bV_&&!((x_bU_.getLen()-_bV_|0)<_bW_))
               {var r_bY_=caml_create_string(_bV_);
                caml_blit_string(x_bU_,_bW_,r_bY_,0,_bV_);
                var _bZ_=r_bY_,_bX_=1;}
              else
               var _bX_=0;
              if(!_bX_)var _bZ_=_f_(_af_);
              return _bZ_;},
            handlers_name_bT_),
         _b2_=kind_bM_[3],
         handlers_func_b4_=
          _aE_(function(param_b1_){return param_b1_[2];},_b2_),
         handler_obj_b3_=new Object(),
         _b6_=_aM_(handlers_name_bT_,handlers_name_func_b0_);
        _aP_
         (function(param_b5_)
           {return handler_obj_b3_[param_b5_[1]]=param_b5_[2].toString();},
          _b6_);
        js_obj_bL_.handlers=handler_obj_b3_;
        var _b8_=_aM_(handlers_name_func_b0_,handlers_func_b4_);
        _aP_
         (function(param_b7_)
           {return js_obj_bL_[param_b7_[1]]=
                   caml_js_wrap_meth_callback(param_b7_[2]);},
          _b8_);}
      js_obj_bL_._onyo_id=kind_bM_[1].toString();
      return js_obj_bL_;}
    var js_obj_b9_=build_component_tree_bQ_(_bK_);
    try
     {var param_b__=_bK_[4];
      for(;;)
       {if(!param_b__)throw [0,_b_];
        var match_b$_=param_b__[1],b_ca_=match_b$_[2],l_cb_=param_b__[2];
        if(0!==caml_compare(match_b$_[1],_q_)){var param_b__=l_cb_;continue;}
        if(1!==b_ca_[0])throw [0,_c_,_p_];
        var s_cc_=b_ca_[1],name_cd_=s_cc_;
        break;}}
    catch(_ce_)
     {if(_ce_[1]!==_b_)throw _ce_;
      js_obj_b9_.name=_o_.toString();
      var name_cd_=_n_;}
    enyo.kind(js_obj_b9_);
    var enyo_js_object_cf_=new (caml_js_var(name_cd_))();
    function _ch_(param_cg_)
     {enyo_js_object_cf_.renderInto(document.body);return _false_aT_;}
    window_aW_.onload=
    caml_js_wrap_callback
     (function(e_ci_)
       {if(e_ci_)
         {var res_cj_=_ch_(e_ci_);
          if(!(res_cj_|0))e_ci_.preventDefault();
          return res_cj_;}
        var _ck_=event,res_cl_=_ch_(_ck_);
        _ck_.returnValue=res_cl_;
        return res_cl_;});
    do_at_exit_am_(0);
    return;}
  ());
