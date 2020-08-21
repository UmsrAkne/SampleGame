package tests.charas {
    import app.charas.Character;
    import app.charas.CharacterBuilder;
    import app.charas.Ability;
    import tests.Assert;
    import app.charas.ITarget;
    import app.charas.Range;

    /**
     * ...
     * @author
     */
    public class TestCharacter {

        public function TestCharacter() {
            creationTest();
            executeBattleCommandTest();
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

            ally0.otherCharacters = new Vector.<ITarget>();
            ally0.otherCharacters.push(enemy0);
            ally0.otherCharacters.push(enemy1);

            // 一番上の項目である "攻撃" コマンドを実行する
            ally0.executeBattleCommand(0);

            // 攻撃コマンドを実行した結果、次のコマンド項目の数は敵の数(2)の状態になり、
            // CmdManager.Selected はまだ false つまりコマンド選択は未完了
            Assert.areEqual(ally0.CmdManager.TopCommands.length, 2);
            Assert.isFalse(ally0.CmdManager.Selected);

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
    }
}
