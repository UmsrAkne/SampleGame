package app.scns.battle {

    import flash.display.Sprite;
    import app.scns.IScenePart;
    import app.scns.IScene;
    import app.charas.Character;
    import app.charas.Party;
    import flash.events.Event;

    public class CommandSelectionPart extends Sprite implements IScenePart {


        private var ownerScene:IScene

        /**
         * @param ownerScene このパートを保持しているシーンを入力します。
         * このパラメーターは、パーティーメンバーを取得する際などに参照されます。
         */
        public function CommandSelectionPart(ownerScene:IScene) {
            this.ownerScene = ownerScene;
        }

        public function start():void {
            var character:Character = getCurrentCharacter();
            if (character == null) {
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
    }
}
