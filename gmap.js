var map;
var marker = [];
var module = [
    [-6.40333, 106.88776, 'test_1', 'test.01'],
    [-6.40, 106.88778]
];
var pin = [-6.40333, 106.88776, -6.40, 106.88776];
var env = ['test', 'test.01'];
var center = [-6.40333, 106.88776];
var Rtrn;
var image = 'qrc:/new/map/image/marker.png';
//alert('test');
var directionsDisplay, directionsService, map;

function initMap() {
    var directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    var mapOptions = { zoom:7, mapTypeId: google.maps.MapTypeId.ROADMAP, center: chicago }
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    directionsDisplay.setMap(map);
}

//function test(x) {
//    alert('test');
//}

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: center[0], lng: center[1]},
        zoom: 15 //8
    });
//    initMarker();
}
      
function split_LatLng(Request) {
    if (Request) {
        var spl = Request.split(";");
        if (spl.length > 0 && spl.length % 4 == 0) {
            for (var i = 0; i <= spl.length / 4; i++) {
                pin[(i*2)] = spl[(i*4)];
                pin[(i*2)+1] = spl[(i*4)+1];
                env[(i*2)] = spl[(i*4)+2];
                env[(i*2)+1] = spl[(i*4)+3];
            }
//            initMap();
            initMarker();
        } else {
            for (var i = 0; i <= (spl.length - (spl.length % 4)) / 4; i++) {
                pin[(i*2)] = spl[(i*4)];
                pin[(i*2)+1] = spl[(i*4)+1];
                env[(i*2)] = spl[(i*4)+2];
                env[(i*2)+1] = spl[(i*4)+3];
            }
//            initMap();
            initMarker();
        }
    }
    Rtrn = "";
    for (var i = 0; i <= pin.length; i+=2) {
        if (pin[i] && pin[i+1]) {
            Rtrn = Rtrn + pin[i] + ";" + pin[i+1] + ";" + env[i] + ";" + env[i+1];
        }
    }
}

function initMarker() {
    for (var i = 0; i <= pin.length; i+=2) {
        if (i < env.length - 1) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(pin[i], pin[i+1]),
                map: map,
//                icon: image,
                animation: google.maps.Animation.DROP,
                title: 'Latitude : ' + pin[i] + '; \n' +
                       'Longitude : ' + pin[i+1] + '; \n' +
                       'Board_Name : ' + env[i] + '; \n' +
                       'Serial_Number : ' + env[i+1]
            });
        } else {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(pin[i], pin[i+1]),
                map: map,
//                icon: image,
                animation: google.maps.Animation.DROP,
                title: 'Latitude : ' + pin[i] + '; \n' +
                       'Longitude : ' + pin[i+1] + '; \n' +
                       'Board_Name : N/A; \n' +
                       'Serial_Number : N/A'
            });
        }
    }
}
