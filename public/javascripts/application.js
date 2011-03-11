// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var gMap;
var gLatLngBounds;

function initGMap() {
	try {
		var centerLatLng = new google.maps.LatLng(12.901095, 77.581692);

	  var myOptions = {
	    zoom: 10,
	    center: centerLatLng,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	}
	catch (e)	{
		alert(e);
	}	

  gMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	gLatLngBounds = new google.maps.LatLngBounds();
}

function addMarker(lat, lng, title) {
	var point = new google.maps.LatLng(lat, lng);
	var marker = new google.maps.Marker({
																				position: point,
																				map: gMap,
																				title: title 
																			});																			
	gLatLngBounds.extend(point);
}

function addStoreMarker(lat, lng, title, iconURL, infoContent) {
	var point = new google.maps.LatLng(lat, lng);
	var marker = new google.maps.Marker({
																				position: point,
																				map: gMap,
																				icon: iconURL,
																				title: title 
																			});

	var infowindow = new google.maps.InfoWindow({ content: infoContent });	
	google.maps.event.addListener(marker, 'click', function() { infowindow.open(gMap,marker); });																			
																			
	gLatLngBounds.extend(point);
}

function setCenter(lat, lng) {
	gMap.setCenter(new google.maps.LatLng(lat, lng));
}