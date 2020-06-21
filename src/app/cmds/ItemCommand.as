package app.cmds {

    import app.charas.Character;

    /**
     * ...
     * @author
     */
    public class ItemCommand implements IBattleCommand {

        private var owner:Character;

        public function ItemCommand(owner:Character) {
            this.owner = owner;
        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "アイテム";
        }

        public function executeAsBattleCommand():void {

        }

    }

}
