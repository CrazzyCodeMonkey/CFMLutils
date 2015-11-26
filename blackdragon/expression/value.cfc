<cfcomponent output="false" extends="blackdragon.expression" implements="blackdragon.expression.iExpression"><cfscript>


this.sType													= "VALUE";
VARIABLES.yValue 										= null;
VARIABLES.sStringWrapper 						= '"';



public blackdragon.expression function init(required any _yValue){
	yValue = _yValue;

	return SUPER.init();
}



public string function prefix(required string _sDelim = " "){
	return _sDelim & getValue();
}



public string function postfix(required string _sDelim = " "){
	return getValue() & _sDelim;
}


public string function infix(required string _sDelim = " "){
	return _sDelim & getValue() & _sDelim;
}



private string function getValue(){
	var sValue = "";

	if (isNumeric(yValue)){
		sValue = "#yValue#";

	} else if (isBoolean(yValue)) {
		if (yValue){
			sValue = "true";
		} else {
			sValue = "false";
		}
	} else {

		sValue = "#sStringWrapper##yValue##sStringWrapper#";
	}

	return sValue;
}


</cfscript></cfcomponent>