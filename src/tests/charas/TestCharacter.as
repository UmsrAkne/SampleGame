package tests.charas {
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Ability;
    import tests.Assert;
    import app.charas.ITarget;
    import app.charas.Range;

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
            characterBuilder.setIsFriend(true);

            var testCharacter:Character = characterBuilder.build();
            Assert.areEqual(testCharacter.Name, "testCharacter");
            Assert.areEqual(testCharacter.IsFriend, true);

            characterBuilder.setName("testCharacter2");
            var testCharacter2:Character = characterBuilder.build();

            characterBuilder.setName("testCharacter3");
            var testCharacter3:Character = characterBuilder.build();

            characterBuilder.setIsFriend(false);
            characterBuilder.setName("enemy0");
            var enemy0:Character = characterBuilder.build();

            characterBuilder.setName("enemy1");
            var enemy1:Character = characterBuilder.build();

            var targets:Vector.<ITarget> = new Vector.<ITarget>();
            targets.push(testCharacter, testCharacter2, testCharacter3, enemy0, enemy1);
            testCharacter.otherCharacters = targets;
            testCharacter.setSelectableTargets(Range.RELATIVE_SINGLE_ENEMY);
        }

    }

}
