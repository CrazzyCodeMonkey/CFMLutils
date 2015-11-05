<cfcomponent output="false"><cfscript>

	/**
		* @class markup.builder
		*
		*/

	this.sRender = "";
	this.oMarkUp = "";
	this.sSyntaxPath = "markup.syntax.";



	/**
	 * create the markup syntax
	 *
	 * @method init
	 * @public
	 * @param {string} _sMarkUp (required)
	 */
	public component function init(required string _sMarkUp) hint="create the markup syntax"{
		this.oMarkup = createObject(this.sSyntaxPath & _sMarkUp);
		var uMeta = getMetaData(this.oMarkup);

		/* if (!structKeyExists(uMeta,"implements") || uMeta.implements.name != this.sSyntaxPath & "iMarkup"){
			throw("Builder", "#_sType# does not implement the iMarkup", "iMarkup interface is designed to ensure all Syntax libraries implement the same formatters");
		} */

		this.clear();
	}



	/**
	 * render the item, and append it to the render string
	 *
	 * @method add
	 * @public
	 * @param {string} _sType (required)
	 * @param {any} any _y1
	 * @param {any} any _y2
	 * @param {any} any _y3
	 * @return {component}
	 */
	public component function add(required string _sType, any _y1, any _y2, any _y3) hint="render the item, and append it to the render string"{
		this.sRender &= this.noAdd(argumentCollection=arguments);
		return this;
	}



	/**
	 * render the item, and return it
	 *
	 * @method noAdd
	 * @public
	 * @param {string} _sType (required)
	 * @param {any} any _y1
	 * @param {any} any _y2
	 * @param {any} any _y3
	 * @return {isCustom}
	 */
	public string function noAdd(required string _sType, any _y1, any _y2, any _y3) hint="render the item, and return it"{
		var sRenderSection="";
		var uNewArgs = {};

		//make sure we are rendering an element the specified syntax supports
		if (structKeyExists(this.oMarkup, _sType) && isCustomFunction(this.oMarkup[_sType])){
			//prepare the arguments to pass on
			uNewArgs = structCopy(arguments);
			structDelete(uNewArgs,"_sType");
			//call to render the item
			sRenderSection = invoke(this.oMarkup, _sType, uNewArgs);
		} else {
			//unsupported item
			throw("Builder", "Markup type not found", "The markup type of #_sType# is not a valid elemenr for #this.oMarkup.getLanguage()#");
		}

		return sRenderSection;
	}



	/**
	 * get the rendered string
	 *
	 * @method get
	 * @public
	 * @return {string}
	 */
	public string function get() hint="get the rendered string"{
		return this.sRender;
	}



	/**
	 * clear the rendered string
	 *
	 * @method clear
	 * @public
	 */
	public void function clear() hint="clear the rendered string"{
		this.sRender = "";
	}



</cfscript></cfcomponent>