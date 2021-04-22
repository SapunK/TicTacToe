import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    id:game
    property int xScore: 0
    property int oScore: 0
    property int rectHeight: parent.height * 0.15
    property int rectWidth: parent.height * 0.15
    property bool firstPlayerTurn: true
    property bool bAiGame: false
    property bool turnVisible: true
    color: mainBackgroundColor
    focus: true

    property color xColor: "#FF8000"
    property color oColor: "#CC0066"

    Connections {
        target: utils
        function onGameFinished(winner) {
            lbTurn.visible = false
            if(winner === 1) {
                xScore++;
                lbWinner.text = "Player X won"
                lbWinner.color = xColor
            } else if( winner === 0) {
                oScore++;
                lbWinner.text = "Player O won"
                lbWinner.color = oColor
            } else {
                lbWinner.text = "Game finished with no winner"
                lbWinner.color = mainAppColor
            }
            playingField.gameFinished = true
            utils.setGameFinished(true)
            timer.start()
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            mainWindow.loadScreen("GameMode.qml")
            event.accepted = true
        }
    }

    Timer {
        id:timer
        interval: 500
        repeat: false
        onTriggered: dlgGameWon.open()
    }

    Dialog {
        id: dlgGameWon
        width: parent.width * 0.8
        height: lbWinner.height + btnNewGame.height + minimize.height + 80
        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose

        Image {
            id: minimize
            source: "qrc:/pictures/minimize"
            anchors.top: parent.top
            anchors.right: parent.right
            width: parent.height * 0.15
            height: parent.height * 0.15
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dlgGameWon.close()
                    btnShowDlg.visible = true
                }
            }
        }
        Label {
            id: lbWinner
            width: parent.width
            anchors.top: minimize.bottom
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
            height: game.height * 0.08
            width: parent.width * 0.4
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            onClicked: clearFields()
        }

        CustomButton {
            id:btnMainMenu
            buttonText: "Main menu"
            anchors.right: parent.right
            height: game.height * 0.08
            width: parent.width * 0.4
            anchors.bottom: parent.bottom
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            onClicked: mainWindow.loadScreen("WelcomeWindow.qml")
        }
    }

    Label {
        id:lbScore
        text: "Score"
        anchors.top: parent.top
        width: parent.width
        height: 30
        font.pixelSize: 30
        font.bold: true
        anchors.topMargin: 30
        horizontalAlignment: Text.AlignHCenter
        color: mainAppColor
    }

    Label {
        id:lbXScore
        text: "X: " + xScore
        anchors.top: lbScore.bottom
        anchors.left: parent.left
        width: parent.width / 2
        height: 30
        font.pixelSize: 30
        font.bold: true
        anchors.topMargin: 20
        horizontalAlignment: Text.AlignHCenter
        color: xColor
    }

    Label {
        id:lbOScore
        text: "O: " + oScore
        anchors.top: lbScore.bottom
        anchors.right: parent.right
        width: parent.width / 2
        height: 30
        font.pixelSize: 30
        font.bold: true
        anchors.topMargin: 20
        horizontalAlignment: Text.AlignHCenter
        color: oColor
    }

    Label {
        id: lbTurn
        anchors.bottom: playingField.top
        width: parent.width
        height: 30
        font.pixelSize: 25
        font.bold: true
        anchors.bottomMargin: 80
        horizontalAlignment: Text.AlignHCenter
        color: firstPlayerTurn ? xColor : oColor
        text: firstPlayerTurn ? "X Player turn" : "O Player turn"
        visible: turnVisible
    }

    PlayingField {
        id: playingField
        anchors.bottom: btnShowDlg.top
        width: rectWidth * 3
        height: rectHeight * 3

        onAiTurn: {
            utils.aiFillField()
        }
    }

    CustomButton {
        id: btnShowDlg
        buttonText: "Show dialog"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.4
        anchors.bottomMargin: parent.height * 0.04
        anchors.rightMargin: parent.width * 0.04
        visible: false
        onClicked: {
            btnShowDlg.visible = false
            dlgGameWon.open()
        }
    }

    function clearFields() {
        lbTurn.visible = turnVisible && true
        dlgGameWon.close()
        utils.setDefaultValues()
        playingField.clearFields()
        if(playingField.aiGame && !firstPlayerTurn)
            playingField.aiTurn()
    }

    function setAiGame(bAiGame) {
        playingField.aiGame = bAiGame
    }

    function fillField(i, j, value) {
        if(!isGameFinished())
            playingField.fillField(i, j, value);
    }

    function isGameFinished() {
        return playingField.gameFinished
    }
}

