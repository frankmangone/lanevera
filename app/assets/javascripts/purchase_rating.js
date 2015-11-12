function controlStars(){
	$rating = $(".rating-form");

	// Rating only present when purchase is confirmed

	if ($rating.length != 0){
		$rating.find("a").each( function(){
			// The selection is done in the same order in which the links appear


			$(this).click( function(){
				$(this).find("span").addClass("highlighted");
			});
		});
	}
}