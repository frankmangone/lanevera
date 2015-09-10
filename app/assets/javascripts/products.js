function productImageAutosize($wrapper){
	var $image = $wrapper.find("img");
	var wrapper_side = $wrapper.width();
	var width =  $image.width();
	var height = $image.height();
	var ratio;

	// Revisar este script porque en realidad width y height están quedando como 0

	if( width >= height ){
		ratio = width/height;

		$image.height( wrapper_side );
		$image.width( wrapper_side*ratio );
	}
	else {
		ratio = height/width;

		$image.height( wrapper_side*ratio );
		$image.width( wrapper_side );
	}
}

/* Event handler binders */
/* ------------------------------------------- */
function addProductTabListeners($target){
	var $image_wrapper = $target.find(".image-wrapper");
	var image_wrapper_height = $image_wrapper.height();
	var $product_info = $target.find(".product");
	var product_info_height = $product_info.height();

	$target.hover( function(){
		// Mouse enter
		$image_wrapper.height( image_wrapper_height - 15);
		$product_info.height( product_info_height + 15);
		$image_wrapper.find("img").addClass("image-hover");
	}, function(){
		//Mouse leave
		$image_wrapper.height( image_wrapper_height );
		$product_info.height( product_info_height );
		$image_wrapper.find("img").removeClass("image-hover");
	});
}

function addCategoryTabsListeners(){
	var $category_tabs = $(".category-tab");
	$category_tabs = $category_tabs.slice(0, -1);
	$category_tabs.each( function(){
		alert('alo');
	});
}

/* Master event binding function */
/* ------------------------------------------- */

function addEventsOnLoad(){
	$products = $(".product-index");

	$products.find(".image-wrapper").each( function(){
		productImageAutosize($(this));
		//addCategoryTabsListeners();
	});

	$products.children(".product-display").children(".product-wrapper").each( function(){
		addProductTabListeners( $(this) );
		//$(this).trigger("hover");
	});
}

/* Bind all events on load */
/* ------------------------------------------- */
$(document).ready( function(){
	addEventsOnLoad();
}).on("page:change", function(){
	addEventsOnLoad();
});