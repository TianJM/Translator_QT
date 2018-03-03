#include "jsonprocessor.h"

JsonProcessor::JsonProcessor(QObject *parent) : QObject(parent)
{

}
void JsonProcessor::handleJson(const QByteArray bytearray)
{
    rWeb="";
    rQuery="";
    rTranslation="";
    rErrorCode="";
    rDict="";
    rWebdict="";

    //basic
    rUsphonetic="";
    rUkphonetic="";
    rPhonetic="";
    rExplains="";
    rUkSpeech="";
    rUsSpeech="";

    rSSpeakUrl="";
    rRSpeakUrl="";
    rl="";
    QJsonParseError jsonError;
    QJsonDocument doucment = QJsonDocument::fromJson(bytearray, &jsonError);  // 转化为 JSON 文档
    //--------------------处理en-zh
    if (!doucment.isNull() && (jsonError.error == QJsonParseError::NoError)) {  // 解析未发生错误
        if (doucment.isObject()) {  // JSON 文档为对象
            QJsonObject Object = doucment.object();  // 转化为对象
            if (Object.contains("web")) {
                QJsonValue value = Object.value("web");
                if (value.isArray()) {  // web 的  是数组
                    QJsonArray array = value.toArray();
                    int nSize = array.size();
                    //QString key_value[nSize]={};
                    QString *key_value = new QString[nSize];
                    for (int i = 0; i < nSize; ++i)
                    {
                        QJsonValue value = array.at(i);
                        if (value.isObject())
                        {
                            QJsonObject QJob = value.toObject();
                            if(QJob.contains("key"))
                            {
                                QJsonValue value2 = QJob.value("key");
                                if(value2.isString())
                                {
                                    QString str =value2.toString()+":";
                                    key_value[i]+=str;
                                    //qDebug() <<"key:"<< str;
                                }
                            }
                            if (QJob.contains("value"))
                            {
                                QJsonValue valuevalue = QJob.value("value");
                                if (valuevalue.isArray())
                                {
                                    QJsonArray array = valuevalue.toArray();
                                    int n2Size = array.size();
                                    for (int i1 = 0; i1 < n2Size; ++i1)
                                    {
                                        QJsonValue value1 = array.at(i1);
                                        if(value1.isString())
                                        {
                                            if(i1!=n2Size - 1)
                                            {
                                                QString str =value1.toString()+",";
                                                key_value[i]+=str;
                                                //qDebug() <<"value:"<< i << i1 << str;
                                            }
                                            else
                                            {
                                                QString str =value1.toString();
                                                key_value[i]+=str;
                                                //qDebug() <<"value:"<< i << i1 << str;
                                            }
                                        }

                                    }
                                }
                            }
                        }
                    }
                    for(int s = 0;s<nSize;s++)
                    {
                        rWeb+=key_value[s];
                        if(s!=nSize-1)
                            rWeb+="\n    ";
                    }
                }
            }
            if (Object.contains("query")) {
                QJsonValue value = Object.value("query");
                if (value.isString()) {
                    QString query = value.toString();
                    rQuery=query;
                    //qDebug() << "query:" << query;
                }
            }

            if (Object.contains("tSpeakUrl")) {
                QJsonValue value = Object.value("tSpeakUrl");
                if (value.isString()) {
                    QString surl = value.toString();
                    rRSpeakUrl=surl;
                    //qDebug() << "query:" << query;
                }
            }

            if (Object.contains("speakUrl")) {
                QJsonValue value = Object.value("speakUrl");
                if (value.isString()) {
                    QString surl = value.toString();
                    rSSpeakUrl=surl;
                    //qDebug() << "query:" << query;
                }
            }
            if (Object.contains("translation")) {
                QJsonValue value = Object.value("translation");
                if (value.isArray()) {
                    QJsonArray array2 = value.toArray();
                    int n2Size = array2.size();
                    rTranslation="";
                    for (int i2 = 0; i2 < n2Size; ++i2)
                    {
                        QJsonValue value1 = array2.at(i2);
                        if(value1.isString())
                        {
                            QString translation = value1.toString();
                            rTranslation+=translation;
                            if(i2!=n2Size-1)
                            {
                                rTranslation+="\n";
                            }
                            //qDebug() << "translation: " << translation;
                        }
                    }
                }
            }
            if (Object.contains("errorCode")) {
                QJsonValue value = Object.value("errorCode");
                if (value.isString()) {
                    QString errorCode = value.toString();
                    rErrorCode=errorCode;
                    //qDebug() << "errorCode: " << errorCode;
                }
            }
            if (Object.contains("dict")) {
                QJsonValue value = Object.value("dict");
                if (value.isObject()) {
                    QJsonObject ob = value.toObject();
                    if(ob.contains("url"))
                    {
                        QJsonValue qvalue = ob.value("url");
                        QString dict = qvalue.toString();
                        rDict=dict;
                        //qDebug() << "dict: " << dict;
                    }
                }
            }

            if (Object.contains("webdict")) {
                QJsonValue value = Object.value("webdict");
                if (value.isObject()) {
                    QJsonObject ob = value.toObject();
                    if(ob.contains("url"))
                    {
                        QJsonValue qvalue = ob.value("url");
                        QString webdict = qvalue.toString();
                        rWebdict=webdict;
                        //qDebug() << "webdict: " << webdict;
                    }
                }
            }
            if(Object.contains("basic"))
            {
                QJsonValue value = Object.value("basic");
                if (value.isObject()) {
                    QJsonObject objectb = value.toObject();
                    if (objectb.contains("us-phonetic")) {
                        QJsonValue value = objectb.value("us-phonetic");
                        if (value.isString()) {
                            QString usphonetic = value.toString();
                            rUsphonetic=usphonetic;
                            //qDebug() << "us-phonetic: " << usphonetic;
                        }
                    }
                    if (objectb.contains("phonetic")) {
                        QJsonValue value = objectb.value("phonetic");
                        if (value.isString()) {
                            QString phonetic = value.toString();
                            rPhonetic=phonetic;
                            //qDebug() << "phonetic: " << phonetic;
                        }
                    }
                    if(objectb.contains("uk-phonetic"))
                    {
                        QJsonValue value = objectb.value("uk-phonetic");
                        if (value.isString()) {
                            QString ukphonetic = value.toString();
                            rUkphonetic=ukphonetic;
                            //qDebug() << "ukphonetic: " << ukphonetic;
                        }
                    }
                    if(objectb.contains("explains")) {
                        QJsonValue value = objectb.value("explains");
                        if (value.isArray()) {
                            QJsonArray array3 = value.toArray();
                            int n3Size = array3.size();
                            rExplains="";
                            for (int i2 = 0; i2 < n3Size; ++i2)
                            {
                                QJsonValue value1 = array3.at(i2);
                                if(value1.isString())
                                {
                                    QString explains = value1.toString();
                                    rExplains+=explains;
                                    if(i2!=n3Size-1)
                                    {
                                        rExplains+="\n    ";
                                    }
                                    //qDebug() << "explains: " << explains;
                                }
                            }
                        }
                    }
                    if (objectb.contains("uk-speech")) {
                        QJsonValue value = objectb.value("uk-speech");
                        if (value.isString()) {
                            QString ukspeech = value.toString();
                            rUkSpeech=ukspeech;
                            //qDebug() << "us-phonetic: " << usphonetic;
                        }
                    }
                    if (objectb.contains("us-speech")) {
                        QJsonValue value = objectb.value("us-speech");
                        if (value.isString()) {
                            QString usspeech = value.toString();
                            rUsSpeech=usspeech;
                            //qDebug() << "us-phonetic: " << usphonetic;
                        }
                    }
                }
            }
            if(Object.contains("l"))
            {
                QJsonValue value = Object.value("l");
                if (value.isString()) {
                    rl = value.toString();
                    //qDebug() << "l: " << l;
                }
            }
        }
    }
}

QString JsonProcessor::returnrWeb()
{
    return rWeb;
}
QString JsonProcessor::returnrQuery()
{
    return rQuery;
}
QString JsonProcessor::returnrTranslation()
{
    return rTranslation;
}
QString JsonProcessor::returnrErrorCode()
{
    return rErrorCode;
}
QString JsonProcessor::returnrDict()
{
    return rDict;
}
QString JsonProcessor::returnrWebdict()
{
    return rWebdict;
}
QString JsonProcessor::returnrUsphonetic()
{
    return rUsphonetic;
}
QString JsonProcessor::returnrUkphonetic()
{
    return rUkphonetic;
}
QString JsonProcessor::returnrPhonetic()
{
    return rPhonetic;
}
QString JsonProcessor::returnrExplains()
{
    return rExplains;
}
QString JsonProcessor::returnrUkSpeech()
{
    return rUkSpeech;
}
QString JsonProcessor::returnrUsSpeech()
{
    return rUsSpeech;
}
QString JsonProcessor::returnrSSpeakUrl()
{
    return rSSpeakUrl;
}
QString JsonProcessor::returnrRSpeakUrl()
{
    return rRSpeakUrl;
}
QString JsonProcessor::returnrl()
{
    return rl;
}
