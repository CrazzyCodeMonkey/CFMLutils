<cfcomponent output="false" implements="blackdragon.lang.iSyntax"><cfscript>


variables.sSyntax										= "CFML";
variables.bTag											= true;
variables.oParser										= "";
variables.uSubSyntax								= {};
variables.sNewLine									= chr(10);

public component function init(blackdragon.parser _oParser){
	variables.uSubSyntax.oTag					= new tag();
	variables.uSubSyntax.oScript			= new script();
	variables.oParser									= _oParser;

	return this;
}

public numeric function getLineCount(){
	return listLen(variables.oParser.getSourceCode(), variables.sNewLine);
}

public numeric function getSourceLength(){
	return len(variables.oParser.getSourceCode());
}

private boolean function isTag(){
	return this.bTag;
}

private boolean function isScript(){
	return (!this.bTag);
}

private void function setTag(){
	this.bTag = true;
}

private void function setScript(){
	this.bTag = false;
}



</cfscript></cfcomponent>