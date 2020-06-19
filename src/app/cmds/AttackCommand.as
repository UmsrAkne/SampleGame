package app.cmds {

    /**
     * ...
     * @author
     */
    public class AttackCommand implements IBattleCommand {

        public function AttackCommand() {

        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "攻撃";
        }

        public function executeAsBattleCommand():void {

        }

    }

}
