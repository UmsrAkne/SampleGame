package app.scns.battle {
    import flash.display.Sprite;
    import app.charas.Party;
    import app.scns.IScenePart;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class ActionPart extends Sprite implements IScenePart {

        private var allowInput:Boolean = false;
        private var party:Party;

        public function ActionPart(party:Party) {
            this.party = party;
        }

        public function start():void {
            addEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
        }

        public function get AllowInput():Boolean {
            return allowInput;
        }

        public function keyboardInput(e:KeyboardEvent):void {
        }

        public function mouseInput(e:MouseEvent):void {
        }

        private function enterFrameEventHandler(e:Event):void {
        }

        private function partComplete():void {
            dispatchEvent(new Event(Event.COMPLETE));
            removeEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
        }
    }
}
