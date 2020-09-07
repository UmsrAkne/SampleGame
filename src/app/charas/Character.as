package app.charas {

    import app.cmds.IBattleCommand;
    import app.cmds.AttackCommand;
    import app.cmds.SkillCommand;
    import app.cmds.ItemCommand;

    /**
     * ...
     * @author
     */
    public class Character implements ITarget, IBattleCommand {
        private var name:String;
        private var isFriend:Boolean = true;
        public var otherCharacters:Vector.<ITarget>;
        public var targetSource:ITargetSource;
        private var commandManager:CommandManager = new CommandManager();
        private var targets:Vector.<ITarget> = new Vector.<ITarget>();
        private var skills:Vector.<Skill> = new Vector.<Skill>();
        private var items:Vector.<Item> = new Vector.<Item>();

        public function get Skills():Vector.<Skill> {
            return skills;
        }

        public function get Items():Vector.<Item> {
            return items;
        }

        public function get CmdManager():CommandManager {
            return commandManager;
        }

        public function get Name():String {
            return name;
        }

        private var abilities:Ability;

        public function get Abilities():Ability {
            return abilities;
        }

        private var action:IAction;

        public function get Action():IAction {
            return action;
        }

        public function set Action(value:IAction):void {
            action = value;
        }

        public function Character(name:String, ability:Ability, isFriend:Boolean = true) {
            this.name = name;
            this.abilities = ability;
            this.isFriend = isFriend;

            var defaultCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            defaultCommands.push(new AttackCommand(this));
            defaultCommands.push(new SkillCommand(this));
            defaultCommands.push(new ItemCommand(this));
            CmdManager.DefaultCommands = defaultCommands;

            // 全キャラクターが持っている通常攻撃スキル
            Skills.push(new SkillBuilder().setName("攻撃").setCost(0).setOwner(this).build());
        }


        public function get DisplayName():String {
            return name;
        }

        public function get IsFriend():Boolean {
            return isFriend;
        }

        public function get IsAlive():Boolean {
            return (this.Abilities.HP.Currentry > 0);
        }

        /**
         * このキャラクターが所持するIBattleCommandの中から、指定されたインデックスのコマンドを実行します。
         * @param commandIndex
         */
        public function executeBattleCommand(commandIndex:int):void {
            var selectedCommand:IBattleCommand = CmdManager.TopCommands[commandIndex];

            if (selectedCommand is Character) {
                this.targets = new Vector.<ITarget>();
                targets.push(Character(selectedCommand));
            }

            if (selectedCommand.IsFinalCommand) {
                CmdManager.Selected = true;
                return;
            }

            var nextCommands:Vector.<IBattleCommand> = selectedCommand.executeAsBattleCommand();
            if (nextCommands.length != 0) {
                CmdManager.stackCommand(nextCommands);
            } else {
                // 例えば、ターゲットにできるキャラクターが存在しないとか、アイテムやスキルを一つも所持していない等
                // そういった場合に nextCommands == 0 の状態になる可能性あり。
                // このブロックを通った場合、キャラクターの状態はこのメソッド突入時と同じ状態になるはず。
                selectedCommand.cancel();
            }
        }

        private function getTargetables(targetableRange:String):Vector.<ITarget> {
            var selectFriend:Boolean = Range.getAbsoluteSide(this, Range.RELATIVE_SINGLE_FRIEND)
            var selected:Vector.<ITarget> = otherCharacters.filter(function(item:ITarget, i:int, v:*):Boolean {
                return item.IsFriend == selectFriend;
            });

            return selected;
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            return new Vector.<IBattleCommand>();
        }

        public function cancel():void {
        }

        public function get IsFinalCommand():Boolean {
            return true;
        }
    }

}
