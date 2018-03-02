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
        QString sRegCn = "[\\x4e00-\\x9fa5]+";
        QString sRegRu = "[\\x0400-\\x052f]+";
        QString sRegKo = "[\uAC00-\uD7A3]+";
        QString sRegJa = "[\u0800-\u4e00]+";
        QRegExp rx;
        rx.setPattern(sRegNum);
        if(rx.exactMatch(text))
        {
            qDebug()<< text +"exist int";
            //return ;
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
int JudgeLanguageType::judgeQstringRuCount(QString text){
    //QString sRegCn = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if(tem2 >= 0x0400 && tem2 <= 0x052F)  {
            //这个字符是俄文
            ++tem;
        }
    }
    //qDebug() << "Cn:" + tem;
    return tem;

}
int JudgeLanguageType::judgeQstringZhCount(QString text){
    //QString sRegCn = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if(tem2 >= 0x4E00 && tem2 <= 0x9FA5)  {
            //这个字符是中文
            ++tem;
        }
    }
    //qDebug() << "Cn:" + tem;
    return tem;

}
int JudgeLanguageType::judgeQstringEnCount(QString text){
    //QString sRegCn = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if((tem2 >= 0x0041 && tem2 <= 0x005A) || (tem2 >= 0x0061 && tem2 <= 0x007A))  {
            //这个字符是英文
            ++tem;
        }
    }
    //qDebug() << "En:" + tem;
    return tem;

}
int JudgeLanguageType::judgeQstringJaCount(QString text){
    //QString sRegCn = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if(tem2 >= 0x0800 && tem2 <= 0x4E00)  {
            //这个字符是日文
            ++tem;
        }
    }
    //qDebug() << "Ja:" + tem;
    return tem;

}
int JudgeLanguageType::judgeQstringKoCount(QString text){
    //QString sRegCn = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if(tem2 >= 0xAC00 && tem2 <= 0xD7A3)  {
            //这个字符是韩文
            ++tem;
        }
    }
    //qDebug() << "Ko:" + tem;
    return tem;

}
int JudgeLanguageType::judgeQstringNuCount(QString text){
    //QString sRegNu = "[\\x4e00-\\x9fa5]+";
    int tem = 0;
    for(int s =0;s < text.length();s++){
        QChar tem1 = text.at(s);
        ushort tem2 = tem1.unicode();
        if(tem2 >= 0x0030 && tem2 <= 0x0039)  {
            //这个字符是数字
            ++tem;
        }
    }
    //qDebug() << "Nu:" + tem;
    return tem;

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
