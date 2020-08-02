package app.charas {

    public class Range {
        public static const ALL:String = "all";
        public static const RELATIVE_ALL_ENEMY:String = "relativeAllEnemy";
        public static const RELATIVE_ALL_FRIEDN:String = "relativeAllFriend";
        public static const RELATIVE_SINGLE_ENEMY:String = "relativeSingleEnemy";
        public static const RELATIVE_SINGLE_FRIEND:String = "relativeSingleFriend";

        /**
         * 引数に入力したキャラクターを基準とした場合の絶対範囲を取得します。
         * @param character 基準となるキャラクターです。主にこのメソッドを呼び出すキャラクターをthisで入力します。
         * @param range このクラスに定義されている定数のうち、ALL 以外のいずれかを入力します。
         * @return 入力した相対範囲に該当する側を取得します。
         */
        public static function getAbsoluteSide(character:ITarget, range:String):Boolean {
            if (character.IsFriend) {
                return (range == RELATIVE_ALL_FRIEDN || range == RELATIVE_SINGLE_FRIEND);
            } else {
                return (range == RELATIVE_ALL_ENEMY || range == RELATIVE_SINGLE_ENEMY);
            }
        }
    }
}
