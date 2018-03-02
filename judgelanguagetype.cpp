#include "judgelanguagetype.h"
#include <QRegExp>
#include <QDebug>
JudgeLanguageType::JudgeLanguageType(QObject *parent) : QObject(parent)
{

}
void JudgeLanguageType::judgeQString(QString text){
    if(text.length()<=0)
        {
            return ;
        }
        QString sRegNum = "[0-9]+";
        QString sRegEn = "[a-zA-Z]+";
        QString sRegCn = "[\\x4e00-\\x9fff]+";
        QString sRegRu = "[\\x0400-\\x052f]+";
        QString sRegKo = "[\uAC00-\uD7A3]+";
        QString sRegJa = "[\u0800-\u4e00]+";
        QRegExp rx;
        rx.setPattern(sRegNum);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist int";
            return ;
        }
        rx.setPattern(sRegEn);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist en";
            //return en;
        }
        rx.setPattern(sRegCn);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist zh";
            //return zh;
        }
        rx.setPattern(sRegRu);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist ru";
            //return ru;
        }
        rx.setPattern(sRegKo);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist ko";
            //return ko;
        }
        rx.setPattern(sRegJa);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist ja";
            //return ja;
        }


}
bool JudgeLanguageType::GetBit(char c,int i){
    return (c >> i) & 1;
}
void JudgeLanguageType::SetBit(char &c, int i, bool v){
    if(v){
        c |= (1 << i);
    }
    else{
        c &= ~(1 << i);
    }
}
