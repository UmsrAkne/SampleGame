package app.charas {

    import app.cmds.IBattleCommand;
    import app.charas.ITarget;

    public class Skill implements IBattleCommand, IAction {

        private var owner:Character;
        private var displayName:String = "";
        private var cost:int = 0;
        private var targets:Vector.<ITarget> = new Vector.<ITarget>();
        private var targetRange:String;

        public function Skill(owner:Character, skillName:String, cost:int, targetRange:String) {
            this.owner = owner;
            displayName = skillName;
            this.cost = cost;
            this.targetRange = targetRange;
        }

        public function get DisplayName():String {
            return displayName;
        }

        public function get Cost():int {
            return cost;
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            owner.Action = this;
            var targetableSide:Boolean = Range.getAbsoluteSide(owner, targetRange);
            var battleCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            owner.targetSource.getTargets().forEach(function(t:ITarget, i:int, vv:Vector.<ITarget>):void {
                if (t.IsFriend == targetableSide) {
                    battleCommands.push(IBattleCommand(t));
                }
            })

            return battleCommands;
        }

        public function cancel():void {
            owner.Action = null;
        }

        public function act():void {
        }

        public function get Targets():Vector.<ITarget> {
            return targets;
        }

        public function set Targets(value:Vector.<ITarget>):void {
            targets = value;
        }

        public function get TargetRange():String {
            return targetRange;
        }

        public function get IsFinalCommand():Boolean {
            return false;
        }

        public function get CanAct():Boolean {
            return owner.Abilities.SP.Currentry >= cost;
        }
    }
}
