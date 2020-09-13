package tests.scns.battles {

    import flash.events.EventDispatcher;
    import app.scns.IScenePart;

    public class DummyPart extends EventDispatcher implements IScenePart {

        private var startedCount:int = 0
        private var lastInputValue:uint = 0x0;

        /**
         * startメソッドを実行した回数を表します
         * @return
         */
        public function get StartedCount():int {
            return startedCount;
        }

        public function DummyPart() {

        }

        public function start():void {
            startedCount++;
        }

        public function get AllowInput():Boolean {
            return true;
        }

        public function input(value:uint):void {
        }
    }
}
