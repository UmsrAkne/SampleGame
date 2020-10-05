package app.charas {

    public class ItemBuilder {

        private var itemName:String = "";
        private var owner:Character;
        private var targetRange:String;
        private var effectType:String;

        public function ItemBuilder() {
        }

        public function setName(value:String):ItemBuilder {
            itemName = value;
            return this;
        }

        public function setOwner(value:Character):ItemBuilder {
            owner = value;
            return this;
        }

        public function setTargetRange(range:String):ItemBuilder {
            targetRange = range;
            return this;
        }

        public function setEffectType(effectType:String):ItemBuilder {
            this.effectType = effectType;
            return this;
        }

        /**
         * 現在のフィールドの値を使用してアイテムオブジェクトを生成します。
         * @param itemNumber 番号を指定した場合、owner 以外に関しては現在のビルダーのフィールドに依存しない値でアイテムを生成します。
         * owner だけは必要になるので、値を入力してからこのメソッドを呼び出してください。
         * 生成したアイテムに初期値のフィールドがあった場合はエラーを投げます。
         * @return
         */
        public function build(itemNumber:int = -1):Item {
            var resultItem:Item;
            if (itemNumber < 0) {
                resultItem = new Item(owner, itemName, targetRange, effectType);
            } else {
                if (itemNumber == 0) {
                    resultItem = new Item(owner, "testItem0", Range.RELATIVE_SINGLE_ENEMY, EffectType.DAMAGE);
                }

                if (itemNumber == 1) {
                    resultItem = new Item(owner, "testItem1", Range.RELATIVE_SINGLE_FRIEND, EffectType.DAMAGE);
                }

                if (itemNumber == 2) {
                    resultItem = new Item(owner, "testItem2", Range.RELATIVE_ALL_ENEMY, EffectType.DAMAGE);
                }

                if (itemNumber == 3) {
                    resultItem = new Item(owner, "testItem3", Range.RELATIVE_ALL_FRIEDN, EffectType.DAMAGE);
                }
            }

            return resultItem;
        }
    }
}
