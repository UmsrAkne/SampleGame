package app.charas {
    import flash.events.Event;
    import app.animationClasses.IAnimation;

    public class Reaction extends Event {

        public static const REACTION:String = "reactionEvent";
        public static const DAMAGE_EFFECT:String = "damageEffect";

        private var messageQueue:Vector.<String> = new Vector.<String>();
        private var animationQueue:Vector.<IAnimation> = new Vector.<IAnimation>();
        private var effectType:String;

        public var owner:Character;

        public function Reaction() {
            super(REACTION, false, false);
        }

        public function enqueueMessage(msg:String):void {
            messageQueue.unshift(msg);
        }

        public function dequeueMessage():String {
            return messageQueue.pop();
        }

        public function enqueueAnimation(a:IAnimation):void {
            animationQueue.unshift(a);
        }

        public function dequeueAnimation():IAnimation {
            return animationQueue.pop();
        }

        /**
         * このReactionが保持しているアニメーションの個数を取得します
         * @return
         */
        public function animationCount():int {
            return animationQueue.length;
        }

        public function get Length():int {
            return messageQueue.length;
        }

        public function set EffectType(type:String):void {
            effectType = type;
        }
    }
}
