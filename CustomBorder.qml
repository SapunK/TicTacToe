import QtQuick 2.0

Rectangle
{

    property bool commonBorder : false

    property int lBorderwidth : 0
    property int rBorderwidth : 0
    property int tBorderwidth : 0
    property int bBorderwidth : 0

    property int commonBorderWidth : 1

    z : -1

    property string borderColor : mainButtonColor

    color: borderColor
//    radius: 10

    anchors
    {
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: parent.bottom

        topMargin    : commonBorder ? -commonBorderWidth : -tBorderwidth
        bottomMargin : commonBorder ? -commonBorderWidth : -bBorderwidth
        leftMargin   : commonBorder ? -commonBorderWidth : -lBorderwidth
        rightMargin  : commonBorder ? -commonBorderWidth : -rBorderwidth
    }
}
