package app.scns {
    import flash.events.IEventDispatcher;

    /** シーン内の一部分を担うクラスに実装されるインターフェースで、IScene 実装クラスによって保持されます。
     * このインターフェースを実装するクラスが処理を終了する際、flash.events.Event クラスの COMPLETE イベントを送出します。
     * IScene 実装クラスは COMPLETE イベントを受け取ったら、次のパートに移行してください。
     */
    public interface IScenePart extends IEventDispatcher {
        function start():void;
    }
}
