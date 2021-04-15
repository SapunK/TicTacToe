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

    CustomButton {
        id:btnNew
        anchors.top: lblTitle.bottom
        anchors.topMargin: parent.height / 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "New game"
        onClicked: {
            mainWindow.loadScreen("NewGame1v1.qml")
        }
    }

    CustomButton {
        id:btnCredits
        anchors.top: btnNew.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Credits"
    }

    CustomButton {
        id:btnExit
        anchors.top: btnCredits.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Exit game"
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

