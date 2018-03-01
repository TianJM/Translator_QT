#ifndef JUDGELANGUAGETYPE_H
#define JUDGELANGUAGETYPE_H

#include <QObject>

class JudgeLanguageType : public QObject
{
    Q_OBJECT
    Q_ENUMS(LanType)

    bool GetBit(char c,int i);
    void SetBit(char &c,int i,bool v);
    char tem;

public:
    enum LanType{
        zh = 0,
        ja = 1,
        en = 2,
        ko = 3,
        fr = 4,
        ru = 5,
        pt = 6,
        es = 7,
        int_ = 8,
        Udef = 9
    };
    explicit JudgeLanguageType(QObject *parent = nullptr);
    Q_INVOKABLE void judgeQString(QString text);
signals:

public slots:
};

#endif // JUDGELANGUAGETYPE_H
