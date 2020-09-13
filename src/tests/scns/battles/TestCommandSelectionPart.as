package tests.scns.battles {


    import app.scns.battle.CommandSelectionPart;
    import app.scns.IScene;
    import app.charas.Party;
    import app.scns.IScenePart;
    import app.scns.battle.BattleScene;
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import tests.Assert;
    import flash.events.Event;

    public class TestCommandSelectionPart {

        private var scene:IScene;
        private var party:Party;
        private var sceneParts:Vector.<IScenePart>;

        public function TestCommandSelectionPart() {
            testConstructor();
        }

        private function testConstructor():void {
            initializeFields();

            // 味方キャラクターのコマンド選択が完了している場合、このパートは完了イベントを飛ばす
            var commandSelectionCompleted:Boolean = false;
            var commandSelectionPart:CommandSelectionPart = new CommandSelectionPart(scene);
            party.getAll()[0].CmdManager.Selected = true;
            party.getAll()[1].CmdManager.Selected = true;
            commandSelectionPart.addEventListener(Event.COMPLETE, function(e:Event):void {
                commandSelectionCompleted = true;
            });

            commandSelectionPart.start();
            Assert.isTrue(commandSelectionCompleted);
        }

        private function initializeFields():void {
            party = new Party();
            party.push(new CharacterBuilder().setName("ally1").setIsFriend(true).build());
            party.push(new CharacterBuilder().setName("ally2").setIsFriend(true).build());

            party.push(new CharacterBuilder().setName("enemy1").setIsFriend(false).build());
            party.push(new CharacterBuilder().setName("enemy2").setIsFriend(false).build());
            sceneParts = new Vector.<IScenePart>();
            scene = new BattleScene(party, sceneParts);
        }
    }
}
