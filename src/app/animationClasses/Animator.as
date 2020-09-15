package app.animationClasses {
    import flash.display.DisplayObject;

    /**
     * ...
     * @author
     */
    public class Animator {

        private var animations:Vector.<IAnimation> = new Vector.<IAnimation>;

        private var target:DisplayObject;

        public function get Target():DisplayObject {
            return this.target;
        }

        public function set Target(t:DisplayObject):void {
            for each (var a:IAnimation in animations) {
                a.Target = t;
            }
            target = t;
        }

        public function Animator() {

        }

        /**
         * このオブジェクトに保管されている全てのアニメーションのexecuteメソッドを一度ずつ実行します。
         */
        public function executes():void {
            for each (var a:IAnimation in animations) {
                a.execute();
            }

            removeInvalidAnimation();
        }

        public function add(a:IAnimation):void {
            for each (var anime:IAnimation in animations) {
                if (anime.Type == a.Type && !anime.AllowDuplicate) {
                    anime.stop();
                }
            }
            a.Target = this.target;
            animations.push(a);
        }

        private function removeInvalidAnimation():void {
            var needRemove:Boolean = false;
            for (var i:int = 0; i < animations.length; i++) {
                if (!animations[i].IsValid) {
                    needRemove = true;
                    break;
                }
            }

            if (!needRemove)
                return;

            var newVector:Vector.<IAnimation> = new Vector.<IAnimation>;
            for each (var a:IAnimation in animations) {
                if (a.IsValid)
                    newVector.push(a);
            }

            animations = newVector;
        }

        public function canAnimation():Boolean {
            return (animations.length > 0 && target);
        }
    }

}
