<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>



	this.sType													= "BINARY";
	VARIABLES.oOperandLeft							= null;
	VARIABLES.oOperandRight							= null;
	VARIABLES.sOperator									= "";
	VARIABLES.aValid 										= [
		"+", //Add
		"-", //Minus
		"/", //Divide
		"\", //Modulus
		"*", //Multiply
		"||", //Logical OR
		"|", //Bitwise OR
		"&&", //Logical AND
		"&", //Bitwise AND
		"=", //Assignment
		"==", //Logical Equality
		">", //Greater than
		"<", //Less than
		">=", //Greater than or Equal
		"<=", //less than or Equal
	];



	public blackdragon.expression function init(required string _sOperator, required blackdragon.expression _oLeft, required blackdragon.expression _oRight){
		sOperator = _sOperator;
		oOperandLeft = _oLeft;
		oOperandRight = _oRight;

		return SUPER.init();
	}



	public string function prefix( string _sDelim = " "){
		var sFormat = "prefix";
		return this.getOperator() & this.oOperandLeft.expressionRender(sFormat, _sDelim) & this.oOperandRight.expressionRender(sFormat, _sDelim);
	}



	public string function postfix( string _sDelim = " "){
		var sFormat = "postfix";
		return this.oOperandLeft.expressionRender(sFormat, _sDelim) & this.oOperandRight.expressionRender(sFormat, _sDelim) & this.getOperator();
	}



	public string function infix( string _sDelim = " "){
		var sFormat = "indix";
		return this.oOperandLeft.expressionRender(sFormat, _sDelim) & this.getOperator() & this.oOperandRight.expressionRender(sFormat, _sDelim);
	}



	public string function getOperator(){
		return sOperator;
	}



	private boolean function validate(string _sOperator){
		return arrayContains(aValid,_sOperator);
	}



</cfscript></cfcomponent>