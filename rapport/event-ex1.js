enyo.kind({kind:"Control",
           name:"MonCadre",
           components: [
               {kind:"Input", value:""},
               {kind:"Button", content:"ok",
		handlers:{ontap:"monCallback"},
		monCallback:function(sender, event){
                    alert("ok");
		    return true;
		}
               }
           ]
          });
