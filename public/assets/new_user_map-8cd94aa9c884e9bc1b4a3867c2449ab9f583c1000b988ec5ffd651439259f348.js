function loadMap(){
	L.mapbox.accessToken = 'pk.eyJ1IjoiZnJhbmttYW5nb25lIiwiYSI6IjFlZjlmZTliYmYwYjljZDJhYmIwNmU1ZDlkOGExMDdkIn0.wSNu880_pH8ZGjMj3CoYWw';
	var map = L.mapbox.map('map', 'frankmangone.o0mg9e5k').setView([-34.91587454384448, -56.158976554870605], 16);
}

$(document).ready( function(){
	loadMap();
}).on("page:change", function(){
	loadMap();
});
