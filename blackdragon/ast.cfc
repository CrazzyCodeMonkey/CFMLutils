<cfcomponent output="false"><cfscript>

	variables.aAbstractSyntaxTree = [];
	variables.sExpressionPath = "blackdragon.expression.";



	public component init(){
		return this;
	}



	public void addNode(required blackdragon.expression _oExpression){
		arrayAppend(aAbstractSyntaxTree, _oExpression);
	}



	public blackdragon.expression newNode(required string _sType){
		return createObject(sExpressionPath & _sType);
	}

</cfscript></cfcomponent>