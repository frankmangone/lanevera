var map;
//var click = document.getElementById('click');

function loadMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';
	if ($("#map").length != 0){
		map = L.mapbox.map('map', 'frankmangone.o0mg9e5k').setView([-34.91587454384448, -56.158976554870605], 16);

		$latitude = $("#user_location_attributes_latitude");
		$longitude = $("#user_location_attributes_longitude");

		var firstClick = true;
		var featureLayer;

		map.on('click', function(e){
			var position =  e.latlng;
			var latitude = position.lat;
			var longitude = position.lng;

			$latitude.val(latitude);
			$longitude.val(longitude);

			if(firstClick) {
				firstClick = false;
			}
			else {
				map.removeLayer(featureLayer);
			}

			featureLayer = L.mapbox.featureLayer({
				type: 'Feature',
				geometry: {
					type: 'Point',
					coordinates: [
						position.lng,
						position.lat
					]			
				},
				properties: {
					'marker-size': 'large',
					'marker-color': '#BE9A6B'
				}

			});
			featureLayer.addTo(map);
		});
	}
}

$(document).ready( function(){
	loadMap();
}).on("page:change", function(){
	loadMap();
});