// For products/index.html.haml

function bindCategoryTabListeners() {
	// The first category tab is the one that just says "Categorías"
	$tabs = $(".category-tab").not(":first");
	// This doesn't select anything!!!
	$delete_tabs = $(".category-delete-tab");
	
	if($delete_tabs.length != 0){
		$tabs.each( function(){

			var $tab = $(this);
			var $delete_tab = $tab.next();

			$tab.find(".btn-symbol").click( function(event){
				event.preventDefault();

				$tab.slideUp();
				$tab.next().slideDown();
			});

			$delete_tab.hide();
			$delete_tab.find(".btn-symbol").last().click( function(){
				/* Delete button, do not prevent default behaviour */
				$delete_tab.slideUp( function(){
					$(this).remove();
				});
			});
			$delete_tab.find(".btn-symbol").first().click( function(event){
				/* Show the category again */
				event.preventDefault();
				$(this).parent().parent().slideUp();
				$(this).parent().parent().prev().slideDown();
			});

		});
	}
}
