package app.charas {

    /**
     * ...
     * @author
     */
    public class Ability {

        private var level:AbilityInteger;

        public function get Level():AbilityInteger {
            return level;
        }

        private var hp:AbilityInteger;

        public function get HP():AbilityInteger {
            return hp;
        }

        private var sp:AbilityInteger;

        public function get SP():AbilityInteger {
            return sp;
        }

        private var atk:AbilityInteger;

        public function get Atk():AbilityInteger {
            return atk;
        }

        private var gud:AbilityInteger;

        public function get Gud():AbilityInteger {
            return gud;
        }

        private var spd:AbilityInteger;

        public function get Spd():AbilityInteger {
            return spd;
        }

        public function Ability(level:AbilityInteger, hp:AbilityInteger, sp:AbilityInteger, atk:AbilityInteger, gud:AbilityInteger, spd:AbilityInteger) {
            this.level = level;
            this.hp = hp;
            this.sp = sp;
            this.atk = atk;
            this.gud = gud;
            this.spd = spd;
        }

    }

}
