package tests {

    import tests.charas.*;
    import tests.cmds.*;
    import tests.charas.TestParty;
    import flash.desktop.NativeApplication;
    import tests.charas.TestAutoCommander;

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
            new TestSkill();
            new TestItem();
            new TestParty();
            new TestAutoCommander();

            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
            NativeApplication.nativeApplication.exit();
        }
    }
}
