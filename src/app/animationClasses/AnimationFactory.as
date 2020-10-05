package app.animationClasses {

    public class AnimationFactory {

        public function AnimationFactory() {

        }

        /**
         * 引数によって指定された特定のアニメーションインスタンスを生成して返却します。
         * @param animationString app.animationClasses.AnimationType に定義された文字列を入力します。
         *        引数として上記の値以外を入れた場合は、ArgumentError を投げます。
         */
        public function create(animationString:String):IAnimation {
            var anime:IAnimation;
            switch (animationString) {
                case AnimationType.NORMAL_ATTACK_ANIME:
                    anime = new Shake();
                    break;

                case AnimationType.RECIEVE_DAMAGE_ANIME:
                    anime = new Shake();
                    break;

                default:
                    throw new ArgumentError("引数に不正な値が指定されました。このメソッドの引数には AnimationType に宣言された文字列を指定してください")
                    break;
            }

            return anime;
        }
    }
}
