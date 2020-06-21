package tests.cmds {

    import app.cmds.CommandsStack;
    import app.cmds.IBattleCommand;
    import app.cmds.AttackCommand;
    import tests.Assert;
    import app.charas.CharacterBuilder;
    import app.charas.Character;

    public class TestCommandStack {
        public function TestCommandStack() {
            test();
        }

        private function test():void {

            var character:Character = new CharacterBuilder().build();

            var commandStack:CommandsStack = new CommandsStack();
            var commands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            var commandA:IBattleCommand = new AttackCommand(character);
            commands.push(commandA);
            commandStack.stack(commands);

            Assert.areEqual(commands, commandStack.TopCommands);

            var commandsB:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            var commandB:IBattleCommand = new AttackCommand(character);
            commandsB.push(commandB);
            commandStack.stack(commandsB);

            Assert.areEqual(commandsB, commandStack.TopCommands);
        }
    }
}
