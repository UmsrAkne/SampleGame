package tests.charas {
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Ability;
    import tests.Assert;
    import app.charas.ITarget;
    import app.charas.Range;
    import app.charas.Party;
    import app.charas.ITargetSource;
    import app.charas.ItemBuilder;

    /**
     * ...
     * @author
     */
    public class TestCharacter {

        public function TestCharacter() {
            creationTest();
            executeBattleCommandTest();
            executeSkillCommandTest();
            executeItemCommandTest();
            resetTest();
        }

        private function creationTest():void {
            var characterBuilder:CharacterBuilder = new CharacterBuilder()
            characterBuilder.setName("testCharacter");
            characterBuilder.setLevel(1);
            characterBuilder.setHp(10);
            characterBuilder.setSp(5);
            characterBuilder.setAtk(3);
            characterBuilder.setGud(3);
            characterBuilder.setSp(2);
            characterBuilder.setIsFriend(true);

            var testCharacter:Character = characterBuilder.build();
            Assert.areEqual(testCharacter.Name, "testCharacter");
            Assert.areEqual(testCharacter.IsFriend, true);

            characterBuilder.setName("testCharacter2");
            var testCharacter2:Character = characterBuilder.build();

            characterBuilder.setName("testCharacter3");
            var testCharacter3:Character = characterBuilder.build();

            characterBuilder.setIsFriend(false);
            characterBuilder.setName("enemy0");
            var enemy0:Character = characterBuilder.build();

            characterBuilder.setName("enemy1");
            var enemy1:Character = characterBuilder.build();

            var targets:Vector.<ITarget> = new Vector.<ITarget>();
            targets.push(testCharacter, testCharacter2, testCharacter3, enemy0, enemy1);
            testCharacter.otherCharacters = targets;
        }


        private function executeBattleCommandTest():void {
            var ally0:Character = getTestFriendBuilder().build();
            var enemy0:Character = getTestEnemyBuilder().build();
            var enemy1:Character = getTestEnemyBuilder().build();

            var party:Party = new Party();
            party.push(ally0);
            party.push(enemy0);
            party.push(enemy1);

            ally0.targetSource = party;

            // 一番上の項目である "攻撃" コマンドを実行する
            ally0.executeBattleCommand(0);

            // 攻撃コマンドを実行した結果、次のコマンド項目の数は敵の数(2)の状態になり、
            // CmdManager.Selected はまだ false つまりコマンド選択は未完了
            Assert.areEqual(ally0.CmdManager.TopCommands.length, 2);
            Assert.isFalse(ally0.CmdManager.Selected);

            ally0.CmdManager.cancelCommand(); // コマンドを一回キャンセル。TopCommands は DefaultCOmmands と同値の状態に戻る
            Assert.areEqual(ally0.CmdManager.TopCommands, ally0.CmdManager.DefaultCommands);

            ally0.executeBattleCommand(0); // コマンドを再選択

            // 表示されているターゲット０番を選択すると、 Selected は true となりコマンド選択が完了状態になる。
            ally0.executeBattleCommand(0);
            Assert.isTrue(ally0.CmdManager.Selected);
        }

        private function getTestFriendBuilder():CharacterBuilder {
            var characterBuilder:CharacterBuilder = new CharacterBuilder()
            characterBuilder.setName("testFriend");
            characterBuilder.setLevel(1);
            characterBuilder.setHp(10);
            characterBuilder.setSp(5);
            characterBuilder.setAtk(3);
            characterBuilder.setGud(3);
            characterBuilder.setSp(2);
            characterBuilder.setIsFriend(true);

            return characterBuilder;
        }

        private function getTestEnemyBuilder():CharacterBuilder {
            var characterBuilder:CharacterBuilder = getTestFriendBuilder();
            characterBuilder.setName("testEnemy");
            characterBuilder.setIsFriend(false);

            return characterBuilder;
        }

        private function executeSkillCommandTest():void {
            var cs:Vector.<Character> = new Vector.<Character>();
            cs.push(new CharacterBuilder().setIsFriend(true).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            var party:Party = new Party(cs);
            var c:Character = cs[0]
            c.targetSource = ITargetSource(party);

            // skillCommand を実行
            c.executeBattleCommand(1);
            Assert.areEqual(c.CmdManager.TopCommands.length, 1);

            // ターゲットの数は２体
            c.executeBattleCommand(0);
            Assert.areEqual(c.CmdManager.TopCommands.length, 2);

            // コマンド選択完了
            c.executeBattleCommand(0);
            Assert.isTrue(c.CmdManager.Selected);
        }

        private function executeItemCommandTest():void {
            var cs:Vector.<Character> = new Vector.<Character>();
            cs.push(new CharacterBuilder().setIsFriend(true).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            cs.push(new CharacterBuilder().setIsFriend(false).build());
            var party:Party = new Party(cs);
            var c:Character = cs[0]
            c.targetSource = ITargetSource(party);
            c.Items.push(new ItemBuilder().setName("item1").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c).build());
            c.Items.push(new ItemBuilder().setName("item1").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c).build());
            c.Items.push(new ItemBuilder().setName("item1").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c).build());
            c.Items.push(new ItemBuilder().setName("item1").setTargetRange(Range.RELATIVE_SINGLE_ENEMY).setOwner(c).build());


            // itemCommand を実行
            c.executeBattleCommand(2);
            Assert.areEqual(c.CmdManager.TopCommands.length, 4);

            // 一度アイテムコマンドをキャンセル
            c.CmdManager.cancelCommand();
            Assert.areEqual(c.CmdManager.TopCommands.length, c.CmdManager.DefaultCommands.length);

            // もう一度 itemCommand を実行
            c.executeBattleCommand(2);
            Assert.areEqual(c.CmdManager.TopCommands.length, 4);

            // item のメソッドを実行。ターゲットの数は２
            c.executeBattleCommand(0);
            Assert.areEqual(c.CmdManager.TopCommands.length, 2);

            // ターゲット選択画面でキャンセルを実行 再びアイテム一覧が表示されるのでコマンドの数は４
            c.CmdManager.cancelCommand();
            Assert.areEqual(c.CmdManager.TopCommands.length, 4);

            // item のメソッド実行
            c.executeBattleCommand(0);
            Assert.areEqual(c.CmdManager.TopCommands.length, 2);

            // 敵を１体選択してコマンド選択を終了
            c.executeBattleCommand(0);
            Assert.isTrue(c.CmdManager.Selected);
        }

        private function resetTest():void {
            var c:Character = new CharacterBuilder().setName("testChara").setIsFriend(true).build();
            var cv:Vector.<Character> = new Vector.<Character>();
            cv.push(c);
            cv.push(new CharacterBuilder().setIsFriend(false).build());
            cv.push(new CharacterBuilder().setIsFriend(false).build());
            var party:Party = new Party(cv);
            c.targetSource = ITargetSource(party);

            c.executeBattleCommand(0);
            c.executeBattleCommand(0);
            Assert.isTrue(c.CmdManager.Selected);

            c.reset();
            Assert.isFalse(c.CmdManager.Selected);
            Assert.isTrue(c.Action == null);
            Assert.areEqual(c.CmdManager.TopCommands, c.CmdManager.DefaultCommands);
        }
    }
}
