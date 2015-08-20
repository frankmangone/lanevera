/* Fill in blank category tab */

function fillCategoryInfo(data, $tab){
	var deleteBtn = $tab.children().first();
	var linkToCategory = $tab.children().last();

	$tab.attr("id", "cat"+data.id);

	deleteBtn.attr("href", "/categories/"+data.id);

	linkToCategory.text(data.name);
	linkToCategory.attr("href", "/products?category_id="+data.id);
}