#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // const QUrl url(QStringLiteral("qrc:/GCS/UI/MainWindow.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    // engine.load(url);
    engine.addImportPath(":/");//important for qt to find the working dir for laoding qml types
    engine.loadFromModule("GCS.UI","MainWindow");

    return app.exec();
}
