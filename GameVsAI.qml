import QtQuick 2.0

Rectangle {

    property int rectHeight: parent.width * 0.285
    property int rectWidth: parent.width * 0.285
    property bool firstPlayerTurn: true

    PlayingField {
        anchors.bottom: parent.bottom
        width: rectWidth * 3
        height: rectHeight * 3
    }

}
