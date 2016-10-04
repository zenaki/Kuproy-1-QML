import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
//import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import Qt.labs.settings 1.0
import QtWebEngine 1.0
import "gmap.js" as Gmap_funct

ApplicationWindow {
    id: window
    width: 800
    height: 400
    visible: true
    title: "Qt Quick Controls 2"
    Material.theme: Material.Dark
    Material.accent: Material.Red

//    Settings {
//        id: settings
//        property string style: "Material"
//    }

    property int tree_index
    property variant sub_module: [
        "Environment", "qrc:/pages/TabBarPage.qml",
        "Channel Input", "qrc:/pages/SwipeViewPage.qml",
        "Channel Output", "qrc:/pages/TabBarPage.qml",
        "Back", ""
    ]
    property variant module: [
        "Google Maps",
        "RTU.01",
        "RTU.02",
        "RTU.03",
        "Refresh"
    ]
    property string gmap_source: "qrc:/gmap.qml"
    property string module_loc: "-6.40333;106.88776;Module_1;RTU.01;-6.40;106.88776;Module_2;RTU.02"

    header: ToolBar {
        Material.primary: "red"
        Material.foreground: "black"

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/list.png"
                }
                onClicked: drawer.open()
            }

            Label {
                id: titleLabel
                text: "Welcome to Sarasvati Operational Software"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/setting.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: "Settings"
//                        onTriggered: settingsPopup.open()
                    }
                    MenuItem {
                        text: "About"
//                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    if (index == 0) {
                        titleLabel.text = "Maps for Monita RTU"
                        stackView.replace(gmap_source)
//                        Gmap_funct.initMap()
//                        Gmap_funct.split_LatLng(module_loc)
//                        Gmap_funct.test(module_loc)
                    } else {
                        if (index == module.length-1) {
                            Gmap_funct.test(module_loc)
                        } else {
                            tree_index = index
                            sub_drawer.open()
                        }
                    }
                    drawer.close()
                }
            }

            model: ListModel {
                Component.onCompleted: {
                    for (var i = 0; i < module.length; i++) {
                        append({title: module[i]});
                    }
                }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    Drawer {
        id: sub_drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView {
            id: sub_listView
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    if (sub_listView.currentIndex != index) {
                        if (model.title == "Back") {
                            drawer.open()
                        } else {
                            sub_listView.currentIndex = index
                            titleLabel.text = module[tree_index] + " " + model.title
                            stackView.replace(model.source)
                        }
                    }
                    sub_drawer.close()
                }
            }

            model: ListModel {
                Component.onCompleted: {
                    for (var i = 0; i < sub_module.length; i+=2) {
                        append({
                            title: sub_module[i],
                            source: sub_module[i+1]
                        });
                    }
                }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
    }
}
