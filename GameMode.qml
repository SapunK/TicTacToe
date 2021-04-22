import QtQuick 2.0

Rectangle {

    color: mainBackgroundColor
    focus: true

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            mainWindow.loadScreen("WelcomeWindow.qml")
            event.accepted = true
        }
    }

    Image {
        id: logo
        source: "qrc:/pictures/gamemode"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height * 0.04
        width: parent.height * 0.25
        height: parent.height * 0.25
    }

    CustomButton {
        id:btn1v1
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Local 1 v 1"
        onClicked: mainWindow.loadScreen("NewGame1v1.qml")
    }

    CustomButton {
        id:btnAI
        anchors.top: btn1v1.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "vs AI"
        onClicked: mainWindow.loadScreen("GameVsAI.qml")
    }

    CustomButton {
        id:btnOnline1v1
        anchors.top: btnAI.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Online 1 v 1"
    }

    CustomButton {
        id:btnOnlineRnd
        anchors.top: btnOnline1v1.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Online random"
    }

    CustomButton {
        id:btnBack
        anchors.top: btnOnlineRnd.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Back"
        onClicked: mainWindow.loadScreen("WelcomeWindow.qml")
    }

    function init(){}
}

