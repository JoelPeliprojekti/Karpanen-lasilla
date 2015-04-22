package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class WindowFrameBelow extends MovieClip
	{
		
		public var hitFrameBelow:Boolean = false;
		
		
		public function WindowFrameBelow()
		{
			
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true)
		
		
		}
	


		public function loop(event:Event):void
		
		{	
		
			if (this.hitTestObject(GameScene._fly.hitfly))
			{
			trace("hit frame below")
			trace(GameScene._fly.x);
			GameScene._fly.gotoAndStop("dead")
			hitFrameBelow = true;
			}

		}
	}	

}