package app.scns {

    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import app.charas.Party;

    public interface IScene extends IEventDispatcher {

        /**
         * シーン開始時に呼び出すメソッドです。
         */
        function start():void;

        function getParty():Party;

        /**
         * シーン内で使用しているリソースを直ちに破棄します。
         */
        function dispose():void;
    }
}
