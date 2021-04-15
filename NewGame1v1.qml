import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    property color xColor: "#FF8000"
    property color oColor: "#CC0066"

    Connections {
        target: utils
        function onGameFinished(winner) {
            lbTurn.text = ""
            if(winner === 1) {
                lbWinner.text = "Player X won"
                lbWinner.color = xColor
            } else if( winner === 0) {
                lbWinner.text = "Player O won"
                lbWinner.color = oColor
            } else {
                lbWinner.text = "Game finished with no winner"
                lbWinner.color = mainButtonColor
            }

            dlgGameWon.open()
        }
    }

    color: mainBackgroundColor

    property int rectHeight: parent.width * 0.285
    property int rectWidth: parent.width * 0.285
    property bool firstPlayerTurn: true

    Popup {
        id: dlgGameWon
        width: parent.width * 0.8
        height: parent.height * 0.25
        anchors.centerIn: parent

        Label {
            id: lbWinner
            width: parent.width
            anchors.top: parent.top
            anchors.topMargin: 12
            font.pixelSize: 30
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.leftMargin: 10
            anchors.rightMargin: 10
        }

        CustomButton {
            id:btnNewGame
            buttonText: "New game"
            anchors.left: parent.left
            width: parent.width * 0.4
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
        }

        CustomButton {
            id:btnMainMenu
            buttonText: "Main menu"
            anchors.right: parent.right
            width: parent.width * 0.4
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
        }
    }

    Label {
        id: lbTurn
        anchors.top: parent.top
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

        CustomField {
            id: rectLeftTop
            anchors.top: parent.top
            anchors.left: parent.left

            CustomBorder {
                rBorderwidth: 5
                bBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectLeftTop.lblText != "")
                        return

                    rectLeftTop.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 0, rectLeftTop.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectLeftMid
            anchors.top: rectLeftTop.bottom
            anchors.left: parent.left
            anchors.topMargin: 5

            CustomBorder {
                rBorderwidth: 5
                bBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectLeftMid.lblText != "")
                        return

                    rectLeftMid.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 0, rectLeftMid.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectLeftBottom
            anchors.top: rectLeftMid.bottom
            anchors.left: parent.left
            anchors.topMargin: 5

            CustomBorder {
                rBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectLeftBottom.lblText != "")
                        return

                    rectLeftBottom.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 0, rectLeftBottom.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectTopMid
            anchors.top: parent.top
            anchors.left: rectLeftTop.right
            anchors.leftMargin: 5

            CustomBorder {
                rBorderwidth: 5
                bBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectTopMid.lblText != "")
                        return

                    rectTopMid.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 1, rectTopMid.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectTopRight
            anchors.top: parent.top
            anchors.left: rectTopMid.right
            anchors.leftMargin: 5

            CustomBorder {
                bBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectTopRight.lblText != "")
                        return

                    rectTopRight.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(0, 2, rectTopRight.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectMid
            anchors.top: rectTopMid.bottom
            anchors.left: rectLeftMid.right
            anchors.margins: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectMid.lblText != "")
                        return

                    rectMid.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 1, rectMid.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectRightMid
            anchors.top: rectTopRight.bottom
            anchors.left: rectMid.right
            anchors.topMargin: 5
            anchors.leftMargin: 5

            CustomBorder {
                lBorderwidth: 5
                bBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectRightMid.lblText != "")
                        return

                    rectRightMid.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(1, 2, rectRightMid.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectBottomMid
            anchors.top: rectMid.bottom
            anchors.left: rectLeftBottom.right
            anchors.leftMargin: 5
            anchors.topMargin: 5

            CustomBorder {
                rBorderwidth: 5
                tBorderwidth: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectBottomMid.lblText != "")
                        return

                    rectBottomMid.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 1, rectBottomMid.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }

        CustomField {
            id: rectRightBottom
            anchors.top: rectRightMid.bottom
            anchors.left: rectBottomMid.right
            anchors.topMargin: 5
            anchors.leftMargin: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(rectRightBottom.lblText != "")
                        return

                    rectRightBottom.lblText = firstPlayerTurn ? "X" : "O"
                    utils.fillValue(2, 2, rectRightBottom.lblText == "X" ? 1 : 0)
                    firstPlayerTurn = !firstPlayerTurn
                }
            }
        }
    }
}
