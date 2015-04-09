package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	public class StartScene extends Sprite
	{
		private var _gameState:GameState;
		private var _startButton:StartButton = new StartButton;
		private var _endButton:EndButton = new EndButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _mainMenuImage:MainMenuImage = new MainMenuImage;
		
		
		public function StartScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In StartScene");
			
			_mainMenuImage.x = 1;
			_mainMenuImage.y = 1;
			addChild(_mainMenuImage);
			
			
			
			_startButton.x = 400;
			_startButton.y = 300;
			addChild(_startButton);
			
			_instructionsButton.x = 400;
			_instructionsButton.y = 400;
			addChild(_instructionsButton);
				
			_endButton.x = 400;
			_endButton.y = 500;
			addChild(_endButton);
			
			
			
			_instructionsButton.addEventListener(MouseEvent.CLICK, startInstructions)
			_endButton.addEventListener(MouseEvent.CLICK, endGame)
			
				
		}
		
		private function startInstructions(event:MouseEvent)
		{
			_gameState.instructionsScene();
			
		}
	
		private function endGame(event:MouseEvent)
		{
			_gameState.endGame();
		}
	}
	
}