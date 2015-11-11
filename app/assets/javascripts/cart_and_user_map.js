function loadCartMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';

	var longitude = parseFloat( $("#map").attr('longitude') );
	var latitude = parseFloat( $("#map").attr('latitude') );

	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k', {
		minZoom: 14
	}).setView([latitude, longitude], 16);

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

//-----------------------------------------------------------------

function loadUserMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';

	var longitude = parseFloat( $("#map").attr('longitude') );
	var latitude = parseFloat( $("#map").attr('latitude') );

	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k', {
		zoomControl: false
	}).setView([latitude, longitude], 16);

	// Disable drag and zoom handlers.
	map.dragging.disable();
	map.touchZoom.disable();
	map.doubleClickZoom.disable();
	map.scrollWheelZoom.disable();

	// Disable tap handler, if present.
	if (map.tap) map.tap.disable();

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

//-----------------------------------------------------------------

function loadUserEditMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';

	var $map = $("#map");

	var $latitude = $("#user_location_attributes_latitude");
	var $longitude = $("#user_location_attributes_longitude");

	var latitude = parseFloat($("#map").attr('latitude'));
	var longitude = parseFloat($("#map").attr('longitude'));

	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k', {
		minZoom: 14
	}).setView([latitude, longitude], 16);

	var featureLayer;

	// Initialize
	featureLayer = L.mapbox.featureLayer({
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
	}).addTo(map);

	// Click
	map.on('click', function(e){
		var position =  e.latlng;
		latitude = position.lat;
		longitude = position.lng;

		$latitude.val(latitude);
		$longitude.val(longitude);

		map.removeLayer(featureLayer);

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