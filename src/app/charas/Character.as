package app.charas {

    import app.cmds.IBattleCommand;

    /**
     * ...
     * @author
     */
    public class Character implements ITarget, IBattleCommand {
        private var name:String;
        private var isFriend:Boolean = true;
        public var otherCharacters:Vector.<ITarget>;
        private var commandManager:CommandManager = new CommandManager();

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
        }

        private function getTargetables(targetableRange:String):Vector.<ITarget> {
            var selectFriend:Boolean = Range.getAbsoluteSide(this, Range.RELATIVE_SINGLE_FRIEND)
            var selected:Vector.<ITarget> = otherCharacters.filter(function(item:ITarget, i:int, v:*):Boolean {
                return item.IsFriend == selectFriend;
            });

            return selected;
        }

        public function executeAsBattleCommand():void {
        }

        public function cancel():void {
        }

        public function get IsFinalCommand():Boolean {
            return true;
        }
    }

}
