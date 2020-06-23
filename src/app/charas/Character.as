package app.charas {

    /**
     * ...
     * @author
     */
    public class Character {

        private var name:String;

        public function get Name():String {
            return name;
        }

        private var abilities:Ability;

        public function get Abilities():Ability {
            return abilities;
        }

        private var action:IAction;

        public function get Action():IAction {
            return action;
        }

        public function set Action(value:IAction):void {
            action = value;
        }

        public function Character(name:String, ability:Ability) {
            this.name = name;
            this.abilities = ability;
        }

    }

}
