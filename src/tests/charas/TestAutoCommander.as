package tests.charas {

    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Party;
    import tests.Assert;

    public class TestAutoCommander {
        public function TestAutoCommander() {
            testSetAutoCommand();
        }

        private function testSetAutoCommand():void {
            var c1:Character = new CharacterBuilder().setIsFriend(true).build();
            var cs:Vector.<Character> = new Vector.<Character>();
            cs.push(c1);
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());

            var party:Party = new Party(cs);
            c1.targetSource = party;
            c1.AI.setRandomAction();

            Assert.isTrue(c1.Action != null);
            Assert.isTrue(c1.CmdManager.Selected);
        }
    }
}
