package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class WindowFrameAbove extends MovieClip
	{
		
		public var hitFrameAbove:Boolean = false;
		
		
		
		public function WindowFrameAbove()
		{
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true)
		
		}
	
	
	
	
	
		public function loop(event:Event):void
		
		{	
		
		
			if (this.hitTestObject(GameScene._fly.hitfly))
			{
				trace("hit frame above")
				trace(this.x);
				trace(GameScene._fly.x);
				GameScene._fly.gotoAndStop("dead")
				hitFrameAbove = true;
			}
			
		
		}
	}
}