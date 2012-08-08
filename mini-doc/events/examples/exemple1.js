enyo.kind({
    name:"App",
    kind:"FittableColumns",
    handlers: {
	ontap:"apptap"
    },
    apptap:function(s,e){
	//alert("bla");
    },
    components:[
	{
	    name:"Pere",
	    kind:"Control",
	    style:"border:10px solid green;",
	    handlers: {
		ontap:"tap"
	    },
	    tap:function(sender,e){
		console.log("Traitant : "+this.name+" - Emetteur : "+sender.name+" - Emetteur d'origine : "+e.originator.name);
		return false;
	    },
	    components : [
		{
		    name:"Fils",
		    style:"border:10px solid pink;",
		    handlers: {
			ontap:"tap",
		    },
		    tap:function(sender,e){
			console.log("Traitant : "+this.name+" - Emetteur : "+sender.name+" - Emetteur d'origine : "+e.originator.name);
			return false;
		    },
		    components : [
			{
			    name:"Petit-fils",
			    content:"MON CONTROLE",
			    style:"border:10px solid blue;",
			    handlers : {
				ontap:"tap"
			    },
			    tap:function(sender,e){
				console.log("Traitant : "+this.name+" - Emetteur : "+sender.name+" - Emetteur d'origine : "+e.originator.name);
				return false;
			    },
			}
		    ]
		}
	    ]
	}]
});