package app.charas {

    import app.cmds.CommandsStack;
    import app.cmds.IBattleCommand;

    /**
     * ...
     * @author
     */
    public class Character implements ITarget {

        private var name:String;
        private var isFriend:Boolean = true;
        private var commandStack:CommandsStack = new CommandsStack();
        public var otherCharacters:Vector.<ITarget>;

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

        public function get Commands():CommandsStack {
            return commandStack;
        }

        public function executeBattleCommand(commandIndex:int):void {
            var selectedCommand:IBattleCommand = commandStack.TopCommands[commandIndex];
            if (selectedCommand is IAction) {
                // Skill or Item
                Action = IAction(selectedCommand);
                Action.Targets = getTargetables(Action.TargetRange);
                var battleCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
                for each (var t:ITarget in Action.Targets) {
                    battleCommands.push(IBattleCommand(t));
                }
            }

            if (selectedCommand is ITarget) {
                // selected target character

            }
            commandStack.TopCommands[commandIndex].executeAsBattleCommand();
        }

        private function getTargetables(targetableRange:String):Vector.<ITarget> {
            var selectFriend:Boolean = Range.getAbsoluteSide(this, Range.RELATIVE_SINGLE_FRIEND)
            var selected:Vector.<ITarget> = otherCharacters.filter(function(item:ITarget, i:int, v:*):Boolean {
                return item.IsFriend == selectFriend;
            });

            return selected;
        }
    }

}
