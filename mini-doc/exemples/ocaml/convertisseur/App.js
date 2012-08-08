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
function caml_js_wrap_callback(f) {
  var toArray = Array.prototype.slice;
  return function () {
    var args = (arguments.length > 0)?toArray.call (arguments):[undefined];
    return caml_call_gen(f, args);
  }
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
   {var _a_=[0,new MlString("Invalid_argument")];
    caml_register_global(5,[0,new MlString("Division_by_zero")]);
    caml_register_global(3,_a_);
    caml_register_global(2,[0,new MlString("Failure")]);
    var
     _G_=new MlString("Pervasives.do_at_exit"),
     _F_=new MlString("Random.int"),
     _E_=
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
     _D_=new MlString("background-color"),
     _C_=new MlString("Select"),
     _B_=new MlString("\xc2\xb0C"),
     _A_=new MlString("\xc2\xb0F"),
     _z_=new MlString("\xc2\xb0K"),
     app_name_y_=new MlString("App"),
     _x_=new MlString("Control"),
     _w_=new MlString("onyx.Toolbar"),
     _v_=new MlString("maToolBar"),
     _u_=new MlString("clique"),
     _t_=new MlString("onyx.InputDecorator"),
     _s_=new MlString("onyx.Input"),
     _r_=new MlString("monInput"),
     _q_=new MlString("select1"),
     _p_=new MlString("Control"),
     _o_=new MlString("en"),
     _n_=new MlString("select2"),
     _m_=new MlString("onyx.Button"),
     _l_=new MlString("Convertir"),
     _k_=new MlString("convert"),
     _j_=new MlString("Control"),
     _i_=new MlString("resultat"),
     _h_=new MlString("black"),
     _g_=
      [0,
       new MlString("black"),
       new MlString("white"),
       new MlString("gray"),
       new MlString("green"),
       new MlString("blue"),
       new MlString("pink"),
       new MlString("yellow")];
    function do_at_exit_f_(param_e_)
     {var param_b_=caml_ml_out_channels_list(0);
      for(;;)
       {if(param_b_)
         {var l_c_=param_b_[2];try {}catch(_d_){}var param_b_=l_c_;continue;}
        return 0;}}
    caml_register_named_value(_G_,do_at_exit_f_);
    var _H_=[0,0];
    32===caml_sys_get_config(0)[2];
    var
     _I_=[0,_E_.slice(),0],
     _true_J_=true,
     array_constructor_K_=Array,
     undefined_N_=undefined,
     _false_M_=false;
    function _O_(e_L_)
     {return e_L_ instanceof array_constructor_K_
              ?0
              :[0,new MlWrappedString(e_L_.toString())];}
    _H_[1]=[0,_O_,_H_[1]];
    var window_P_=window,document_Q_=window_P_.document;
    window.HTMLElement===undefined_N_;
    function creer_composant_T_(kind_S_)
     {var obj_R_=new Object();obj_R_.kind=kind_S_.toString();return obj_R_;}
    function creer_container_ac_(nom_W_,kind_U_)
     {var obj_V_=creer_composant_T_(kind_U_);
      obj_V_.name=nom_W_.toString();
      return obj_V_;}
    function add_components_aj_(obj_X_,array_Y_)
     {return obj_X_.components=array_Y_;}
    function build_array_ai_(liste_$_)
     {var i_Z_=[0,0],___=new array_constructor_K_(),liste_aa_=liste_$_;
      for(;;)
       {if(liste_aa_)
         {var t_ab_=liste_aa_[2];
          ___[i_Z_[1]]=liste_aa_[1];
          i_Z_[1]+=1;
          var liste_aa_=t_ab_;
          continue;}
        return ___;}}
    function creer_select_ak_(name_ad_)
     {var
       obj_ae_=creer_container_ac_(name_ad_,_C_),
       value1_af_=new Object(),
       value2_ag_=new Object(),
       value3_ah_=new Object();
      value1_af_.content=_B_.toString();
      value2_ag_.content=_A_.toString();
      value3_ah_.content=_z_.toString();
      value1_af_.value=0;
      value2_ag_.value=1;
      value3_ah_.value=2;
      add_components_aj_
       (obj_ae_,
        build_array_ai_([0,value1_af_,[0,value2_ag_,[0,value3_ah_,0]]]));
      return obj_ae_;}
    var
     monControl_al_=creer_container_ac_(app_name_y_,_x_),
     maToolBar_am_=creer_container_ac_(_v_,_w_);
    maToolBar_am_.ontap=_u_.toString();
    var
     monDecorator_an_=creer_composant_T_(_t_),
     monInput_ao_=creer_container_ac_(_r_,_s_),
     monSelect1_aq_=creer_select_ak_(_q_),
     monLabel_ap_=creer_composant_T_(_p_);
    monLabel_ap_.content=_o_.toString();
    var
     monSelect2_as_=creer_select_ak_(_n_),
     monBouton_ar_=creer_composant_T_(_m_);
    monBouton_ar_.content=_l_.toString();
    monBouton_ar_.ontap=_k_.toString();
    var result_au_=creer_container_ac_(_i_,_j_),monPublished_at_=new Object();
    monPublished_at_.nbClick=0;
    monPublished_at_.color=_h_;
    var tabCouleurs_av_=_g_.slice();
    monControl_al_.published=monPublished_at_;
    add_components_aj_(monDecorator_an_,build_array_ai_([0,monInput_ao_,0]));
    add_components_aj_
     (maToolBar_am_,
      build_array_ai_
       ([0,
         monDecorator_an_,
         [0,
          monSelect1_aq_,
          [0,
           monLabel_ap_,
           [0,monSelect2_as_,[0,monBouton_ar_,[0,result_au_,0]]]]]]));
    add_components_aj_(monControl_al_,build_array_ai_([0,maToolBar_am_,0]));
    monControl_al_.convert=
    function(container_aD_,event_aE_)
     {var
       value_aw_=parseFloat(this.$.monInput.getValue()),
       from_ax_=this.$.select1.getValue(),
       _ay_=(from_ax_+this.$.select2.getValue()|0)-1|0;
      if(_ay_<0||20<_ay_)
       var _az_=0;
      else
       {switch(_ay_)
         {case 0:var _aA_=value_aw_*1.8+32,_aB_=1;break;
          case 1:var _aA_=value_aw_+273.15,_aB_=1;break;
          case 9:var _aA_=(value_aw_-32)/1.8,_aB_=1;break;
          case 11:var _aA_=(value_aw_+459.67)/1.8,_aB_=1;break;
          case 19:var _aA_=value_aw_-273.15,_aB_=1;break;
          case 20:var _aA_=value_aw_*1.8-459.67,_aB_=1;break;
          default:var _az_=0,_aB_=0;}
        if(_aB_){var res_aC_=_aA_,_az_=1;}}
      if(!_az_)var res_aC_=value_aw_;
      this.$.resultat.setContent(res_aC_);
      return _true_J_;};
    monControl_al_.clique=
    function(cont_aL_,ev_aM_)
     {var nbClick_aF_=this.getNbClick();
      this.setNbClick(nbClick_aF_+1|0);
      if(0===((1+nbClick_aF_|0)%5|0))
       {var _aG_=tabCouleurs_av_.length-1;
        if(1073741823<_aG_||!(0<_aG_))
         var _aH_=0;
        else
         for(;;)
          {_I_[2]=(_I_[2]+1|0)%55|0;
           var
            newval_aI_=
             caml_array_get(_I_[1],(_I_[2]+24|0)%55|0)+
             (caml_array_get(_I_[1],_I_[2])^
              caml_array_get(_I_[1],_I_[2])>>>
              25&
              31)|
             0;
           caml_array_set(_I_[1],_I_[2],newval_aI_);
           var _aJ_=newval_aI_&1073741823,v_aK_=caml_mod(_aJ_,_aG_);
           if(((1073741823-_aG_|0)+1|0)<(_aJ_-v_aK_|0))continue;
           this.$.maToolBar.applyStyle
            (_D_,caml_array_get(tabCouleurs_av_,v_aK_));
           var _aH_=1;
           break;}
        if(!_aH_)throw [0,_a_,_F_];}
      return _true_J_;};
    enyo.kind(monControl_al_);
    var enyo_obj_aN_=new App();
    function handler_aP_(param_aO_)
     {enyo_obj_aN_.renderInto(document_Q_.body);return _false_M_;}
    window_P_.onload=
    caml_js_wrap_callback
     (function(e_aQ_)
       {if(e_aQ_)
         {var res_aR_=handler_aP_(e_aQ_);
          if(!(res_aR_|0))e_aQ_.preventDefault();
          return res_aR_;}
        var _aS_=event,res_aT_=handler_aP_(_aS_);
        _aS_.returnValue=res_aT_;
        return res_aT_;});
    do_at_exit_f_(0);
    return;}
  ());
