package app.cmds {

    import app.charas.Character;
    import app.charas.ITarget;

    /**
     * ...
     * @author
     */
    public class AttackCommand implements IBattleCommand {

        private var owner:Character;

        public function AttackCommand(owner:Character) {
            this.owner = owner;
        }


        /* INTERFACE app.cmds.IBattleCommand */

        public function get DisplayName():String {
            return "攻撃";
        }

        public function executeAsBattleCommand():Vector.<IBattleCommand> {
            var commands:Vector.<IBattleCommand> = new Vector.<IBattleCommand>();
            owner.otherCharacters.forEach(function(item:ITarget, i:int, v:*):void {
                if (!item.IsFriend) {
                    commands.push(IBattleCommand(item));
                }
            });

            return commands;
        }

        public function cancel():void {
        }


        public function get IsFinalCommand():Boolean {
            return false;
        }
    }
}
