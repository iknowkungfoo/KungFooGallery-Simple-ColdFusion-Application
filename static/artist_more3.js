KFG.artistMore = (function(){
	var init = function(){
		var template = KFG.getHandlebar('artistMore', 'templates/artist_more.handlebars');
		$.ajax({
			asynch: true,
			type: 'GET',
			dataType: 'json',
			url: 'model/Gallery.cfc?method=artist_more',
			data: { artist_id: KFG.cfvars.art.artist_id },
			success: function(data, textStatus){
				$('#artist_more').html(template(data));
			}
		});
	}
	
	$(document).ready(function(){
		init();
	});
	
})();