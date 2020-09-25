package tests.scns.battles {

    import app.scns.battle.ActionPart;
    import app.charas.Party;
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import flash.events.Event;
    import tests.Assert;

    public class TestActionPart {

        private var actionPart:ActionPart;
        private var party:Party;

        private var allyA:Character;
        private var allyB:Character;

        private var enemyA:Character;
        private var enemyB:Character;
        private var enemyC:Character;

        public function TestActionPart() {
            constructorTest();
            startTest();
        }

        private function constructorTest():void {
            initializeFields();
            actionPart.start();
        }

        private function startTest():void {
            initializeFields();
            var completed:Boolean = false;
            actionPart.addEventListener(Event.COMPLETE, function(e:Event):void {
                completed = true;
            });

            actionPart.start();
            actionPart.dispatchEvent(new Event(Event.ENTER_FRAME));

            Assert.isTrue(completed);
        }

        private function initializeFields():void {
            var builder:CharacterBuilder = new CharacterBuilder();

            party = new Party();
            party.push(builder.setName("allyA").setIsFriend(true).build());
            party.push(builder.setName("allyB").setIsFriend(true).build());
            party.push(builder.setName("enemyA").setIsFriend(false).build());
            party.push(builder.setName("enemyB").setIsFriend(false).build());
            party.push(builder.setName("enemyC").setIsFriend(false).build());

            actionPart = new ActionPart(party);

            allyA = party.getAll()[0];
            allyB = party.getAll()[1];
            enemyA = party.getAll()[2];
            enemyA = party.getAll()[3];
            enemyA = party.getAll()[4];

        }
    }
}
