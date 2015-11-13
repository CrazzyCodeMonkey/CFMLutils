<cfcomponent output="false"><cfscript>


variables.bInit											= false;
variables.sCode											= "";
variables.sSyntax										= "";
variables.oSyntax										= "";
variables.oAST											= "";
variables.uSyntax										= {
	sPath																: "blackdragon.lang.",
	sClass															: ".syntax"};
variables.uPos											= {
	nGlobalPos													: 0,
	nLinePos														: 0,
	nLine																: 0};
variables.uSize											= {
	nLines															: 0,
	nCharacters													: 0};

public component function init(required string _sSyntax, string _sPath, string _sCode){

	try {
		oSyntax													= createObject(variables.uSyntax.sPath & lCase(_sSyntax) & variables.uSyntax.sClass).init(this);

	} catch(any e){
		throw("BlackDragon","Undefined Syntax", "'#_sSyntax#' is not a supported Syntax");
	}

	if (len(trim(_sPath)) > 0 && fileExists(_sPath)){
		_sCode													= fileRead(_sPath);
	}

	if (len(trim(_sCode)) > 0){
		sCode														= _sCode;
	}

	if (len(sCode)>0){
		uSize.nLines										= variables.oSyntax.getLineCount();
		uSize.nCharacters								= variables.oSyntax.getSourceLength();
	}
}


public string function getSourceCode(){
	return variables.sCode;
}



public struct function getStats(){
	return variables.uSize;
}



</cfscript></cfcomponent>