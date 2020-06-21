package tests.cmds {
    import app.cmds.AttackCommand;
    import app.charas.CharacterBuilder;
    import app.charas.Character;
    import app.charas.Ability;

    /**
     * ...
     * @author
     */
    public class TestAttackCommand {

        public function TestAttackCommand() {
            test();
        }

        private function test():void {
            var character:Character = new CharacterBuilder().build();
            var attackCommand:AttackCommand = new AttackCommand(character);
        }

    }

}
