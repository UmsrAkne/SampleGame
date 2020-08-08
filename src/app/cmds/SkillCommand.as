package app.cmds {

    import app.charas.Character;

    /**
     * ...
     * @author
     */
    public class SkillCommand implements IBattleCommand {

        private var owner:Character

        public function SkillCommand(owner:Character) {
            this.owner = owner;
        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "スキル";
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            return new Vector.<IBattleCommand>();
        }

        public function cancel():void {
        }

        public function get IsFinalCommand():Boolean {
            return false;
        }
    }

}
