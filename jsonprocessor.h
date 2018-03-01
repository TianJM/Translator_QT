#ifndef JSONPROCESSOR_H
#define JSONPROCESSOR_H

#include <QObject>
#include<QJsonArray>
#include<QJsonObject>
#include<QJsonDocument>
#include<QDebug>

class JsonProcessor : public QObject
{
    Q_OBJECT
public:
    explicit JsonProcessor(QObject *parent = nullptr);
    Q_INVOKABLE void handleJson(const QByteArray bytearray);


    Q_INVOKABLE QString returnrWeb();
    Q_INVOKABLE QString returnrQuery();
    Q_INVOKABLE QString returnrTranslation();
    Q_INVOKABLE QString returnrErrorCode();
    Q_INVOKABLE QString returnrDict();
    Q_INVOKABLE QString returnrWebdict();
    Q_INVOKABLE QString returnrUsphonetic();
    Q_INVOKABLE QString returnrUkphonetic();
    Q_INVOKABLE QString returnrPhonetic();
    Q_INVOKABLE QString returnrExplains();
    Q_INVOKABLE QString returnrUkSpeech();
    Q_INVOKABLE QString returnrUsSpeech();
    Q_INVOKABLE QString returnrSSpeakUrl();
    Q_INVOKABLE QString returnrRSpeakUrl();
    Q_INVOKABLE QString returnrl();

protected:
    QString rWeb="";
    QString rQuery="";
    QString rTranslation="";
    QString rErrorCode="";
    QString rDict="";
    QString rWebdict="";

    //basic
    QString rUsphonetic="";
    QString rUkphonetic="";
    QString rPhonetic="";
    QString rExplains="";
    QString rUkSpeech="";
    QString rUsSpeech="";

    QString rSSpeakUrl="";
    QString rRSpeakUrl="";
    QString rl="";


signals:

public slots:
};

#endif // JSONPROCESSOR_H
