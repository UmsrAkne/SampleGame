package app.charas {

    import flash.events.EventDispatcher;
    import app.animationClasses.AnimationType;
    import app.animationClasses.AnimationFactory;

    public class Communicator extends EventDispatcher {

        private var owner:Character;

        public function Communicator(owner:Character) {
            this.owner = owner;
        }

        /**
         * 自分の行動に対するリアクション（メッセージ）を送出します。
         * @param reaction
         */
        public function reaction(reaction:Reaction):void {
            reaction.owner = this.owner;
            reaction.enqueueAnimation(new AnimationFactory().create(AnimationType.NORMAL_ATTACK_ANIME));
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
            reaction.EffectType = Reaction.DAMAGE_EFFECT;
            reaction.enqueueMessage(owner.DisplayName + "はダメージを受けた");
            reaction.enqueueAnimation(new AnimationFactory().create(AnimationType.RECIEVE_DAMAGE_ANIME));
            dispatchEvent(reaction);
        }
    }
}
