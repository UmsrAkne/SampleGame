package tests.scns.battles {

    import app.scns.IScene;
    import app.scns.battle.BattleScene;
    import app.charas.Party;
    import app.scns.IScenePart;

    public class TestBattleScene {
        public function TestBattleScene() {
            testConstructor();
        }

        private function testConstructor():void {
            var scene:IScene = new BattleScene(new Party(), new Vector.<IScenePart>());
        }
    }
}
