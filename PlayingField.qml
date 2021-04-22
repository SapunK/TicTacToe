import QtQuick 2.0

Rectangle {
    property bool gameFinished: false
    property bool aiGame: false

    color: mainBackgroundColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottomMargin: parent.height * 0.2

    signal aiTurn()

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

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectLeftMid.lblText != "" || gameFinished)
                    return

                rectLeftMid.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(1, 0, rectLeftMid.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectLeftBottom.lblText != "" || gameFinished)
                    return

                rectLeftBottom.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(2, 0, rectLeftBottom.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectTopMid.lblText != "" || gameFinished)
                    return

                rectTopMid.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(0, 1, rectTopMid.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectTopRight.lblText != "" || gameFinished)
                    return

                rectTopRight.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(0, 2, rectTopRight.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectMid.lblText != "" || gameFinished)
                    return

                rectMid.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(1, 1, rectMid.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectRightMid.lblText != "" || gameFinished)
                    return

                rectRightMid.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(1, 2, rectRightMid.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectBottomMid.lblText != "" || gameFinished)
                    return

                rectBottomMid.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(2, 1, rectBottomMid.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
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
                if(rectRightBottom.lblText != "" || gameFinished)
                    return

                rectRightBottom.lblText = firstPlayerTurn ? "X" : "O"
                utils.fillValue(2, 2, rectRightBottom.lblText == "X" ? 1 : 0)
                firstPlayerTurn = !firstPlayerTurn

                if(aiGame && !firstPlayerTurn)
                    aiTurn()
            }
        }
    }

    function clearFields() {
        rectLeftBottom.lblText = ""
        rectLeftMid.lblText = ""
        rectLeftTop.lblText = ""
        rectTopMid.lblText = ""
        rectMid.lblText = ""
        rectBottomMid.lblText = ""
        rectTopRight.lblText = ""
        rectRightMid.lblText = ""
        rectRightBottom.lblText = ""
        gameFinished = false
    }

    function fillField(i, j, value) {
        if(i === 0 && j === 0) {
            rectLeftTop.lblText = value === 1 ? "X" : "O"
        } else if(i === 0 && j === 1) {
            rectTopMid.lblText = value === 1 ? "X" : "O"
        } else if(i === 0 && j === 2) {
            rectTopRight.lblText = value === 1 ? "X" : "O"
        } else if(i === 1 && j === 0) {
            rectLeftMid.lblText = value === 1 ? "X" : "O"
        } else if(i === 1 && j === 1) {
            rectMid.lblText = value === 1 ? "X" : "O"
        } else if(i === 1 && j === 2) {
            rectRightMid.lblText = value === 1 ? "X" : "O"
        } else if(i === 2 && j === 0) {
            rectLeftBottom.lblText = value === 1 ? "X" : "O"
        } else if(i === 2 && j === 1) {
            rectBottomMid.lblText = value === 1 ? "X" : "O"
        } else if(i === 2 && j === 2) {
            rectRightBottom.lblText = value === 1 ? "X" : "O"
        }
        firstPlayerTurn = !firstPlayerTurn
    }
}
