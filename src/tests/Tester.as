package tests {

    import tests.charas.*;

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

            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
        }
    }
}
