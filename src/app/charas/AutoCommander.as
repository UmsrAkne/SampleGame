package app.charas {

    import app.cmds.IBattleCommand;
    import app.cmds.AttackCommand;
    import app.cmds.SkillCommand;

    public class AutoCommander {

        private var owner:Character;

        private var isSkillPriority:Boolean = false;
        private var isItemPriority:Boolean = false;
        private var commandsPriority:Vector.<String> = new Vector.<String>();

        public static const ITEM_COMMAND:String = "itemCommand";
        public static const SKILL_COMMAND:String = "skillCommand";
        public static const ATTACK_COMMAND:String = "attackCommand";

        public function AutoCommander(owner:Character) {
            this.owner = owner;
            commandsPriority.push(ATTACK_COMMAND, SKILL_COMMAND, ITEM_COMMAND);
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

        public function getCommandPriorityClone():Vector.<String> {
            var cloneVector:Vector.<String> = new Vector.<String>();
            commandsPriority.forEach(function(s:String, i:int, vv:Vector.<String>):void {
                cloneVector.push(s);
            });
            return cloneVector;
        }

        public function swtichToPriority(typeString:String):void {
            commandsPriority = commandsPriority.filter(function(s:String, i:int, v:Vector.<String>):Boolean {
                return s != typeString;
            });

            commandsPriority.unshift(typeString);
        }

        /**
         * 攻撃コマンドを最優先で選択するようセットします
         */
        public function switchToAttackPriorityType():void {
            swtichToPriority(ATTACK_COMMAND);
        }

        /**
         * スキルコマンドを最優先で選択するようセットします
         */
        public function switchToSkillPriorityType():void {
            swtichToPriority(SKILL_COMMAND);
        }

        /**
         * アイテムコマンドを最優先で選択するようセットします
         */
        public function switchToItemPriorityType():void {
            swtichToPriority(ITEM_COMMAND);
        }

    }
}
