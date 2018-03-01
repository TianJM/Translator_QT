#ifndef JUDGELANGUAGETYPE_H
#define JUDGELANGUAGETYPE_H

#include <QObject>

class JudgeLanguageType : public QObject
{
    Q_OBJECT


    enum LanType{
        zh = 0,
        ja = 1,
        en = 2,
        ko = 3,
        fr = 4,
        ru = 5,
        pt = 6,
        es = 7
    };
public:
    explicit JudgeLanguageType(QObject *parent = nullptr);
    LanType JudgeQString(QString text);
signals:

public slots:
};

#endif // JUDGELANGUAGETYPE_H
