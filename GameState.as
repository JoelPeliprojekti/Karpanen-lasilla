package
{
	import flash.display.Sprite;
	import flash.system.*;
	
	public class GameState extends Sprite
	{
		private var _startScene:StartScene
		
		
		public function GameState()
		{
			startScene();
		}
	
		private function startScene():void
		{
			_startScene = new StartScene(this);
			addChild(_startScene);
		}
	}
	
}