package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class WindowFrameRight extends MovieClip
	{
		
		public var hitRightFrame:Boolean = false;
		
		
		public function WindowFrameRight()
		{
			
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true)
		
		
		
		}
	

	
		
		public function loop(event:Event):void
		{	
		
		
			if (this.hitTestObject(GameScene._fly.hitfly))
			{
			trace("hit right frame")
			trace(this.x);
			trace(GameScene._fly.x);
			GameScene._fly.gotoAndStop("dead")
			hitRightFrame = true;
			}

		}
	}
}