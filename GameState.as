package
{
	import flash.display.Sprite;
	import flash.system.*;
	import flash.system.fscommand;
	
	public class GameState extends Sprite
	{
		private var _startScene:StartScene;
		private var _instructionsScene:InstructionsScene;
		
		public function GameState()
		{
			startScene();
			
		}
	
		public function startScene():void
		{
			_startScene = new StartScene(this);
			addChild(_startScene);
		}
		
		public function instructionsScene():void
		{
			if (_startScene)
			{
				removeChild(_startScene);
				_startScene =null;
			}
			
			
			_instructionsScene = new InstructionsScene(this);
			addChild(_instructionsScene);
			
		}
		
		public function endGame():void
		{
			fscommand("quit");
		}
	
		public function quitInstructions():void
		{
			if (_instructionsScene)
			{
				removeChild(_instructionsScene);
				_instructionsScene =null;
				
			}
		
			_startScene = new StartScene(this);
			addChild(_startScene);
			
			
		}
		
		
	}
	
}