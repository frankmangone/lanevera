function productImageAutosize($wrapper){
	var width = $wrapper.width();

	$wrapper.find("img").width(width);
	$wrapper.find("img").height(width);
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
		$(this).trigger("hover");
		$image_wrapper.height( image_wrapper_height - 15);
		$product_info.height( product_info_height + 15);
		$image_wrapper.find("img").toggleClass("image-hover");
	}, function(){
		//Mouse leave
		$(this).trigger("hover");
		$image_wrapper.height( image_wrapper_height );
		$product_info.height( product_info_height );
		$image_wrapper.find("img").toggleClass("image-hover");
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
	$products = $("#products");

	$products.find(".image-wrapper").each( function(){
		productImageAutosize($(this));
		//addCategoryTabsListeners();
	});

	//AFTER the images are resized (because of the height getter):
	$products.children(".product-display").children(".product-wrapper").each( function(){
		addProductTabListeners( $(this) );
	});
}

/* Bind all events on load */
/* ------------------------------------------- */
$(document).ready( function(){
	addEventsOnLoad();
})/*.on("page:change", function(){
	addEventsOnLoad();
});*/