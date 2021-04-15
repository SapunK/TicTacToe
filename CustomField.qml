import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    color: mainBackgroundColor
    property string lblText: ""
    height: rectHeight
    width: rectWidth

    Label {
        id:lblField
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: lblText == "X" ? xColor : oColor
        font.pixelSize: 65
        font.bold: true
        text: lblText
    }
}
