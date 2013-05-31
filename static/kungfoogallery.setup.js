/* Include after jQuery */
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

	$(document).ready(function() {
		init();
	});

	return {
		cfvars : {}
	};

})();