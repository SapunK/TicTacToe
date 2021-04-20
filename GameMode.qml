import QtQuick 2.0

Rectangle {

    color: mainBackgroundColor

    Image {
        id: logo
//        source: "qrc:/pictures/icon"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height / 10
        width: parent.width * 0.6
        height: parent.width * 0.6
    }

    CustomButton {
        id:btn1v1
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.06
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Local 1 v 1"
        onClicked: mainWindow.loadScreen("NewGame1v1.qml")
    }

    CustomButton {
        id:btnAI
        anchors.top: btn1v1.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "vs AI"
        onClicked: mainWindow.loadScreen("GameVsAI.qml")
    }

    CustomButton {
        id:btnOnline1v1
        anchors.top: btnAI.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Online 1 v 1"
    }

    CustomButton {
        id:btnOnlineRnd
        anchors.top: btnOnline1v1.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Online random"
    }

    CustomButton {
        id:btnBack
        anchors.top: btnOnlineRnd.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Back"
        onClicked: mainWindow.loadScreen("WelcomeWindow.qml")
    }

    function init(){}
}

