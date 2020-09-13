package app.scns.battle {

    import flash.display.Sprite;
    import flash.events.IEventDispatcher;
    import app.scns.IScene;
    import app.charas.Party;
    import app.scns.IScenePart;
    import flash.events.Event;
    import app.charas.Character;
    import app.charas.ITargetSource;

    public class BattleScene extends Sprite implements IScene {

        private var party:Party;
        private var sceneParts:Vector.<IScenePart>;
        private var currentSceneIndex:int = 0;

        public function BattleScene(party:Party, sceneParts:Vector.<IScenePart>) {
            this.party = party;
            this.sceneParts = sceneParts;
            var p:Vector.<Character> = party.getAll();
            p.forEach(function(c:Character, i:int, v:Vector.<Character>):void {
                c.targetSource = ITargetSource(party);
            });
        }

        public function start():void {
            sceneParts[currentSceneIndex].start();
            sceneParts[currentSceneIndex].addEventListener(Event.COMPLETE, scenePartCompleted);
        }

        public function getParty():Party {
            return party;
        }

        public function dispose():void {
            party = null;
        }

        private function scenePartCompleted(event:Object):void {
            sceneParts[currentSceneIndex].removeEventListener(Event.COMPLETE, scenePartCompleted);
            currentSceneIndex++;
            if (currentSceneIndex >= sceneParts.length) {
                currentSceneIndex = 0;
            }

            sceneParts[currentSceneIndex].addEventListener(Event.COMPLETE, scenePartCompleted);
            sceneParts[currentSceneIndex].start();
        }
    }
}
