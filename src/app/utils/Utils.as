package app.utils {

    public class Utils {
        public static function getRandom(min:int, max:int):int {
            return Math.floor(Math.random() * (max - min + 1) + min);
        }
    }
}
