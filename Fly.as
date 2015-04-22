package
{
	import GameScene;
	
	import Spider1;
	
	import Window;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Fly extends MovieClip
	{
		static public const STATIC:String = "static";
		static public const FLYMOVES:String = "flyMoves";
		static public const DEAD:String = "dead";
		private var target:Spider1;
		private var _spider1:Spider1;
		private var stageRef:Stage;
		private var _window:Window
		
		public function Fly(stageRef:Stage, target:Spider1):void
		{
			this._spider1=_spider1;
			this._window = _window
			this.stageRef = stageRef;
			this.target = target;
			addEventListener(Event.ENTER_FRAME, hitDetection, false, 0, true)
			
		}
		private function hitDetection(event:Event):void
		{
			
			//if (this.hitTestObject(GameScene._window.windowBorders))
			//{
				//trace("hit window border")
				
				
			//}
			
			
		}
		
	
	
	}
}