// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .

/* jQuery plugins */
/* --------------------------------- */

/* Toggle disable property for a button */
$.fn.toggleDisable = function(){
	if(this.attr('disabled') == 'disabled'){
		this.removeAttr('disabled');
	}
	else{
		this.attr('disabled', 'true');
	}
}


/* Other */
/* --------------------------------- */

/* Capitalize first letter of a string */
function capitalize(string){
	return string.charAt(0).toUpperCase() + string.slice(1);
}

/* Display error messages upon failed [model] creation. */
function handleError(model, key, value){
	$("#"+model+"-"+key+"-errors").html("<p>"+capitalize(key)+" "+value+"</p>")
									  .hide()
									  .slideDown();

	$("#"+model+"_"+key).addClass("invalid-field").on("keydown", function(){
		$("#"+model+"-"+key+"-errors").slideUp();
		$(this).removeClass("invalid-field").off("keydown");
	}).on("change", function(){
		$("#"+model+"-"+key+"-errors").slideUp();
		$(this).removeClass("invalid-field").off("keydown");
	});
}