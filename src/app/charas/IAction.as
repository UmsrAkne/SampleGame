package app.charas {

    public interface IAction {
        function act():void
        function get Targets():Vector.<ITarget>;
        function set Targets(value:Vector.<ITarget>):void;
        function get TargetRange():String;
    }
}
