package app.charas {

    import app.cmds.IBattleCommand;
    import app.charas.ITarget;

    public class Skill implements IBattleCommand, IAction {

        private var owner:Character;
        private var displayName:String = "";
        private var cost:int = 0;
        private var targets:Vector.<ITarget> = new Vector.<ITarget>();

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

        public function get Targets():Vector.<ITarget> {
            return targets;
        }

        public function set Targets(value:Vector.<ITarget>):void {
            targets = value;
        }
    }
}
