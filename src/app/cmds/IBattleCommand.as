package app.cmds {

    /**
     * ...
     * @author
     */
    public interface IBattleCommand {
        function get DisplayName():String;
        function executeAsBattleCommand():Vector.<IBattleCommand>;
        function cancel():void;
        function get IsFinalCommand():Boolean;
    }

}
