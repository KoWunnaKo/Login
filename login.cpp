#include "login.h"
#include <QDebug>

Login::Login(QGuiApplication *app):obj_app(app)
{

}

bool Login::matchUser(QString str_id, QString str_password)
{
    bool b_matched;
    if(str_id == "admin" && str_password == "admin") {
        b_matched = true;
    } else {
        b_matched = false;
    }
    return b_matched;
}

QString Login::getEmptyString()
{
    return "";
}

void Login::updateLanguge(int i_langId)
{
    qDebug("updateLanguge!!");
    if(this->obj_app) {
        switch (i_langId) {
        case EN_Language::DUT:
            this->obj_app->removeTranslator(&(this->translator));
            break;
        case EN_Language::FRN: {
            qDebug("FRN!!");
            if(this->translator.load("test_Fr",":/Translator")){
                this->obj_app->installTranslator(&(this->translator));
            } else qDebug("langage change failed!!");
        }
            break;
        default:
            this->obj_app->removeTranslator(&(this->translator));
            break;
        }
        emit languageChanged();
    } else  qDebug("obj_app is null ptr!!");
}
