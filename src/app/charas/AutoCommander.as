package app.charas {

    import app.cmds.IBattleCommand;
    import app.cmds.AttackCommand;
    import app.cmds.SkillCommand;
    import app.cmds.ItemCommand;
    import app.utils.Utils;

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

        /**
         * 設定された行動の優先順位に基づき、キャラクターの Action をセットします。
         */
        public function setAction():void {
            var selectableAction:Vector.<IAction> = new Vector.<IAction>();
            commandsPriority.forEach(function(s:String, i:int, vv:Vector.<String>):void {
                if (s == ATTACK_COMMAND) {
                    selectableAction.push(owner.Skills[0]);
                }

                if (s == SKILL_COMMAND && owner.Skills.length > 1) {
                    selectableAction.push(owner.Skills[Utils.getRandom(1, owner.Skills.length - 1)]); // skills[0] は通常攻撃
                }

                if (s == ITEM_COMMAND && owner.Items.length > 0) {
                    selectableAction.push(owner.Items[Utils.getRandom(0, owner.Items.length - 1)]);
                }
            });

            var currentAction:IAction;
            for each (var a:IAction in selectableAction) {
                if (a.CanAct) {
                    currentAction = a;
                    break;
                }
            }

            selectableAction.forEach(function(a:IAction, i:int, av:Vector.<IAction>):void {
            });

            var targetables:Vector.<ITarget> = new Vector.<ITarget>()

            if (currentAction.TargetRange == Range.ALL) {
                targetables = owner.targetSource.getTargets();
            } else {
                owner.targetSource.getTargets().forEach(function(t:ITarget, i:int, vv:Vector.<ITarget>):void {
                    if (t.IsFriend == Range.getAbsoluteSide(owner, currentAction.TargetRange)) {
                        targetables.push(t);
                    }
                });
            }

            if (targetables.length > 0) {
                if (Range.isAllRange(currentAction.TargetRange)) {
                    currentAction.Targets = targetables;
                } else {
                    currentAction.Targets.push(targetables[0]);
                }
                owner.CmdManager.Selected = true;
                owner.Action = currentAction;
            }
        }

        public function setRandomAction():void {
            var clone:Vector.<String> = commandsPriority.slice();
            commandsPriority.sort(function():int {
                return int(Math.random() * 3) - 1
            });
            setAction();

            commandsPriority = clone;
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
