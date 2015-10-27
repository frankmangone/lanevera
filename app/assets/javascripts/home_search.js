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

$(document).ready( function(){
	// Disable previously to prevent memory leaks?
	handleSearchBar();
}).on("page:change", function(){
	handleSearchBar();
});