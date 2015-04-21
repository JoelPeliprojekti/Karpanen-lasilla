package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Fly extends MovieClip
	{
		static public const STATIC:String = "static";
		static public const FLYMOVES:String = "flyMoves";
		static public const DEAD:String = "dead";
		private var Target:HitBounds;
		private var hitSpider:HitBox = new HitBox;
		
		public function Fly()
		{
			
				
			
			
		}
		private function hitDetection(event:Event):void
		{
			if (this.hitTestObject(hitSpider))
			{
				trace("hit enemy")
				
			}
			
			
			
		}
		
	
	
	}
}