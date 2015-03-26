package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class InstructionsScene extends Sprite
	{
		private var _instructions:String
		private var _instructionsArea:TextField
		
		
		
		
		public function InstructionsScene(passedClass:GameState)
		{
			_gameState:passedClass
			trace("In InstructionsScene")
		}
	}
}