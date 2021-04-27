import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {

    color: mainBackgroundColor

    Image {
        id: logo
        source: "qrc:/pictures/logo"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height * 0.03
        width: parent.height * 0.45
        height: parent.height * 0.45
    }

    CustomButton {
        id:btnNew
        anchors.top: logo.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Casual"
        onClicked: {
            mainWindow.loadScreen("GameMode.qml")
        }
    }

    //TODO implement a way to play ranked matches online

    CustomButton {
        id:btnRanked
        anchors.top: btnNew.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Ranked"
    }

    CustomButton {
        id:btnCredits
        anchors.top: btnRanked.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Credits"
    }

    CustomButton {
        id:btnExit
        anchors.top: btnCredits.bottom
        anchors.topMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 2
        buttonText: "Exit game"
        onClicked: Qt.quit()
    }

    function init(){}
}

