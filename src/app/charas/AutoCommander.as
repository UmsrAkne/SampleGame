package app.charas {

    import app.cmds.IBattleCommand;

    public class AutoCommander {

        private var owner:Character;

        public function AutoCommander(owner:Character) {
            this.owner = owner;
        }
    }
}
