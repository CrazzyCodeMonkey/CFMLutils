<cfcomponent output="false" extends="markup" implements="iMarkup"><cfscript>
	/**
		* @class markup.syntax.html
		*
		*/


this.sMarkup = "HTML";
this.sNewLine = "</br>";



/**
 * reader a header level 1 item
 *
 * @method header1
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header1(required string _y1) hint="reader a header level 1 item" {
	return "<h1>" & _y1  & "</h1>";
}



/**
 * reader a header level 2 item
 *
 * @method header2
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header2(required string _y1) hint="reader a header level 2 item" {
	return "<h2>" & _y1 & "</h2>";
}



/**
 * reader a header level 3 item
 *
 * @method header3
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header3(required string _y1) hint="reader a header level 3 item" {
	return "<h3>" & _y1 & "</h3>";
}



/**
 * reader a header level 4 item
 *
 * @method header4
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header4(required string _y1) hint="reader a header level 4 item" {
	return "<h4>" & _y1 & "</h4>";
}



/**
 * reader a header level 5 item
 *
 * @method header5
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header5(required string _y1) hint="reader a header level 5 item" {
	return "<h5>" & _y1 & "</h5>";
}



/**
 * reader a header level 6 item
 *
 * @method header6
 * @public
 * @param {string} _y1 (required) the header text
 * @return {string}
 */
public string function header6(required string _y1) hint="reader a header level 6 item" {
	return "<h6>" & _y1 & "</h6>";
}



/**
 * render a paragraph item
 *
 * @method paragraph
 * @public
 * @param {string} _y1 (required) the paragraph text
 * @return {string}
 */
public string function paragraph(required string _y1) hint="render a paragraph item" {
	return "<p>" & y1 & "</p>;
}



/**
 * render a blockquote item
 *
 * @method blockquote
 * @public
 * @param {string} _y1 (required) the blockquote text
 * @return {string}
 */
public string function blockquote(required string _y1) hint="render a blockquote item" {
	return "<blockquote>" & _y1 & "</blockquote>";
}


/**
 * render an item in bold
 *
 * @method bold
 * @public
 * @param {string} _y1 (required) the text to bold
 * @return {string}
 */
public string function bold(required string _y1) hint="render an item in bold" {
	return "<strong>" & _y1 & "</strong>";
}



/**
 * render an item in italics
 *
 * @method italic
 * @public
 * @param {string} _y1 (required) the text to italicize
 * @return {string}
 */
public string function italic(required string _y1) hint="render an item in italics" {
	return "<em>" & _y1 & "</em>";
}



/**
 * render an item as code
 *
 * @method code
 * @public
 * @param {string} _y1 (required) the code to render
 * @param {string} [_y2 = ""] the language to render in (if multiline)
 * @return {string}
 */
public string function code(required string _y1, string _y2="") hint="render an item as code" {
	return "<code>" & _y1 & "</code>;
}



/**
 * render a link
 *
 * @method link
 * @public
 * @param {string} _y1 (required) the source of the link
 * @param {string} _y2 (required) the text to display for the link
 * @return {string}
 */
public string function link(required string _y1, required string _y2) hint="render a link" {
	return "<a href='" & _y1 & "'>" & _y2 & "</a>";
}



/**
 * render a horizontil rule
 *
 * @method rule
 * @public
 * @return {string}
 */
public string function rule() hint="render a horizontil rule" {
	return "</ hr />";
}

/**
 * render a list or a specific type
 *
 * @method list
 * @public
 * @param {string} _y1 (required) the type of list (bullet/number)
 * @param {array} _y2 (required) an array of list items
 * @param {numeric} [_y3 = 0] the indent level of the list
 * @return {string}
 */
public string function list(required string _y1, required array _y2) hint="render a list or a specific type" {
	var sList = "";

	if (_y1=="bullet"){
		sList = this.bulletList(_y2);
	} else if (_y1=="number"){
		sList = this.numberList(_y2);
	}

	return sList;
}

/**
 * render an unordered list
 *
 * @method bulletList
 * @public
 * @param {array} _y1 (required) an array of list items
 * @return {string}
 */
public string function bulletList(required array _y1) hint="render an unordered list" {
	var sList = "<ul>";
	var yItem="";

	for (yItem in _y1){
		var sLine = "<li>";
		if (isArray(yItem)){
			sLine &= this.bulletList(yItem);
		} else {
			sLine &= yItem;
		}

		sList &= sLine & "</li>";
	}

	sList &= "</ul>";

	return sList;
}



/**
 * render an ordered list
 *
 * @method numberList
 * @public
 * @param {array} _y1 (required) an array of list items
 * @param {numeric} [_y2 = 0] the indent leve of the list
 * @return {string}
 */
public string function numberList(required array _y1, numeric _y2=0) hint="render an ordered list" {
	var sList = "<ol>";
	var yItem="";

	for (yItem in _y1){
		var sLine = "<li>";
		if (isArray(yItem)){
			sLine &= this.numberList(yItem,_y2+1);
		} else {
			sLine &= yItem;
		}

		sList &= sLine & "</li>";
	}

	sList &= "</ol>";

	return sList;
}



/**
 * render an image
 *
 * @method image
 * @public
 * @param {string} _y1 (required) the alt text for the image
 * @param {string} _y2 (required) the source for the image
 * @return {string}
 */
public string function image(required string _y1, required string _y2) hint="render an image" {
	return "<img src='" & _y2 & "' alt='" & _y2 & "'>";
}



/**
 * render a new line
 *
 * @method newLine
 * @public
 * @param {numeric} [_nTimes = 1] the number of newlines to render
 * @return {string}
 */
public string function newLine() hint="render a new line" {
	return this.sNewLine;
}




</cfscript></cfcomponent>