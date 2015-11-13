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
//= require nprogress
//= require nprogress-turbolinks
//= require_self
//= require_tree .

/* Progress bar settings */
/* --------------------------------- */
NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 500
});

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
	$("#"+model+"-"+key+"-errors").html("<p>"+value+"</p>")
	$("#"+model+"-"+key+"-errors").find("p").hide().fadeIn();

	$("#"+model+"_"+key).addClass("invalid-field").on("keydown change", function(){
		$("#"+model+"-"+key+"-errors").find("p").fadeOut( function(){ $(this).remove(); });
		$(this).removeClass("invalid-field").off("keydown").off("change");
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

/* Handle tooltips */
function handleTooltips(){
	// Tooltip only Text
	$('.hover-tooltip').hover(function(){
    // Hover over code
		var title = $(this).attr('title');
		// Delete data attribute to hide default tooltip
		$(this).data('tooltip-aux', title).removeAttr('title');
		$('<p class="tooltip-text"></p>').text(title).appendTo('body');
	}, function() {
		// Hover out code
		$(this).attr('title', $(this).data('tooltip-aux'));
		$('.tooltip-text').remove();
	}).mousemove(function(e) {
		var mousex = e.pageX + 20; //Get X coordinates
		var mousey = e.pageY + 10; //Get Y coordinates
		$('.tooltip-text').css({ top: mousey, left: mousex })
	});
}

/* Listeners */
/* --------------------------------- */

$(document).on("page:change", function(){
	addAllListeners();
});

function fadeFlashes(){
	$alerts = $(".alert");
	$alerts.each( function(){
		$(this).delay(2000).fadeOut(1000);
	});
}

// Manage collapse of navigation bar.
function navbarControl(){
	$("#collapsed-button").find("a").click( function(event){
		event.preventDefault();
		$menu = $("#collapse-wrapper");

		if ($menu.css("display") == "none"){	
			$menu.addClass("visible");
			$menu.slideDown();
		}
		else {
			$menu.slideUp( function(){
				$menu.removeClass("visible").removeAttr("style");
			});
		}
	});
}


// MASTER EVENTS FUNCTION!!!!!

function addAllListeners(){
	fadeFlashes();
	navbarControl();
	handleTooltips();

	if(isTitle("Nuevo producto") || isTitle("Editar producto")){
		bindProductFormEvents();
	}
	else if(isTitle("Productos")){
		addProductEvents();
	}
	else if(isTitle("Nueva cuenta")){
		loadMap();
	}
	else if(isTitle("")){
		handleSearchBar();
		//addOfferListeners();
	}
	else if(isTitle("Compra")){
		loadCartMap();
		controlStars();
	}
	else if(isTitle("Perfil de usuario")){
		loadUserMap();
	}
	else if(isTitle("Editar cuenta")){
		loadUserEditMap();
	}
}