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
    import app.animationClasses.AnimationType;
    import app.animationClasses.IAnimation;
    import app.charas.ITarget;
    import app.charas.Reaction;

    public class ActionPart extends Sprite implements IScenePart {

        private var allowInput:Boolean = false;
        private var party:Party;
        private var animator:Animator = new Animator();
        private var currentCharacters:Vector.<Character> = new Vector.<Character>();
        private var currentCharacter:Character;
        private var reactions:Vector.<Reaction> = new Vector.<Reaction>();

        public function ActionPart(party:Party) {
            this.party = party;
        }

        public function start():void {
            if (!hasEventListener(Event.ENTER_FRAME)) {
                addEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
            }

            party.getAll().forEach(function(c:Character, i:int, v:Vector.<Character>):void {
                c.ActionCommunicator.addEventListener(Reaction.REACTION, stackReaction);
            });

            // コマンド選択済みのキャラクターを一人選択する。
            var cmdSelectedCharacter:Character;
            var cmdSelectedCharacterList:Vector.<Character> = party.getAll().filter(function(c:Character, i:int, v:Vector.<Character>):Boolean {
                return (c.CmdManager.Selected && c.Action.CanAct);
            });

            if (cmdSelectedCharacterList.length > 0) {
                cmdSelectedCharacter = cmdSelectedCharacterList[0];
                cmdSelectedCharacter.Action.act();
                // act()実行後の段階でリアクションは全て積み上がっている

                currentCharacter = reactions[0].owner;
                var firstAnimation:IAnimation = reactions[0].dequeueAnimation();
                firstAnimation.addEventListener(Event.COMPLETE, next);
                currentCharacter.AnimationContainer.add(firstAnimation);
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

            if (currentCharacter) {
                currentCharacter.AnimationContainer.executes();
            }

            if (!animator.canAnimation() && reactions.length == 0) {
                partComplete();
            }

        }

        private function partComplete():void {
            dispatchEvent(new Event(Event.COMPLETE));
            removeEventListener(Event.ENTER_FRAME, enterFrameEventHandler);
            party.getAll().forEach(function(c:Character, i:int, v:Vector.<Character>):void {
                c.ActionCommunicator.removeEventListener(Reaction.REACTION, stackReaction);
            });
        }

        private function next(e:Event):void {
            var a:IAnimation = IAnimation(e.target);
            a.removeEventListener(Event.COMPLETE, next);
            var nextAnime:IAnimation;

            if (reactions.length > 0) {

                if (reactions[0].animationCount() == 0) {
                    reactions.shift();
                    if (reactions.length == 0) {
                        return
                    }
                }

                currentCharacter = reactions[0].owner;
                nextAnime = reactions[0].dequeueAnimation();
                nextAnime.addEventListener(Event.COMPLETE, next);
                currentCharacter.AnimationContainer.add(nextAnime);
            }
        }

        private function stackReaction(reaction:Reaction):void {
            reactions.push(reaction);
        }
    }
}
