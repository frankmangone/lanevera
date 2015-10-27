/* Check if field is empty and display correct search class */

function handleSearchBar(){ 
	// Disable submit button:

	$("#search-submit").attr('disabled', 'true');

	$("#search").keyup( function(){

		var $self = $(this);
		var $submit = $("#search-submit");

		if($self.val().length != 0){
			if(!$submit.hasClass("valid-search")){
				$submit.addClass("valid-search");
				$("#search-submit").removeAttr('disabled');
			}
		}
		else if($submit.hasClass("valid-search")){
			$submit.removeClass("valid-search");
			$("#search-submit").attr('disabled', 'true');
		}

	});
}

function addOfferListeners(){
	$offers = $(".home-offer");

	$offers.each( function(){
		$(this).find(".offer-info").hide();

		$(this).hover( function(){
			// Mouse In
			$(this).find(".offer-thumb-wrapper").find("img").addClass("image-hover");
			$(this).find(".offer-info").show();
		}, function(){
			// Mouse Out
			$(this).find(".offer-thumb-wrapper").find("img").removeClass("image-hover");
			$(this).find(".offer-info").hide();
		});

		//$(this).trigger('mouseout');
	});
}

$(document).ready( function(){
	// Disable previously to prevent memory leaks?
	handleSearchBar();
	addOfferListeners();
}).on("page:change", function(){
	handleSearchBar();
	addOfferListeners();
});