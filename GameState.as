package
{
	import flash.display.Sprite;
	import flash.system.*;
	import flash.system.fscommand;
	
	public class GameState extends Sprite
	{
		private var _startScene:StartScene;
		private var _instructionsScene:InstructionsScene;
		private var _gameScene:GameScene;
		private var _pauseScene:PauseScene;
		
		public function GameState()
		{
			startScene();
			
		}
	
		public function startScene():void
		{
			_startScene = new StartScene(this);
			addChild(_startScene);
		}
		
		public function gameScene():void
		{
			if (_startScene)
			{
				removeChild(_startScene);
				_startScene =null;
			}
			
			
			_gameScene = new GameScene(this);
			addChild(_gameScene);
			
		}
		
		public function pauseScene():void
		{
			_pauseScene = new PauseScene(this);
			_pauseScene.x = 350
			_pauseScene.y = 180
			
			
			addChildAt(_pauseScene,0);
			
			
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