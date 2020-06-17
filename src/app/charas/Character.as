package app.charas {
	/**
	 * ...
	 * @author 
	 */
	public class Character {

		private var name:String;
		public function get Name():String { return name; }

		private var abilities:Ability;
		public function get Abilities():Ability { return abilities; }
		
		public function Character(name:String, ability:Ability) {
			this.name = name;
			this.abilities = ability;
		}
		
	}

}