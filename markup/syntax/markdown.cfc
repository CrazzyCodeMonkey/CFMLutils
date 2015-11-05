<cfcomponent output="false" extends="markup"><cfscript>


this.sMarkup = "MarkDown";
this.sNewLine = chr(13) & chr(10);



public string function header1(required string _y1){
	return this.hN(1) & " " & _y1  & " " & this.hN(1) & this.newLine();
}



public string function header2(required string _y1){
	return this.hN(2) & " " & _y1 & " " & this.hN(2) & this.newLine();
}



public string function header3(required string _y1){
	return this.hN(3) & " " & _y1 & " " & this.hN(3) & this.newLine();
}



public string function header4(required string _y1){
	return this.hN(4) & " " & _y1 & " " & this.hN(4) & this.newLine();
}



public string function header5(required string _y1){
	return this.hN(5) & " " & _y1 & " " & this.hN(5) & this.newLine();
}



public string function header6(required string _y1){
	return this.hN(6) & " " & _y1 & " " & this.hN(6) & this.newLine();
}



public string function paragraph(required string _y1) {
	return _y1 & this.newLine(2);
}



public string function blockquote(required string _y1){
	var aLines = listToArray(_y1, this.sNewLine,true);
	var sLine ="";
	var sQuote="";

	for (sLine in aLines){
		sQuote &= "> " & sLine & this.newLine();
	}

	sQuote &= this.newLine();

	return sQuote;
}


public string function bold(required string _y1){
	return "**" & _y1 & "**";
}



public string function italic(required string _y1){
	return "_" & _y1 & "_";
}



public string function code(required string _y1, string _y2=""){
	var sCode = "";
	if (listLen(_y1,this.newLine())==1){
		sCode = "`" & _y1 & "`";
	} else {
		sCode = this.newLine(2) & "```" & _y2 & this.newLine() & _y1 & this.newLine() & "```" & this.newLine(2);
	}

	return sCode;
}



public string function link(required string _y1, required string _y2){
	return "[" & _y2 & "](" & _y1 & ")";
}



public string function rule(){
	return this.newLine(2) & "---" & this.newLine();
}

public string function list(required string _y1, required array _y2, numeric _y3=0){
	var sList = "";

	if (_y1=="bullet"){
		sList = this.bulletList(_y2, _y3);
	} else if (_y1=="number"){
		sList = this.numberList(_y2, _y3);
	}

	return sList;
}

public string function bulletList(required array _y1, numeric _y2=0){
	var sList = "";
	var yItem="";

	for (yItem in _y1){
		var sLine = "";
		if (isArray(yItem)){
			sLine = this.bulletList(yItem,_y2+1);
		} else {
			sLine = repeatString("  ", _y2) & "* " & yItem & this.newLine();
		}

		sList &= sLine;
	}

	if (_y2==0){
		sList &= this.newLine();
	}

	return sList;
}



public string function numberList(required array _y1, numeric _y2=0){
	var sList = "";
	var yItem="";
	var count=1;

	for (yItem in _y1){
		var sLine = "";
		if (isArray(yItem)){
			sLine = this.numberList(yItem,_y2+1);
		} else {
			sLine = repeatString("  ", _y2) & count & ". " & yItem & this.newLine();
			count++;
		}

		sList &= sLine;
	}

	if (_y2==0){
		sList &= this.newLine();
	}

	return sList;
}



public string function image(required string _y1, required string _y2){
	return "![" & _y1 & "](" & _y2 & ")";
}





private string function hN(required numeric _nLevel){
	return repeatString("##", _nLevel);
}


private string function newLine(numeric _nTimes=1){
	return repeatString(this.sNewLine, _nTimes);
}


</cfscript></cfcomponent>