package tests {

    import tests.charas.*;
    import tests.cmds.*;

    /**
     * ...
     * @author
     */
    public class Tester {

        public function Tester() {
            var b:Boolean = true;
            Assert.isTrue(b);

            new TestAbilityInteger();
            new TestCharacter();

            new TestAttackCommand();
            new TestSkillCommand();
            new TestItemCommand();
            new TestCommandStack();

            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
        }
    }
}
