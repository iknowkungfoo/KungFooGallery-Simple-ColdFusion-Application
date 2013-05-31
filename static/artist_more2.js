KFG.artistMore = (function(){
	var init = function(){
		$.ajax({
			asynch: true,
			type: 'GET',
			dataType: 'json',
			url: 'model/Gallery.cfc?method=artist_more',
			data: { artist_id: KFG.cfvars.art.artist_id },
			success: function(data, textStatus){
				var source = $('#artist_more_tmpl').html();
				var template = Handlebars.compile(source);
				$('#artist_more').html(template(data));
			}
		});
	}
	
	$(document).ready(function(){
		init();
	});
	
})();