/* Fill in new product info on display div upon creation */
function fillProductInfo(data, $div){
	$div.attr("id", "prod"+data.id);

	$div.find(".title-display").text(data.title);
	$div.find(".category-display").text("Categoría: "+data.category_name);
}