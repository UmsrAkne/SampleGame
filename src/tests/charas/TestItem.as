package tests.charas {

    import app.charas.Item;
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import tests.Assert;

    public class TestItem {
        public function TestItem() {
            test();
        }

        private function test():void {
            var owner:Character = new CharacterBuilder().build();
            var item:Item = new Item(owner, "testItemName", "");
            Assert.areEqual(item.DisplayName, "testItemName");
        }
    }
}
