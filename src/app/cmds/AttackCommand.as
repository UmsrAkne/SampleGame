package app.cmds {

    import app.charas.Character;

    /**
     * ...
     * @author
     */
    public class AttackCommand implements IBattleCommand {

        private var owner:Character;

        public function AttackCommand(owner:Character) {
            this.owner = owner;
        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "攻撃";
        }

        public function executeAsBattleCommand():void {

        }

    }

}
