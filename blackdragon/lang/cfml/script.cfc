<cfcomponent output="false" implements="blackdragon.lang.iSyntax"><cfscript>


this.sSyntax = "CFML-SCRIPT";

public component function init(){
	this.aFunctions = structKeyArray(getFunctionList());
}



</cfscript></cfcomponent>