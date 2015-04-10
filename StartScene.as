package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	
	public class StartScene extends Sprite
	{
		private var _gameState:GameState;
		private var _startButton:StartButton = new StartButton;
		private var _endButton:EndButton = new EndButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _mainMenuImage:MainMenuImage = new MainMenuImage;
		private var _gameName:TextField = new TextField;
		
		
		public function StartScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In StartScene");
			
			// taustakuva
			_mainMenuImage.x = 1;
			_mainMenuImage.y = 1;
			addChild(_mainMenuImage);
			
			// pelin nimi
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 96;
			myFormat.font = "uni 05_53";
			_gameName.width = 1000;
			_gameName.height = 500;
			_gameName.defaultTextFormat = myFormat;
			_gameName.x = 150;
			_gameName.y = 10;
			_gameName.textColor = 000000;
			_gameName.text = "Kärpänen lasilla"
			addChild(_gameName)
			
			
			
			
			// painikkeet
			_startButton.x = 350;
			_startButton.y = 300;
			addChild(_startButton);
			
			_instructionsButton.x = 350;
			_instructionsButton.y = 400;
			addChild(_instructionsButton);
				
			_endButton.x = 350;
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