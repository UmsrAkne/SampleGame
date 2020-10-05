package tests {

    import tests.charas.*;
    import tests.cmds.*;
    import tests.charas.TestParty;
    import flash.desktop.NativeApplication;
    import tests.charas.TestAutoCommander;
    import tests.scns.battles.TestBattleScene;
    import tests.scns.battles.TestCommandSelectionPart;
    import tests.scns.battles.TestActionPart;
    import tests.animationClasses.TestShake;

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
            new TestBattleScene();
            new TestCommandSelectionPart();
            new TestActionPart();
            new TestShake();

            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
            NativeApplication.nativeApplication.exit();
        }
    }
}
