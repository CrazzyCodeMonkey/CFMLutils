<cfcomponent output="false"><cfscript>

	this.sType												= "BLANK";



	public component function init(){
		return this;
	}



	public string function expressionRender(required string _sFormat, string _sDelim = " "){
		var sValue = "";

		switch(_sFormat){
			case "prefix":
				sValue = this.prefix(_sDelim);
				break;
			case "postfix":
				sValue = this.postfix(_sDelim);
				break;
			case "infix":
				sValue = this.infix(_sDelim);
			default:
				throw("BlackDragon", "Invalid render type", "'#_sFormat#' is not a valid render type");
			break;
		}

		return sValue;
	}

</cfscript></cfcomponent>