package app.charas {

    import app.cmds.IBattleCommand;

    public class Item implements IBattleCommand, IAction {

        private var displayName:String;
        private var owner:Character;
        private var targets:Vector.<ITarget> = new Vector.<ITarget>();
        private var targetRange:String;

        public function Item(owner:Character, itemName:String, targetRange:String) {
            this.owner = owner;
            displayName = itemName;
            this.targetRange = targetRange;
        }

        public function act():void {
        }

        public function get Targets():Vector.<ITarget> {
            return targets
        }

        public function set Targets(value:Vector.<ITarget>):void {
            targets = value;
        }

        public function get TargetRange():String {
            return targetRange;
        }

        public function get DisplayName():String {
            return displayName;
        }

        public function executeAsBattleCommand():void {
        }

        public function cancel():void {
        }
    }
}
