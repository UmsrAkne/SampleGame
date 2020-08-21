package app.charas {

    import app.cmds.CommandsStack;
    import app.cmds.IBattleCommand;

    public class CommandManager {

        private var selected:Boolean = false;
        private var commandStack:CommandsStack = new CommandsStack();
        private var defaultCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
        private var commands:Vector.<Vector.<IBattleCommand>> = new Vector.<Vector.<IBattleCommand>>();

        public function CommandManager() {

        }

        public function get Selected():Boolean {
            return selected;
        }

        public function set Selected(value:Boolean):void {
            selected = value;
        }

        public function stackCommand(value:Vector.<IBattleCommand>):void {
            commands.push(value);
        }

        public function get TopCommands():Vector.<IBattleCommand> {
            return (commands.length > 0) ? commands[commands.length - 1] : new Vector.<IBattleCommand>();
        }

        public function set DefaultCommands(value:Vector.<IBattleCommand>):void {
            defaultCommands = value;
            commands.push(value);
        }

        public function get DefaultCommands():Vector.<IBattleCommand> {
            return defaultCommands;
        }
    }
}
