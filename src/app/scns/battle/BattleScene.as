package app.scns.battle {

    import flash.display.Sprite;
    import flash.events.IEventDispatcher;
    import app.scns.IScene;
    import app.charas.Party;
    import app.scns.IScenePart;

    public class BattleScene extends Sprite implements IScene {

        private var party:Party;
        private var sceneParts:Vector.<IScenePart>;

        public function BattleScene(party:Party, sceneParts:Vector.<IScenePart>) {
            this.party = party;
            this.sceneParts = sceneParts;
        }

        public function start():void {
        }

        public function getParty():Party {
            return party;
        }

        public function dispose():void {
            party = null;
        }
    }
}
