QT += qml quick quickcontrols2 webengine

#CONFIG += c++11

TEMPLATE = app

TARGET = sarasvati-operational

SOURCES += main.cpp

OTHER_FILES += main.qml \
               gmap.qml \
               pages/SwipeViewPage.qml \
               pages/TabBarPage.qml

RESOURCES += qml.qrc
