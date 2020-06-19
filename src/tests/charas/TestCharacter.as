package tests.charas {
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Ability;
    import tests.Assert;

    /**
     * ...
     * @author
     */
    public class TestCharacter {

        public function TestCharacter() {
            creationTest();
        }

        private function creationTest():void {
            var characterBuilder:CharacterBuilder = new CharacterBuilder()
            characterBuilder.setName("testCharacter");
            characterBuilder.setLevel(1);
            characterBuilder.setHp(10);
            characterBuilder.setSp(5);
            characterBuilder.setAtk(3);
            characterBuilder.setGud(3);
            characterBuilder.setSp(2);

            var testCharacter:Character = characterBuilder.build();
            Assert.areEqual(testCharacter.Name, "testCharacter");
        }

    }

}
