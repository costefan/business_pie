// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
    $.get("http://ipinfo.io", function(response) {
        a = response;
        $('.city').val(a.city);
    }, "jsonp");
    google.maps.event.addDomListener(window, 'load', initialize());
    Ladda.bind( '.ladda-button', { timeout: 2000 } );
});

var map;
var markers = [];

function getCityName (location) {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'latLng': location}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                for (var i = 0; i < results.length; i++) {
                    if (results[i].types[0] === "locality") {
                        var city = results[i].address_components[0].short_name;
                        var state = results[i].address_components[2].short_name;
                        $('.city').val(city + ' ' + state);
                    }
                }
            }
            else {console.log("No reverse geocode results.")}
        }
            else {console.log("Geocoder failed: " + status)}
        });
}

function addMarker(location, map) {
    // Add the marker at the clicked location, and add the next-available label
    // from the array of alphabetical characters.
    deleteMarkers();
    getCityName(location);
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });
    markers.push(marker);
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

function getLocationByResponse(response) {
    var a = response;
    a = a.loc;
    a = a.split(',');
    return new google.maps.LatLng(a[0], a[1]);//(долгота, широта)
}

// инициализация карты в div "map"
function initialize() {
    $.get("http://ipinfo.io", function(response) {
        var location = getLocationByResponse(response);
        var mapOptions = {
            zoom: 5,//масштаб
            center: location, //позиционируем карту на заданые координаты,
            mapTypeId: google.maps.MapTypeId.TERRAIN,
            draggableCursor: 'default'
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);//инициализация карты

        addMarker(location, map);

        google.maps.event.addListener(map, 'click', function(event) {
            addMarker(event.latLng, map);
        });
    }, "jsonp")
        .fail(function() {
            var mapOptions = {
                zoom: 2//масштаб
            };
            map = new google.maps.Map(document.getElementById("map"), mapOptions); //инициализация карты
        });
}

