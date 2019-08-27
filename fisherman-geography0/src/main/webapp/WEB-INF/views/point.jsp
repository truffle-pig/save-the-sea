<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
        </script>

<script src="https://cdn.jsdelivr.net/npm/leaflet@1.5.1/dist/leaflet.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/leaflet@1.5.1/dist/leaflet.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css" />
<link rel="stylesheet"
	href="https://rawcdn.githack.com/python-visualization/folium/master/folium/templates/leaflet.awesome.rotate.css" />
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<style>
#map {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
}
</style>

<meta name="viewport"
	content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<style>
#map_973a98bf972f49809826515244f5050d {
	position: relative;
	width: 100.0%;
	height: 100.0%;
	left: 0.0%;
	top: 0.0%;
}
</style>

</head>
<body>

	<div class="folium-map" id="map_973a98bf972f49809826515244f5050d"></div>

</body>
<script>    
    
            var map_973a98bf972f49809826515244f5050d = L.map(
                "map_973a98bf972f49809826515244f5050d",
                {
                    center: [37.5612, 126.99542],
                    crs: L.CRS.EPSG3857,
                    zoom: 20,
                    zoomControl: true,
                    preferCanvas: false,
                }
            );

            

        
    
            var tile_layer_01c9d36efcf74f2e83d97859d4d79546 = L.tileLayer(
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                {"attribution": "Data by \u0026copy; \u003ca href=\"http://openstreetmap.org\"\u003eOpenStreetMap\u003c/a\u003e, under \u003ca href=\"http://www.openstreetmap.org/copyright\"\u003eODbL\u003c/a\u003e.", "detectRetina": false, "maxNativeZoom": 18, "maxZoom": 18, "minZoom": 0, "noWrap": false, "opacity": 1, "subdomains": "abc", "tms": false}
            ).addTo(map_973a98bf972f49809826515244f5050d);
        
    
            var marker_74745cf361b347409bf07b3b5ccdccb5 = L.marker(
                [37.5612, 126.99542],
                {}
            ).addTo(map_973a98bf972f49809826515244f5050d);
        
    
        var popup_85753fa5ee6340deb5b834740a02da39 = L.popup({"maxWidth": "100%"});

        
            var html_0ac2c1bc63664b06893400c6f2b4bec2 = $(`<div id="html_0ac2c1bc63664b06893400c6f2b4bec2" style="width: 100.0%; height: 100.0%;">Catching point</div>`)[0];
            popup_85753fa5ee6340deb5b834740a02da39.setContent(html_0ac2c1bc63664b06893400c6f2b4bec2);
        

        marker_74745cf361b347409bf07b3b5ccdccb5.bindPopup(popup_85753fa5ee6340deb5b834740a02da39)
        ;

        
    
</script>