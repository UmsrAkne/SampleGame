package tests {
	/**
	 * ...
	 * @author 
	 */
	public class Tester {
		
		public function Tester() {
			var b:Boolean = true;
			Assert.isTrue(b);

			trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
		}
		
	}

}