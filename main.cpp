#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#include "login.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Login login(&app);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("login",(QObject *)&login);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
