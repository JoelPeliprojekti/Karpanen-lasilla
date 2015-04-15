package
{
	import flash.display.MovieClip;
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
		public var _powerSpeed:Number = 10;
		public var container:MovieClip = new MovieClip;
		public var vy:Number = 0;
		public var vx:Number = 0;
		public var friction:Number = 0.93;
		public var maxSpeed:Number = 100;
		public var maxRotation:Number = 20;
		public var isD:Boolean = false;
		public var isS:Boolean = false;
		public var isA:Boolean = false;
		public var isW:Boolean = false;
		
		public function GameScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In GameScene");
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// spawnaa kärpäsen
			addChildAt(_fly,0);
			_fly.move1();
			_fly.x = 1024 / 2
			_fly.y = 768 / 2
			
			
				
			
			}
		
		
		private function init(event:Event)
		{
			stage.stageFocusRect = false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseMenu);
			stage.focus = _fly
			stage.addEventListener(Event.ENTER_FRAME, loop)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey)
			
		}
		
		private function downkey(event:KeyboardEvent):void
		{
			if (event.keyCode == 68) {
				isD = true;
			}
			
			if (event.keyCode == 83) {
				isS = true;
			}
			
			if (event.keyCode == 65) {
				isA = true;
			}
			if (event.keyCode == 87) {
				isW = true;
			}
		}
		
		
		
		// d on 68, w on 87, a on 65, s on 83, esc on 27
		private function loop(event:Event):void
		{
			if (isD == true && _powerSpeed < maxSpeed)
			{
				_fly.rotation += _powerSpeed;
			}
			
			if (isS == true && _powerSpeed < maxSpeed)
			{
				
				_fly.y += 10;
			}	
			
			if (isA == true && _powerSpeed < maxSpeed)	
			{	
				_fly.rotation -= _powerSpeed;
				
			}	
			
			if (isW == true && _powerSpeed < maxSpeed)
			{
				
				var Angle:Number = (2 * Math.PI * (_fly.rotation/360));
				var dx:Number = _powerSpeed * Math.cos(Angle);
				var dy:Number = _powerSpeed * Math.sin(Angle);
				_fly.x += dx;  
				_fly.y += dy;  
				
				
			
			} 
			
			
		
		}
			
		
		// pause-tila
		private function pauseMenu(event:KeyboardEvent)
		{
		
			var key:uint = event.keyCode;
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
				
				
					
				
				
				_gameState.pauseScene();
				
				
			}
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, arguments.callee);
			_instructionsButton.addEventListener(MouseEvent.CLICK, startInstructions);
			_endButton.addEventListener(MouseEvent.CLICK, backToStartScene);
			_okButton.addEventListener(MouseEvent.CLICK, continueGame);
		
		
		
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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseMenu);
			stage.focus = _fly
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.clickOkFromPauseScene();
			
			
			
		}
		
	
	
	}
}