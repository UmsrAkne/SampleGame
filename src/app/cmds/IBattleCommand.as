package app.cmds {

    /**
     * ...
     * @author
     */
    public interface IBattleCommand {
        function get DisplayName():String;
        function executeAsBattleCommand():void;
        function cancel():void;
        function get IsFinalCommand():Boolean;
    }

}
