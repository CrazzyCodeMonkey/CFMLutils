<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>



this.sType													= "UNARY";
VARIABLES.oOperand									= null;
VARIABLES.sOperator									= "";



public blackdragon.expression function init(required string _sOperator, required blackdragon.expression _oOperand){
	sOperator = _sOperator;
	oOperand = _oOperand;

	return SUPER.init();
}



public string function prefix( string _sDelim = " "){
	var sFormat = "prefix";
	return this.getOperator() & this.oOperand.expressionRender(sFormat, _sDelim);
}



public string function postfix( string _sDelim = " "){
	var sFormat = "postfix";
	return this.oOperand.expressionRender(sFormat, _sDelim) & this.getOperator();
}



public string function infix( string _sDelim = " "){
	var sFormat = "infix";
	return this.getOperator() & this.oOperand.expressionRender(sFormat, _sDelim);
}



public string function getOperator(){
	return sOperator;
}






</cfscript></cfcomponent>