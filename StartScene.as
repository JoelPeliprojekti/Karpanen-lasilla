package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class StartScene extends Sprite
	{
		private var _gameState:GameState;
		private var _startButton:StartButton = new StartButton;
		private var _endButton:EndButton = new EndButton;
		private var _instructionsButton = new InstructionsButton;
		
		
		public function StartScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In StartScene");
			_startButton.x = 530;
			_startButton.y = 265;
			addChild(_startButton);
			
			_instructionsButton.x = 530;
			_instructionsButton.y = 250;
			addChild(_instructionsButton);
				
			_endButton.x = 400;
			_endButton.y = 225;
			addChild(_endButton);
			
			
		}
	}
}