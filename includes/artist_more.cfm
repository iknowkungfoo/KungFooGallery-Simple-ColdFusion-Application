<h4>More from this Artist</h4>

<div id="artist_more"></div>

<script id="artist_more_tmpl" type="text/x-handlebars-template">
	<table class="table table-striped" id="artist_thumbs">
		<tbody>
			{{#data}}
			<tr>
				<td><img src="resources/images/gallery/artists/{{artist_id}}/{{artwork_id}}//{{img_thumb}}" /></td>
				<td>{{title}}</td>
			</tr>
			{{/data}}
		</tbody>
	</table>
</script>

<script type="text/javascript">
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
</script>