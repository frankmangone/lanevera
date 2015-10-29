// On the form: -----------------------------------------------

function bindProductFormEvents(){
	// Disable the submit button until a photo is uploaded
	$("#create-product").attr('disabled', 'true');
	// And disable buttons on click, to prevent double submissions.
	$("#new_product").submit( function(){
		$("#create-product").attr('disabled', 'true');
		$("#new-product-cancel").attr('disabled', 'true');
	});

	// Photo events: -----------------------------------------------

	// Bind the photo events:
	$("#photo-preview").click( function(){
		// Trigger file selection
		$photo_upload = $("#photo_photo");
		$photo_upload.trigger('click');
	});

	$("#photo_photo").on("change", function(){
		// Trigger form submit
		$("#photo-submit").trigger("click");
	});

	$("#photo-submit").click( function(){
		$icon = $("#photo-upload-info").find("h2").find("span")
		$text = $("#photo-upload-info").find("p")

		$icon.removeClass('glyphicon-upload').addClass('glyphicon-time');
		$text.text('Subiendo foto...');
	});
}