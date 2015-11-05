<cfcomponent output="false"><cfscript>

this.sRender = "";
this.oMarkUp = "";
this.sSyntaxPath = "markup.syntax.";



public component function init(required string _sMarkUp){
	this.oMarkup = createObject(this.sSyntaxPath & _sMarkUp);
}



public void function add(required string _sType, any _y1, any _y2, any _y3){
	this.sRender &= this.noAdd(argumentCollection=arguments);
}



public string function noAdd(required string _sType, any _y1, any _y2, any _y3){
	var sRenderSection="";
	var uNewArgs = {};

	if (structKeyExists(this.oMarkup, _sType) && isCustomFunction(this.oMarkup[_sType])){
		uNewArgs = structCopy(arguments);
		structDelete(uNewArgs,"_sType");
		sRenderSection = invoke(this.oMarkup, _sType, uNewArgs);
	} else {
		throw("Builder", "Markup type not found", "The markup type of #_sType# is not a valid elemenr for #this.oMarkup.getLanguage()#");
	}

	return sRenderSection;
}



public string function get(){
	return this.sRender;
}



public void function clear(){
	this.sRender = "";
}



</cfscript></cfcomponent>