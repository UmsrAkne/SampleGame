package app.charas {

    import app.cmds.IBattleCommand;

    public class Item implements IBattleCommand, IAction {

        private var displayName:String;
        private var owner:Character;
        private var targets:Vector.<ITarget> = new Vector.<ITarget>();
        private var targetRange:String;
        private var effectType:String;

        public function Item(owner:Character, itemName:String, targetRange:String, effectType:String) {
            this.owner = owner;
            displayName = itemName;
            this.targetRange = targetRange;
            this.effectType = effectType;
        }

        public function act():void {
            var reaction:Reaction = new Reaction();
            reaction.effectType = effectType;
            owner.ActionCommunicator.reaction(reaction);
        }

        public function get Targets():Vector.<ITarget> {
            return targets
        }

        public function set Targets(value:Vector.<ITarget>):void {
            targets = value;
        }

        public function get TargetRange():String {
            return targetRange;
        }

        public function get DisplayName():String {
            return displayName;
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            owner.Action = this;
            var targetList:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            var isAllRange:Boolean = (TargetRange == Range.ALL);
            var absTargetSide:Boolean = Range.getAbsoluteSide(owner, TargetRange);
            owner.targetSource.getTargets().forEach(function(t:ITarget, i:int, tv:Vector.<ITarget>):void {
                if (isAllRange) {
                    targetList.push(IBattleCommand(t));
                } else if (t.IsFriend == absTargetSide) {
                    targetList.push(IBattleCommand(t));
                }
            })
            return targetList;
        }

        public function cancel():void {
            owner.Action = null;
        }

        public function get IsFinalCommand():Boolean {
            return false;
        }

        public function get EffectType():String {
            return effectType;
        }

        public function get CanAct():Boolean {
            return true;
        }
    }
}
