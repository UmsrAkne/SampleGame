package app.charas {

    /**
     * ...
     * @author
     */
    public class AbilityInteger {

        private var max:int;

        public function get Max():int {
            return max;
        }

        public function set Max(value:int):void {
            if (value < Min)
                throw ArgumentError("不正な値です。Min よりも小さな値を入力することはできません");
            max = value;
        }

        private var min:int;

        public function get Min():int {
            return min;
        }

        public function set Min(value:int):void {
            if (value > Max)
                throw ArgumentError("不正な値です。 Max よりも大きな値を入力することはできません");
            min = value;
        }

        private var currentry:int;

        /**
         * このクラスが表す現在の値を取得します。
         * @return 返却される値には Addition , Subtraction の値が考慮され、負の値が算出された場合には0を返します。
         */
        public function get Currentry():int {
            return Math.max(currentry + Addition - Subtraction, 0);
        }

        /**
         * このクラスが表す現在の値を設定します
         * @param value 実際にセットされる値は Max 以下 Min 以上です。この範囲内に収まらない値の場合、より近い値が代入されます。
         */
        public function set Currentry(value:int):void {
            if (currentry + value > Max) {
                currentry = Max;
            } else if (currentry + value < Min) {
                currentry = Min;
            } else {
                currentry = value;
            }
        }

        private var addition:int;

        public function get Addition():int {
            return addition;
        }

        public function set Addition(value:int):void {
            addition = value;
        }

        private var subtraction:int;

        public function get Subtraction():int {
            return subtraction;
        }

        public function set Subtraction(value:int):void {
            subtraction = value;
        }


        /**
         * 能力値の一つを表すクラスです。
         * @param max この能力値の Currentry が取りうる最大値を表します。
         * @param min この能力値の Currentry が取りうる最小値を表します。
         * @param currentry この能力値の現在の値を表します。引数を省略した場合、max の値が代入されます。
         */
        public function AbilityInteger(min:int, max:int, currentry:int = int.MAX_VALUE) {
            this.Max = max;
            this.Min = min;

            if (currentry == int.MAX_VALUE) {
                Currentry = Max;
            } else {
                Currentry = currentry;
            }
        }
    }

}
