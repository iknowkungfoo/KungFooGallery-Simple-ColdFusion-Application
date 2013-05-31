component {

	this.name = "KungFoo Gallery Twitter Bootstrap";
	this.applicationtimeout = createTimeSpan(0,2,0,0);
	this.sessionmanagement = true;
	this.sessiontimeout = createTimeSpan(0,1,0,0);
	this.datasource = "kungfoogallery";

	public boolean function onApplicationStart(){
		application.gallery = new model.Gallery(this.datasource);
		application.esapiEncoder = createObject("java", "org.owasp.esapi.ESAPI").encoder();
		return true;
	}
	
	public void function onRequest(String targetPage){
        include arguments.targetPage;
    }
	
	public boolean function onRequestStart(String targetPage){
		var keys = structKeyList( this );
		var key = "";
		var i = 1;
		
		for( i = 1; i LTE listLen( keys ); i = i+1){
		
			key = listGetAt( keys, i );
			
			if ( isCustomFunction( this[key] ) and left( lcase( key ), 2 ) NEQ "on" ) {
				structAppend( request, this[key], true );
			}
			
		}
		
		if (structKeyExists(url,"reinit") AND url.reinit) {
			onApplicationStart();
		}
		
		return true;
	}
	
	include "includes/owasp-esapi.cfm";

}