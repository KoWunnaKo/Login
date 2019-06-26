import QtQuick 2.6

Rectangle {
    id:menuwidget
    width : 310
    height : 340
    visible: false
    color: "#FFD3D3D3"
    border.color: "#444444"
    border.width: 1
    property bool isLogedIn: false
    property int iLanguageNo: 0
    signal menuClicked (int iMenuNo,string strMessage, int iLanguage)

    Rectangle {
        id: loginicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/right.svg"
            anchors.fill: parent
            opacity: isLogedIn ? 0.3: 0
        }
    }

    Rectangle {
        id:loginbutton
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.left: loginicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        enabled: !isLogedIn
        Text {
            anchors.fill: loginbutton
            id: logintitle
            color: isLogedIn ? "#3F000000" : "#FF000000"
            text: "Login << BCBE smartLogin >>"
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: loginbutton
            onClicked:{
                menuClicked(0,"Login << BCBE smartLogin >>",-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id: logouticon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: loginbutton.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/right.svg"
            anchors.fill: parent
            opacity: isLogedIn ? 0 : 0.3
        }
    }

    Rectangle {
        id:logoutbutton
        width: parent.width
        height: 30
        anchors.top: loginbutton.bottom
        anchors.left: logouticon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        enabled: isLogedIn
        Text {
            id: logouttitle
            text: "Logout << BCBE smartLogin >>"
            font.pointSize: 12
            anchors.fill: logoutbutton
            color: isLogedIn ?  "#FF000000" : "#3F000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: logoutbutton
            onClicked:{
                menuClicked(1,"Logout << BCBE smartLogin >>",-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id:seperator
        width: parent.width - 10
        height: 2
        anchors.top: logoutbutton.bottom
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        anchors.rightMargin:3
        color: "#5F000000"
    }

    Rectangle {
        id: ebankingicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: seperator.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectCrop
            source: "qrc:/icons/image/world-wide-web(1).svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:ebankingbutton
        width: parent.width
        height: 30
        anchors.top: seperator.bottom
        anchors.left: ebankingicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: ebankingtitle
            text: qsTr("E-Banking Portal offnen") + login.emptyString
            font.pointSize: 12
            anchors.fill: ebankingbutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: ebankingbutton
            onClicked:{
                menuClicked(2,qsTr("E-Banking Portal offnen"),-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id: identificationicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: ebankingbutton.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/add-user.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:identificationbutton
        width: parent.width
        height: 30
        anchors.top: ebankingbutton.bottom
        anchors.left: identificationicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: identificationtitle
            text: qsTr("Benutzeridentifikation hinzufugen") + login.emptyString
            font.pointSize: 12
            anchors.fill: identificationbutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: identificationbutton
            onClicked:{
                menuClicked(3,qsTr("Benutzeridentifikation hinzufugen"),-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id: languageicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: identificationbutton.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/world-wide-web.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:languagebutton
        property bool isChecked: false
        width: parent.width - 30
        height: 30
        anchors.top: identificationbutton.bottom
        anchors.left: languageicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: languagetitle
            text: qsTr("Sprache andern") + login.emptyString
            font.pointSize: 12
            anchors.fill: languagebutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id:languagearea
            anchors.fill: languagebutton
            onClicked:{
                if(languagebutton.isChecked) {
                    languagebutton.isChecked = false
                    submenuwidget.visible = false
                } else {
                    languagebutton.isChecked = true
                    submenuwidget.visible = true
                }
            }
        }
    }

    Rectangle {
        id:submenubutton
        width: 20
        height: 20
        anchors.verticalCenter: languagebutton.verticalCenter
        anchors.right: parent.right
        color: "#00000000"
        Text {
            id: submenutitle
            text: ">"
            font.bold: true
            font.pointSize: 12
            anchors.fill: submenubutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id:submenuarea
            anchors.fill: submenubutton
            onClicked:{
                if(languagebutton.isChecked) {
                    languagebutton.isChecked = false
                    submenuwidget.visible = false
                } else {
                    languagebutton.isChecked = true
                    submenuwidget.visible = true
                }
            }
        }

        Rectangle {
            id: submenuwidget
            width: 110
            height: 80
            color: "#FFD3D3D3"
            border.color: "#444444"
            border.width: 1
            anchors.left: parent.right
            anchors.top: submenubutton.top
            anchors.leftMargin: 5
            visible: false

            Rectangle {
                id: deutschicon
                width: 30
                height: 30
                anchors.left: parent.left
                anchors.top: submenuwidget.top
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                color: "#00000000"
                Image {
                    id:deutschimage
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/image/right.svg"
                    anchors.fill: parent
                    opacity: iLanguageNo === 0 ? 1 :0
                }
            }

            Rectangle {
                id:deutschbutton
                width: parent.width
                height: 30
                anchors.top: submenuwidget.top
                anchors.left: deutschicon.right
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                color: "#00000000"
                Text {
                    id: deutschtitle
                    text: qsTr("Deutsch") + login.emptyString
                    font.pointSize: 12
                    anchors.fill: deutschbutton
                    color:"#FF000000"
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    anchors.fill: deutschbutton
                    onClicked: {
                        menuClicked(4,"language menu selected",0)
                        iLanguageNo = 0
                        submenuwidget.visible = false
                    }
                }
            }

            Rectangle {
                id: franceicon
                width: 30
                height: 30
                anchors.left: parent.left
                anchors.top: deutschbutton.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                color: "#00000000"
                Image {
                    id:franceimage
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/image/right.svg"
                    anchors.fill: parent
                    opacity: iLanguageNo === 1 ? 1 :0
                }
            }

            Rectangle {
                id:francebutton
                width: parent.width
                height: 30
                anchors.top:  deutschbutton.bottom
                anchors.left: franceicon.right
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                color: "#00000000"
                Text {
                    id: francetitle
                    text: qsTr("Francais") + login.emptyString
                    font.pointSize: 12
                    anchors.fill: francebutton
                    color:"#FF000000"
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea {
                    anchors.fill: francebutton
                    onClicked:{
                        menuClicked(4,"language menu selected",1)
                        iLanguageNo = 1
                        submenuwidget.visible = false
                    }
                }
            }
        }
    }

    Rectangle {
        id: informationicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: languagebutton.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/information.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:informationbutton
        width: parent.width
        height: 30
        anchors.top: languagebutton.bottom
        anchors.left: informationicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: informationtitle
            text: qsTr("Uber diese App") + login.emptyString
            font.pointSize: 12
            anchors.fill: informationbutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: informationbutton
            onClicked:{
                menuClicked(5,qsTr("Uber diese App"),-1)
                submenuwidget.visible = false
            }
        }
    }


    Rectangle {
        id: supporticon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: informationbutton.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/auricular-phone-symbol-in-a-circle.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:supportbutton
        width: parent.width
        height: 30
        anchors.top: informationbutton.bottom
        anchors.left: supporticon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: supporttitle
            text: qsTr("E-Banking Support Kontaktieren") + login.emptyString
            font.pointSize: 12
            anchors.fill: supportbutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: supportbutton
            onClicked:{
                menuClicked(6,qsTr("E-Banking Support Kontaktieren"),-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id: richeticon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: supporticon.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/icon.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:richetbutton
        width: parent.width
        height: 30
        anchors.top: supporticon.bottom
        anchors.left: richeticon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: richettitle
            text: qsTr("Rechtliches") + login.emptyString
            font.pointSize: 12
            anchors.fill: richetbutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: richetbutton
            onClicked:{
                menuClicked(7,qsTr("Rechtliches"),-1)
                submenuwidget.visible = false
            }
        }
    }

    Rectangle {
        id:seperator2
        width: parent.width - 10
        height: 2
        anchors.top: richetbutton.bottom
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        anchors.rightMargin:3
        color: "#5F000000"
    }

    Rectangle {
        id: closeicon
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.top: seperator2.bottom
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Image {
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/image/cross-circular-button.svg"
            anchors.fill: parent
            opacity: 1
        }
    }

    Rectangle {
        id:closebutton
        width: parent.width
        height: 30
        anchors.top: seperator2.bottom
        anchors.left: closeicon.right
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 5
        color: "#00000000"
        Text {
            id: closetitle
            text: qsTr("Beenden") + login.emptyString
            font.pointSize: 12
            anchors.fill: closebutton
            color:"#FF000000"
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            anchors.fill: closebutton
            onClicked:{
                menuClicked(8,qsTr("Beenden"),-1)
                submenuwidget.visible = false
            }
        }
    }
}
