package tests.charas {

    import app.charas.Item;
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import tests.Assert;
    import app.charas.ItemBuilder;
    import app.charas.Range;
    import app.charas.EffectType;

    public class TestItem {
        public function TestItem() {
            test();
        }

        private function test():void {
            var owner:Character = new CharacterBuilder().build();
            var item:Item = new Item(owner, "testItemName", "", EffectType.DAMAGE);
            Assert.areEqual(item.DisplayName, "testItemName");

            var itemBuilder:ItemBuilder = new ItemBuilder().setOwner(owner);
            var testItem:Item = itemBuilder.build(0);
            Assert.areEqual(testItem.DisplayName, "testItem0");
            Assert.areEqual(testItem.TargetRange, Range.RELATIVE_SINGLE_ENEMY);
            Assert.areEqual(testItem.EffectType, EffectType.DAMAGE);
        }
    }
}
