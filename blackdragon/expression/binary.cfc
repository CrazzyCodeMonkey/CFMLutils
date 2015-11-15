<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>


this.sType													= "BINARY";
this.oOperandLeft										= null;
this.oOperandRight									= null;
this.sOperator											= "";


public blackdragon.expression function init(required string _sOperator, required blackdragon.expression _oLeft, required blackdragon.expression _oRight){
	this.sOperator = _sOperator;
	this.oOperandLeft = _oLeft;
	this.oOperandRight = _oRight;
}


public string function prefix( string _sDelim = " "){
	return this.sOperator & _sDelim & this.oOperandLeft.expressionRender("prefix") & _sDelim & this.oOperandRight.expressionRender("prefix");
}

public string function postfix( string _sDelim = " "){
	return this.oOperandLeft.expressionRender("prefix") & _sDelim & this.oOperandRight.expressionRender("prefix") & _sDelim & this.sOperator;
}


public string function infix( string _sDelim = " "){
	return this.oOperandLeft.expressionRender("prefix") & _sDelim & & this.sOperator & _sDelim this.oOperandRight.expressionRender("prefix");
}







</cfscript></cfcomponent>