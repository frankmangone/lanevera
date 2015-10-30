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
//= require cocoon
//= require_self
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

/* Check if title is the provided string */
function isTitle(string){
	var title;
	var base = "La Nevera, tu tienda de congelados";
	if(string == ""){
		title = base;
	}
	else{
		title = string + " | " + base;
	}

	return document.title == title;
}

/* Listeners */
/* --------------------------------- */

$(document).ready( function(){
	addAllListeners();
}).on("page:load", function(){
	addAllListeners();
});

function fadeFlashes(){
	$alerts = $(".alert");
	$alerts.each( function(){
		$(this).delay(3000).fadeOut(1000);
	});
}


// MASTER EVENTS FUNCTION!!!!!

function addAllListeners(){
	fadeFlashes();
	if(isTitle("Nuevo producto")){
		bindProductFormEvents();
	}
	if(isTitle("Productos")){
		addProductEvents();
		bindCategoryTabListeners();
	}
	if(isTitle("Nueva cuenta")){
		loadMap();
	}
	if(isTitle("")){
		handleSearchBar();
		addOfferListeners();
	}
}