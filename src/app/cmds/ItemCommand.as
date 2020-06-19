package app.cmds {

    /**
     * ...
     * @author
     */
    public class ItemCommand implements IBattleCommand {

        public function ItemCommand() {

        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "アイテム";
        }

        public function executeAsBattleCommand():void {

        }

    }

}
