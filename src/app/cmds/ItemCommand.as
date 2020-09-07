package app.cmds {

    import app.charas.Character;
    import app.charas.Item;

    /**
     * ...
     * @author
     */
    public class ItemCommand implements IBattleCommand {

        private var owner:Character;

        public function ItemCommand(owner:Character) {
            this.owner = owner;
        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "アイテム";
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            // アイテムの一覧を返す
            var battleCommands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            owner.Items.forEach(function(item:Item, i:int, iv:Vector.<Item>):void {
                battleCommands.push(Item(item));
            });
            return battleCommands;
        }

        public function cancel():void {
        }

        public function get IsFinalCommand():Boolean {
            return false;
        }
    }

}
