function productImageAutosize($wrapper){
	var width = $wrapper.width();

	$wrapper.find("img").width(width);
	$wrapper.find("img").height(width);
}

function addCategoryTabsListeners(){
	var $category_tabs = $(".category-tab");
	$category_tabs = $category_tabs.slice(0, -1);
	$category_tabs.each( function(){
		alert('alo');
	});
}

/* Events */
$(document).ready( function(){
	$("#products").find(".image-wrapper").each( function(){
		productImageAutosize($(this));
		addCategoryTabsListeners();
	});
}).on("page:change", function(){
	$("#products").find(".image-wrapper").each( function(){
		productImageAutosize($(this));
	});
});