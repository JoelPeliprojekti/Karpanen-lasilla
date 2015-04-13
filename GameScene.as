package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class GameScene extends Sprite
	{
		private var _gameState:GameState;
		private var _window:Window = new Window;
		private var _okButton:OkButton = new OkButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _endButton:EndButton = new EndButton;
		
		
		
		
		public function GameScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In GameScene");
			
			_window.x = 1;
			_window.y = 1;
			addChild(_window);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		
		private function init(event:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
			
			
			
		}
			
		
		// tästä pause-tilaan
		private function keyPressedDown(event:KeyboardEvent)
		{
			
			var key:uint = event.keyCode;
			var escPressed:Boolean;
			if (key == 27)
			{
					
				_okButton.x = 100;
				_okButton.y = 100;
				addChild(_okButton);
				
				_instructionsButton.x = 300
				_instructionsButton.y = 300
				addChild(_instructionsButton);
				
				_endButton.x = 200
				_endButton.y = 200
				addChild(_endButton)
				
				
				
				_gameState.pauseScene();
				escPressed = true;
					
					
					
			} 
			
		}
	
	}
}