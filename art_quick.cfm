<cfparam name="url.artwork_id" type="numeric" />

<cfset artwork = application.gallery.artwork_quickview(artwork_id: val(url.artwork_id)) />

<cfoutput><img src="/resources/images/gallery/artists/#artwork.artist_id#/#artwork.artwork_id#/#artwork.img_medium#" /></cfoutput>