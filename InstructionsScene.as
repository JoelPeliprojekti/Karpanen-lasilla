package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	
	
	public class InstructionsScene extends Sprite
	{
		private var _gameState:GameState;
		private var _instructionsArea:TextField = new TextField;
		private var _okButton:OkButton = new OkButton;
		private var _mainMenuImage:MainMenuImage = new MainMenuImage;
	
		
		
		
		public function InstructionsScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In InstructionsScene")
			
			_mainMenuImage.x = 1;
			_mainMenuImage.y = 1;
			addChild(_mainMenuImage);			
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 24;
			myFormat.font = "uni 05_53";
			_instructionsArea.defaultTextFormat = myFormat;
			_instructionsArea.x = 275;
			_instructionsArea.y = 130;
			_instructionsArea.width = 500;
			_instructionsArea.height = 500;
			_instructionsArea.border = true;
			_instructionsArea.borderColor = 000000;
			_instructionsArea.wordWrap = true;
			_instructionsArea.textColor = 000000;
			_instructionsArea.background = true;
			_instructionsArea.backgroundColor = 0xFFFFFF;
			_instructionsArea.text = "Ohjeet tulee tähän asdasdasdasdasdasdasdasdasdasdasdasd"
			addChild(_instructionsArea);
			
			_okButton.x = 370;
			_okButton.y = 50;
			addChild(_okButton);
			
			_okButton.addEventListener(MouseEvent.CLICK, quitInstructions);
				
			
			
			
		}
		
		private function quitInstructions(event:MouseEvent)
		{
			
			_gameState.quitInstructions();
			
			
		}
	
	}
	
	
}