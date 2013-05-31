<cfcomponent extends="ArrayCollection" accessors="true">

	<!---
		Author: Adrian J. Moreno
		Site: http://iknowkungfoo.com
		Twitter: @iknowkungfoo
		Description: A custom JSON render object for ColdFusion queries.
		Repo: https://github.com/iknowkungfoo/ColdBox-Custom-Data-Render
	--->

    <cffunction name="init" access="public" output="false" returntype="DataTables">
		<cfscript>
			setContentType("json");
			setDataHandle(false);
			setDataKeys(true);
			setDataKeyCase("lower");
			setEcho();
			setTotalRecords();
			setTotalDisplayRecords();
			return this;
        </cfscript>
    </cffunction>

    <cffunction name="$renderdata" access="public" output="false" returntype="string" hint="">
        <cfset var rs = {} />
		<cfif getEcho() GT 0>
			<cfset rs["sEcho"] = val(getEcho()) />
		</cfif>
		<cfif getTotalRecords() GT 0>
			<cfset rs["iTotalRecords"] = getTotalRecords() />
		</cfif>
		<cfif getTotalDisplayRecords() GT 0>
			<cfset rs["iTotalDisplayRecords"] = getTotalDisplayRecords() />
		</cfif>
		<cfif getDataKeys()>
			<cfset rs["aaData"] = queryToArrayOfStructs() />
		<cfelse>
			<cfset rs["aaData"] = queryToArrayOfArrays() />
		</cfif>
		<cfreturn serializeJSON( rs ) />
    </cffunction>

    <cffunction name="setData" access="public" output="false" returntype="void" hint="Setup DataTables defaults.">
        <cfargument name="data" type="query" required="true">
        <cfset variables.data = arguments.data />
		<cfif getEcho() EQ 0>
			<cfset setTotalRecords( arguments.data.recordcount ) />
			<cfset setTotalDisplayRecords( arguments.data.recordcount ) />
		</cfif>
    </cffunction>

    <cffunction name="setEcho" access="public" output="false" returntype="void">
		<cfargument name="echo" type="numeric" required="false" default="0" />
		<cfset variables.echo = arguments.echo />
    </cffunction>
    <cffunction name="getEcho" access="public" output="false" returntype="numeric">
    	<cfreturn variables.echo />
    </cffunction>

    <cffunction name="setTotalRecords" access="public" output="false" returntype="void">
		<cfargument name="totalRecords" type="numeric" required="false" default="0" />
		<cfset variables.totalRecords = arguments.totalRecords />
    </cffunction>
    <cffunction name="getTotalRecords" access="public" output="false" returntype="numeric">
    	<cfreturn variables.totalRecords />
    </cffunction>

    <cffunction name="setTotalDisplayRecords" access="public" output="false" returntype="void">
		<cfargument name="totalDisplayRecords" type="boolean" required="false" default="0" />
		<cfset variables.totalDisplayRecords = arguments.totalDisplayRecords />
    </cffunction>
    <cffunction name="getTotalDisplayRecords" access="public" output="false" returntype="boolean">
    	<cfreturn variables.totalDisplayRecords />
    </cffunction>

</cfcomponent>