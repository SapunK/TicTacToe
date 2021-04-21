import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

    color: mainBackgroundColor

    Image {
        id: logo
        source: "qrc:/pictures/icon"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height / 8
        width: parent.width * 0.6
        height: parent.width * 0.6
    }
    CustomButton {
        id:btnNew
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.08
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

