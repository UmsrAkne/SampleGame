package tests.cmds {

    import app.cmds.ItemCommand;
    import app.charas.Character;
    import app.charas.CharacterBuilder;

    /**
     * ...
     * @author
     */
    public class TestItemCommand {

        public function TestItemCommand() {
            test();
        }

        private function test():void {
            var character:Character = new CharacterBuilder().build();
            var itemCommand:ItemCommand = new ItemCommand(character);
        }

    }

}
