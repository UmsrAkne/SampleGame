package app.charas {

    /**　現在シーンに参加している全てのキャラクターを格納するベクターをフィールドに持ち、
     * その操作を行うメソッドをもつクラスです */

    public class Party implements ITargetSource {

        private var characters:Vector.<Character> = new Vector.<Character>();

        public function Party(vec:Vector.<Character> = null) {
            if (vec != null) {
                characters = vec;
            }
        }

        public function push(chara:Character):void {
            characters.push(chara);
        }

        /**
         * 内部に保持するベクターを初期化します
         */
        public function clear():void {
            characters = new Vector.<Character>();
        }

        /**
         * 全ての味方キャラクター、または全ての敵キャラクターを取得します。
         * @param isAlly 味方キャラクターを取得する場合は true 逆の場合は false を入力します。
         * @return パーティーに含まれる全敵、全味方キャラクターを取得します。
         */
        public function getOneSide(isAlly:Boolean):Vector.<Character> {
            return characters.filter(function(c:Character, i:int, v:Vector.<Character>):Boolean {
                return c.IsFriend == isAlly;
            });
        }

        /**
         * @return 全キャラクターを取得します
         */
        public function getAll():Vector.<Character> {
            return characters;
        }

        public function getTargets():Vector.<ITarget> {
            var v:Vector.<ITarget> = new Vector.<ITarget>();
            characters.forEach(function(c:Character, i:int, vector:Vector.<Character>):void {
                v.push(ITarget(c));
            });

            return v;
        }
    }
}
