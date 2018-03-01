#ifndef HTTP_H
#define HTTP_H

#include <QObject>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <jsonprocessor.h>

class http :public JsonProcessor
{
    Q_OBJECT
private:
    QNetworkAccessManager *networkAccessManager;
    QUrl url;
    QByteArray buffer;
    bool isWord = true;
public:
    explicit http(QObject *parent = 0);
    Q_INVOKABLE void inithttp(bool isWord,QString Text,QString from,QString to);
    Q_INVOKABLE void get();
signals:
    void contentReady0();
    void contentReady1();
public slots:
    void finishedSlot(QNetworkReply *reply);
};

#endif // HTTP_H
