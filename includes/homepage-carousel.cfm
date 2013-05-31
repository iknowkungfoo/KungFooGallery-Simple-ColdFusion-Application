<cfset artwork = new model.Gallery().randomArt() />

<div id="welcomeCarousel" class="carousel slide">
	<ol class="carousel-indicators">
		<li data-target="#welcomeCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#welcomeCarousel" data-slide-to="1"></li>
		<li data-target="#welcomeCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<cfoutput query="artwork" maxrows="3">
			<div class="item<cfif artwork.currentrow EQ 1> active</cfif>">
				<a href="art.cfm?artwork_id=#artwork.artwork_id#"><img src="resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#artwork.slide#" /></a>
				<div class="carousel-caption">
					<h4>#artwork.title#</h4>
					<p>&copy; #encodeForHTML(artwork.first_name & " " & artwork.last_name)# (<a href="#encodeForHTMLAttribute(artwork.source_url)#" class="outbound">Source</a>)</p>
				</div>
			</div>
		</cfoutput>
	</div>
	<!--- Left / Right slide controls --->
	<a class="carousel-control left" href="#welcomeCarousel" data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#welcomeCarousel" data-slide="next">&rsaquo;</a>
</div>