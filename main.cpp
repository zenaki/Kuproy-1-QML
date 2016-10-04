#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QtWebEngine/QtWebEngine>
#include <QQmlWebChannel>
#include <QWebChannel>
//#include <QQmlComponent>

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Sarasvati Operational");
    QGuiApplication::setOrganizationName("PT. Daunbiru Engineering Indonesia");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Material");
    QtWebEngine::initialize();


    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));
//    QQmlComponent component(&engine,QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
