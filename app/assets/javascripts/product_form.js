// Main function:

function bindProductFormEvents(){
	// Decides which function to call depending on if a photo url is passed or not.
	$photo_url = $("#photo-url");
	if($photo_url.length == 0) {
		bindProductFormWithoutPhoto();
	}
	else {
		bindProductFormWithPhoto();
	}
}


function bindProductFormWithPhoto(){

	$icon = $("#photo-upload-info").find("h2").find("span");
	$text = $("#photo-upload-info").find("p");
	$preview = $("#photo-preview");

	// Photo events: -----------------------------------------------

	// Get url and change background of preview
	$photo_url = $("#photo-url");
	url = $photo_url.text();
	$photo_url.remove();
	$("#photo-preview").css('background-image', 'url('+url+')');

	// Add listeners in case the photo is deleted
	$("#photo-preview").click( function(){
		// Trigger file selection
		$photo_upload = $("#photo_photo");
		$photo_upload.trigger('click');
	});

	// Handle delete button
	$delete_button = $("#photo-delete");
	$delete_button.click( function(){
		$(this).attr('disabled', 'true');
		$("#product_photo_id").removeAttr("value");
		$icon.addClass('glyphicon-time');
		$text.text('Borrando...');
		$preview.css('background-image', 'none');
	});
}


function bindProductFormWithoutPhoto(){

	// On the form: -----------------------------------------------

	// Disable buttons on click, to prevent double submissions.
	$("#new_product").submit( function(){
		$("#create-product").attr('disabled', 'true');
		$("#new-product-cancel").attr('disabled', 'true');
		submit = true;
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