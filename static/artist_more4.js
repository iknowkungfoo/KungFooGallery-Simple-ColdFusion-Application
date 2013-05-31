KFG.artistMore = (function(){
	
	$(document).ready(function(){
		KFG.setHandlebar('artist_more', 
				'artistMore', 
				'templates/artist_more.handlebars',
				'model/Gallery.cfc?method=artist_more',
				{ artist_id: KFG.cfvars.art.artist_id }
				);
	});
	
})();