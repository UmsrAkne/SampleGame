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
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    public class TestCommandSelectionPart {

        private var scene:IScene;
        private var party:Party;
        private var sceneParts:Vector.<IScenePart>;

        public function TestCommandSelectionPart() {
            testConstructor();
            testKeyboardInput();
        }

        private function testConstructor():void {
            initializeFields();

            // 味方キャラクターのコマンド選択が完了している場合、このパートは完了イベントを飛ばす
            var commandSelectionCompleted:Boolean = false;
            var commandSelectionPart:CommandSelectionPart = new CommandSelectionPart(party);
            party.getAll()[0].CmdManager.Selected = true;
            party.getAll()[1].CmdManager.Selected = true;
            commandSelectionPart.addEventListener(Event.COMPLETE, function(e:Event):void {
                commandSelectionCompleted = true;
            });

            commandSelectionPart.start();
            Assert.isTrue(commandSelectionCompleted);
        }

        private function testKeyboardInput():void {
            initializeFields();

            var sp:IScenePart = sceneParts[0];
            var c1:Character = party.getAll()[0];
            var c2:Character = party.getAll()[1];

            var enterKeyEvent:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, true, false, 0, Keyboard.ENTER);

            var commandSelected:Boolean = false;
            sp.addEventListener(Event.COMPLETE, function(e:Event):void {
                commandSelected = true;
            });

            // 入力している enterKeyEvent が送出されることによって、内部でコマンドが決定される。
            // それを２回（攻撃コマンド --> 対象選択）でコマンド選択が終了していることが期待される。
            // allowInput の判定で入力を遮断するので、余計な回数、キーボードを連打しても問題なし。
            sp.start();
            Assert.isFalse(c1.CmdManager.Selected);
            sp.keyboardInput(enterKeyEvent);
            sp.keyboardInput(enterKeyEvent);
            sp.keyboardInput(enterKeyEvent);
            Assert.isTrue(c1.CmdManager.Selected);
            Assert.isTrue(commandSelected);

            commandSelected = false;

            sp.start();
            Assert.isFalse(c2.CmdManager.Selected);
            sp.keyboardInput(enterKeyEvent);
            sp.keyboardInput(enterKeyEvent);
            Assert.isTrue(c2.CmdManager.Selected);
            Assert.isTrue(commandSelected);

            // 最後は start() を呼んだ時点でコマンド選択可能なキャラクターがいないため、
            // 即座に完了イベントが飛んでいるはず。
            commandSelected = false;
            sp.start();
            Assert.isTrue(commandSelected);
        }

        private function initializeFields():void {
            party = new Party();
            party.push(new CharacterBuilder().setName("ally1").setIsFriend(true).build());
            party.push(new CharacterBuilder().setName("ally2").setIsFriend(true).build());

            party.push(new CharacterBuilder().setName("enemy1").setIsFriend(false).build());
            party.push(new CharacterBuilder().setName("enemy2").setIsFriend(false).build());

            sceneParts = new Vector.<IScenePart>();
            sceneParts.push(new CommandSelectionPart(party));
            scene = new BattleScene(party, sceneParts);
        }

    }
}
