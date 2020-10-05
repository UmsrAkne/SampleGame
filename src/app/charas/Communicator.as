package app.charas {

    import flash.events.EventDispatcher;
    import app.animationClasses.AnimationType;
    import app.animationClasses.AnimationFactory;
    import app.animationClasses.IAnimation;

    public class Communicator extends EventDispatcher {

        private var owner:Character;
        private var animationFactory:AnimationFactory = new AnimationFactory();

        public function Communicator(owner:Character) {
            this.owner = owner;
        }

        /**
         * 自分の行動に対するリアクション（メッセージ）を送出します。
         * @param reaction
         */
        public function reaction(reaction:Reaction):void {
            reaction.owner = this.owner;
            reaction.enqueueAnimation(animationFactory.create(AnimationType.NORMAL_ATTACK_ANIME));
            dispatchEvent(reaction);
        }

        /**
         * 他のキャラクターが起こしたアクションを受け取るためのメソッド
         * @param action
         */
        public function recieve(action:IAction):void {
            owner.Abilities.HP.Currentry -= 3; // デバッグ用コード とりあえずHPを減算する。マジックナンバーが書かれているが値に意味はない。０より大きい値ならOK
            var reaction:Reaction = new Reaction();
            reaction.owner = this.owner;
            reaction.effectType = action.EffectType;

            var msg:String;
            var anime:IAnimation;
            switch (action.EffectType) {
                case EffectType.DAMAGE:
                    msg = owner.DisplayName + "はダメージを受けた";
                    anime = animationFactory.create(AnimationType.RECIEVE_DAMAGE_ANIME);
                    break;
                case EffectType.RECOVER:
                    msg = owner.DisplayName + "は回復した";

                    // 本当は回復アニメが入る
                    anime = animationFactory.create(AnimationType.RECIEVE_DAMAGE_ANIME);
                    break;

                default:
                    break;
            }

            reaction.enqueueMessage(msg);
            reaction.enqueueAnimation(anime);
            dispatchEvent(reaction);
        }
    }
}
