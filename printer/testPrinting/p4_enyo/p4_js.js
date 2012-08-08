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
function caml_greaterequal (x, y) { return +(caml_compare(x,y,false) >= 0); }
function caml_lessequal (x, y) { return +(caml_compare(x,y,false) <= 0); }
function caml_make_vect (len, init) {
  var b = [0]; for (var i = 1; i <= len; i++) b[i] = init; return b;
}
function caml_ml_flush () { return 0; }
function caml_ml_open_descriptor_in () { return 0; }
function caml_ml_open_descriptor_out () { return 0; }
function caml_ml_out_channels_list () { return 0; }
function caml_ml_output () { return 0; }
function caml_mul(x,y) {
  return ((((x >> 16) * y) << 16) + (x & 0xffff) * y)|0;
}
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
(function()
   {function _dq_(_e__,_e$_,_fa_,_fb_)
     {return _e__.length==3
              ?_e__(_e$_,_fa_,_fb_)
              :caml_call_gen(_e__,[_e$_,_fa_,_fb_]);}
    function _aS_(_e7_,_e8_,_e9_)
     {return _e7_.length==2?_e7_(_e8_,_e9_):caml_call_gen(_e7_,[_e8_,_e9_]);}
    function _dC_(_e5_,_e6_)
     {return _e5_.length==1?_e5_(_e6_):caml_call_gen(_e5_,[_e6_]);}
    var
     _a_=[0,new MlString("Failure")],
     _b_=[0,new MlString("Invalid_argument")],
     _c_=[0,0,[0,2,[0,10,[0,50,0]]]];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_b_);
    caml_register_global(2,_a_);
    var
     _J_=[0,new MlString("End_of_file")],
     _I_=new MlString("%d"),
     _H_=new MlString("Pervasives.do_at_exit"),
     _G_=new MlString("nth"),
     _F_=new MlString("List.nth"),
     _E_=new MlString("hd"),
     _D_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Gagne"),
     _C_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Perd"),
     _B_=new MlString("Alphabeta.FSquelette(Rep)(Aff)(Eval)(Alpha).Nul"),
     _A_=new MlString(" non trouve'"),
     _z_=new MlString("AB: "),
     _y_=new MlString("AB: longueur diff"),
     _x_=new MlString("Alphabeta.FAlphabetaO(Rep)(Eval).AlphaCoupure"),
     _w_=new MlString("Alphabeta.FAlphabetaO(Rep)(Eval).BetaCoupure"),
     _v_=new MlString("P4.P4_eval.Quatre"),
     _u_=new MlString("P4.P4_eval.Valeur_nulle"),
     _t_=new MlString("P4.P4_eval.Arg_invalid"),
     _s_=new MlString(" : "),
     _r_=new MlString("1"),
     _q_=new MlString("2"),
     _p_=new MlString("Choix joueur"),
     _o_=new MlString("Est-ce une machine qui joue ?"),
     _n_=new MlString("Encore une partie"),
     _m_=new MlString("o"),
     _l_=new MlString("A bientot ... \n"),
     _k_=new MlString("P4 ...\n"),
     _j_=new MlString("P4_js.P4_js.Coup");
    function _i_(s_d_){throw [0,_a_,s_d_];}
    function _K_(x_f_,y_e_){return caml_lessequal(x_f_,y_e_)?x_f_:y_e_;}
    function _L_(x_h_,y_g_){return caml_greaterequal(x_h_,y_g_)?x_h_:y_g_;}
    function _R_(s1_M_,s2_O_)
     {var
       l1_N_=s1_M_.getLen(),
       l2_P_=s2_O_.getLen(),
       s_Q_=caml_create_string(l1_N_+l2_P_|0);
      caml_blit_string(s1_M_,0,s_Q_,0,l1_N_);
      caml_blit_string(s2_O_,0,s_Q_,l1_N_,l2_P_);
      return s_Q_;}
    var
     stdin_S_=caml_ml_open_descriptor_in(0),
     stdout_T_=caml_ml_open_descriptor_out(1);
    function print_string_as_(s_U_)
     {return caml_ml_output(stdout_T_,s_U_,0,s_U_.getLen());}
    function print_newline_at_(param_V_)
     {caml_ml_output_char(stdout_T_,10);return caml_ml_flush(stdout_T_);}
    function read_line_au_(param_an_)
     {function build_result_ad_(buf_aa_,pos_W_,param_Y_)
       {var pos_X_=pos_W_,param_Z_=param_Y_;
        for(;;)
         {if(param_Z_)
           {var hd___=param_Z_[1],len_$_=hd___.getLen(),tl_ab_=param_Z_[2];
            caml_blit_string(hd___,0,buf_aa_,pos_X_-len_$_|0,len_$_);
            var _ac_=pos_X_-len_$_|0,pos_X_=_ac_,param_Z_=tl_ab_;
            continue;}
          return buf_aa_;}}
      var accu_ae_=0,len_af_=0;
      for(;;)
       {var n_ag_=caml_ml_input_scan_line(stdin_S_);
        if(0===n_ag_)
         {if(!accu_ae_)throw [0,_J_];
          var
           _ah_=
            build_result_ad_(caml_create_string(len_af_),len_af_,accu_ae_);}
        else
         {if(!(0<n_ag_))
           {var beg_ak_=caml_create_string(-n_ag_|0);
            caml_ml_input(stdin_S_,beg_ak_,0,-n_ag_|0);
            var
             _am_=len_af_-n_ag_|0,
             _al_=[0,beg_ak_,accu_ae_],
             accu_ae_=_al_,
             len_af_=_am_;
            continue;}
          var res_ai_=caml_create_string(n_ag_-1|0);
          caml_ml_input(stdin_S_,res_ai_,0,n_ag_-1|0);
          caml_ml_input_char(stdin_S_);
          if(accu_ae_)
           {var
             len_aj_=(len_af_+n_ag_|0)-1|0,
             _ah_=
              build_result_ad_
               (caml_create_string(len_aj_),len_aj_,[0,res_ai_,accu_ae_]);}
          else
           var _ah_=res_ai_;}
        return _ah_;}}
    function do_at_exit_av_(param_ar_)
     {var param_ao_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_ao_)
         {var l_ap_=param_ao_[2];
          try {}catch(_aq_){}
          var param_ao_=l_ap_;
          continue;}
        return 0;}}
    caml_register_named_value(_H_,do_at_exit_av_);
    function _aD_(a_aw_)
     {var l_ax_=a_aw_.length-1;
      if(0===l_ax_)return [0];
      var res_ay_=caml_make_vect(l_ax_,a_aw_[0+1]),_az_=1,_aA_=l_ax_-1|0;
      if(!(_aA_<_az_))
       {var i_aB_=_az_;
        for(;;)
         {res_ay_[i_aB_+1]=a_aw_[i_aB_+1];
          var _aC_=i_aB_+1|0;
          if(_aA_!==i_aB_){var i_aB_=_aC_;continue;}
          break;}}
      return res_ay_;}
    function _aV_(param_aE_){return param_aE_?param_aE_[1]:_i_(_E_);}
    function _aW_(l_aG_,n_aF_)
     {if(0<=n_aF_)
       {var l_aH_=l_aG_,n_aI_=n_aF_;
        for(;;)
         {if(l_aH_)
           {var l_aL_=l_aH_[2],a_aJ_=l_aH_[1];
            if(0!==n_aI_){var _aM_=n_aI_-1|0,l_aH_=l_aL_,n_aI_=_aM_;continue;}
            var _aK_=a_aJ_;}
          else
           var _aK_=_i_(_G_);
          return _aK_;}}
      throw [0,_b_,_F_];}
    function _aX_(f_aR_,accu_aN_,l_aP_)
     {var accu_aO_=accu_aN_,l_aQ_=l_aP_;
      for(;;)
       {if(l_aQ_)
         {var
           l_aT_=l_aQ_[2],
           _aU_=_aS_(f_aR_,accu_aO_,l_aQ_[1]),
           accu_aO_=_aU_,
           l_aQ_=l_aT_;
          continue;}
        return accu_aO_;}}
    var _aY_=[0,0],undefined_a1_=undefined,array_constructor_a0_=Array;
    function _a2_(e_aZ_)
     {return e_aZ_ instanceof array_constructor_a0_
              ?0
              :[0,new MlWrappedString(e_aZ_.toString())];}
    _aY_[1]=[0,_a2_,_aY_[1]];
    window.HTMLElement===undefined_a1_;
    var _a3_=7,_a4_=6;
    function _bx_(param_a$_)
     {var res_a5_=caml_make_vect(_a4_,[0]),_a6_=0,_a7_=_a4_-1|0,_a9_=2;
      if(!(_a7_<_a6_))
       {var x_a8_=_a6_;
        for(;;)
         {res_a5_[x_a8_+1]=caml_make_vect(_a3_,_a9_);
          var _a__=x_a8_+1|0;
          if(_a7_!==x_a8_){var x_a8_=_a__;continue;}
          break;}}
      return res_a5_;}
    function _by_(b_bg_,m_be_)
     {var l_ba_=[0,0],_bb_=0,_bc_=_a3_-1|0;
      if(!(_bc_<_bb_))
       {var c_bd_=_bb_;
        for(;;)
         {if(2===caml_array_get(caml_array_get(m_be_,_a4_-1|0),c_bd_))
           l_ba_[1]=[0,c_bd_+1|0,l_ba_[1]];
          var _bf_=c_bd_+1|0;
          if(_bc_!==c_bd_){var c_bd_=_bf_;continue;}
          break;}}
      return l_ba_[1];}
    function _bu_(cp_bp_,m_bh_,e_br_)
     {var l_bi_=m_bh_.length-1;
      if(0===l_bi_)
       var mj_bj_=[0];
      else
       {var
         r_bk_=caml_make_vect(l_bi_,_aD_(m_bh_[0+1])),
         _bl_=1,
         _bm_=l_bi_-1|0;
        if(!(_bm_<_bl_))
         {var i_bn_=_bl_;
          for(;;)
           {r_bk_[i_bn_+1]=_aD_(m_bh_[i_bn_+1]);
            var _bo_=i_bn_+1|0;
            if(_bm_!==i_bn_){var i_bn_=_bo_;continue;}
            break;}}
        var mj_bj_=r_bk_;}
      var l_bq_=[0,_a4_],_bs_=cp_bp_-1|0;
      for(;;)
       {if
         (0<
          l_bq_[1]&&
          2===
          caml_array_get(caml_array_get(mj_bj_,l_bq_[1]-1|0),cp_bp_-1|0))
         {l_bq_[1]+=-1;continue;}
        caml_array_set(caml_array_get(mj_bj_,(l_bq_[1]+1|0)-1|0),_bs_,e_br_);
        return mj_bj_;}}
    function _bz_(b_bt_,cp_bw_,m_bv_)
     {return b_bt_?_bu_(cp_bw_,m_bv_,0):_bu_(cp_bw_,m_bv_,1);}
    if(_c_)
     {var accu_bA_=0,param_bB_=_c_,tl_bH_=_c_[2],hd_bE_=_c_[1];
      for(;;)
       {if(param_bB_)
         {var
           t_bD_=param_bB_[2],
           _bC_=accu_bA_+1|0,
           accu_bA_=_bC_,
           param_bB_=t_bD_;
          continue;}
        var a_bF_=caml_make_vect(accu_bA_,hd_bE_),i_bG_=1,param_bI_=tl_bH_;
        for(;;)
         {if(param_bI_)
           {var tl_bJ_=param_bI_[2];
            a_bF_[i_bG_+1]=param_bI_[1];
            var _bK_=i_bG_+1|0,i_bG_=_bK_,param_bI_=tl_bJ_;
            continue;}
          var _bL_=a_bF_;
          break;}
        break;}}
    else
     var _bL_=[0];
    var _bM_=[0,_v_],_bN_=[0,_u_],_bO_=[0,_t_],_bP_=-10000,_bQ_=10000;
    function _cf_
     (m_b5_,e_cb_,cmin_bS_,cmax_bR_,lmin_bV_,lmax_bU_,dx_b7_,dy_b6_)
     {if(!(cmax_bR_<cmin_bS_))
       {var c_bT_=cmin_bS_;
        for(;;)
         {if(!(lmax_bU_<lmin_bV_))
           {var l_bW_=lmin_bV_;
            for(;;)
             {var n_bX_=[0,0],e_bY_=[0,2],x_bZ_=[0,c_bT_],y_b0_=[0,l_bW_];
              try
               {var _b1_=1,_b2_=4;
                if(!(_b2_<_b1_))
                 {var i_b3_=_b1_;
                  for(;;)
                   {if
                     (0<=
                      y_b0_[1]&&
                      !(_a4_<=y_b0_[1]||!(0<=x_bZ_[1]&&!(_a3_<=x_bZ_[1]))))
                     {switch
                       (caml_array_get(caml_array_get(m_b5_,y_b0_[1]),x_bZ_[1]))
                       {case 1:
                         if(0===e_bY_[1])throw [0,_bN_];
                         n_bX_[1]+=1;
                         if(4===n_bX_[1])throw [0,_bM_,_bP_];
                         e_bY_[1]=1;
                         break;
                        case 2:break;
                        default:
                         if(1===e_bY_[1])throw [0,_bN_];
                         n_bX_[1]+=1;
                         if(4===n_bX_[1])throw [0,_bM_,_bQ_];
                         e_bY_[1]=0;}
                      x_bZ_[1]=x_bZ_[1]+dy_b6_|0;
                      y_b0_[1]=y_b0_[1]+dx_b7_|0;
                      var _b8_=i_b3_+1|0;
                      if(_b2_!==i_b3_){var i_b3_=_b8_;continue;}
                      var _b4_=1;}
                    else
                     var _b4_=0;
                    if(!_b4_)throw [0,_bO_];
                    break;}}
                var
                 _b9_=0===e_bY_[1]?1:-1,
                 _b__=caml_mul(caml_array_get(_bL_,n_bX_[1]),_b9_),
                 _b$_=_b__;}
              catch(_ca_)
               {if(_ca_[1]!==_bN_&&_ca_[1]!==_bO_)throw _ca_;var _b$_=0;}
              e_cb_[1]=e_cb_[1]+_b$_|0;
              var _cc_=l_bW_+1|0;
              if(lmax_bU_!==l_bW_){var l_bW_=_cc_;continue;}
              break;}}
          var _cd_=c_bT_+1|0;
          if(cmax_bR_!==c_bT_){var c_bT_=_cd_;continue;}
          break;}}
      return 0;}
    function _ck_(b_cj_,m_cg_)
     {try
       {var evaluation_ce_=[0,0];
        _cf_(m_cg_,evaluation_ce_,0,_a4_-1|0,0,_a3_-4|0,0,1);
        _cf_(m_cg_,evaluation_ce_,0,_a3_-1|0,0,_a4_-4|0,1,0);
        _cf_(m_cg_,evaluation_ce_,0,_a3_-4|0,0,_a4_-4|0,1,1);
        _cf_(m_cg_,evaluation_ce_,1,_a4_-4|0,0,_a3_-4|0,1,1);
        _cf_(m_cg_,evaluation_ce_,3,_a3_-1|0,0,_a4_-4|0,1,-1);
        _cf_(m_cg_,evaluation_ce_,1,_a4_-4|0,3,_a3_-1|0,1,-1);
        var _ch_=evaluation_ce_[1];}
      catch(_ci_){if(_ci_[1]===_bM_)return _ci_[2];throw _ci_;}
      return _ch_;}
    function _cw_(b_cm_,m_cl_)
     {var v_cn_=_ck_(b_cm_,m_cl_),_co_=v_cn_===_bQ_?1:0;
      if(_co_)
       var _cp_=_co_;
      else
       {var _cq_=v_cn_===_bP_?1:0,_cp_=_cq_?_cq_:0===_by_(b_cm_,m_cl_)?1:0;}
      return _cp_;}
    function _cx_(b_cr_,j_cs_){return 1;}
    function _cW_(joueur_cu_,m_ct_)
     {var v_cv_=_ck_(joueur_cu_,m_ct_);
      return v_cv_===_bQ_
              ?joueur_cu_?0:1
              :v_cv_===_bP_?joueur_cu_?1:0:0===_by_(joueur_cu_,m_ct_)?2:3;}
    function _cQ_(mat_cE_)
     {var _cy_=_a4_-1|0,_cz_=0;
      if(!(_cy_<_cz_))
       {var l_cA_=_cy_;
        for(;;)
         {var _cB_=0,_cC_=_a3_-1|0;
          if(!(_cC_<_cB_))
           {var c_cD_=_cB_;
            for(;;)
             {switch(caml_array_get(caml_array_get(mat_cE_,l_cA_),c_cD_))
               {case 1:break;case 2:break;default:}
              var _cF_=c_cD_+1|0;
              if(_cC_!==c_cD_){var c_cD_=_cF_;continue;}
              break;}}
          print_newline_at_(0);
          var _cG_=l_cA_-1|0;
          if(_cz_!==l_cA_){var l_cA_=_cG_;continue;}
          break;}}
      return print_newline_at_(0);}
    function _cX_(param_cH_){return print_string_as_(_k_);}
    function _cY_(param_cI_){return print_string_as_(_l_);}
    function _cK_(s_cJ_){return caml_string_equal(read_line_au_(0),_m_);}
    function _c0_(param_cL_){return _cK_(_n_);}
    function _cZ_(param_cM_){return _cK_(_o_);}
    function _c1_(param_cN_){return print_newline_at_(0);}
    function _c2_(param_cO_){return print_newline_at_(0);}
    function _c3_(param_cP_){return print_newline_at_(0);}
    function _c5_(param_cR_)
     {print_newline_at_(0);
      print_newline_at_(0);
      _cQ_(_bx_(0));
      return print_newline_at_(0);}
    function _c4_(b_cT_,c_cU_,aj_cV_,j_cS_){return _cQ_(j_cS_);}
    var _c6_=[0,_j_],_dj_=[0,_x_],_dk_=[0,_w_];
    function _er_(joueur_c7_,jeu_c9_)
     {var _c8_=joueur_c7_?_r_:_q_;
      _R_(_p_,_R_(_c8_,_s_));
      var l_c__=_by_(joueur_c7_,jeu_c9_);
      try
       {for(;;)
         {if(1)
           {var i_c$_=read_line_au_(0);
            if(0<i_c$_.getLen())
             {var
               _da_=
                (i_c$_.safeGet(0)-49|0)<0||6<(i_c$_.safeGet(0)-49|0)?0:1;
              if(_da_)
               {var c_db_=i_c$_.safeGet(0)-48|0,param_dc_=l_c__;
                for(;;)
                 {if(param_dc_)
                   {var
                     l_dd_=param_dc_[2],
                     _de_=0===caml_compare(param_dc_[1],c_db_)?1:0;
                    if(!_de_){var param_dc_=l_dd_;continue;}
                    var _df_=_de_;}
                  else
                   var _df_=0;
                  if(_df_)throw [0,_c6_,c_db_];
                  var _dg_=1;
                  break;}}
              else
               var _dg_=0;}
            else
             var _dg_=0;
            _dg_;
            continue;}
          var _dh_=_aV_(l_c__);
          break;}}
      catch(_di_){return _di_[1]===_c6_?_di_[2]:_aV_(l_c__);}
      return _dh_;}
    function _dE_(noeud_dl_,minmax_cur_dp_,beta_do_,alpha_dn_,cp_dm_)
     {var
       alpha_resu_dr_=
        _L_
         (alpha_dn_,
          _dq_(minmax_cur_dp_,_bz_(1,cp_dm_,noeud_dl_),beta_do_,alpha_dn_));
      if(beta_do_<=alpha_resu_dr_)throw [0,_dk_,alpha_resu_dr_];
      return alpha_resu_dr_;}
    function _dO_(noeud_ds_,maxmin_cur_dw_,alpha_dv_,beta_du_,cp_dt_)
     {var
       beta_resu_dx_=
        _K_
         (beta_du_,
          _dq_(maxmin_cur_dw_,_bz_(0,cp_dt_,noeud_ds_),alpha_dv_,beta_du_));
      if(beta_resu_dx_<=alpha_dv_)throw [0,_dj_,beta_resu_dx_];
      return beta_resu_dx_;}
    function _dM_(prof_dy_,noeud_dA_,alpha_dG_,beta_dD_)
     {var _dz_=1<=prof_dy_?0:_cx_(1,noeud_dA_)?1:0;
      if(!_dz_&&!_cw_(1,noeud_dA_))
       {try
         {var
           prev_dF_=_dq_(_dE_,noeud_dA_,_dC_(_dB_,prof_dy_-1|0),beta_dD_),
           _dH_=_aX_(prev_dF_,alpha_dG_,_by_(1,noeud_dA_));}
        catch(_dI_){if(_dI_[1]===_dk_)return _dI_[2];throw _dI_;}
        return _dH_;}
      return _ck_(1,noeud_dA_);}
    function _dB_(prof_dJ_,noeud_dL_,beta_dQ_,alpha_dN_)
     {var _dK_=1<=prof_dJ_?0:_cx_(0,noeud_dL_)?1:0;
      if(!_dK_&&!_cw_(0,noeud_dL_))
       {try
         {var
           prev_dP_=_dq_(_dO_,noeud_dL_,_dC_(_dM_,prof_dJ_-1|0),alpha_dN_),
           _dR_=_aX_(prev_dP_,beta_dQ_,_by_(0,noeud_dL_));}
        catch(_dS_){if(_dS_[1]===_dj_)return _dS_[2];throw _dS_;}
        return _dR_;}
      return _ck_(0,noeud_dL_);}
    function _eq_(a_dX_,l1_dT_,l2_dV_)
     {var l1_dU_=l1_dT_,l2_dW_=l2_dV_;
      for(;;)
       {if(l1_dU_)
         {if(l2_dW_)
           {var q2_d0_=l2_dW_[2],h2_dY_=l2_dW_[1],q1_dZ_=l1_dU_[2];
            if(a_dX_===l1_dU_[1])return h2_dY_;
            var l1_dU_=q1_dZ_,l2_dW_=q2_d0_;
            continue;}}
        else
         if(!l2_dW_)return _i_(_R_(_z_,_R_(caml_format_int(_I_,a_dX_),_A_)));
        return _i_(_y_);}}
    var
     _eR_=
      [0,
       function(prof_ed_,joueur_d5_,racine_d4_)
        {var
          alpha_d1_=[0,_bP_],
          beta_d2_=[0,_bQ_],
          l_d3_=[0,0],
          cpl_d6_=_by_(joueur_d5_,racine_d4_);
         try
          {var _d7_=0,len_d8_=0,param_d9_=cpl_d6_;
           for(;;)
            {if(param_d9_)
              {var
                l_d$_=param_d9_[2],
                _d__=len_d8_+1|0,
                len_d8_=_d__,
                param_d9_=l_d$_;
               continue;}
             var _ea_=len_d8_-1|0;
             if(!(_ea_<_d7_))
              {var i_eb_=_d7_;
               for(;;)
                {if(joueur_d5_)
                  {var
                    b_ec_=_bz_(joueur_d5_,_aW_(cpl_d6_,i_eb_),racine_d4_),
                    a_ee_=_dB_(prof_ed_-1|0,b_ec_,beta_d2_[1],alpha_d1_[1]);
                   l_d3_[1]=[0,a_ee_,l_d3_[1]];
                   alpha_d1_[1]=_L_(alpha_d1_[1],a_ee_);
                   if(beta_d2_[1]<=alpha_d1_[1])throw [0,_dk_,alpha_d1_[1]];}
                 else
                  {var
                    a_ef_=_bz_(joueur_d5_,_aW_(cpl_d6_,i_eb_),racine_d4_),
                    b_eg_=_dM_(prof_ed_-1|0,a_ef_,alpha_d1_[1],beta_d2_[1]);
                   l_d3_[1]=[0,b_eg_,l_d3_[1]];
                   beta_d2_[1]=_K_(beta_d2_[1],b_eg_);
                   if(beta_d2_[1]<=alpha_d1_[1])throw [0,_dj_,beta_d2_[1]];}
                 var _eh_=i_eb_+1|0;
                 if(_ea_!==i_eb_){var i_eb_=_eh_;continue;}
                 break;}}
             var _ei_=joueur_d5_?alpha_d1_[1]:beta_d2_[1],eval_ej_=_ei_;
             break;}}
         catch(_ek_)
          {if(_ek_[1]===_dk_)
            var _el_=_ek_[2];
           else
            {if(_ek_[1]!==_dj_)throw _ek_;var _el_=_ek_[2];}
           var eval_ej_=_el_;}
         var l1_em_=l_d3_[1],l2_en_=0;
         for(;;)
          {if(l1_em_)
            {var
              l_eo_=l1_em_[2],
              _ep_=[0,l1_em_[1],l2_en_],
              l1_em_=l_eo_,
              l2_en_=_ep_;
             continue;}
           l_d3_[1]=l2_en_;
           return _eq_(eval_ej_,l_d3_[1],cpl_d6_);}}],
     _eQ_=[0,_ck_,_bQ_,_bP_,_cw_,_cx_,_cW_],
     P4_squelette_eS_=
      _dC_
       (function(_eA_)
          {return function(Alpha_eC_)
            {var
              prof_es_=[0,4],
              Gagne_et_=[0,_D_],
              Perd_eu_=[0,_C_],
              Nul_ev_=[0,_B_],
              _ew_=[0,_bx_(0)];
             function _eJ_(joueur_ex_,param_eB_)
              {var choix_ey_=_er_(joueur_ex_,_ew_[1]),ancien_jeu_ez_=_ew_[1];
               _ew_[1]=_bz_(joueur_ex_,choix_ey_,_ew_[1]);
               _c4_(joueur_ex_,choix_ey_,ancien_jeu_ez_,_ew_[1]);
               switch(_aS_(_eA_[6],joueur_ex_,_ew_[1]))
                {case 1:throw [0,Perd_eu_];
                 case 2:throw [0,Nul_ev_];
                 case 3:return 0;
                 default:throw [0,Gagne_et_];}}
             function _eL_(joueur_eD_,param_eG_)
              {var
                choix_eE_=_dq_(Alpha_eC_[1],prof_es_[1],joueur_eD_,_ew_[1]),
                ancien_jeu_eF_=_ew_[1];
               _ew_[1]=_bz_(joueur_eD_,choix_eE_,_ew_[1]);
               _c4_(joueur_eD_,choix_eE_,ancien_jeu_eF_,_ew_[1]);
               switch(_aS_(_eA_[6],joueur_eD_,_ew_[1]))
                {case 1:throw [0,Perd_eu_];
                 case 2:throw [0,Nul_ev_];
                 case 3:return 0;
                 default:throw [0,Gagne_et_];}}
             return [0,
                     prof_es_,
                     Gagne_et_,
                     Perd_eu_,
                     Nul_ev_,
                     _c1_,
                     _c2_,
                     _c3_,
                     _c0_,
                     _ew_,
                     _cY_,
                     _cX_,
                     _eJ_,
                     _eL_,
                     function(param_eP_)
                      {var a_eI_=_cZ_(0),b_eH_=_cZ_(0);
                       _ew_[1]=_bx_(0);
                       _c5_(0);
                       if(0===a_eI_)
                        {if(0===b_eH_)
                          {var _eK_=_dC_(_eJ_,0);return [0,_dC_(_eJ_,1),_eK_];}
                         var _eM_=_dC_(_eL_,0);
                         return [0,_dC_(_eJ_,1),_eM_];}
                       if(0===b_eH_)
                        {var _eN_=_dC_(_eJ_,0);return [0,_dC_(_eL_,1),_eN_];}
                       var _eO_=_dC_(_eL_,0);
                       return [0,_dC_(_eL_,1),_eO_];}];};}
         (_eQ_),
        _eR_),
     fini_eT_=[0,0],
     _e2_=P4_squelette_eS_[7],
     _e1_=P4_squelette_eS_[6],
     _e0_=P4_squelette_eS_[5],
     _eZ_=P4_squelette_eS_[4],
     _eY_=P4_squelette_eS_[3],
     _eX_=P4_squelette_eS_[2],
     _eW_=P4_squelette_eS_[10],
     _eV_=P4_squelette_eS_[8],
     _eU_=P4_squelette_eS_[14];
    _dC_(P4_squelette_eS_[11],0);
    for(;;)
     {if(fini_eT_[1]){_dC_(_eW_,0);do_at_exit_av_(0);return;}
      try
       {var _e3_=_dC_(_eU_,0);
        for(;;){if(1){_dC_(_e3_[1],0);_dC_(_e3_[2],0);continue;}break;}}
      catch(_e4_)
       {if(_e4_[1]===_eX_)
         _dC_(_e0_,0);
        else
         if(_e4_[1]===_eY_)
          _dC_(_e1_,0);
         else
          {if(_e4_[1]!==_eZ_)throw _e4_;_dC_(_e2_,0);}}
      fini_eT_[1]=1-_dC_(_eV_,0);
      continue;}}
  ());
