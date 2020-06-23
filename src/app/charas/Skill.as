package app.charas {

    import app.cmds.IBattleCommand;

    public class Skill implements IBattleCommand, IAction {

        private var owner:Character;
        private var displayName:String = "";
        private var cost:int = 0;

        public function Skill(owner:Character, skillName:String, cost:int) {
            this.owner = owner;
            displayName = skillName;
            this.cost = cost;
        }

        public function get DisplayName():String {
            return displayName;
        }

        public function get Cost():int {
            return cost;
        }

        public function executeAsBattleCommand():void {
        }

        public function cancel():void {
        }

        public function act():void {
        }
    }
}
