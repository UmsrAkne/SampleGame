package tests.charas {
    import app.charas.AbilityInteger;
    import tests.Assert;

    /**
     * ...
     * @author
     */
    public class TestAbilityInteger {

        public function TestAbilityInteger() {
            test();
        }

        private function test():void {
            var hp:AbilityInteger = new AbilityInteger(0, 10);
            Assert.areEqual(hp.Currentry, 10);
            Assert.areEqual(hp.Min, 0);
            Assert.areEqual(hp.Max, 10);

            hp.Addition = 5;
            hp.Subtraction = 2;
            Assert.areEqual(hp.Currentry, 13);

            //	第3引数のテスト
            hp = new AbilityInteger(0, 10, 5);
            Assert.areEqual(hp.Currentry, 5);

            //	set Currentry のテスト
            hp.Currentry += 30;
            Assert.areEqual(hp.Currentry, 10);

            hp.Currentry -= 40;
            Assert.areEqual(hp.Currentry, 0);
        }

    }

}
