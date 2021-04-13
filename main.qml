import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: mainWindow
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    title: qsTr("TicTacToe")

    readonly property color mainButtonColor: "#6600CC"
    readonly property color mainTextColor: "#CC0000"
    readonly property color mainBackgroundColor: "#C0C0C0"

    Loader {
        id: loader
        anchors.fill: parent
        source: "WelcomeWindow.qml"
    }

    function loadScreen(source){
        loader.source = source
    }
}
