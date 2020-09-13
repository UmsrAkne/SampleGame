package app.scns.battle {

    import flash.display.Sprite;
    import app.scns.IScenePart;
    import app.scns.IScene;
    import app.charas.Character;
    import app.charas.Party;
    import flash.events.Event;
    import app.cmds.IBattleCommand;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.geom.Point;
    import flash.events.MouseEvent;

    public class CommandSelectionPart extends Sprite implements IScenePart {


        private var party:Party;
        private var allowInput:Boolean = false;
        private var currentCommands:Vector.<IBattleCommand>;
        private var cursorIndex:Point = new Point(0, 0);

        /**
         * @param ownerScene このパートを保持しているシーンを入力します。
         * このパラメーターは、パーティーメンバーを取得する際などに参照されます。
         */
        public function CommandSelectionPart(party:Party) {
            this.party = party;
        }

        public function start():void {
            var character:Character = getCurrentCharacter();
            if (character == null) {
                complete();
                return;
            }

            currentCommands = character.CmdManager.TopCommands;
            allowInput = true;
            addEventListener(KeyboardEvent.KEY_DOWN, keyboardInput);
        }

        /**
         * @return コマンド選択未完了のキャラクターのうち、パーティー内でインデックスが最小のキャラクターを取得します。
         */
        private function getCurrentCharacter():Character {
            var chara:Character;
            var csv:Vector.<Character> = party.getOneSide(true);
            for each (var c:Character in csv) {
                if (!c.CmdManager.Selected) {
                    chara = c;
                    break;
                }
            }

            return chara;
        }

        public function get AllowInput():Boolean {
            return allowInput;
        }

        private function selectCommand(value:uint):void {
            if (!AllowInput) {
                return;
            }

            var character:Character = getCurrentCharacter();
            character.executeBattleCommand(value);
            if (character.CmdManager.Selected) {
                complete();
                return;
            }

            currentCommands = character.CmdManager.TopCommands;
        }

        /**
         * シーンの処理が終了した際に実行します
         */
        private function complete():void {
            dispatchEvent(new Event(Event.COMPLETE));
            allowInput = false;
            removeEventListener(KeyboardEvent.KEY_DOWN, keyboardInput);
        }

        public function keyboardInput(e:KeyboardEvent):void {
            if (!allowInput) {
                return;
            }

            if (e.keyCode == Keyboard.ENTER) {
                selectCommand(cursorIndex.y);
            }

            if (e.keyCode == Keyboard.DOWN) {
                cursorIndex.y++;
            }

            if (e.keyCode == Keyboard.UP) {
                cursorIndex.y--;
            }
        }

        public function mouseInput(e:MouseEvent):void {
        }
    }
}
