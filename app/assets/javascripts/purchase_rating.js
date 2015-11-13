function controlStars(){
	$rating = $(".rating-form");

	// Rating only present when purchase is confirmed

	if ($rating.length != 0){
		$rating.find("a").each( function(){
			$(this).hover( function(){
				// Mouse in
				starHoverIn( parseInt($(this).attr("star")) );
			}, function(){
				// Mouse out
				starHoverOut();
			}).click( function(){
				starSelect( parseInt($(this).attr("star")) );
			});
		});
	}
}


function starHoverIn(star){
	// Expects a number
	
	$stars = $(".rating-form").find("a>span");
	$stars.each( function(index){
		if (index < star){
			$(this).addClass("selected");
		}
		else {
			$(this).addClass("unselected");
		}
	});
}

function starHoverOut(){
	$stars = $(".rating-form").find("a>span");
	$stars.each( function(){
		$(this).removeClass("selected").removeClass("unselected");
	});
}

//

function starSelect(star){
	// Expects a number

	$stars = $(".rating-form").find("a>span");
	$stars.each( function(index){
		if (index < star){
			$(this).addClass("highlighted");
		}
		else {
			$(this).removeClass("highlighted");
		}
	});
}