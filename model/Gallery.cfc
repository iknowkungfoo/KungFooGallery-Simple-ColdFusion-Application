<cfcomponent>

	<cffunction name="init" access="public" output="false" returntype="Gallery">
		<cfset variables.dsn = "kungfoogallery" />
		<cfreturn this />
	</cffunction>

	<cffunction name="randomArt" access="public" output="false" returntype="query">
		<cfset var artwork = "" />
		<cfquery name="artwork" datasource="#variables.dsn#">
			SELECT
				a.artist_id,
				a.first_name,
				a.last_name,
				b.artwork_id,
				b.title,
				b.slide,
				b.source_url
			FROM
				ARTISTS a
			INNER JOIN
				ARTWORK b ON b.artist_id = a.artist_id
			ORDER BY RANDOM()
		</cfquery>
		<cfreturn artwork />
	</cffunction>

	<cffunction name="artwork" access="public" output="false" returntype="query">
		<cfargument name="artwork_id" type="numeric" required="true" />
		<cfset var artwork = "" />
		<cfquery name="artwork" datasource="#variables.dsn#">
			SELECT
				a.artist_id,
				a.first_name,
				a.last_name,
				a.twitter,
				a.flickr,
				b.artwork_id,
				b.title,
				b.description,
				b.slide,
				b.img_thumb,
				b.img_medium,
				b.img_large,
				b.source_url
			FROM
				ARTISTS a
			INNER JOIN
				ARTWORK b ON b.artist_id = a.artist_id
			WHERE
				b.artwork_id = <cfqueryparam value="#arguments.artwork_id#" cfsqltype="cf_sql_numeric" />
		</cfquery>
		<cfreturn artwork />
	</cffunction>

	<cffunction name="artwork_grid" access="remote" output="false" returntype="string"  returnformat="json">
		<cfset var dt = new model.json.DataTables() />
		<cfset var artwork = "" />
		<cfquery name="artwork" datasource="kungfoogallery">
			SELECT
				a.artist_id,
				a.first_name,
				a.last_name,
				b.artwork_id,
				b.title,
				b.img_thumb,
				b.img_medium
			FROM
				ARTISTS a
			INNER JOIN
				ARTWORK b ON b.artist_id = a.artist_id
		</cfquery>
		<cfset dt.setData(artwork) />
		<cfreturn dt.$renderData() />
	</cffunction>

	<cffunction name="artwork_quickview" access="public" output="false" returntype="query">
		<cfargument name="artwork_id" type="numeric" required="true" />
		<cfset var artwork = "" />
		<cfquery name="artwork" datasource="#variables.dsn#">
			SELECT
				a.artist_id,
				b.artwork_id,
				b.img_medium
			FROM
				ARTISTS a
			INNER JOIN
				ARTWORK b ON b.artist_id = a.artist_id
			WHERE
				b.artwork_id = <cfqueryparam value="#arguments.artwork_id#" cfsqltype="cf_sql_numeric" />
		</cfquery>
		<cfreturn artwork />
	</cffunction>

	<cffunction name="artist_more" access="remote" output="false" returntype="string"  returnformat="json">
		<cfset var dt = new model.json.ArrayCollection() />
		<cfset var artwork = "" />
		<cfquery name="artwork" datasource="kungfoogallery">
			SELECT * FROM (
				SELECT
					a.artist_id,
					b.artwork_id,
					b.title,
					b.img_thumb,
					ROW_NUMBER() OVER () AS row
				FROM
					ARTISTS a
				INNER JOIN
					ARTWORK b ON b.artist_id = a.artist_id
				WHERE
					b.artist_id = <cfqueryparam value="#arguments.artist_id#" cfsqltype="cf_sql_numeric" />
			) AS CTE
			WHERE CTE.row <= 5
		</cfquery>
		<cfset dt.setData(artwork) />
		<cfreturn dt.$renderData() />
	</cffunction>

</cfcomponent>