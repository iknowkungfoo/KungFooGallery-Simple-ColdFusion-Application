<div id="artist_more"></div>

<script id="artist_more_tmpl" type="text/x-handlebars-template">
	<h4>More from this Artist</h4>
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

<script type="text/javascript" src="static/artist_more2.js"></script>