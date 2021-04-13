import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

    color: mainBackgroundColor

    Label {
        id: lblTitle
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: parent.height / 8
        width: 150
        height: 30
        text: "Tic Tac Toe"
        font.pixelSize: 25
        font.bold: true
        color: mainTextColor
    }

    Button {
        id:btnNew
        anchors.top: lblTitle.bottom
        anchors.topMargin: parent.height / 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        height: 50
        background: Rectangle{
            height: parent.height
            width: parent.width
            color: mainButtonColor
            radius: 12
            Text {
                anchors.fill: parent
                text: "New game"
                color: "white"
                font.bold: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        onClicked: {
            mainWindow.loadScreen("NewGame1v1.qml")
        }
    }

    Button {
        id:btnCredits
        anchors.top: btnNew.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        height: 50
        background: Rectangle{
            height: parent.height
            width: parent.width
            color: mainButtonColor
            radius: 12
            Text {
                anchors.fill: parent
                text: "Credits"
                color: "white"
                font.bold: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Button {
        id:btnExit
        anchors.top: btnCredits.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        height: 50
        background: Rectangle{
            height: parent.height
            width: parent.width
            color: mainButtonColor
            radius: 12
            Text {
                anchors.fill: parent
                text: "Exit game"
                color: "white"
                font.bold: true
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Label {
        id: lblMadeBy
        text: "Made by: \nKostic"
        font.bold: true
        font.pixelSize: 13
        color: mainTextColor
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.rightMargin: 20
    }
}

