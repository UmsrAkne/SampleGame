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


        private var ownerScene:IScene
        private var allowInput:Boolean = false;

        /**
         * @param ownerScene このパートを保持しているシーンを入力します。
         * このパラメーターは、パーティーメンバーを取得する際などに参照されます。
         */
        public function CommandSelectionPart(ownerScene:IScene) {
            this.ownerScene = ownerScene;
        }

        public function start():void {
            if (getCurrentCharacter() == null) {
                dispatchEvent(new Event(Event.COMPLETE));
                return;
            }
        }

        /**
         * @return コマンド選択未完了のキャラクターのうち、パーティー内でインデックスが最小のキャラクターを取得します。
         */
        private function getCurrentCharacter():Character {
            var chara:Character;
            var csv:Vector.<Character> = ownerScene.getParty().getOneSide(true);
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

        public function input(value:uint):void {
            var commandIndex:int = commandIndexConverter(value);
            var character:Character = getCurrentCharacter();
            character.executeBattleCommand(commandIndex);
            if (character.CmdManager.Selected) {
                dispatchEvent(new Event(Event.COMPLETE));
            }
        }

        /**
         * input によって渡ってきた uint を変換します
         */
        private function complete():void {
            dispatchEvent(new Event(Event.COMPLETE));
            allowInput = false;
            removeEventListener(KeyboardEvent.KEY_DOWN, keyboardInput);
        }

        public function keyboardInput(e:KeyboardEvent):void {
            if (e.keyCode == Keyboard.ENTER) {
                input(cursorIndex.y);
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
