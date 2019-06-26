import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: "BCBE smartLogin"
    color: "#FFFFFFFF"

    Rectangle {
        id: centerWidget
        width: parent.width/1.5
        height: parent.height/1.5
        color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Column {
            id: loginpage
            anchors.horizontalCenter: centerWidget.horizontalCenter
            anchors.verticalCenter: centerWidget.verticalCenter
            anchors.verticalCenterOffset: 50
            spacing: 30

            Column {
                id: inputField
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Rectangle {
                    id: idrect
                    width: topbar.width - 40
                    height: 50
                    gradient: Gradient {
                        GradientStop {
                            position: 0.00;
                            color: "#ffffff";
                        }
                        GradientStop {
                            position: 0.97;
                            color: "#ffffff";
                        }
                        GradientStop {
                            position: 0.98;
                            color: "#000000";
                        }
                    }
                    smooth: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -20
                    TextInput {
                        id: idtextedit
                        width: idrect.width
                        height: 50
                        font.pointSize: 12
                        verticalAlignment: Text.AlignVCenter
                        anchors.centerIn: idrect
                        property string placeholderText: qsTr("Benutzeridentifikation") + login.emptyString

                        Text {
                            text: qsTr(idtextedit.placeholderText) + login.emptyString
                            color: "#aaa"
                            visible: !idtextedit.text
                            font.pointSize: 12
                            verticalAlignment: Text.AlignVCenter
                            width: idtextedit.width
                            height: idtextedit.height
                            anchors.centerIn: idtextedit
                        }
                    }
                }

                Row {
                    id:passField
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Rectangle {
                        id: passrect
                        width: topbar.width - 40
                        height: 50
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00;
                                color: "#ffffff";
                            }
                            GradientStop {
                                position: 0.97;
                                color: "#ffffff";
                            }
                            GradientStop {
                                position: 0.98;
                                color: "#000000";
                            }
                        }
                        smooth: true
                        anchors.verticalCenter: parent.verticalCenter

                        TextInput {
                            id: passtextedit
                            width: passrect.width
                            height: 50
                            font.pointSize: 12
                            verticalAlignment: Text.AlignVCenter
                            anchors.centerIn: passrect
                            property string placeholderText: qsTr("Aktivierungscode") + login.emptyString
                            property bool ispasswordmode: true
                            echoMode : ispasswordmode ? TextInput.Password : TextInput.Normal

                            Text {
                                text: qsTr(passtextedit.placeholderText) + login.emptyString
                                color: "#aaa"
                                visible: !passtextedit.text
                                font.pointSize: 12
                                verticalAlignment: Text.AlignVCenter
                                width: passtextedit.width
                                height: passtextedit.height
                                anchors.centerIn: passtextedit
                            }
                        }
                    }

                    Rectangle {
                        id: showpass
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#00000000"
                        Image { fillMode: Image.PreserveAspectFit; source: "qrc:/icons/image/information.svg"; anchors.fill: parent; opacity: 1 }
                        MouseArea {
                            anchors.fill: showpass
                            onPressed:{
                                passtextedit.ispasswordmode = false
                            }
                            onReleased: {
                                passtextedit.ispasswordmode = true
                            }
                        }
                    }

                }
            }

            Text {
                id:messageField
                property string message
                text: qsTr(message) + login.emptyString
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                verticalAlignment: Text.AlignVCenter
                width: passtextedit.width
                height: passtextedit.height
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: loginbutton
                width: 200
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                color: ((idtextedit.text.length > 0) && (passtextedit.text.length > 0)) ? "#77ea9e" : "#d9d1d1"
                enabled: ((idtextedit.text.length > 0) && (passtextedit.text.length > 0)) ? true : false
                MouseArea {
                    anchors.fill: loginbutton
                    onClicked:{
                        console.log("login pressed")
                        if(login.matchUser(idtextedit.text,passtextedit.text)) {
                            messageField.message = qsTr("Succesvol ingelogd")
                            mymenu.isLogedIn = true
                        } else {
                            messageField.message = qsTr("Ongeldige gebruikersnaam of wachtwoord")
                            mymenu.isLogedIn = false
                        }
                    }
                }

                Text {
                    text: qsTr("WEITER") + login.emptyString
                    color: ((idtextedit.text.length > 0) && (passtextedit.text.length > 0)) ? "#ffffff" : "#918989"
                    font.pointSize: 12
                    anchors.centerIn: loginbutton
                }
            }

        }

        Rectangle {
            id:topbar
            width:450
            height: 40
            color: "#00000000"
            anchors.horizontalCenter: centerWidget.horizontalCenter
            anchors.top: centerWidget.top

            Rectangle {
                id: menuButton
                property bool isChecked: false
                width: 30
                height: 30
                color: "#00FFFFFF"
                Image { source: "qrc:/icons/image/menu.svg"; anchors.fill: parent;  opacity: 1 }
                anchors.top: topbar.top
                anchors.left: topbar.left

                MouseArea {
                    anchors.fill: menuButton
                    onClicked: {
                        messageField.message = ""
                        if(menuButton.isChecked) {
                            menuButton.isChecked = false
                            mymenu.visible = false

                        } else {
                            menuButton.isChecked = true
                            mymenu.visible = true

                        }
                    }
                }

                CustomMenu {
                    id:mymenu
                    anchors.top: menuButton.bottom
                    anchors.left: menuButton.left
                    isLogedIn: false
                }
                Component.onCompleted: {
                    mymenu.menuClicked.connect(menuClicked)
                }

                function menuClicked(iMenuNo,strMessage, iLanguage) {
                    console.log("menuclicked: " + iMenuNo + ", " + strMessage + ", " + iLanguage)
                    menuButton.isChecked = false
                    if(iMenuNo === 1) {
                        mymenu.visible = false
                        mymenu.isLogedIn = false
                        idtextedit.text = ""
                        passtextedit.text = ""
                    } else if(iMenuNo === 4) {
                        login.updateLanguge(iLanguage)
                        messageField.message = ""
                        mymenu.visible = false
                    } else if(iMenuNo === 8) {
                        Qt.quit();
                    } else {
                        mymenu.visible = false
                        messageField.message = qsTr(strMessage) + " Button clicked!!"
                    }
                }
            }

            Row {
                id: logo
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 15

                z : 0

                Rectangle {
                    id: logoicon
                    width: 30
                    height: 30
                    color: "#00FFFFFF"
                    border.color: "#ff0000"
                    border.width: 7
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        id: logotitle
                        text: "<"
                        font.bold: true
                        font.weight: Font.ExtraBold
                        verticalAlignment: Text.AlignVCenter
                        styleColor: "#000000"
                        style: Text.Sunken
                        font.pointSize: 15
                        anchors.centerIn: logoicon
                    }
                }

                Row {
                    id: logolabelract
                    anchors.top: parent.top
                    spacing: 10

                    Rectangle {
                        id: logolable
                        height: 30
                        width: 75
                        color: "#00FFFFFF"
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            id: logolabletitle
                            text: "BEKB"
                            font.bold: true
                            font.letterSpacing: 10
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 12
                        }
                    }

                    Rectangle {
                        id: saperator
                        height: 30
                        width: 2
                        color: "#FF000000"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Rectangle {
                        id: logolable2
                        height: 30
                        width: 75
                        color: "#00FFFFFF"
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            id: logolable2title
                            text: "BCBE"
                            font.bold: true
                            font.letterSpacing: 10
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 12
                        }
                    }
                }
            }
        }

    }
}
