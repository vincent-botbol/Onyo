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
function caml_parse_format (fmt) {
  fmt = fmt.toString ();
  var len = fmt.length;
  if (len > 31) caml_invalid_argument("format_int: format too long");
  var f =
    { justify:'+', signstyle:'-', filler:' ', alternate:false,
      base:0, signedconv:false, width:0, uppercase:false,
      sign:1, prec:-1, conv:'f' };
  for (var i = 0; i < len; i++) {
    var c = fmt.charAt(i);
    switch (c) {
    case '-':
      f.justify = '-'; break;
    case '+': case ' ':
      f.signstyle = c; break;
    case '0':
      f.filler = '0'; break;
    case '#':
      f.alternate = true; break;
    case '1': case '2': case '3': case '4': case '5':
    case '6': case '7': case '8': case '9':
      f.width = 0;
      while (c=fmt.charCodeAt(i) - 48, c >= 0 && c <= 9) {
        f.width = f.width * 10 + c; i++
      }
      i--;
     break;
    case '.':
      f.prec = 0;
      i++;
      while (c=fmt.charCodeAt(i) - 48, c >= 0 && c <= 9) {
        f.prec = f.prec * 10 + c; i++
      }
      i--;
    case 'd': case 'i':
      f.signedconv = true; /* fallthrough */
    case 'u':
      f.base = 10; break;
    case 'x':
      f.base = 16; break;
    case 'X':
      f.base = 16; f.uppercase = true; break;
    case 'o':
      f.base = 8; break;
    case 'e': case 'f': case 'g':
      f.signedconv = true; f.conv = c; break;
    case 'E': case 'F': case 'G':
      f.signedconv = true; f.uppercase = true;
      f.conv = c.toLowerCase (); break;
    }
  }
  return f;
}
function caml_finish_formatting(f, rawbuffer) {
  if (f.uppercase) rawbuffer = rawbuffer.toUpperCase();
  var len = rawbuffer.length;
  if (f.signedconv && (f.sign < 0 || f.signstyle != '-')) len++;
  if (f.alternate) {
    if (f.base == 8) len += 1;
    if (f.base == 16) len += 2;
  }
  var buffer = "";
  if (f.justify == '+' && f.filler == ' ')
    for (var i = len; i < f.width; i++) buffer += ' ';
  if (f.signedconv) {
    if (f.sign < 0) buffer += '-';
    else if (f.signstyle != '-') buffer += f.signstyle;
  }
  if (f.alternate && f.base == 8) buffer += '0';
  if (f.alternate && f.base == 16) buffer += "0x";
  if (f.justify == '+' && f.filler == '0')
    for (var i = len; i < f.width; i++) buffer += '0';
  buffer += rawbuffer;
  if (f.justify == '-')
    for (var i = len; i < f.width; i++) buffer += ' ';
  return new MlWrappedString (buffer);
}
function caml_format_int(fmt, i) {
  if (fmt.toString() == "%d") return new MlWrappedString(""+i);
  var f = caml_parse_format(fmt);
  if (i < 0) { if (f.signedconv) { f.sign = -1; i = -i; } else i >>>= 0; }
  var s = i.toString(f.base);
  if (f.prec >= 0) {
    f.filler = ' ';
    var n = f.prec - s.length;
    if (n > 0) s = caml_str_repeat (n, '0') + s;
  }
  return caml_finish_formatting(f, s);
}
function caml_greaterequal (x, y) { return +(caml_compare(x,y,false) >= 0); }
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
function caml_lessequal (x, y) { return +(caml_compare(x,y,false) <= 0); }
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
   {function _hk_(_iZ_,_i0_,_i1_,_i2_)
     {return _iZ_.length==3
              ?_iZ_(_i0_,_i1_,_i2_)
              :caml_call_gen(_iZ_,[_i0_,_i1_,_i2_]);}
    function _b3_(_iW_,_iX_,_iY_)
     {return _iW_.length==2?_iW_(_iX_,_iY_):caml_call_gen(_iW_,[_iX_,_iY_]);}
    function _bQ_(_iU_,_iV_)
     {return _iU_.length==1?_iU_(_iV_):caml_call_gen(_iU_,[_iV_]);}
    var
     _a_=[0,new MlString("Failure")],
     _b_=[0,new MlString("Invalid_argument")],
     _c_=[0,new MlString("Not_found")],
     lp_d_=[0,6,[0,5,[0,4,[0,3,[0,3,[0,2,[0,2,[0,1,[0,1,0]]]]]]]]],
     lignes_e_=
      [0,
       [0,0,[0,1,0]],
       [0,
        [0,2,[0,3,[0,4,0]]],
        [0,
         [0,5,[0,6,[0,7,[0,8,0]]]],
         [0,
          [0,9,[0,10,[0,11,[0,12,[0,13,0]]]]],
          [0,
           [0,14,[0,15,[0,16,[0,17,0]]]],
           [0,
            [0,0,[0,2,[0,5,[0,9,0]]]],
            [0,
             [0,1,[0,3,[0,6,[0,10,[0,14,0]]]]],
             [0,
              [0,4,[0,7,[0,11,[0,15,0]]]],
              [0,
               [0,8,[0,12,[0,16,0]]],
               [0,
                [0,13,[0,17,0]],
                [0,
                 [0,9,[0,14,0]],
                 [0,
                  [0,5,[0,10,[0,15,0]]],
                  [0,
                   [0,2,[0,6,[0,11,[0,16,0]]]],
                   [0,
                    [0,0,[0,3,[0,7,[0,12,[0,17,0]]]]],
                    [0,[0,1,[0,4,[0,8,[0,13,0]]]],0]]]]]]]]]]]]]]],
     _f_=[0,new MlString("valider")];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_b_);
    caml_register_global(2,_a_);
    var
     _aW_=[0,new MlString("Assert_failure")],
     _aV_=new MlString("%d"),
     _aU_=new MlString("Pervasives.do_at_exit"),
     _aT_=new MlString("List.combine"),
     _aS_=new MlString("nth"),
     _aR_=new MlString("List.nth"),
     _aQ_=new MlString("String.sub"),
     _aP_=[0,[0,new MlString("kind"),[1,new MlString("Control")]],0],
     _aO_=new MlString("tag"),
     _aN_=new MlString("classes"),
     _aM_=new MlString("style"),
     _aL_=new MlString("content"),
     _aK_=new MlString("showing"),
     _aJ_=new MlString("allowHtml"),
     _aI_=new MlString("src"),
     _aH_=new MlString("canGenerate"),
     _aG_=new MlString("fit"),
     _aF_=new MlString("isContainer"),
     _aE_=new MlString("container"),
     _aD_=new MlString("parent"),
     _aC_=new MlString("controlParentName"),
     _aB_=new MlString("layoutKind"),
     _aA_=new MlString("name"),
     _az_=new MlString("id"),
     _ay_=new MlString("owner"),
     _ax_=new MlString("ontap"),
     _aw_=new MlString("CONTROL"),
     _av_=[0,[0,new MlString("kind"),[1,new MlString("Button")]],0],
     _au_=new MlString("disabled"),
     _at_=new MlString("active"),
     _as_=new MlString("tag"),
     _ar_=new MlString("classes"),
     _aq_=new MlString("style"),
     _ap_=new MlString("content"),
     _ao_=new MlString("showing"),
     _an_=new MlString("allowHtml"),
     _am_=new MlString("src"),
     _al_=new MlString("canGenerate"),
     _ak_=new MlString("fit"),
     _aj_=new MlString("isContainer"),
     _ai_=new MlString("container"),
     _ah_=new MlString("parent"),
     _ag_=new MlString("controlParentName"),
     _af_=new MlString("layoutKind"),
     _ae_=new MlString("name"),
     _ad_=new MlString("id"),
     _ac_=new MlString("owner"),
     _ab_=new MlString("ontap"),
     _aa_=new MlString("BUTTON"),
     _$_=[0,[0,new MlString("kind"),[1,new MlString("onyx.Toolbar")]],0],
     ___=new MlString("tag"),
     _Z_=new MlString("classes"),
     _Y_=new MlString("style"),
     _X_=new MlString("content"),
     _W_=new MlString("showing"),
     _V_=new MlString("allowHtml"),
     _U_=new MlString("src"),
     _T_=new MlString("canGenerate"),
     _S_=new MlString("fit"),
     _R_=new MlString("isContainer"),
     _Q_=new MlString("container"),
     _P_=new MlString("parent"),
     _O_=new MlString("controlParentName"),
     _N_=new MlString("layoutKind"),
     _M_=new MlString("name"),
     _L_=new MlString("id"),
     _K_=new MlString("owner"),
     _J_=new MlString("ontap"),
     _I_=new MlString("ONYX.TOOLBAR"),
     _H_=new MlString("name"),
     _G_=[0,new MlString("lib_enyo.ml"),2078,12],
     _F_=new MlString("_default_app_name"),
     _E_=new MlString("_default_app_name"),
     _D_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Gagne"),
     _C_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Perd"),
     _B_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Nul"),
     _A_=new MlString(" non trouve'"),
     _z_=new MlString("AB: "),
     _y_=new MlString("AB: longueur diff"),
     _x_=new MlString("Alphabeta.FAlphabetaO(Rep)(Eval).AlphaCoupure"),
     _w_=new MlString("Alphabeta.FAlphabetaO(Rep)(Eval).BetaCoupure"),
     _v_=new MlString("joueur"),
     _u_=new MlString("quel_menhir"),
     _t_=[0,1,[0,-1]],
     _s_=new MlString("Encore une partie ?"),
     _r_=new MlString("Est-ce une machine qui joue?"),
     _q_=new MlString("Partie nulle"),
     _p_=new MlString("La machine a perdu"),
     _o_=new MlString("La machine a gagn\xc3\xa9"),
     _n_=[0,new MlString("blibli")];
    function _m_(s_g_){throw [0,_a_,s_g_];}
    function _aX_(s_h_){throw [0,_b_,s_h_];}
    function _aY_(x_j_,y_i_){return caml_lessequal(x_j_,y_i_)?x_j_:y_i_;}
    function _aZ_(x_l_,y_k_){return caml_greaterequal(x_l_,y_k_)?x_l_:y_k_;}
    function _bb_(s1_a0_,s2_a2_)
     {var
       l1_a1_=s1_a0_.getLen(),
       l2_a3_=s2_a2_.getLen(),
       s_a4_=caml_create_string(l1_a1_+l2_a3_|0);
      caml_blit_string(s1_a0_,0,s_a4_,0,l1_a1_);
      caml_blit_string(s2_a2_,0,s_a4_,l1_a1_,l2_a3_);
      return s_a4_;}
    function _a6_(l1_a5_,l2_a7_)
     {if(l1_a5_)
       {var hd_a8_=l1_a5_[1];return [0,hd_a8_,_a6_(l1_a5_[2],l2_a7_)];}
      return l2_a7_;}
    function do_at_exit_bc_(param_ba_)
     {var param_a9_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_a9_)
         {var l_a__=param_a9_[2];
          try {}catch(_a$_){}
          var param_a9_=l_a__;
          continue;}
        return 0;}}
    caml_register_named_value(_aU_,do_at_exit_bc_);
    function _bw_(a_bd_)
     {var l_be_=a_bd_.length-1;
      if(0===l_be_)return [0];
      var res_bf_=caml_make_vect(l_be_,a_bd_[0+1]),_bg_=1,_bh_=l_be_-1|0;
      if(!(_bh_<_bg_))
       {var i_bi_=_bg_;
        for(;;)
         {res_bf_[i_bi_+1]=a_bd_[i_bi_+1];
          var _bj_=i_bi_+1|0;
          if(_bh_!==i_bi_){var i_bi_=_bj_;continue;}
          break;}}
      return res_bf_;}
    function _bx_(l_bk_)
     {if(l_bk_)
       {var accu_bl_=0,param_bm_=l_bk_,tl_bs_=l_bk_[2],hd_bp_=l_bk_[1];
        for(;;)
         {if(param_bm_)
           {var
             t_bo_=param_bm_[2],
             _bn_=accu_bl_+1|0,
             accu_bl_=_bn_,
             param_bm_=t_bo_;
            continue;}
          var a_bq_=caml_make_vect(accu_bl_,hd_bp_),i_br_=1,param_bt_=tl_bs_;
          for(;;)
           {if(param_bt_)
             {var tl_bu_=param_bt_[2];
              a_bq_[i_br_+1]=param_bt_[1];
              var _bv_=i_br_+1|0,i_br_=_bv_,param_bt_=tl_bu_;
              continue;}
            return a_bq_;}}}
      return [0];}
    function _cn_(l_bz_,n_by_)
     {if(0<=n_by_)
       {var l_bA_=l_bz_,n_bB_=n_by_;
        for(;;)
         {if(l_bA_)
           {var l_bE_=l_bA_[2],a_bC_=l_bA_[1];
            if(0!==n_bB_){var _bF_=n_bB_-1|0,l_bA_=l_bE_,n_bB_=_bF_;continue;}
            var _bD_=a_bC_;}
          else
           var _bD_=_m_(_aS_);
          return _bD_;}}
      return _aX_(_aR_);}
    function _ch_(l_bG_)
     {var l1_bH_=l_bG_,l2_bI_=0;
      for(;;)
       {if(l1_bH_)
         {var
           l_bJ_=l1_bH_[2],
           _bK_=[0,l1_bH_[1],l2_bI_],
           l1_bH_=l_bJ_,
           l2_bI_=_bK_;
          continue;}
        return l2_bI_;}}
    function _bM_(param_bL_)
     {if(param_bL_)
       {var l_bN_=param_bL_[1];return _a6_(l_bN_,_bM_(param_bL_[2]));}
      return 0;}
    function _bS_(f_bP_,param_bO_)
     {if(param_bO_)
       {var l_bR_=param_bO_[2],r_bT_=_bQ_(f_bP_,param_bO_[1]);
        return [0,r_bT_,_bS_(f_bP_,l_bR_)];}
      return 0;}
    function _co_(f_bW_,param_bU_)
     {var param_bV_=param_bU_;
      for(;;)
       {if(param_bV_)
         {var l_bX_=param_bV_[2];
          _bQ_(f_bW_,param_bV_[1]);
          var param_bV_=l_bX_;
          continue;}
        return 0;}}
    function _cp_(f_b2_,accu_bY_,l_b0_)
     {var accu_bZ_=accu_bY_,l_b1_=l_b0_;
      for(;;)
       {if(l_b1_)
         {var
           l_b4_=l_b1_[2],
           _b5_=_b3_(f_b2_,accu_bZ_,l_b1_[1]),
           accu_bZ_=_b5_,
           l_b1_=l_b4_;
          continue;}
        return accu_bZ_;}}
    function _cq_(x_b8_,param_b6_)
     {var param_b7_=param_b6_;
      for(;;)
       {if(param_b7_)
         {var
           l_b9_=param_b7_[2],
           _b__=0===caml_compare(param_b7_[1],x_b8_)?1:0;
          if(_b__)return _b__;
          var param_b7_=l_b9_;
          continue;}
        return 0;}}
    function _cr_(p_cf_)
     {return _bQ_
              (function(accu_b$_,param_cb_)
                {var accu_ca_=accu_b$_,param_cc_=param_cb_;
                 for(;;)
                  {if(param_cc_)
                    {var l_cd_=param_cc_[2],x_ce_=param_cc_[1];
                     if(_bQ_(p_cf_,x_ce_))
                      {var _cg_=[0,x_ce_,accu_ca_],accu_ca_=_cg_,param_cc_=l_cd_;
                       continue;}
                     var param_cc_=l_cd_;
                     continue;}
                   return _ch_(accu_ca_);}},
               0);}
    function _ck_(l1_ci_,l2_cj_)
     {if(l1_ci_)
       {if(l2_cj_)
         {var a2_cm_=l2_cj_[1],a1_cl_=l1_ci_[1];
          return [0,[0,a1_cl_,a2_cm_],_ck_(l1_ci_[2],l2_cj_[2])];}}
      else
       if(!l2_cj_)return 0;
      return _aX_(_aT_);}
    var
     _cs_=[0,0],
     undefined_cw_=undefined,
     _false_cv_=false,
     array_constructor_cu_=Array;
    function _cx_(e_ct_)
     {return e_ct_ instanceof array_constructor_cu_
              ?0
              :[0,new MlWrappedString(e_ct_.toString())];}
    _cs_[1]=[0,_cx_,_cs_[1]];
    var window_cy_=window;
    window.HTMLElement===undefined_cw_;
    function coerce_prop_cA_(param_cz_)
     {switch(param_cz_[0])
       {case 1:return param_cz_[1].toString();
        case 2:return param_cz_[1];
        case 3:return param_cz_[1];
        case 4:return param_cz_[1];
        case 5:return !!param_cz_[1];
        case 6:
         return caml_js_from_array(_bx_(_bS_(coerce_prop_cA_,param_cz_[1])));
        case 7:return param_cz_[1];
        default:return param_cz_[1];}}
    function instanciate_dA_(kind_cZ_)
     {function build_component_tree_cG_(kind_cC_)
       {var js_obj_cB_=new Object(),_cF_=kind_cC_[4];
        _co_
         (function(param_cD_)
           {var x_cE_=param_cD_[1];
            return js_obj_cB_[x_cE_]=coerce_prop_cA_(param_cD_[2]);},
          _cF_);
        if(0!==kind_cC_[2])
         js_obj_cB_.components=
         caml_js_from_array(_bx_(_bS_(build_component_tree_cG_,kind_cC_[2])));
        if(0!==kind_cC_[3])
         {var
           _cI_=kind_cC_[3],
           handlers_name_cJ_=
            _bS_(function(param_cH_){return param_cH_[1];},_cI_),
           handlers_name_func_cQ_=
            _bS_
             (function(x_cK_)
               {var _cL_=x_cK_.getLen()-2|0,_cM_=2;
                if(0<=_cM_&&0<=_cL_&&!((x_cK_.getLen()-_cL_|0)<_cM_))
                 {var r_cO_=caml_create_string(_cL_);
                  caml_blit_string(x_cK_,_cM_,r_cO_,0,_cL_);
                  var _cP_=r_cO_,_cN_=1;}
                else
                 var _cN_=0;
                if(!_cN_)var _cP_=_aX_(_aQ_);
                return _cP_;},
              handlers_name_cJ_),
           _cS_=kind_cC_[3],
           handlers_func_cU_=
            _bS_(function(param_cR_){return param_cR_[2];},_cS_),
           handler_obj_cT_=new Object(),
           _cW_=_ck_(handlers_name_cJ_,handlers_name_func_cQ_);
          _co_
           (function(param_cV_)
             {return handler_obj_cT_[param_cV_[1]]=param_cV_[2].toString();},
            _cW_);
          js_obj_cB_.handlers=handler_obj_cT_;
          var _cY_=_ck_(handlers_name_func_cQ_,handlers_func_cU_);
          _co_
           (function(param_cX_)
             {return js_obj_cB_[param_cX_[1]]=
                     caml_js_wrap_meth_callback(param_cX_[2]);},
            _cY_);}
        js_obj_cB_._hidden_id=kind_cC_[1].toString();
        return js_obj_cB_;}
      var js_obj_c0_=build_component_tree_cG_(kind_cZ_);
      try
       {var param_c1_=kind_cZ_[4];
        for(;;)
         {if(!param_c1_)throw [0,_c_];
          var match_c2_=param_c1_[1],b_c3_=match_c2_[2],l_c4_=param_c1_[2];
          if(0!==caml_compare(match_c2_[1],_H_))
           {var param_c1_=l_c4_;continue;}
          if(1!==b_c3_[0])throw [0,_aW_,_G_];
          var s_c5_=b_c3_[1],name_c6_=s_c5_;
          break;}}
      catch(_c7_)
       {if(_c7_[1]!==_c_)throw _c7_;
        js_obj_c0_.name=_F_.toString();
        var name_c6_=_E_;}
      enyo.kind(js_obj_c0_);
      return new (caml_js_var(name_c6_))();}
    function _dB_(obj_js_c8_)
     {function _c__(param_c9_)
       {obj_js_c8_.renderInto(document.body);return _false_cv_;}
      return window_cy_.onload=
             caml_js_wrap_callback
              (function(e_c$_)
                {if(e_c$_)
                  {var res_da_=_c__(e_c$_);
                   if(!(res_da_|0))e_c$_.preventDefault();
                   return res_da_;}
                 var _db_=event,res_dc_=_c__(_db_);
                 _db_.returnValue=res_dc_;
                 return res_dc_;});}
    function _dC_
     (_opt__dd_,
      tag_dh_,
      classes_di_,
      style_dj_,
      content_dk_,
      showing_dl_,
      allowHtml_dm_,
      src_dn_,
      canGenerate_do_,
      fit_dp_,
      isContainer_dq_,
      container_dr_,
      parent_ds_,
      controlParentName_dt_,
      layoutKind_du_,
      name_dv_,
      id_dw_,
      owner_dx_,
      ontap_dy_,
      param_dz_)
     {var
       components_de_=_opt__dd_?_opt__dd_[1]:0,
       prop_list_df_=[0,_aP_],
       handler_list_dg_=[0,0];
      if(tag_dh_)
       prop_list_df_[1]=[0,[0,_aO_,[1,tag_dh_[1]]],prop_list_df_[1]];
      if(classes_di_)
       prop_list_df_[1]=[0,[0,_aN_,[1,classes_di_[1]]],prop_list_df_[1]];
      if(style_dj_)
       prop_list_df_[1]=[0,[0,_aM_,[1,style_dj_[1]]],prop_list_df_[1]];
      if(content_dk_)
       prop_list_df_[1]=[0,[0,_aL_,[1,content_dk_[1]]],prop_list_df_[1]];
      if(showing_dl_)
       prop_list_df_[1]=[0,[0,_aK_,[5,showing_dl_[1]]],prop_list_df_[1]];
      if(allowHtml_dm_)
       prop_list_df_[1]=[0,[0,_aJ_,[5,allowHtml_dm_[1]]],prop_list_df_[1]];
      if(src_dn_)
       prop_list_df_[1]=[0,[0,_aI_,[1,src_dn_[1]]],prop_list_df_[1]];
      if(canGenerate_do_)
       prop_list_df_[1]=[0,[0,_aH_,[5,canGenerate_do_[1]]],prop_list_df_[1]];
      if(fit_dp_)
       prop_list_df_[1]=[0,[0,_aG_,[5,fit_dp_[1]]],prop_list_df_[1]];
      if(isContainer_dq_)
       prop_list_df_[1]=[0,[0,_aF_,[5,isContainer_dq_[1]]],prop_list_df_[1]];
      if(container_dr_)
       prop_list_df_[1]=[0,[0,_aE_,[7,container_dr_[1]]],prop_list_df_[1]];
      if(parent_ds_)
       prop_list_df_[1]=[0,[0,_aD_,[7,parent_ds_[1]]],prop_list_df_[1]];
      if(controlParentName_dt_)
       prop_list_df_[1]=
       [0,[0,_aC_,[1,controlParentName_dt_[1]]],prop_list_df_[1]];
      if(layoutKind_du_)
       prop_list_df_[1]=[0,[0,_aB_,[1,layoutKind_du_[1]]],prop_list_df_[1]];
      if(name_dv_)
       prop_list_df_[1]=[0,[0,_aA_,[1,name_dv_[1]]],prop_list_df_[1]];
      if(id_dw_)prop_list_df_[1]=[0,[0,_az_,[1,id_dw_[1]]],prop_list_df_[1]];
      if(owner_dx_)
       prop_list_df_[1]=[0,[0,_ay_,[7,owner_dx_[1]]],prop_list_df_[1]];
      if(ontap_dy_)
       handler_list_dg_[1]=[0,[0,_ax_,ontap_dy_[1]],handler_list_dg_[1]];
      return [0,_aw_,components_de_,handler_list_dg_[1],prop_list_df_[1]];}
    function int_of_pierre_dE_(param_dD_){return param_dD_[1];}
    var
     vecteur_l_dF_=_bx_(lignes_e_),
     r_dG_=caml_make_vect(18,[0]),
     _dH_=0,
     _dI_=17,
     t_dN_=vecteur_l_dF_.length-1;
    if(!(_dI_<_dH_))
     {var i_dJ_=_dH_;
      for(;;)
       {var w_dK_=caml_make_vect(3,0),p_dL_=[0,0],_dM_=0,_dO_=t_dN_-1|0;
        if(!(_dO_<_dM_))
         {var j_dP_=_dM_;
          for(;;)
           {if(_cq_(i_dJ_,caml_array_get(vecteur_l_dF_,j_dP_)))
             {caml_array_set(w_dK_,p_dL_[1],j_dP_);p_dL_[1]+=1;}
            var _dQ_=j_dP_+1|0;
            if(_dO_!==j_dP_){var j_dP_=_dQ_;continue;}
            break;}}
        caml_array_set(r_dG_,i_dJ_,w_dK_);
        var _dR_=i_dJ_+1|0;
        if(_dI_!==i_dJ_){var i_dJ_=_dR_;continue;}
        break;}}
    var _dS_=0,_dT_=17,a_dW_=caml_make_vect(18,lignes_e_);
    if(!(_dT_<_dS_))
     {var i_dU_=_dS_;
      for(;;)
       {caml_array_set
         (a_dW_,
          i_dU_,
          _b3_
           (_cr_,
            function(i_dU_)
              {return function(t_dV_){return _cq_(i_dU_,t_dV_);};}
             (i_dU_),
            lignes_e_));
        var _dX_=i_dU_+1|0;
        if(_dT_!==i_dU_){var i_dU_=_dX_;continue;}
        break;}}
    function _fm_(param_d1_)
     {var _d0_=_bS_(function(x_dY_){return [0,x_dY_];},lp_d_);
      return [0,
              caml_make_vect(18,0),
              caml_make_vect(15,0),
              _bS_(function(x_dZ_){return [0,x_dZ_];},lp_d_),
              _d0_];}
    function _d6_(l_d2_)
     {var l_d3_=l_d2_;
      for(;;)
       {if(l_d3_)
         {var t_d4_=l_d3_[2],h_d5_=l_d3_[1];
          if(_cq_(h_d5_,t_d4_)){var l_d3_=t_d4_;continue;}
          return [0,h_d5_,_d6_(t_d4_)];}
        return 0;}}
    function _fn_(joueur_d8_,param_d7_)
     {var
       r2_d$_=param_d7_[4],
       r1_d9_=param_d7_[3],
       ca_ea_=param_d7_[1],
       r_d__=joueur_d8_?r1_d9_:r2_d$_;
      if(0===r_d__)return 0;
      var l_eb_=[0,0],_ec_=0,_ed_=17;
      if(!(_ed_<_ec_))
       {var i_ee_=_ec_;
        for(;;)
         {var
           _ef_=caml_array_get(ca_ea_,i_ee_),
           _eg_=_ef_?int_of_pierre_dE_(_ef_[2]):0;
          if(0===_eg_)l_eb_[1]=[0,i_ee_,l_eb_[1]];
          var _eh_=i_ee_+1|0;
          if(_ed_!==i_ee_){var i_ee_=_eh_;continue;}
          break;}}
      var _el_=l_eb_[1];
      return _bM_
              (_bS_
                (function(x_ej_)
                  {var _ek_=_ch_(_d6_(r_d__));
                   return _bS_(function(y_ei_){return [0,x_ej_,y_ei_];},_ek_);},
                 _el_));}
    function _eq_(caillou_ep_,l_em_)
     {if(l_em_)
       {var q_en_=l_em_[2],x_eo_=l_em_[1];
        return caml_equal(x_eo_,caillou_ep_)
                ?q_en_
                :[0,x_eo_,_eq_(caillou_ep_,q_en_)];}
      return 0;}
    function _e__(joueur_eu_,ligne_ez_,pos_es_)
     {var _ey_=0;
      return _cp_
              (function(x_ex_,y_er_)
                {var _et_=caml_array_get(pos_es_,y_er_);
                 if(_et_)
                  {var
                    p_ev_=_et_[2],
                    _ew_=
                     caml_equal(_et_[1],joueur_eu_)?int_of_pierre_dE_(p_ev_):0;}
                 else
                  var _ew_=0;
                 return x_ex_+_ew_|0;},
               _ey_,
               ligne_ez_);}
    function _eC_(n_eB_,param_eA_)
     {if(param_eA_)
       {var q_eD_=param_eA_[2],t_eE_=param_eA_[1];
        if(0<n_eB_)
         {var _eF_=_eC_(n_eB_-1|0,q_eD_);
          return int_of_pierre_dE_(t_eE_)+_eF_|0;}
        return 0;}
      return 0;}
    function _eK_(ca_eJ_,l_eG_)
     {var l_eH_=l_eG_;
      for(;;)
       {if(l_eH_)
         {var q_eI_=l_eH_[2];
          if(caml_array_get(ca_eJ_,l_eH_[1])){var l_eH_=q_eI_;continue;}
          return 1+_eK_(ca_eJ_,q_eI_)|0;}
        return 0;}}
    function _e8_(i_eL_,ma_eM_){return caml_array_get(ma_eM_,i_eL_)?1:0;}
    function _e9_(l_eN_,ca_eO_){return 0===_eK_(ca_eO_,l_eN_)?1:0;}
    function _fo_(joueur_eV_,coup_eP_,jeu_eS_)
     {var
       i_eQ_=coup_eP_[2],
       c_eR_=coup_eP_[1],
       r2_eT_=jeu_eS_[4],
       r1_eU_=jeu_eS_[3],
       m_eY_=jeu_eS_[2],
       p_eX_=jeu_eS_[1],
       match_eW_=
        joueur_eV_?[0,_eq_(i_eQ_,r1_eU_),r2_eT_]:[0,r1_eU_,_eq_(i_eQ_,r2_eT_)],
       nr2_eZ_=match_eW_[2],
       nr1_e0_=match_eW_[1],
       _e1_=_bw_(p_eX_),
       _e2_=_bw_(m_eY_);
      caml_array_set(_e1_,c_eR_,[0,joueur_eV_,i_eQ_]);
      var _e3_=0,_e4_=2,lignes_de_la_case_e6_=caml_array_get(r_dG_,c_eR_);
      if(!(_e4_<_e3_))
       {var k_e5_=_e3_;
        for(;;)
         {var l_e7_=caml_array_get(lignes_de_la_case_e6_,k_e5_);
          if
           (!_e8_(l_e7_,_e2_)&&_e9_(caml_array_get(vecteur_l_dF_,l_e7_),_e1_))
           {var
             c1_e$_=_e__(joueur_eV_,caml_array_get(vecteur_l_dF_,l_e7_),_e1_),
             c2_fa_=
              _e__(1-joueur_eV_,caml_array_get(vecteur_l_dF_,l_e7_),_e1_);
            if(c2_fa_<c1_e$_)
             caml_array_set(_e2_,l_e7_,[0,joueur_eV_]);
            else
             if(c1_e$_<c2_fa_)
              caml_array_set(_e2_,l_e7_,[0,1-joueur_eV_]);
             else
              caml_array_set(_e2_,l_e7_,[0,1-joueur_eV_]);}
          var _fb_=k_e5_+1|0;
          if(_e4_!==k_e5_){var k_e5_=_fb_;continue;}
          break;}}
      var _fc_=0,_fd_=14;
      if(!(_fd_<_fc_))
       {var k_fe_=_fc_;
        for(;;)
         {if(!_e8_(k_fe_,_e2_))
           if(_e9_(caml_array_get(vecteur_l_dF_,k_fe_),_e1_))
            _m_(_v_);
           else
            {var
              c1_ff_=_e__(joueur_eV_,caml_array_get(vecteur_l_dF_,k_fe_),_e1_),
              c2_fg_=
               _e__(1-joueur_eV_,caml_array_get(vecteur_l_dF_,k_fe_),_e1_),
              cases_libres_fh_=_eK_(_e1_,caml_array_get(vecteur_l_dF_,k_fe_)),
              _fi_=joueur_eV_?nr1_e0_:nr2_eZ_,
              _fk_=_eC_(cases_libres_fh_,_fi_),
              _fj_=joueur_eV_?nr2_eZ_:nr1_e0_;
             if((c2_fg_+_eC_(cases_libres_fh_,_fj_)|0)<=c1_ff_)
              caml_array_set(_e2_,k_fe_,[0,joueur_eV_]);
             else
              if((c1_ff_+_fk_|0)<=c2_fg_)
               caml_array_set(_e2_,k_fe_,[0,1-joueur_eV_]);}
          var _fl_=k_fe_+1|0;
          if(_fd_!==k_fe_){var k_fe_=_fl_;continue;}
          break;}}
      return [0,_e1_,_e2_,nr1_e0_,nr2_eZ_];}
    var _fp_=1000,_fq_=-1000;
    function _fs_(lig_fr_)
     {if(lig_fr_)
       {var t_ft_=lig_fr_[1],_fu_=_fs_(lig_fr_[2]);
        return int_of_pierre_dE_(t_ft_)+_fu_|0;}
      return 0;}
    function _fM_(joueur_fL_,jeu_fv_)
     {var
       m_fw_=jeu_fv_[2],
       _fx_=[0,0],
       _fy_=[0,0],
       _fz_=0,
       _fA_=14,
       r2_fG_=jeu_fv_[4],
       r1_fF_=jeu_fv_[3];
      if(!(_fA_<_fz_))
       {var i_fB_=_fz_;
        for(;;)
         {if(_e8_(i_fB_,m_fw_))
           {var _fC_=caml_array_get(m_fw_,i_fB_),_fD_=_fC_?_fC_[1]:_m_(_u_);
            if(_fD_)_fy_[1]+=1;else _fx_[1]+=1;}
          var _fE_=i_fB_+1|0;
          if(_fA_!==i_fB_){var i_fB_=_fE_;continue;}
          break;}}
      var _fH_=_fx_[1],_fI_=_fy_[1],_fJ_=_fs_(r2_fG_),_fK_=_fs_(r1_fF_);
      return 0===joueur_fL_
              ?7<_fH_?_fq_:(50*(_fI_-_fH_|0)|0)+(10*(_fK_-_fJ_|0)|0)|0
              :7<_fI_?_fp_:(50*(_fI_-_fH_|0)|0)+(10*(_fK_-_fJ_|0)|0)|0;}
    function _fY_(joueur_fO_,jeu_fN_)
     {var v_fP_=_fM_(joueur_fO_,jeu_fN_),_fQ_=v_fP_===_fp_?1:0;
      if(_fQ_)
       var _fR_=_fQ_;
      else
       {var
         _fS_=v_fP_===_fq_?1:0,
         _fR_=_fS_?_fS_:0===_fn_(joueur_fO_,jeu_fN_)?1:0;}
      return _fR_;}
    function _fZ_(joueur_fT_,jeu_fU_){return 1;}
    function _f4_(joueur_fW_,m_fV_)
     {var v_fX_=_fM_(joueur_fW_,m_fV_);
      return v_fX_===_fp_
              ?joueur_fW_?0:1
              :v_fX_===_fq_?joueur_fW_?1:0:0===_fn_(joueur_fW_,m_fV_)?2:3;}
    function _f3_(this_f0_,param_f1_,_f2_){return 1;}
    var
     _f5_=0,
     _f6_=0,
     _f7_=0,
     _f8_=0,
     _f9_=0,
     _f__=0,
     _f$_=0,
     _ga_=0,
     _gb_=0,
     _gc_=0,
     _gd_=0,
     _ge_=0,
     _gf_=0,
     _gg_=0,
     _gh_=0,
     _gi_=0,
     _gj_=0,
     _gk_=0,
     _gl_=0,
     _gn_=[0,_f3_],
     components_gm_=_gl_?_gl_[1]:0,
     prop_list_go_=[0,_av_],
     handler_list_gp_=[0,0];
    if(_gk_)prop_list_go_[1]=[0,[0,_au_,[5,_gk_[1]]],prop_list_go_[1]];
    if(_gj_)prop_list_go_[1]=[0,[0,_at_,[5,_gj_[1]]],prop_list_go_[1]];
    if(_gi_)prop_list_go_[1]=[0,[0,_as_,[1,_gi_[1]]],prop_list_go_[1]];
    if(_gh_)prop_list_go_[1]=[0,[0,_ar_,[1,_gh_[1]]],prop_list_go_[1]];
    if(_gg_)prop_list_go_[1]=[0,[0,_aq_,[1,_gg_[1]]],prop_list_go_[1]];
    if(_f_)prop_list_go_[1]=[0,[0,_ap_,[1,_f_[1]]],prop_list_go_[1]];
    if(_gf_)prop_list_go_[1]=[0,[0,_ao_,[5,_gf_[1]]],prop_list_go_[1]];
    if(_ge_)prop_list_go_[1]=[0,[0,_an_,[5,_ge_[1]]],prop_list_go_[1]];
    if(_gd_)prop_list_go_[1]=[0,[0,_am_,[1,_gd_[1]]],prop_list_go_[1]];
    if(_gc_)prop_list_go_[1]=[0,[0,_al_,[5,_gc_[1]]],prop_list_go_[1]];
    if(_gb_)prop_list_go_[1]=[0,[0,_ak_,[5,_gb_[1]]],prop_list_go_[1]];
    if(_ga_)prop_list_go_[1]=[0,[0,_aj_,[5,_ga_[1]]],prop_list_go_[1]];
    if(_f$_)prop_list_go_[1]=[0,[0,_ai_,[7,_f$_[1]]],prop_list_go_[1]];
    if(_f__)prop_list_go_[1]=[0,[0,_ah_,[7,_f__[1]]],prop_list_go_[1]];
    if(_f9_)prop_list_go_[1]=[0,[0,_ag_,[1,_f9_[1]]],prop_list_go_[1]];
    if(_f8_)prop_list_go_[1]=[0,[0,_af_,[1,_f8_[1]]],prop_list_go_[1]];
    if(_f7_)prop_list_go_[1]=[0,[0,_ae_,[1,_f7_[1]]],prop_list_go_[1]];
    if(_f6_)prop_list_go_[1]=[0,[0,_ad_,[1,_f6_[1]]],prop_list_go_[1]];
    if(_f5_)prop_list_go_[1]=[0,[0,_ac_,[7,_f5_[1]]],prop_list_go_[1]];
    if(_gn_)handler_list_gp_[1]=[0,[0,_ab_,_f3_],handler_list_gp_[1]];
    var
     _gq_=0,
     _gr_=0,
     _gs_=0,
     _gt_=0,
     _gu_=0,
     _gv_=0,
     _gw_=0,
     _gx_=0,
     _gy_=0,
     _gz_=0,
     _gA_=0,
     _gB_=0,
     _gC_=0,
     _gD_=0,
     _gE_=0,
     _gF_=0,
     _gG_=0,
     _gH_=0,
     _gI_=[0,[0,_aa_,components_gm_,handler_list_gp_[1],prop_list_go_[1]],0],
     components_gJ_=[0,_gI_]?_gI_:0,
     prop_list_gK_=[0,_$_],
     handler_list_gL_=[0,0];
    if(_gH_)prop_list_gK_[1]=[0,[0,___,[1,_gH_[1]]],prop_list_gK_[1]];
    if(_gG_)prop_list_gK_[1]=[0,[0,_Z_,[1,_gG_[1]]],prop_list_gK_[1]];
    if(_gF_)prop_list_gK_[1]=[0,[0,_Y_,[1,_gF_[1]]],prop_list_gK_[1]];
    if(_gE_)prop_list_gK_[1]=[0,[0,_X_,[1,_gE_[1]]],prop_list_gK_[1]];
    if(_gD_)prop_list_gK_[1]=[0,[0,_W_,[5,_gD_[1]]],prop_list_gK_[1]];
    if(_gC_)prop_list_gK_[1]=[0,[0,_V_,[5,_gC_[1]]],prop_list_gK_[1]];
    if(_gB_)prop_list_gK_[1]=[0,[0,_U_,[1,_gB_[1]]],prop_list_gK_[1]];
    if(_gA_)prop_list_gK_[1]=[0,[0,_T_,[5,_gA_[1]]],prop_list_gK_[1]];
    if(_gz_)prop_list_gK_[1]=[0,[0,_S_,[5,_gz_[1]]],prop_list_gK_[1]];
    if(_gy_)prop_list_gK_[1]=[0,[0,_R_,[5,_gy_[1]]],prop_list_gK_[1]];
    if(_gx_)prop_list_gK_[1]=[0,[0,_Q_,[7,_gx_[1]]],prop_list_gK_[1]];
    if(_gw_)prop_list_gK_[1]=[0,[0,_P_,[7,_gw_[1]]],prop_list_gK_[1]];
    if(_gv_)prop_list_gK_[1]=[0,[0,_O_,[1,_gv_[1]]],prop_list_gK_[1]];
    if(_gu_)prop_list_gK_[1]=[0,[0,_N_,[1,_gu_[1]]],prop_list_gK_[1]];
    if(_gt_)prop_list_gK_[1]=[0,[0,_M_,[1,_gt_[1]]],prop_list_gK_[1]];
    if(_gs_)prop_list_gK_[1]=[0,[0,_L_,[1,_gs_[1]]],prop_list_gK_[1]];
    if(_gr_)prop_list_gK_[1]=[0,[0,_K_,[7,_gr_[1]]],prop_list_gK_[1]];
    if(_gq_)handler_list_gL_[1]=[0,[0,_J_,_gq_[1]],handler_list_gL_[1]];
    var
     _gM_=[0,_I_,components_gJ_,handler_list_gL_[1],prop_list_gK_[1]],
     _gN_=
      _dC_
       ([0,[0,_gM_,[0,_dC_(0,0,0,0,_n_,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),0]]],
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
        0,
        0);
    function _g6_(param_gO_){return 0;}
    function _g1_(str_gP_){return confirm(str_gP_.toString())|0;}
    function _gS_(str_gQ_){alert(str_gQ_.toString());return 0;}
    function _g7_(param_gR_){return 0;}
    function _g8_(param_gT_){return _gS_(_o_);}
    function _g9_(param_gU_){return _gS_(_p_);}
    function _g__(param_gV_){return _gS_(_q_);}
    function _ha_(param_gW_){return _dB_(instanciate_dA_(_gN_));}
    function _g$_(joueur_gX_,coup_gY_,ancien_jeu_gZ_,nouveau_jeu_g0_)
     {return _dB_(instanciate_dA_(_gN_));}
    function _hb_(param_g2_){return _g1_(_r_);}
    function _hc_(param_g3_){return _g1_(_s_);}
    var _hd_=[0,_x_],_he_=[0,_w_];
    function _ig_(joueur_g4_,jeu_g5_){return _t_;}
    function _hx_(noeud_hf_,minmax_cur_hj_,beta_hi_,alpha_hh_,cp_hg_)
     {var
       alpha_resu_hl_=
        _aZ_
         (alpha_hh_,
          _hk_(minmax_cur_hj_,_fo_(1,cp_hg_,noeud_hf_),beta_hi_,alpha_hh_));
      if(beta_hi_<=alpha_resu_hl_)throw [0,_he_,alpha_resu_hl_];
      return alpha_resu_hl_;}
    function _hH_(noeud_hm_,maxmin_cur_hq_,alpha_hp_,beta_ho_,cp_hn_)
     {var
       beta_resu_hr_=
        _aY_
         (beta_ho_,
          _hk_(maxmin_cur_hq_,_fo_(0,cp_hn_,noeud_hm_),alpha_hp_,beta_ho_));
      if(beta_resu_hr_<=alpha_hp_)throw [0,_hd_,beta_resu_hr_];
      return beta_resu_hr_;}
    function _hF_(prof_hs_,noeud_hu_,alpha_hz_,beta_hw_)
     {var _ht_=1<=prof_hs_?0:_fZ_(1,noeud_hu_)?1:0;
      if(!_ht_&&!_fY_(1,noeud_hu_))
       {try
         {var
           prev_hy_=_hk_(_hx_,noeud_hu_,_bQ_(_hv_,prof_hs_-1|0),beta_hw_),
           _hA_=_cp_(prev_hy_,alpha_hz_,_fn_(1,noeud_hu_));}
        catch(_hB_){if(_hB_[1]===_he_)return _hB_[2];throw _hB_;}
        return _hA_;}
      return _fM_(1,noeud_hu_);}
    function _hv_(prof_hC_,noeud_hE_,beta_hJ_,alpha_hG_)
     {var _hD_=1<=prof_hC_?0:_fZ_(0,noeud_hE_)?1:0;
      if(!_hD_&&!_fY_(0,noeud_hE_))
       {try
         {var
           prev_hI_=_hk_(_hH_,noeud_hE_,_bQ_(_hF_,prof_hC_-1|0),alpha_hG_),
           _hK_=_cp_(prev_hI_,beta_hJ_,_fn_(0,noeud_hE_));}
        catch(_hL_){if(_hL_[1]===_hd_)return _hL_[2];throw _hL_;}
        return _hK_;}
      return _fM_(0,noeud_hE_);}
    function _if_(a_hQ_,l1_hM_,l2_hO_)
     {var l1_hN_=l1_hM_,l2_hP_=l2_hO_;
      for(;;)
       {if(l1_hN_)
         {if(l2_hP_)
           {var q2_hT_=l2_hP_[2],h2_hR_=l2_hP_[1],q1_hS_=l1_hN_[2];
            if(a_hQ_===l1_hN_[1])return h2_hR_;
            var l1_hN_=q1_hS_,l2_hP_=q2_hT_;
            continue;}}
        else
         if(!l2_hP_)
          return _m_(_bb_(_z_,_bb_(caml_format_int(_aV_,a_hQ_),_A_)));
        return _m_(_y_);}}
    var
     _iG_=
      [0,
       function(prof_h8_,joueur_hY_,racine_hX_)
        {var
          alpha_hU_=[0,_fq_],
          beta_hV_=[0,_fp_],
          l_hW_=[0,0],
          cpl_hZ_=_fn_(joueur_hY_,racine_hX_);
         try
          {var _h0_=0,len_h1_=0,param_h2_=cpl_hZ_;
           for(;;)
            {if(param_h2_)
              {var
                l_h4_=param_h2_[2],
                _h3_=len_h1_+1|0,
                len_h1_=_h3_,
                param_h2_=l_h4_;
               continue;}
             var _h5_=len_h1_-1|0;
             if(!(_h5_<_h0_))
              {var i_h6_=_h0_;
               for(;;)
                {if(joueur_hY_)
                  {var
                    b_h7_=_fo_(joueur_hY_,_cn_(cpl_hZ_,i_h6_),racine_hX_),
                    a_h9_=_hv_(prof_h8_-1|0,b_h7_,beta_hV_[1],alpha_hU_[1]);
                   l_hW_[1]=[0,a_h9_,l_hW_[1]];
                   alpha_hU_[1]=_aZ_(alpha_hU_[1],a_h9_);
                   if(beta_hV_[1]<=alpha_hU_[1])throw [0,_he_,alpha_hU_[1]];}
                 else
                  {var
                    a_h__=_fo_(joueur_hY_,_cn_(cpl_hZ_,i_h6_),racine_hX_),
                    b_h$_=_hF_(prof_h8_-1|0,a_h__,alpha_hU_[1],beta_hV_[1]);
                   l_hW_[1]=[0,b_h$_,l_hW_[1]];
                   beta_hV_[1]=_aY_(beta_hV_[1],b_h$_);
                   if(beta_hV_[1]<=alpha_hU_[1])throw [0,_hd_,beta_hV_[1]];}
                 var _ia_=i_h6_+1|0;
                 if(_h5_!==i_h6_){var i_h6_=_ia_;continue;}
                 break;}}
             var _ib_=joueur_hY_?alpha_hU_[1]:beta_hV_[1],eval_ic_=_ib_;
             break;}}
         catch(_id_)
          {if(_id_[1]===_he_)
            var _ie_=_id_[2];
           else
            {if(_id_[1]!==_hd_)throw _id_;var _ie_=_id_[2];}
           var eval_ic_=_ie_;}
         l_hW_[1]=_ch_(l_hW_[1]);
         return _if_(eval_ic_,l_hW_[1],cpl_hZ_);}],
     _iF_=[0,_fM_,_fp_,_fq_,_fY_,_fZ_,_f4_],
     Stone_squeletteG_iH_=
      _bQ_
       (function(_ip_)
          {return function(Alpha_ir_)
            {var
              prof_ih_=[0,4],
              Gagne_ii_=[0,_D_],
              Perd_ij_=[0,_C_],
              Nul_ik_=[0,_B_],
              _il_=[0,_fm_(0)];
             function _iy_(joueur_im_,param_iq_)
              {var choix_in_=_ig_(joueur_im_,_il_[1]),ancien_jeu_io_=_il_[1];
               _il_[1]=_fo_(joueur_im_,choix_in_,_il_[1]);
               _g$_(joueur_im_,choix_in_,ancien_jeu_io_,_il_[1]);
               switch(_b3_(_ip_[6],joueur_im_,_il_[1]))
                {case 1:throw [0,Perd_ij_];
                 case 2:throw [0,Nul_ik_];
                 case 3:return 0;
                 default:throw [0,Gagne_ii_];}}
             function _iA_(joueur_is_,param_iv_)
              {var
                choix_it_=_hk_(Alpha_ir_[1],prof_ih_[1],joueur_is_,_il_[1]),
                ancien_jeu_iu_=_il_[1];
               _il_[1]=_fo_(joueur_is_,choix_it_,_il_[1]);
               _g$_(joueur_is_,choix_it_,ancien_jeu_iu_,_il_[1]);
               switch(_b3_(_ip_[6],joueur_is_,_il_[1]))
                {case 1:throw [0,Perd_ij_];
                 case 2:throw [0,Nul_ik_];
                 case 3:return 0;
                 default:throw [0,Gagne_ii_];}}
             return [0,
                     prof_ih_,
                     Gagne_ii_,
                     Perd_ij_,
                     Nul_ik_,
                     _g8_,
                     _g9_,
                     _g__,
                     _hc_,
                     _il_,
                     _g7_,
                     _g6_,
                     _iy_,
                     _iA_,
                     function(param_iE_)
                      {var a_ix_=_hb_(0),b_iw_=_hb_(0);
                       _il_[1]=_fm_(0);
                       _ha_(0);
                       if(0===a_ix_)
                        {if(0===b_iw_)
                          {var _iz_=_bQ_(_iy_,0);return [0,_bQ_(_iy_,1),_iz_];}
                         var _iB_=_bQ_(_iA_,0);
                         return [0,_bQ_(_iy_,1),_iB_];}
                       if(0===b_iw_)
                        {var _iC_=_bQ_(_iy_,0);return [0,_bQ_(_iA_,1),_iC_];}
                       var _iD_=_bQ_(_iA_,0);
                       return [0,_bQ_(_iA_,1),_iD_];}];};}
         (_iF_),
        _iG_),
     fini_iI_=[0,0],
     _iR_=Stone_squeletteG_iH_[7],
     _iQ_=Stone_squeletteG_iH_[6],
     _iP_=Stone_squeletteG_iH_[5],
     _iO_=Stone_squeletteG_iH_[4],
     _iN_=Stone_squeletteG_iH_[3],
     _iM_=Stone_squeletteG_iH_[2],
     _iL_=Stone_squeletteG_iH_[10],
     _iK_=Stone_squeletteG_iH_[8],
     _iJ_=Stone_squeletteG_iH_[14];
    _bQ_(Stone_squeletteG_iH_[11],0);
    for(;;)
     {if(fini_iI_[1]){_bQ_(_iL_,0);do_at_exit_bc_(0);return;}
      try
       {var _iS_=_bQ_(_iJ_,0);
        for(;;){if(1){_bQ_(_iS_[1],0);_bQ_(_iS_[2],0);continue;}break;}}
      catch(_iT_)
       {if(_iT_[1]===_iM_)
         _bQ_(_iP_,0);
        else
         if(_iT_[1]===_iN_)
          _bQ_(_iQ_,0);
         else
          {if(_iT_[1]!==_iO_)throw _iT_;_bQ_(_iR_,0);}}
      fini_iI_[1]=1-_bQ_(_iK_,0);
      continue;}}
  ());
