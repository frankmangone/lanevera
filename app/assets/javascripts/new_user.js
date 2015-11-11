function loadMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';
	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k', {
		minZoom: 14
	}).setView([-34.91527190781726, -56.159612238407135], 16);

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
				'marker-color': '#B96161'
			}

		});
		
		featureLayer.addTo(map);
	});
}