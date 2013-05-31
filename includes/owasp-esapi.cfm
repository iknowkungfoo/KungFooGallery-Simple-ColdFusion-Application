<!--- 
	Security functions defined by the Open Web Application Security Project (OWASP)
	https://www.owasp.org/index.php/Main_Page
	Replacements for ColdFusion's HTMLEditFormat()
 --->
<cfscript>
	public string function decodeFromURL( required string str ){
		return application.esapiEncoder.decodeFromURL( arguments.str );
	}
	
	public string function encodeForCSS( required string str ){
		return application.esapiEncoder.encodeForCSS( arguments.str );
	}
	
	public string function encodeForHTML( required string str ){
		return application.esapiEncoder.encodeForHTML( arguments.str );
	}
	
	public string function encodeForHTMLAttribute( required string str ){
		return application.esapiEncoder.encodeForHTMLAttribute( arguments.str );
	}
	
	public string function encodeForJavaScript( required string str ){
		return application.esapiEncoder.encodeForJavaScript( arguments.str );
	}
	
	public string function encodeForURL( required string str ){
		return application.esapiEncoder.encodeForURL( arguments.str );
	}
	
	public string function encodeForXML( required string str ){
		return application.esapiEncoder.encodeForXML( arguments.str );
	}
	
	public string function encodeForXMLAttribute( required string str ){
		return application.esapiEncoder.encodeForXMLAttribute( arguments.str );
	}
	
	public string function encodeForXPath( required string str ){
		return application.esapiEncoder.encodeForXPath( arguments.str );
	}
</cfscript>