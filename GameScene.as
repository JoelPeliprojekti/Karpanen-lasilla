package
{
	import Spider1;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class GameScene extends Sprite
	{
		public static var _spider1:Spider1;
		private var _gameState:GameState;
		private var _okButton:OkButton = new OkButton;
		private var _instructionsButton:InstructionsButton = new InstructionsButton;
		private var _endButton:EndButton = new EndButton;
		private var gameBackground:GameBackground = new GameBackground;
		public static var _fly:Fly;
		public var windowFrameBelow:WindowFrameBelow = new WindowFrameBelow;
		public var windowFrameAbove:WindowFrameAbove = new WindowFrameAbove;
		public var windowFrameRight:WindowFrameRight = new WindowFrameRight;
		public var windowFrameLeft:WindowFrameLeft = new WindowFrameLeft;
		private var _alarm:Alarm = new Alarm;
		private var _scoreBoard:TextField = new TextField;
		private var _score:int = 0;
		private var hitBounds:HitBounds = new HitBounds;
		private var _window:Window = new Window;
		private var _windowContainer = new MovieClip;
		private var _enemyList:Array = new Array();
		public var _powerSpeed:Number = 20;
		public var _screenRect:Rectangle = new Rectangle(0, 0, 1024, 768);
		public var _spawnRect:Rectangle = new Rectangle();
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
		public var isEsc = false;
		public var flyLives:int = 3;
		public static var _lifeBoard:TextField = new TextField;
		private var stageRef:Stage;
		
		public function GameScene(passedClass:GameState, stageRef:Stage)
		{
			this.stageRef=stageRef;
			_gameState = passedClass;
			trace("In GameScene");
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			// spawnaa kärpäsen
			_fly = new Fly(stageRef, _spider1);
			addChildAt(_fly,0);
			_fly.gotoAndStop("static")
			_fly.x = 1024 / 2
			_fly.y = 768 / 2
				
			addChildAt(gameBackground, 0)
			gameBackground.x = 1024 / 2;
			gameBackground.y = 768 / 2;
				
				
			// kärpäsen elämät textfieldiin
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
			addChild(_lifeBoard);
			
			
			// pisteet textfieldiin
			var myFormat2:TextFormat = new TextFormat();
			myFormat2.size = 40;
			myFormat2.font = "uni 05_53";
			_scoreBoard.width = 200;
			_scoreBoard.height = 200;
			_scoreBoard.defaultTextFormat = myFormat;
			_scoreBoard.x = 965;
			_scoreBoard.y = 110;
			_scoreBoard.textColor = 000000;
			_scoreBoard.text = String(_score);
			addChild(_scoreBoard);
			
			_windowContainer = new MovieClip();
			_windowContainer.addChild(_window)
			_windowContainer.x = 1024 / 2;
			_windowContainer.y = 768 / 2;
			addChild(_windowContainer)
		}
		
		
		
		private function init(event:Event)
		{
			
			stage.stageFocusRect = false;
			stage.focus = _fly;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey);
			stage.addEventListener(KeyboardEvent.KEY_UP, upkey);
			stage.addEventListener(Event.ENTER_FRAME, spawningEnemies);
		}
		
		public function downkey(event:KeyboardEvent):void
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
				pauseMenu()
			}
		}
		
		public function upkey(event:KeyboardEvent)
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
		
		
		
		
		public function spawningEnemies(event:Event):void
		{
			if(Math.floor(Math.random() * 90) == 5)	
			{
				var enemy:Spider1 = new Spider1(stageRef, _fly);
				_enemyList.push(enemy);	
				_window.addChild(enemy);
				trace(_enemyList.length);
				
			}
			if (_enemyList.length >= 4)
			{
				stage.removeEventListener(Event.ENTER_FRAME, spawningEnemies)
				
				
			}
			
			
			
		}
		
		
		public function loop(event:Event):void
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
				_fly.x -= dx / 200;  
				_fly.y -= dy / 200;
				
				// ikkunan parallax scrollaus
				_windowContainer.x += dx;
				_windowContainer.y += dy;
			
				gameBackground.x += dx / 10;
				gameBackground.y += dy / 10;
			
			}	
			
			
			if (isW == true && windowFrameRight.hitRightFrame == false && windowFrameLeft.hitLeftFrame == false && windowFrameAbove.hitFrameAbove == false && windowFrameBelow.hitFrameBelow == false)
			{
				
				trace("x"+_windowContainer.x);
				trace("y"+_windowContainer.y);
				var Angle2:Number = (2 * Math.PI * (_fly.rotation/360));
				var d2x:Number = _powerSpeed * Math.cos(Angle2);
				var d2y:Number = _powerSpeed * Math.sin(Angle2);
				_fly.x += d2x / 200;  
				_fly.y += d2y / 200;
				
				// ikkunan parallax scrollaus
				_windowContainer.x -= d2x;
				_windowContainer.y -= d2y;
				
				gameBackground.x -= d2x / 10;
				gameBackground.y -= d2y / 10;
			}	
			if (isW == false && isD == false && isA == false && isS == false)	
			{
				_fly.gotoAndStop("static")
				
			}
			
			
				
		
		}
		
		
		public static function hitDetection():void
		{
		 var flyLives:int = 3;
		
		 if (flyLives > 0)
		 {
			 flyLives = flyLives - 1
		 }
			
		
		GameScene._lifeBoard.text = "Lives: " + flyLives;
		
		}	
		
		
		// pause-tila
		private function pauseMenu()
		{
			trace("in pausemenu")
			
			stage.focus = this;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, downkey)
			_instructionsButton.addEventListener(MouseEvent.CLICK, startInstructions);
			_endButton.addEventListener(MouseEvent.CLICK, backToStartScene);
			_okButton.addEventListener(MouseEvent.CLICK, continueGame);		
				
				
				_okButton.x = 380;
				_okButton.y = 350;
				addChild(_okButton);
				
				_instructionsButton.x = 380;
				_instructionsButton.y = 250;
				addChild(_instructionsButton);
				
				_endButton.x = 380;
				_endButton.y = 450;
				addChild(_endButton);
				
				
					
				
				
				_gameState.pauseScene();
				
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
			stage.focus = _fly;
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			_gameState.clickOkFromPauseScene();
			
			
			
		}
		
		private function exitPause(event:KeyboardEvent)
		{
			if (isEsc == true) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pauseMenu);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downkey);
			removeChild(_okButton);
			removeChild(_instructionsButton);
			removeChild(_endButton);
			stage.focus = _fly;
			
			}
			
			
		}
	
		
		
		
	}
}