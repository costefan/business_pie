// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    $.get("http://ipinfo.io", function(response) {
        a = response;
        $('.city').val(a.city);
    }, "jsonp");
    google.maps.event.addDomListener(window, 'load', initialize());

});

var map;
var markers = [];

function addMarker(location, map) {
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    /*deleteMarkers();*/
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
}

function setMapOnAll(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

function clearMarkers() {
    setMapOnAll(null);
}

function deleteMarkers() {
    clearMarkers();
    markers = [];
}
$('input[name=""]')
//инициализация карты в div "map"
function initialize() {
    $.get("http://ipinfo.io", function(response) {
        var a = response;
        a = a.loc;
        a = a.split(',');
        var location = new google.maps.LatLng(a[0], a[1]);//(долгота, широта)
        var mapOptions = {
            zoom: 5,//масштаб
            center: location,//позиционируем карту на заданые координаты
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);//инициализация карты

        new google.maps.Marker({
            position: location,
            map: map
        });
        google.maps.event.addListener(map, 'click', function(event) {
            addMarker(event.latLng, map);
        });
    }, "jsonp");


}

