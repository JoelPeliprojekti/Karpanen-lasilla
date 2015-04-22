package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class WindowFrameLeft extends MovieClip
	{
		
		public var hitLeftFrame:Boolean = false;
		
		
		public function WindowFrameLeft()
		{
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true)
		
		
		}
	

	
	
		public function loop(event:Event):void
		
		{	
		
		
			if (this.hitTestObject(GameScene._fly.hitfly))
			{
			trace("hit left frame")
			trace(this.x);
			trace(GameScene._fly.x);
			GameScene._fly.gotoAndStop("dead")
			hitLeftFrame = true;
			}

		}
	}
}