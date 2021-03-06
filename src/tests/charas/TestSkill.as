package tests.charas {

    import app.charas.Skill;
    import app.charas.SkillBuilder;
    import app.charas.Character;
    import tests.Assert;
    import app.charas.Range;
    import app.charas.EffectType;

    public class TestSkill {
        public function TestSkill() {
            test();
        }

        private function test():void {
            var skillBuilder:SkillBuilder = new SkillBuilder();
            skillBuilder.setName("testSkill");
            skillBuilder.setCost(1);
            skillBuilder.setTargetRange(Range.RELATIVE_SINGLE_ENEMY);
            skillBuilder.setEffectType(EffectType.DAMAGE);

            var skill:Skill = skillBuilder.build();
            Assert.areEqual(skill.DisplayName, "testSkill");
            Assert.areEqual(skill.Cost, 1);
            Assert.areEqual(skill.EffectType, EffectType.DAMAGE);
        }
    }
}
