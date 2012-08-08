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
function caml_raise_constant (tag) { throw [0, tag]; }
var caml_global_data = [0];
function caml_raise_zero_divide () {
  caml_raise_constant(caml_global_data[6]);
}
function caml_mod(x,y) {
  if (y == 0) caml_raise_zero_divide ();
  return x%y;
}
function caml_register_global (n, v) { caml_global_data[n + 1] = v; }
var caml_named_values = {};
function caml_register_named_value(nm,v) {
  caml_named_values[nm] = v; return 0;
}
function caml_sys_get_config () {
  return [0, new MlWrappedString("Unix"), 32];
}
(function()
   {function _ad_(_bF_,_bG_)
     {return _bF_.length==1?_bF_(_bG_):caml_call_gen(_bF_,[_bG_]);}
    var
     _a_=[0,new MlString("Invalid_argument")],
     _b_=[0,new MlString("Touch me, touch me, touch me")],
     _c_=[0,new MlString("Bla")];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_a_);
    caml_register_global(2,[0,new MlString("Failure")]);
    var
     _C_=[0,new MlString("Not_found")],
     _B_=[0,new MlString("Assert_failure")],
     _A_=new MlString("%d"),
     _z_=new MlString("Pervasives.do_at_exit"),
     _y_=new MlString("List.combine"),
     _x_=new MlString("String.sub"),
     _w_=new MlString("Random.int"),
     _v_=
      [0,
       2061652523,
       1569539636,
       364182224,
       414272206,
       318284740,
       2064149575,
       383018966,
       1344115143,
       840823159,
       1098301843,
       536292337,
       1586008329,
       189156120,
       1803991420,
       1217518152,
       51606627,
       1213908385,
       366354223,
       2077152089,
       1774305586,
       2055632494,
       913149062,
       526082594,
       2095166879,
       784300257,
       1741495174,
       1703886275,
       2023391636,
       1122288716,
       1489256317,
       258888527,
       511570777,
       1163725694,
       283659902,
       308386020,
       1316430539,
       1556012584,
       1938930020,
       2101405994,
       1280938813,
       193777847,
       1693450012,
       671350186,
       149669678,
       1330785842,
       1161400028,
       558145612,
       1257192637,
       1101874969,
       1975074006,
       710253903,
       1584387944,
       1726119734,
       409934019,
       801085050],
     _u_=new MlString("Position x = "),
     _t_=new MlString(""),
     _s_=new MlString("ontap"),
     _r_=new MlString("name"),
     _q_=new MlString("content"),
     _p_=[0,new MlString("kind"),[1,new MlString("Button")]],
     _o_=new MlString("BUTTON"),
     _n_=new MlString(""),
     _m_=new MlString("name"),
     _l_=new MlString("content"),
     _k_=[0,new MlString("kind"),[1,new MlString("Control")]],
     _j_=new MlString("CONTROL"),
     _i_=new MlString("name"),
     _h_=[0,new MlString("kind_test.ml"),52,34],
     _g_=new MlString("control"),
     _f_=new MlString("button");
    function _e_(s_d_){throw [0,_a_,s_d_];}
    function _N_(s1_D_,s2_F_)
     {var
       l1_E_=s1_D_.getLen(),
       l2_G_=s2_F_.getLen(),
       s_H_=caml_create_string(l1_E_+l2_G_|0);
      caml_blit_string(s1_D_,0,s_H_,0,l1_E_);
      caml_blit_string(s2_F_,0,s_H_,l1_E_,l2_G_);
      return s_H_;}
    function string_of_int_O_(n_I_){return caml_format_int(_A_,n_I_);}
    function do_at_exit_P_(param_M_)
     {var param_J_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_J_)
         {var l_K_=param_J_[2];try {}catch(_L_){}var param_J_=l_K_;continue;}
        return 0;}}
    caml_register_named_value(_z_,do_at_exit_P_);
    function _aa_(l_Q_)
     {if(l_Q_)
       {var accu_R_=0,param_S_=l_Q_,tl_Y_=l_Q_[2],hd_V_=l_Q_[1];
        for(;;)
         {if(param_S_)
           {var t_U_=param_S_[2],_T_=accu_R_+1|0,accu_R_=_T_,param_S_=t_U_;
            continue;}
          var a_W_=caml_make_vect(accu_R_,hd_V_),i_X_=1,param_Z_=tl_Y_;
          for(;;)
           {if(param_Z_)
             {var tl___=param_Z_[2];
              a_W_[i_X_+1]=param_Z_[1];
              var _$_=i_X_+1|0,i_X_=_$_,param_Z_=tl___;
              continue;}
            return a_W_;}}}
      return [0];}
    function _af_(f_ac_,param_ab_)
     {if(param_ab_)
       {var l_ae_=param_ab_[2],r_ag_=_ad_(f_ac_,param_ab_[1]);
        return [0,r_ag_,_af_(f_ac_,l_ae_)];}
      return 0;}
    function _aq_(f_aj_,param_ah_)
     {var param_ai_=param_ah_;
      for(;;)
       {if(param_ai_)
         {var l_ak_=param_ai_[2];
          _ad_(f_aj_,param_ai_[1]);
          var param_ai_=l_ak_;
          continue;}
        return 0;}}
    function _an_(l1_al_,l2_am_)
     {if(l1_al_)
       {if(l2_am_)
         {var a2_ap_=l2_am_[1],a1_ao_=l1_al_[1];
          return [0,[0,a1_ao_,a2_ap_],_an_(l1_al_[2],l2_am_[2])];}}
      else
       if(!l2_am_)return 0;
      return _e_(_y_);}
    var _ar_=[0,0];
    32===caml_sys_get_config(0)[2];
    var
     _as_=[0,_v_.slice(),0],
     undefined_aw_=undefined,
     _false_av_=false,
     array_constructor_au_=Array;
    function _ax_(e_at_)
     {return e_at_ instanceof array_constructor_au_
              ?0
              :[0,new MlWrappedString(e_at_.toString())];}
    _ar_[1]=[0,_ax_,_ar_[1]];
    var window_ay_=window;
    window.HTMLElement===undefined_aw_;
    function coerce_prop_aA_(value_az_)
     {switch(value_az_[0])
       {case 1:return value_az_[1].toString();
        case 2:return value_az_[1];
        case 3:return value_az_[1];
        case 4:return value_az_[1];
        case 5:return !!value_az_[1];
        case 6:
         return caml_js_from_array(_aa_(_af_(coerce_prop_aA_,value_az_[1])));
        default:return value_az_[1];}}
    function new_label_aE_(name_aC_)
     {var i_aB_=[0,-1];
      return function(param_aD_)
       {i_aB_[1]+=1;return _N_(name_aC_,string_of_int_O_(i_aB_[1]));};}
    var new_label_control_aF_=new_label_aE_(_g_),_aQ_=new_label_aE_(_f_);
    function change_content_handler_aP_(this_aM_,sender_aO_,event_aN_)
     {var _aG_=1<<20;
      if(1073741823<_aG_||!(0<_aG_))
       var _aH_=0;
      else
       for(;;)
        {_as_[2]=(_as_[2]+1|0)%55|0;
         var
          newval_aI_=
           caml_array_get(_as_[1],(_as_[2]+24|0)%55|0)+
           (caml_array_get(_as_[1],_as_[2])^
            caml_array_get(_as_[1],_as_[2])>>>
            25&
            31)|
           0;
         caml_array_set(_as_[1],_as_[2],newval_aI_);
         var _aJ_=newval_aI_&1073741823,v_aK_=caml_mod(_aJ_,_aG_);
         if(((1073741823-_aG_|0)+1|0)<(_aJ_-v_aK_|0))continue;
         var _aL_=v_aK_,_aH_=1;
         break;}
      if(!_aH_)var _aL_=_e_(_w_);
      this_aM_.setContent(string_of_int_O_(_aL_));
      alert(_N_(_u_,string_of_int_O_(event_aN_.screenX)));
      return 1;}
    var
     _aR_=0,
     _aS_=0,
     _aU_=[0,change_content_handler_aP_],
     components_aT_=_aS_?_aS_[1]:0,
     _aV_=_aR_?_aR_[1]:_ad_(_aQ_,0),
     _aW_=_b_?_b_[1]:_t_,
     ontap_aX_=
      _aU_?change_content_handler_aP_:function(o_aY_,x_aZ_,y_a0_){return 0;},
     _a1_=0,
     _a2_=
      [0,
       [0,
        _o_,
        components_aT_,
        0,
        [0,[0,_s_,ontap_aX_],0],
        [0,_p_,[0,[0,_q_,[1,_aW_]],[0,[0,_r_,[1,_aV_]],0]]]],
       0],
     components_a3_=[0,_a2_]?_a2_:0,
     _a4_=_c_?_c_[1]:_ad_(new_label_control_aF_,0),
     content_a5_=_a1_?_a1_[1]:_n_,
     _a6_=
      [0,
       _j_,
       components_a3_,
       0,
       0,
       [0,_k_,[0,[0,_l_,[1,content_a5_]],[0,[0,_m_,[1,_a4_]],0]]]];
    function build_component_tree_ba_(kind_a8_)
     {var js_obj_a7_=new Object(),_a$_=kind_a8_[5];
      _aq_
       (function(param_a9_)
         {var x_a__=param_a9_[1];
          return js_obj_a7_[x_a__]=coerce_prop_aA_(param_a9_[2]);},
        _a$_);
      if(0!==kind_a8_[2])
       js_obj_a7_.components=
       caml_js_from_array(_aa_(_af_(build_component_tree_ba_,kind_a8_[2])));
      if(0!==kind_a8_[4])
       {var
         _bc_=kind_a8_[4],
         handlers_name_bd_=
          _af_(function(param_bb_){return param_bb_[1];},_bc_),
         handlers_name_func_bk_=
          _af_
           (function(x_be_)
             {var _bf_=x_be_.getLen()-2|0,_bg_=2;
              if(0<=_bg_&&0<=_bf_&&!((x_be_.getLen()-_bf_|0)<_bg_))
               {var r_bi_=caml_create_string(_bf_);
                caml_blit_string(x_be_,_bg_,r_bi_,0,_bf_);
                var _bj_=r_bi_,_bh_=1;}
              else
               var _bh_=0;
              if(!_bh_)var _bj_=_e_(_x_);
              return _bj_;},
            handlers_name_bd_),
         _bm_=kind_a8_[4],
         handlers_func_bo_=
          _af_(function(param_bl_){return param_bl_[2];},_bm_),
         handler_obj_bn_=new Object(),
         _bq_=_an_(handlers_name_bd_,handlers_name_func_bk_);
        _aq_
         (function(param_bp_)
           {return handler_obj_bn_[param_bp_[1]]=param_bp_[2].toString();},
          _bq_);
        js_obj_a7_.handlers=handler_obj_bn_;
        var _bs_=_an_(handlers_name_func_bk_,handlers_func_bo_);
        _aq_
         (function(param_br_)
           {return js_obj_a7_[param_br_[1]]=
                   caml_js_wrap_meth_callback(param_br_[2]);},
          _bs_);}
      return js_obj_a7_;}
    var _bt_=build_component_tree_ba_(_a6_);
    _bt_._onyo_id=_a6_[1].toString();
    enyo.kind(_bt_);
    var param_bu_=_a6_[5];
    for(;;)
     {if(param_bu_)
       {var match_bv_=param_bu_[1],b_bw_=match_bv_[2],l_bx_=param_bu_[2];
        if(0===caml_compare(match_bv_[1],_i_))
         {if(1===b_bw_[0])
           {var
             enyo_js_object_by_=new (caml_js_var(b_bw_[1]))(),
             _bA_=
              function(param_bz_)
               {enyo_js_object_by_.renderInto(document.body);
                return _false_av_;};
            window_ay_.onload=
            caml_js_wrap_callback
             (function(e_bB_)
               {if(e_bB_)
                 {var res_bC_=_bA_(e_bB_);
                  if(!(res_bC_|0))e_bB_.preventDefault();
                  return res_bC_;}
                var _bD_=event,res_bE_=_bA_(_bD_);
                _bD_.returnValue=res_bE_;
                return res_bE_;});
            do_at_exit_P_(0);
            return;}
          throw [0,_B_,_h_];}
        var param_bu_=l_bx_;
        continue;}
      throw [0,_C_];}}
  ());
