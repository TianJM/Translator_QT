#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "http.h"
#include "judgelanguagetype.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    qmlRegisterType<http> ("MyHttp",1,0,"MyHttp");
    qmlRegisterType<JudgeLanguageType> ("CJudgeLanguageType",1,0,"CJudgeLanguageType");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
