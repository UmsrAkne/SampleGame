package app.charas {
	/**
	 * ...
	 * @author 
	 */
	public class CharacterBuilder {

		private var characterName:String;		
		private var level:int;
		private var hp:int;
		private var sp:int;
		private var atk:int;
		private var gud:int;
		private var spd:int;

		public function CharacterBuilder() {
			
		}

		public function buid():Character{
			var mlevel:AbilityInteger = new AbilityInteger(0,99,level);
			var mhp:AbilityInteger = new AbilityInteger(0,hp);
			var msp:AbilityInteger = new AbilityInteger(0,sp);
			var matk:AbilityInteger = new AbilityInteger(0,atk);
			var mgud:AbilityInteger = new AbilityInteger(0,gud);
			var mspd:AbilityInteger = new AbilityInteger(0,spd);
			var ability:Ability = new Ability(mlevel,mhp,msp,matk,mgud,mspd);

			var character:Character = new Character(characterName, ability);
			return character;
		}

		public function setName(name:String):CharacterBuilder{
			this.characterName = name;
			return this;
		}

		public function setLevel(value:int):CharacterBuilder{
			this.level = value;
            return this;
		}
		
		public function setHp(value:int):CharacterBuilder{
			this.hp = value;
            return this;
		}
		
		public function setSp(value:int):CharacterBuilder{
			this.sp = value;
            return this;
		}
		
		public function setAtk(value:int):CharacterBuilder{
			this.atk = value;
            return this;
		}
		
		public function setGud(value:int):CharacterBuilder{
			this.gud = value;
            return this;
		}

		public function setSpd(value:int):CharacterBuilder{
			this.spd = value;
            return this;
		}

	}

}