package
{
	import flash.display.MovieClip;
	
	public class Fly extends MovieClip
	{
		static public const STATIC:String = "static";
		static public const MOVE1:String = "move1";
		static public const MOVE2:String = "move2";
		static public const DEAD:String = "dead";
		
		
		public function Fly()
		{
			
			
			
				
			
		}
		
		public function showState( label:String, play:Boolean=false ):void
		{ 
			// Pause the current state...
			if( label == Fly.STATIC ){
				return;
			}
			if( play ){
				gotoAndPlay(label);
			}else{
				gotoAndStop(label);
			}
		}
		
		public function static():void
		{
		showState(Fly.STATIC);
			
		}
		
		public function move1():void
		{
			showState(Fly.MOVE1);
			
		}
		
		public function move2():void
		{
			showState(Fly.MOVE2);
			
			
		}
		
		public function dead():void
		{
			showState(Fly.DEAD);
			
			
		}
		
	
	
	}
}