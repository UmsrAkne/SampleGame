package tests.scns.battles {

    import app.scns.IScene;
    import app.scns.battle.BattleScene;
    import app.charas.Party;
    import app.scns.IScenePart;
    import tests.Assert;
    import flash.events.Event;

    public class TestBattleScene {

        private var party:Party;
        private var sceneParts:Vector.<IScenePart>;
        private var battleScene:IScene;

        public function TestBattleScene() {
            testConstructor();
            testStart();
        }

        private function testConstructor():void {
            initializeFields();
            var scene:IScene = new BattleScene(new Party(), new Vector.<IScenePart>());
        }

        private function testStart():void {
            initializeFields();

            // start() を実行した後、各 DummyPart の start() 実行回数を確認する。
            battleScene.start();
            Assert.areEqual(DummyPart(sceneParts[0]).StartedCount, 1);
            Assert.areEqual(DummyPart(sceneParts[1]).StartedCount, 0);

            sceneParts[0].dispatchEvent(new Event(Event.COMPLETE));
            Assert.areEqual(DummyPart(sceneParts[0]).StartedCount, 1);
            Assert.areEqual(DummyPart(sceneParts[1]).StartedCount, 1);

            // sceneParts の要素数は 2 なので、[1] の完了イベントが飛ぶと、次は[0]が実行される
            sceneParts[1].dispatchEvent(new Event(Event.COMPLETE));
            Assert.areEqual(DummyPart(sceneParts[0]).StartedCount, 2);
            Assert.areEqual(DummyPart(sceneParts[1]).StartedCount, 1);
        }

        private function initializeFields():void {
            party = new Party();

            sceneParts = new Vector.<IScenePart>()
            sceneParts.push(new DummyPart());
            sceneParts.push(new DummyPart());

            battleScene = new BattleScene(party, sceneParts);
        }
    }
}
