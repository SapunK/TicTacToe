import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: mainWindow
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    title: qsTr("TicTacToe")

    readonly property color mainAppColor: "#6600CC"
    readonly property color mainTextColor: "#CC0000"
    readonly property color mainBackgroundColor: "#C0C0C0"

    Loader {
        id: loader
        anchors.fill: parent
        source: "WelcomeWindow.qml"

        onLoaded: loader.item.init()
    }

    function loadScreen(source){
        loader.source = source
    }
}
