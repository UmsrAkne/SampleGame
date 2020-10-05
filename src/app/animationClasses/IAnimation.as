package app.animationClasses {
    import flash.display.DisplayObject;
    import flash.events.IEventDispatcher;

    /**
     * ...
     * @author
     */
    public interface IAnimation extends IEventDispatcher {

        /**
         * このアニメーションが動作の対象とするディスプレイオブジェクトを指定します
         * @param t
         */
        function set Target(t:DisplayObject):void;
        function get Target():DisplayObject;

        /**
         * このアニメーションを実行します。
         * このメソッドは毎フレーム実行されることを想定して作成します。
         */
        function execute():void;

        /**
         * アニメーションを強制停止します。
         * 停止する際には、Target の状態をあるべき状態に戻します。
         * 戻すべき状態はアニメーション毎に異なりますが、次のフレームに他のアニメーションを実行しても問題ない状態にします。
         */
        function stop():void;

        function reset():void;

        /**
         * 現在、このアニメーションが有効かどうかを取得します。
         * このプロパティが false を返す場合、execute() は実行しても動作しないよう実装します。
         * @return
         */
        function get IsValid():Boolean;
        function get Type():String;

        /**
         * このアニメーションが複数同時に動作可能かどうかを取得します
         * @return
         */
        function get AllowDuplicate():Boolean;

        /**
         * このアニメーションの再生時間を指定します。
         * @param value
         */
        function set Duration(value:int):void
    }
}
