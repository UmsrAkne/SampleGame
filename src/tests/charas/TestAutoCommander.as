package tests.charas {

    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Party;
    import tests.Assert;
    import app.charas.AutoCommander;

    public class TestAutoCommander {

        public function TestAutoCommander() {
            testSetAutoCommand();
            testPrioritySetting();
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

        private function testPrioritySetting():void {
            var c1:Character = new CharacterBuilder().setIsFriend(true).build();
            Assert.areEqual(c1.AI.getCommandPriorityClone()[0], AutoCommander.ATTACK_COMMAND);

            c1.AI.switchToAttackPriorityType();
            Assert.areEqual(c1.AI.getCommandPriorityClone()[0], AutoCommander.ATTACK_COMMAND);

            c1.AI.switchToSkillPriorityType()
            Assert.areEqual(c1.AI.getCommandPriorityClone()[0], AutoCommander.SKILL_COMMAND);

            c1.AI.switchToItemPriorityType();
            Assert.areEqual(c1.AI.getCommandPriorityClone()[0], AutoCommander.ITEM_COMMAND);

            var sv:Vector.<String> = c1.AI.getCommandPriorityClone();
            Assert.areEqual(sv[0], AutoCommander.ITEM_COMMAND);
            Assert.areEqual(sv[1], AutoCommander.SKILL_COMMAND);
            Assert.areEqual(sv[2], AutoCommander.ATTACK_COMMAND);

        }
    }
}
