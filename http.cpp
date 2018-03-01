#include "http.h"
#include <QtNetwork>
#include <QDebug>
http::http(QObject *parent)
{

}
void http::inithttp(bool isWord,QString Text,QString from,QString to)
{
    buffer = "";
    networkAccessManager = new QNetworkAccessManager(this);
    networkAccessManager->setProxy(QNetworkProxy::NoProxy);
    QObject::connect(networkAccessManager, SIGNAL(finished(QNetworkReply *)), this, SLOT(finishedSlot(QNetworkReply *)));
    QString web="https://openapi.youdao.com/api?q=";
    QString web1="http://openapi.youdao.com/api?q=";
    QString appid="52afa5377912f546";
    QString password="rUUIcD2CQNhXgUxTWPpgpDEWA2pzXstG";
    QString salt="5109221997";
    QString str=appid+Text+salt+password;
    QByteArray stringutf8=str.toUtf8();
    QString blah = QString(QCryptographicHash::hash((stringutf8),QCryptographicHash::Md5).toHex());
    blah=blah.toUpper();
    QString entext = Text.toUtf8().toPercentEncoding();
    QString surl=web1+entext+"&from="+from+"&to="+to+"&appKey="+appid+"&salt="+salt+"&sign="+blah;
    url.setUrl(surl);
    this->isWord = isWord;
}

void http::get() {
    const QNetworkRequest request = QNetworkRequest(url);
    networkAccessManager->get(request);
}
void http::finishedSlot(QNetworkReply *reply) {
    if(reply->error() == QNetworkReply::TimeoutError)
    {
        qDebug()<<reply->errorString();
    }
    else if(reply->error() == QNetworkReply::NoError)
    {
        buffer=reply->readAll();
        //QString str = QString::fromUtf8(buffer);
        //qDebug() << str;
        handleJson(buffer);
        QString tem = "rWeb:" + rWeb + "\n" +
                    "rQuery:" + rQuery + "\n" +
                    "rTranslation:" + rTranslation + "\n" +
                    "rErrorCode:" + rErrorCode + "\n" +
                    "rDict:" + rDict +"\n" +
                    "rWebdict:" + rWebdict + "\n" +
                    "rUsphonetic:" + rUsphonetic + "\n" +
                    "rUkphonetic:" + rUkphonetic + "\n" +
                    "rPhonetic:" + rPhonetic + "\n" +
                    "rExplains:" + rExplains + "\n" +
                    "rUkSpeech:" + rUkSpeech + "\n" +
                    "rUsSpeech:" + rUsSpeech + "\n" +
                    "rSSpeakUrl:" + rSSpeakUrl + "\n" +
                    "rRSpeakUrl:" + rRSpeakUrl + "\n" +
                    "rl:" + rl;
        //qDebug()<< tem;
    }
    if(this->isWord)
        emit contentReady0();
    else
        emit contentReady1();
    reply->deleteLater();
}
