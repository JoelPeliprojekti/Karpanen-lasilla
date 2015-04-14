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
		private var _okButton:OkButton = new OkButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _endButton:EndButton = new EndButton;
		private var _fly:Fly = new Fly;
		
		
		
		public function GameScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In GameScene");
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// spawnaa kärpäsen
			addChildAt(_fly,0);
			_fly.dead();
			_fly.x = 480
			_fly.y = 340
			
			
		}
		
		private function init(event:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
			
			
			
			
		}
			
		
		// pause-tila
		private function keyPressedDown(event:KeyboardEvent)
		{
			
			
			var key:uint = event.keyCode;
			var escPressedOnce:Boolean = false;
			if (key == 27 )
			{
					
				
				
				_okButton.x = 380;
				_okButton.y = 350;
				addChildAt(_okButton,1);
				
				_instructionsButton.x = 380;
				_instructionsButton.y = 250;
				addChildAt(_instructionsButton,1);
				
				_endButton.x = 380;
				_endButton.y = 450;
				addChildAt(_endButton,1);
				
				escPressedOnce = true
					
				
				
				_gameState.pauseScene();
				
				
			}
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, arguments.callee);
			_instructionsButton.addEventListener(MouseEvent.CLICK, startInstructions)
			_endButton.addEventListener(MouseEvent.CLICK, backToStartScene)
			_okButton.addEventListener(MouseEvent.CLICK, continueGame)
		
		
		
		}
	
		// kun klikkaat Ohjeet
		private function startInstructions(event:MouseEvent)
		{
			
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.goToInstructionsSceneFromPauseScene()
			
			
		}
		// kun klikkaat Lopeta
		private function backToStartScene(event:MouseEvent)
		{
			
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.startScene()
			
			
		}
		// kun klikkaat Ok
		private function continueGame(event:MouseEvent)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedDown);
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.clickOkFromPauseScene();
			
			
			
		}
		
	
	
	}
}