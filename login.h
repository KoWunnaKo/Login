#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QGuiApplication>
#include <QTranslator>

class Login : public QObject
{
    Q_OBJECT  
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    enum EN_Language {
        DUT = 0,
        FRN = 1
    };

    explicit Login(QGuiApplication *app = 0);

    Q_INVOKABLE bool matchUser(QString str_id, QString str_password);

    QString getEmptyString();

signals:
    void languageChanged();

public slots:
    void updateLanguge(int i_langId);

private:
    QGuiApplication *obj_app;
    QTranslator translator;
};

#endif // LOGIN_H
