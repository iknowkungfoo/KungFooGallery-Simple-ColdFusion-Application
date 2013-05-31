/* Artist Name
$(document).ready(function() {
	$('#art_search').dataTable({
		"sAjaxSource" : "model/Gallery.cfc?method=artwork_grid",
		"aoColumns" : [ {"mData" : "first_name", "sTitle": "First Name"}, 
		                {"mData" : "last_name", "sTitle": "Last Name"}]
	});
});
*/

/* Artwork title */ /*
$(document).ready(function() {
	$('#art_search').dataTable({
		"sAjaxSource" : "model/Gallery.cfc?method=artwork_grid",
		"aoColumns" : [ {"mData" : "img_thumb", "sTitle": "Thumbnail"}, 
		                {"mData" : "title", "sTitle": "Title"}, 
		                {"mData" : "last_name", "sTitle": "Last Name"}]
	});
});
*/
/* Show thumbnail *//*
$(document).ready(function() {
	$('#art_search').dataTable({
		"sAjaxSource" : "model/Gallery.cfc?method=artwork_grid",
		"aoColumns" : [ {"mData" : "img_thumb", "sTitle": "Thumbnail", 
							"fnRender": function(obj){
								return '<img src="resources/images/gallery/artists/' + obj.aData.artist_id + '/' + obj.aData.artwork_id + '/' + obj.aData.img_thumb + '"/>'; 
							}}, 
		                {"mData" : "title", "sTitle": "Title"}, 
		                {"mData" : "last_name", "sTitle": "Last Name"}]
	});
});
*/

/* Show thumbnail with deferred rendering 
$(document).ready(function() {
	$('#art_search').dataTable({
		"sAjaxSource" : "model/Gallery.cfc?method=artwork_grid",
		"aoColumns" : [ {"mData" : "img_thumb", "sTitle": "Thumbnail", 
							"fnRender": function(obj){
								return '<img src="resources/images/gallery/artists/' + obj.aData.artist_id + '/' + obj.aData.artwork_id + '/' + obj.aData.img_thumb + '"/>'; 
							}}, 
		                {"mData" : "title", "sTitle": "Title"}, 
		                {"mData" : "last_name", "sTitle": "Artist",
		                	"fnRender": function(obj){
		                		return obj.aData.first_name + ' ' + obj.aData.last_name;
		                	}}],
		                "aLengthMenu" : [[ 5, 10, -1 ], [ 5, 10, " All" ]],
		        		"iDisplayLength" : 5,
		        		"bDeferRender": true
	});
});
*/

/* Open image quickview in modal dialog */
$(document).ready(function() {
	$('#art_search').dataTable({
		"sAjaxSource" : "model/Gallery.cfc?method=artwork_grid",
		"aoColumns" : [ {"mData" : "img_thumb", "sTitle": "Thumbnail", 
							"fnRender": function(obj){
								var img = '<img src="resources/images/gallery/artists/' + obj.aData.artist_id + '/' + obj.aData.artwork_id + '/' + obj.aData.img_thumb + '"/>';
								// var icon = '<i title="QUick View" class="icon-search"></i>';
								// var icon = '<a data-toggle="modal" data-target="#quickView"><i title="QUick View" class="icon-search"></i></a>';
								/* See kungfoogallery.setup.js for adjustments to not cache remote content. */
								var icon = '<a data-toggle="modal" href="art_quick.cfm?artwork_id=' + obj.aData.artwork_id + '" data-target="#quickView"><i title="QUick View" class="icon-search"></i></a>';
								return img + ' ' + icon; 
							}}, 
		                {"mData" : "title", "sTitle": "Title",
								"fnRender": function(obj){
									return '<a href="art.cfm?artwork_id=' + obj.aData.artwork_id + '">' + obj.aData.title + '</a>';
								}}, 
		                {"mData" : "last_name", "sTitle": "Artist",
		                	"fnRender": function(obj){
		                		return obj.aData.first_name + ' ' + obj.aData.last_name;
		                	}}],
		                "aLengthMenu" : [[ 5, 10, -1 ], [ 5, 10, " All" ]],
		        		"iDisplayLength" : 5,
		        		"bDeferRender": true
	});
});