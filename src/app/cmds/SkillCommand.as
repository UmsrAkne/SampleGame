package app.cmds {

    /**
     * ...
     * @author
     */
    public class SkillCommand implements IBattleCommand {

        public function SkillCommand() {

        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "スキル";
        }

        public function executeAsBattleCommand():void {

        }

    }

}
