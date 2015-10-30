// On the form: -----------------------------------------------

function bindEditProductFormEvents(){

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
		$icon.addClass('glyphicon-time');
		$text.text('Borrando...');
		$preview.css('background-image', 'none');
		$("#create-product").attr('disabled', 'true');
	});
}