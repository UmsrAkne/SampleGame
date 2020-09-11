package tests.charas {

    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Party;
    import tests.Assert;
    import app.charas.AutoCommander;
    import app.charas.SkillBuilder;
    import app.charas.Range;
    import app.charas.ItemBuilder;
    import app.charas.Skill;
    import app.charas.Item;

    public class TestAutoCommander {

        public function TestAutoCommander() {
            testSetAutoCommand();
            testPrioritySetting();
            testSetAction();
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

        private function testSetAction():void {
            var c1:Character = new CharacterBuilder().setIsFriend(true).build();
            var cs:Vector.<Character> = new Vector.<Character>();
            cs.push(c1);
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());

            var party:Party = new Party(cs);
            c1.Skills.push(new SkillBuilder().setName("skill1").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c1).setCost(0).build());
            c1.Items.push(new ItemBuilder().setName("kaihukuItem1").setTargetRange(Range.RELATIVE_SINGLE_FRIEND).setOwner(c1).build());

            // スキル優先タイプのとき、スキルを選択するか
            c1.targetSource = party;
            c1.AI.switchToSkillPriorityType();
            c1.AI.setAction();
            Assert.areEqual(Skill(c1.Action).DisplayName, "skill1");
            Assert.isFalse(c1.Action.Targets[0].IsFriend);

            // アイテム優先タイプのとき、アイテムを選択するか
            c1.AI.switchToItemPriorityType();
            c1.AI.setAction();
            Assert.areEqual(Item(c1.Action).DisplayName, "kaihukuItem1");
            Assert.isTrue(c1.Action.Targets[0].IsFriend);

            // 攻撃優先タイプのとき、攻撃を選択するか
            c1.AI.switchToAttackPriorityType();
            c1.AI.setAction();
            Assert.areEqual(Skill(c1.Action).DisplayName, "攻撃");
            Assert.isFalse(c1.Action.Targets[0].IsFriend);

            // スキル優先タイプだが、使用できるスキルが無いとき、攻撃コマンドを選択するか
            c1.Skills[1] = new SkillBuilder().setName("コスト不足で使えないスキル").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c1).setCost(50).build();
            c1.AI.switchToSkillPriorityType();
            c1.AI.setAction();
            Assert.areEqual(Skill(c1.Action).DisplayName, "攻撃");
            Assert.isFalse(c1.Action.Targets[0].IsFriend);

            // スキル > アイテム > 攻撃 という優先順位で、使用できるスキルがないとき、アイテムコマンドを選択するか
            c1.AI.switchToAttackPriorityType();
            c1.AI.switchToItemPriorityType();
            c1.AI.switchToSkillPriorityType();
            c1.AI.setAction();

            Assert.areEqual(Item(c1.Action).DisplayName, "kaihukuItem1");
            Assert.isTrue(c1.Action.Targets[0].IsFriend);
        }
    }
}
