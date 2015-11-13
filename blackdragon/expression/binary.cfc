<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>


this.sType													= "BINARY";
this.oLeft													= null;
this.oRight													= null;
this._sOperator											= "";


public blackdragon.expression function init(required string _sOperator, required blackdragon.expression _oLeft, required blackdragon.expression _oRight){
	this._sOperator = _sOperator;
	this.oLeft = _oLeft;
	this.oRight = _oRight;
}







</cfscript></cfcomponent>