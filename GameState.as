package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.system.*;
	import flash.system.fscommand;
	
	public class GameState extends Sprite
	{
		private var _startScene:StartScene;
		private var _instructionsScene:InstructionsScene;
		private var _gameScene:GameScene;
		private var _pauseScene:PauseScene;
		private var stageRef:Stage;
		
		
		public function GameState():void
		{
			this.stageRef=stage;
			startScene();
			
		}
	
		public function startScene():void
		{
			if (_gameScene || _pauseScene)
			{
				removeChild(_pauseScene);
				removeChild(_gameScene);
				_pauseScene =null;
				_gameScene =null;
			}
			
			
			_startScene = new StartScene(this, stageRef);
			addChild(_startScene);
		}
		
		public function gameScene():void
		{
			if (_startScene)
			{
				removeChild(_startScene);
				_startScene =null;
				
			} else if (_pauseScene) {
				
				removeChild(_pauseScene)
				_pauseScene =null;
				
			}
			
			
			_gameScene = new GameScene(this, stageRef);
			addChild(_gameScene);
			
		}
		
		public function pauseScene():void
		{
			_pauseScene = new PauseScene(this);
			_pauseScene.x = 350
			_pauseScene.y = 180
			
			
			addChild(_pauseScene);
			
			
		}
		
		
		
		
		public function instructionsScene():void
		{
			if (_startScene)
			{
				removeChild(_startScene);
				_startScene =null;
			
			} else if (_pauseScene) {
				removeChild(_pauseScene)
				_pauseScene =null;
				
			
			} else if (_gameScene) {
				removeChild(_gameScene)
				_gameScene =null;
				
			}
			
			
			_instructionsScene = new InstructionsScene(this);
			addChild(_instructionsScene);
			
		}
		
		public function endGame():void
		{
			fscommand("quit");
		}
	
		// ohjeet-ikkunan ok-painike toteuttaa tämän
		public function quitInstructions():void
		{
			if (_instructionsScene)
			{
				removeChild(_instructionsScene);
				_instructionsScene =null;
				
			}
		
			_startScene = new StartScene(this, stageRef);
			addChild(_startScene);
			
			
		}
		
		public function clickOkFromPauseScene():void
		{
			removeChild(_pauseScene);
			_pauseScene =null;
			trace("game continues")
			
		}
		public function goToInstructionsSceneFromPauseScene():void
		{
			
			removeChild(_gameScene);
			removeChild(_pauseScene);
			_pauseScene =null;
			_gameScene =null;
			
			_instructionsScene = new InstructionsScene(this);
			addChild(_instructionsScene);
			trace("tulit tänne pausesta")
		
		}
	
	}
	
}