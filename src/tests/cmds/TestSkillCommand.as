package tests.cmds {
    import app.cmds.SkillCommand;
    import app.charas.CharacterBuilder;
    import app.charas.Character;

    /**
     * ...
     * @author
     */
    public class TestSkillCommand {

        public function TestSkillCommand() {
            test();
        }

        private function test():void {
            var character:Character = new CharacterBuilder().build();
            var skillCommand:SkillCommand = new SkillCommand(character);
        }

    }

}
