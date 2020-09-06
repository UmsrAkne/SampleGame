package app.cmds {

    import app.charas.Character;
    import app.charas.Skill;

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
            var skillCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            owner.Skills.forEach(function(s:Skill, i:int, sv:Vector.<Skill>):void {
                skillCommands.push(IBattleCommand(s));
            })

            return skillCommands;
        }

        public function cancel():void {
        }

        public function get IsFinalCommand():Boolean {
            return false;
        }
    }

}
