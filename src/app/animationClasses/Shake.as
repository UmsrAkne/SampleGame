package app.animationClasses {
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import flash.display.DisplayObjectContainer;
    import flash.events.EventDispatcher;

    /**
     * ...
     * @author
     */
    public class Shake extends EventDispatcher implements IAnimation {

        public static const NORMAL_SHAKE:int = 0;
        public static const STRONG_SHAKE:int = 1;
        public static const WEAK_SHAKE:int = 2;

        public static const VERTICAL_SHAKE:int = 5;
        public static const HORIZONTAL_SHAKE:int = 4;

        public static const LONG_TIME_NORMAL_SHAKE:int = 10;
        public static const LONG_TIME_STRONG_SHAKE:int = 11;
        public static const LONG_TIME_WEAK_SHAKE:int = 12;

        public static const LONG_TIME_HORIZONTAL_SHAKE:int = 14;
        public static const LONG_TIME_VERTICAL_SHAKE:int = 15;

        private var animationTarget:DisplayObject;
        private var duration:int = 24;
        private var isValid:Boolean = true;
        private var frameCount:int = 0;

        private var strength:Point = new Point(1, 1);

        public function set Strength(value:Number):void {
            strength = new Point(value, value);
        }

        private var totalMoveDistance:Point = new Point();
        private var lastAddition:Point = new Point();

        public function set Target(value:DisplayObject):void {
            animationTarget = value;
        }


        private var cycle:int = 20; //	アニメーションがリピートするまでのフレーム数

        public function execute():void {
            if (!isValid) {
                return;
            }

            frameCount++;
            var distance:Number = Math.abs(getMoveDistance());

            var direction:Point = new Point(1, 1);
            direction.x = (Math.random() < 0.5) ? -1 : 1;
            direction.y = (Math.random() < 0.5) ? -1 : 1;

            var dx:int = -1 * (Math.floor(distance * strength.x * direction.x) - lastAddition.x);
            var dy:int = -1 * (Math.floor(distance * strength.y * direction.y) - lastAddition.y);

            animationTarget.x += dx;
            animationTarget.y += dy;

            totalMoveDistance.x += dx;
            totalMoveDistance.y += dy;

            lastAddition.x = Math.floor(distance * strength.x * direction.x);
            lastAddition.y = Math.floor(distance * strength.y * direction.y);

            if (frameCount >= duration) {
                stop();
            }
        }

        public function stop():void {
            frameCount = duration + 1;
            isValid = false;

            animationTarget.x -= totalMoveDistance.x;
            animationTarget.y -= totalMoveDistance.y;
        }

        public function reset():void {

        }

        public function adjust(modeInt:int):void {
            duration = 24;

            if (modeInt >= 10) {
                modeInt -= 10;
                duration = 64;
            }

            switch (modeInt) {
                case NORMAL_SHAKE:
                    strength = new Point(8, 8);
                    break;

                case STRONG_SHAKE:
                    strength = new Point(20, 20);
                    break;

                case WEAK_SHAKE:
                    strength = new Point(4, 4);
                    break;

                case VERTICAL_SHAKE:
                    strength = new Point(0, 10);
                    break;

                case HORIZONTAL_SHAKE:
                    strength = new Point(10, 0);
                    break;
            }
        }

        public function get IsValid():Boolean {
            return isValid;
        }

        public function get Type():String {
            return "Shake";
        }

        /**
         * private field cycle , frameCount の値に応じて　-1 - 0 の値数値を取得します。
         */
        private function getMoveDistance():Number {
            var radian:Number = (frameCount * (360 / cycle)) * Math.PI / 180;
            return Math.sin(radian);
        }

        public function get AllowDuplicate():Boolean {
            return false;
        }

        public function get Target():DisplayObject {
            return animationTarget;
        }

        public function set Duration(d:int):void {
            duration = d;
        }
    }

}
