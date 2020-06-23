package app.charas {

    public class SkillBuilder {

        private var skillName:String = "";
        private var cost:int = 0;
        private var owner:Character;
        private var targetRange:String = Range.RELATIVE_SINGLE_ENEMY;

        public function SkillBuilder() {

        }

        public function build():Skill {
            var skill:Skill = new Skill(owner, skillName, cost, targetRange);
            return skill;
        }

        public function setName(skillName:String):SkillBuilder {
            this.skillName = skillName;
            return this;
        }

        public function setCost(cost:int):SkillBuilder {
            this.cost = cost;
            return this;
        }

        public function setOwner(owner:Character):SkillBuilder {
            this.owner = owner;
            return this;
        }

        public function setTargetRange(targetRange:String):SkillBuilder {
            this.targetRange = targetRange;
            return this;
        }
    }
}
