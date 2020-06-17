package app.charas {
	/**
	 * ...
	 * @author 
	 */
	public class CharacterBuilder {

		private var characterName:String;		
		private var ability:Ability;

		public function CharacterBuilder() {
			
		}

		public function buid():Character{
			var character:Character = new Character(characterName, ability);
			return character;
		}

		public function setName(name:String):CharacterBuilder{
			this.characterName = name;
			return this;
		}

		public function setAbility(ability:Ability):CharacterBuilder{
			this.ability = ability;
			return this;
		}
		
	}

}