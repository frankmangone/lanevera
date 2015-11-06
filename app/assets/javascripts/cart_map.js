function loadCartMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';

	var longitude = parseFloat( $("#map").attr('longitude') );
	var latitude = parseFloat( $("#map").attr('latitude') );

	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k').setView([latitude, longitude], 16);

	var featureLayer = L.mapbox.featureLayer({
		type: 'Feature',
		geometry: {
			type: 'Point',
			coordinates: [
				longitude,
				latitude
			]			
		},
		properties: {
			'marker-size': 'large',
			'marker-color': '#B96161'
		}

	});
	
	featureLayer.addTo(map);

}