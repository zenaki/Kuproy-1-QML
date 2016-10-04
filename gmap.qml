import QtQuick 2.7
import QtWebEngine 1.3
import QtWebChannel 1.0
import QtQuick.Controls 1.4
import "gmap.js" as Gmap_funct

WebEngineView {
    id: gmap_web
    property string module_loc: "-6.40333;106.88776;Module_1;RTU.01;-6.40;106.88776;Module_2;RTU.02"
    url: "qrc:/gmap.html"
    settings.javascriptEnabled: true

    onUrlChanged: {
//        if (loadProgress == 100) {
//            Gmap_funct.test(module_loc);
            gmap_web.runJavaScript("alert('" + module_loc + "');");
//            gmap_web.runJavaScript("
//                        function initMap() {
//                            map = new google.maps.Map(document.getElementById('map'), {
//                                center: {lat: center[0], lng: center[1]},
//                                zoom: 15 //8 \
//                            });
//                            initMarker();
//                         }
//            ");
//            gmap_web.runJavaScript("initMap();");
//        }
    }

//    Row {
//        id: tools

//        Button {
//            id: set_marker
//            text: "Set Marker"
//            onClicked:  {
//                Gmap_funct.split_LatLng(module_loc)
//            }
//        }
//        Button {
//            id: refresh
//            text: "Refresh"
//            onClicked:  {
//                Gmap_funct.initMap()
//            }
//        }
//    }

//    function setMarker(LatLng) {
//        Gmap_funct.split_LatLng(LatLng);
//    }

//    onWidthChanged: {
//        webView.runJavaScript("split_LatLng(" + module_loc + ")", function(result) { console.log(result); })
//        webView.runJavaScript("document.title", function(result) { console.log(result); });
//        gmap_web.runJavaScript("alert('" + module_loc + "');");
//        gmap_web.runJavaScript("split_LatLng('" + module_loc + "');");
//        gmap_web.runJavaScript("initMap");
//        Gmap_funct.initMap();
//        Gmap_funct.split_LatLng(module_loc);
//    }
//    onLoadProgressChanged: {
//        setMarker()
//    }

//    function setMarker() {
//        runJavaScript("split_LatLng(" + module_loc + ")")
//    }
}
