package app.scns.battle {
    import flash.display.Sprite;
    import app.charas.Party;
    import app.scns.IScenePart;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import app.animationClasses.Animator;
    import app.charas.Character;
    import app.charas.CommandManager;

    public class ActionPart extends Sprite implements IScenePart {

        private var allowInput:Boolean = false;
        private var party:Party;
        private var animator:Animator = new Animator();

        public function ActionPart(party:Party) {
            this.party = party;
        }

        public function start():void {
            if (!hasEventListener(Event.ENTER_FRAME)) {
                addEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
            }

            var cmdSelectedCharacter:Character;
            var cmdSelectedCharacterList:Vector.<Character> = party.getAll().filter(function(c:Character, i:int, v:Vector.<Character>):Boolean {
                return (c.CmdManager.Selected && c.Action.CanAct);
            });

            if (cmdSelectedCharacterList.length > 0) {
                cmdSelectedCharacter = cmdSelectedCharacterList[0];
                cmdSelectedCharacter.Action.act();
            }
        }

        public function get AllowInput():Boolean {
            return allowInput;
        }

        public function keyboardInput(e:KeyboardEvent):void {
        }

        public function mouseInput(e:MouseEvent):void {
        }

        private function enterFrameEventHandler(e:Event):void {
            animator.executes();

            if (!animator.canAnimation()) {
                partComplete();
            }
        }

        private function partComplete():void {
            dispatchEvent(new Event(Event.COMPLETE));
            removeEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
        }
    }
}
