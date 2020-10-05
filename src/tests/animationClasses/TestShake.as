package tests.animationClasses {


    import flash.display.Sprite;
    import app.animationClasses.Shake;
    import tests.Assert;

    public class TestShake {

        private var shake:Shake;
        private var sprite:Sprite;

        public function TestShake() {
            constructorTest();
            executeTest();
        }

        private function constructorTest():void {
            initializeField();
        }

        private function executeTest():void {
            initializeField();
            shake.Duration = 12;

            Assert.areEqual(sprite.x, 0);
            Assert.areEqual(sprite.y, 0);

            // execute() を実行する中で、sprite の座標が動いているか
            // 振動距離がランダムなので、一回でも動いていれば移動しているとみなす。
            var moved:Boolean = false;
            for (var i:int = 0; i < 12; i++) {
                shake.execute();
                if (sprite.x != 0 || sprite.y != 0) {
                    moved = true;
                }
            }

            Assert.isTrue(moved);

            // exeucte を12回(durationの範囲以上) を実行した後は、sprite の座標は 0 に戻っているはず
            Assert.areEqual(sprite.x, 0);
            Assert.areEqual(sprite.y, 0);

            // 過剰な回数 execute() を実行してもターゲットの座標が動いてないかテスト
            executeLoop(shake, 14);
            Assert.areEqual(sprite.x, 0);
            Assert.areEqual(sprite.y, 0);

        }

        private function initializeField():void {
            sprite = new Sprite();
            shake = new Shake();
            shake.Target = sprite;
        }

        private function executeLoop(shakeObject:Shake, loopCount:int):void {
            for (var i:int = 0; i < loopCount; i++) {
                shakeObject.execute();
            }
        }

    }
}
