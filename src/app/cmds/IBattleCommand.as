package app.cmds {

    /**
     * ...
     * @author
     */
    public interface IBattleCommand {
        function get DisplayName():String;
        function executeAsBattleCommand():void;
    }

}
