import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {

    property color xColor: "#FF8000"
    property color oColor: "#CC0066"

    Connections {
        target: utils
        function onGameFinished(winner) {
            if(winner === 1) {
                lbWinner.text = "Player X won"
                lbWinner.color = xColor
            } else {
                lbWinner.text = "Player O won"
                lbWinner.color = oColor
            }

        }
    }

    color: mainBackgroundColor

    property int rectHeight: parent.width * 0.285
    property int rectWidth: parent.width * 0.285
    property bool firstPlayerTurn: true

    Label {
        id: lbWinner
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 40
        font.pixelSize: 30
        font.bold: true
        horizontalAlignment: Text.AlignHCenter

    }

    Label {
        id: lbTurn
        anchors.top: lbWinner.bottom
        width: parent.width
        height: 30
        font.pixelSize: 25
        font.bold: true
        anchors.topMargin: 50
        horizontalAlignment: Text.AlignHCenter
        color: firstPlayerTurn ? xColor : oColor
        text: firstPlayerTurn ? "X Player turn" : "O Player turn"
    }

    Rectangle {
        anchors.top: lbTurn.bottom
        width: rectWidth * 3
        height: rectHeight * 3
        color: mainBackgroundColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height * 0.1


        Rectangle {
            id: rectLeftTop
            height: rectHeight
            width: rectWidth
            anchors.top: parent.top
            anchors.left: parent.left
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 5
                tBorderwidth: 0
                bBorderwidth: 5
                borderColor: mainButtonColor
            }

            Label {
                id:txtLT
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtLT.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 0, txtLT.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectLeftMid
            height: rectHeight
            width: rectWidth
            anchors.top: rectLeftTop.bottom
            anchors.left: parent.left
            anchors.topMargin: 5
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 5
                tBorderwidth: 0
                bBorderwidth: 5
                borderColor: mainButtonColor
            }

            Label {
                id:txtLM
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtLM.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 0, txtLM.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectLeftBottom
            height: rectHeight
            width: rectWidth
            anchors.top: rectLeftMid.bottom
            anchors.left: parent.left
            color: mainBackgroundColor
            anchors.topMargin: 5

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 5
                tBorderwidth: 0
                bBorderwidth: 0
                borderColor: mainButtonColor
            }

            Label {
                id:txtLB
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtLB.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 0, txtLB.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectTopMid
            height: rectHeight
            width: rectWidth
            anchors.top: parent.top
            anchors.left: rectLeftTop.right
            anchors.leftMargin: 5
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 5
                tBorderwidth: 0
                bBorderwidth: 5
                borderColor: mainButtonColor
            }

            Label {
                id:txtTM
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtTM.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 1, txtTM.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectTopRight
            height: rectHeight
            width: rectWidth
            anchors.top: parent.top
            anchors.left: rectTopMid.right
            anchors.leftMargin: 5
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 0
                tBorderwidth: 0
                bBorderwidth: 5
                borderColor: mainButtonColor
            }

            Label {
                id:txtTR
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtTR.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 2, txtTR.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectMid
            height: rectHeight
            width: rectWidth
            anchors.top: rectTopMid.bottom
            anchors.left: rectLeftMid.right
            anchors.margins: 5
            color: mainBackgroundColor

            Label {
                id:txtM
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtM.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 1, txtM.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectRightMid
            height: rectHeight
            width: rectWidth
            anchors.top: rectTopRight.bottom
            anchors.left: rectMid.right
            anchors.topMargin: 5
            anchors.leftMargin: 5
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 5
                rBorderwidth: 0
                tBorderwidth: 0
                bBorderwidth: 5
                borderColor: mainButtonColor
            }

            Label {
                id:txtRM
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtRM.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 2, txtRM.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectBottomMid
            height: rectHeight
            width: rectWidth
            anchors.top: rectMid.bottom
            anchors.left: rectLeftBottom.right
            color: mainBackgroundColor
            anchors.leftMargin: 5
            anchors.topMargin: 5

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 5
                tBorderwidth: 5
                bBorderwidth: 0
                borderColor: mainButtonColor
            }

            Label {
                id:txtBM
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtBM.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 1, txtBM.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        Rectangle {
            id: rectRightBottom
            height: rectHeight
            width: rectWidth
            anchors.top: rectRightMid.bottom
            anchors.left: rectBottomMid.right
            anchors.topMargin: 5
            anchors.leftMargin: 5
            color: mainBackgroundColor

            CustomBorder {
                commonBorder: false
                lBorderwidth: 0
                rBorderwidth: 0
                tBorderwidth: 0
                bBorderwidth: 0
                borderColor: mainButtonColor
            }

            Label {
                id:txtRB
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: text == "X" ? xColor : oColor
                font.pixelSize: 65
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    txtRB.text = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 2, txtRB.text == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }
    }
}
