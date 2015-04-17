package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class GameScene extends Sprite
	{
		private var _gameState:GameState;
		private var _okButton:OkButton = new OkButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _endButton:EndButton = new EndButton;
		private var _fly:Fly = new Fly;
		private var _alarm:Alarm = new Alarm;
		private var _window:Window = new Window;
		private var _windowContainer = new MovieClip
		public var _powerSpeed:Number = 6;
		public var vy:Number = 0;
		public var vx:Number = 0;
		public var rotateSpeed:Number = 6;
		public var friction:Number = 0.93;
		public var maxSpeed:Number = 100;
		public var maxRotation:Number = 20;
		public var isD:Boolean = false;
		public var isS:Boolean = false;
		public var isA:Boolean = false;
		public var isW:Boolean = false;
		public var isEsc = false
		public var flyLives:int = 3
		public var _lifeBoard:TextField = new TextField;
		
		public function GameScene(passedClass:GameState)
		{
			_gameState = passedClass;
			trace("In GameScene");
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// spawnaa kärpäsen
			addChildAt(_fly,0);
			_fly.gotoAndStop("static")
			_fly.x = 1024 / 2
			_fly.y = 768 / 2
				
			
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 40;
			myFormat.font = "uni 05_53";
			_lifeBoard.width = 200;
			_lifeBoard.height = 200;
			_lifeBoard.defaultTextFormat = myFormat;
			_lifeBoard.x = 860;
			_lifeBoard.y = 40;
			_lifeBoard.textColor = 000000;
			_lifeBoard.text = "Lives: " + flyLives;
			addChild(_lifeBoard)
			
			_windowContainer = new MovieClip();
			_windowContainer.addChild(_window)
			_windowContainer.x = 1024 / 2;
			_windowContainer.y = 768 / 2;
			addChild(_windowContainer)
		}
		
		
		private function init(event:Event)
		{
			stage.stageFocusRect = false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseMenu);
			stage.focus = _fly
			stage.addEventListener(Event.ENTER_FRAME, loop)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey)
			stage.addEventListener(KeyboardEvent.KEY_UP, upkey)
			
	
		}
		
		private function downkey(event:KeyboardEvent):void
		{
			if (event.keyCode == 68) {
				isD = true;
				_fly.gotoAndPlay("flyMoves")
			}
			
			if (event.keyCode == 83) {
				isS = true;
				_fly.gotoAndPlay("flyMoves")
			}
			
			if (event.keyCode == 65) {
				isA = true;
				_fly.gotoAndPlay("flyMoves")
			}
			if (event.keyCode == 87) {
				isW = true;
				_fly.gotoAndPlay("flyMoves")
			}
			
			if (event.keyCode == 27) {
				isEsc = true;
				pauseMenu(event)
				stage.focus =null;
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, downkey)
			}
		}
		
		private function upkey(event:KeyboardEvent)
		{
			if (event.keyCode == 68) {
				isD = false;
				
			}
			
			else if (event.keyCode == 83) {
				isS = false;
				
			}
			
			else if (event.keyCode == 65) {
				isA = false;
				
			}
			else if (event.keyCode == 87) {
				isW = false;
				
			}
			
			if (event.keyCode == 27) {
				isEsc = false;
			
			}
		
		}
		
		// d on 68, w on 87, a on 65, s on 83, esc on 27
		private function loop(event:Event):void
		{
				
				
			if (isD == true)
			{
				
				
				_fly.rotation += rotateSpeed;
				
			
			}	else if (isA == true)	{	
				
				
				_fly.rotation -= rotateSpeed;
				
					
			}
			
			if (isS == true)
			{
				
				
				var Angle:Number = (2 * Math.PI * (_fly.rotation/360));
				var dx:Number = _powerSpeed * Math.cos(Angle);
				var dy:Number = _powerSpeed * Math.sin(Angle);
				_fly.x -= dx / 10;  
				_fly.y -= dy / 10;
				
				// ikkunan parallax scrollaus
				_windowContainer.x += dx;
				_windowContainer.y += dy;
			}	
			
			
			if (isW == true)
			{
				
				
				var Angle2:Number = (2 * Math.PI * (_fly.rotation/360));
				var d2x:Number = _powerSpeed * Math.cos(Angle2);
				var d2y:Number = _powerSpeed * Math.sin(Angle2);
				_fly.x += d2x / 10;  
				_fly.y += d2y/ 10;
				
				// ikkunan parallax scrollaus
				_windowContainer.x -= d2x;
				_windowContainer.y -= d2y;
				
			}	
			if (isW == false && isD == false && isA == false && isS == false)	
			{
				_fly.gotoAndStop("static")
				
			}
			
			
		
		}
		
		public function degreesToRadians(degrees:Number)
		{
			return degrees * Math.PI / 180;
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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey);
			stage.focus = _fly
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.clickOkFromPauseScene();
			
			
			
		}
		
	
	
	}
}