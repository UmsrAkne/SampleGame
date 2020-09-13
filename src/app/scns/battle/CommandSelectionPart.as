package app.scns.battle {

    import flash.display.Sprite;
    import app.scns.IScenePart;
    import app.scns.IScene;

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
        }
    }
}
