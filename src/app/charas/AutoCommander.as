package app.charas {

    import app.cmds.IBattleCommand;

    public class AutoCommander {

        private var owner:Character;

        public function AutoCommander(owner:Character) {
            this.owner = owner;
        }

        public function setRandomAction():void {
            var selectableAction:Vector.<IAction> = new Vector.<IAction>();

            if (owner.Items.length != 0) {
                selectableAction.push(owner.Items[Math.floor(Math.random() * owner.Items.length)]);
            }

            if (owner.Skills.length != 0) {
                selectableAction.push(owner.Skills[Math.floor(Math.random() * owner.Skills.length)]);
            }

            var currentAction:IAction = selectableAction[Math.floor(Math.random() * selectableAction.length)];
            var targetables:Vector.<ITarget> = new Vector.<ITarget>()
            owner.targetSource.getTargets().forEach(function(t:ITarget, i:int, vv:Vector.<ITarget>):void {
                if (t.IsFriend == Range.getAbsoluteSide(owner, currentAction.TargetRange)) {
                    targetables.push(t);
                }
            });

            if (targetables.length > 0) {
                currentAction.Targets.push(targetables[0]);
                owner.CmdManager.Selected = true;
                owner.Action = currentAction;
            }
        }
    }
}
