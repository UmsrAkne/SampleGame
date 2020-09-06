package tests.charas {

    import app.charas.Party;
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import tests.Assert;

    public class TestParty {
        public function TestParty() {
            getOneSideTest();
            getAllTest();
        }

        private function getOneSideTest():void {
            var vec:Vector.<Character> = new Vector.<Character>();
            vec.push(new CharacterBuilder().setIsFriend(true).build());
            vec.push(new CharacterBuilder().setIsFriend(false).build());
            vec.push(new CharacterBuilder().setIsFriend(false).build());
            var party:Party = new Party(vec);

            Assert.areEqual(party.getOneSide(true).length, 1);
            Assert.areEqual(party.getOneSide(false).length, 2);
        }

        private function getAllTest():void {
            var vec:Vector.<Character> = new Vector.<Character>();
            vec.push(new CharacterBuilder().setIsFriend(true).build());
            vec.push(new CharacterBuilder().setIsFriend(false).build());
            vec.push(new CharacterBuilder().setIsFriend(false).build());
            var party:Party = new Party(vec);
            Assert.areEqual(party.getAll().length, 3);
        }
    }
}
