import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id:customButton
    property string buttonText: ""
    height: parent.height * 0.08
    background: Rectangle{
        height: parent.height
        width: parent.width
        color: mainAppColor
        radius: 12
        Text {
            anchors.fill: parent
            text: buttonText
            color: "white"
            font.bold: true
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
