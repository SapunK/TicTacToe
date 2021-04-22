import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

    color: mainBackgroundColor

    Image {
        id: logo
        source: "qrc:/pictures/logo"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height * 0.04
        width: parent.height * 0.45
        height: parent.height * 0.45
    }
    CustomButton {
        id:btnNew
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "New game"
        onClicked: {
            mainWindow.loadScreen("GameMode.qml")
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
        onClicked: Qt.quit()
    }

    function init(){}
}

