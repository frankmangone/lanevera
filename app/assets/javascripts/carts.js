// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function setTotalPrice(){
	$("#total-price").text(totalPrice());
}

function totalPrice(){
	var total_price = 0;
	var price;
	var amount;
	var $item;

	$items = $(".item-list").find(".wrapper");

	$items.each( function(){
		$item = $(this).find(".columns");
		price = parseFloat($item.attr('price'));
		amount = parseInt($item.find(".value").text());
		total_price += price*amount;
	});

	total_price = "$" + total_price.toString();
	alert(total_price);
	return total_price;
}