package app.charas {

    public interface IAction {
        function act():void
        function get Targets():Vector.<ITarget>;
        function set Targets(value:Vector.<ITarget>):void;
        function get TargetRange():String;

        /**
         * このメソッドが実行された時点で、この行動を実行可能かを取得します。
         * @return
         */
        function get CanAct():Boolean;
    }
}
