<cfinclude template="includes/header.cfm" />

<cfset artwork = application.gallery.artwork(artwork_id: val(url.artwork_id)) />

<script type="text/javascript">
	KFG.cfvars.art = (function(){
		return {
		<cfoutput>
			thumb: "resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#encodeForJavaScript(artwork.img_thumb)#",
			medium: "resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#encodeForJavaScript(artwork.img_medium)#",
			large: "resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#encodeForJavaScript(artwork.img_large)#",
			slide: "resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#encodeForJavaScript(artwork.slide)#",
			artist_id: #artwork.artist_id#
        </cfoutput>
		};
	})();
</script>

<h2>Artwork Information</h2>

<div class="row-fluid">
	<div class="span9">
		<cfoutput>
			<h3>#artwork.title#</h3>
			<p>More sizes: <a class="switchImage" data-size="thumb">Thumbnail</a> | <a class="switchImage" data-size="medium">Medium</a> | <a class="switchImage" data-size="large">Large</a> | <a class="switchImage" data-size="slide">Slide</a></p>
			<figure id="featured_art">
				<img id="artwork" src="resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#encodeForHTMLAttribute(artwork.img_medium)#" />
				<figcaption>
					<br />
					<p>#artwork.description#</p>
					<p>&copy; <a href="artist.cfm?artist_id=#artwork.artist_id#">#encodeForHTML(artwork.first_name & " " & artwork.last_name)#</a> (<a href="#encodeForHTMLAttribute(artwork.source_url)#" class="outbound">Source</a>)</p>
				</figcaption>
			</figure>
        </cfoutput>
	</div>

	<!--- Version 1 --->
	<!---<div class="span3">
		<cfinclude template="includes/artist_more.cfm" />
	</div>--->

	<!--- Version 2 --->
	<!---<div class="span3">
		<cfinclude template="includes/artist_more2.cfm" />
	</div>--->

	<!--- Version 3 --->
	<!---<script type="text/javascript" src="static/artist_more3.js"></script>
	<div id="artist_more" class="span3"></div>--->

	<!--- Version 4 --->
	<script type="text/javascript" src="static/artist_more4.js"></script>
	<div id="artist_more" class="span3"></div>
</div>

<cfinclude template="includes/footer.cfm" />