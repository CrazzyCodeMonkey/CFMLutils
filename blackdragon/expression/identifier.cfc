<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>


this.sType													= "VALUE";
this.yValue 												= null;



public blackdragon.expression function init(required any _yValue){
	this.yValue = _yValue;

	return SUPER.init();
}



public string function prefix(required string _sDelim = " "){
	return _sDelim & this.yValue;
}



public string function postfix(required string _sDelim = " "){
	return this.yValue & _sDelim;
}


public string function infix(required string _sDelim = " "){
	return _sDelim & this.yValue & _sDelim;
}


</cfscript></cfcomponent>