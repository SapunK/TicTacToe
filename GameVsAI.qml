import QtQuick 2.0

Game {
    id:game
    turnVisible: false

    Connections {
        target: utils
        function onAiFieldFilled(i, j) {
            game.fillField(i, j, 0);
        }
    }

    function init(){
        game.setAiGame(true)
        utils.setDefaultValues()
    }

}
