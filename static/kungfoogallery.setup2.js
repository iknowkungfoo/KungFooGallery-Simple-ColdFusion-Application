/* Include after jQuery and Handlebars */
var KFG = (function() {
	var init = function() {
		$('.carousel').carousel();
		$('a.outbound').attr('target', '_blank');
		// Switch artwork sizes on art.cfm
		$('.switchImage').on('click', function() {
			$('#artwork').attr('src', KFG.cfvars.art[$(this).data('size')]);
		});
		/* Stop modal from caching remote content. */
		$('body').on('hidden', '.modal', function() {
			$(this).removeData('modal');
		});

	}

	/*
	 * Adapted from
	 * http://berzniz.com/post/24743062344/handling-handlebars-js-like-a-pro
	 */
	var _templates = {};
	var getHandlebar = function(key, path) {
		$.ajax({
			url : path,
			cache : true,
			async : false,
			success : function(data) {
				_templates[key] = Handlebars.compile(data);
			}
		});
		return _templates[key];
	}

	$(document).ready(function() {
		init();
	});

	return {
		cfvars : {},
		getHandlebar : getHandlebar
	};

})();