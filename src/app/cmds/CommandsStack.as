package app.cmds {

    public class CommandsStack {

        private var commands:Vector.<Vector.<IBattleCommand>> = new Vector.<Vector.<IBattleCommand>>();

        public function CommandsStack() {
        }

        public function stack(vec:Vector.<IBattleCommand>):void {
            commands.push(vec);
        }

        public function get TopCommands():Vector.<IBattleCommand> {
            if (commands.length == 0) {
                return new Vector.<IBattleCommand>();
            } else {
                return commands[commands.length - 1];
            }
        }
    }
}
