package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Spider1 extends MovieClip
	{
		
		private var stageRef:Stage;
		private var target:Fly;
		private var _powerSpeed:Number = 3;
		private var dx:Number = 0;
		private var dy:Number = 0;
		private var vy:Number = 3;
		private var vx:Number = 3;
		private var distanceTotal:Number;
		private var agroRange:int = 2000;
		private var rotateSpeed:Number = 6;
		private var friction:Number = 0.93;
		private var maxSpeed:Number = 100;
		private var maxRotation:Number = 20;
		public var _fly:Fly = new Fly;
		
		public function Spider1(stageRef:Stage, target:Fly):void
		{
			this.stageRef = stageRef;
			this.target = target;
		
			x = Math.random() * stageRef.stageWidth;
			y = Math.random() * stageRef.stageHeight;
			
			addEventListener(Event.ENTER_FRAME, loop)
		}
	

		
		private function loop(event:Event):void
		
		{
			var distanceX:Number = target.x - this.x; 
			var distanceY:Number = target.y- this.y; 
			
			//get total distance as one number 
			distanceTotal = Math.sqrt(distanceX*distanceX+distanceY*distanceY); 
			
			//check if target is within agro range 
			if (distanceTotal <= agroRange){ 
				//calculate how much to move 
				var moveDistanceX:Number = rotateSpeed*distanceX/distanceTotal; 
				var moveDistanceY:Number = rotateSpeed*distanceY/distanceTotal; 
				
				//increase current speed 
				dx += moveDistanceX; 
				dy += moveDistanceY; 
				
				//get total move distance 
				var totalmove = Math.sqrt(dx*dx+dy*dy); 
				
				//apply easing 
				dx = _powerSpeed * dx/totalmove; 
				dy = _powerSpeed* dy/totalmove; 
				
				//move follower 
				this.x += dx; 
				this.y += dy; 
				
				//rotate follower toward target 
				this.rotation = 180*Math.atan2(dy, dx)/Math.PI; 
				}
		
		
		}
		
		
		
		public function getDegrees(radians:Number):Number
		{
			return Math.floor(radians/(Math.PI/180));
		}

		public function getRadians(delta_x:Number, delta_y:Number):Number
		{
			var r:Number = Math.atan2(delta_y, delta_x);
			if (delta_y < 0)
			{
				r += (2 * Math.PI);
			}
			return r;
		}
	}
	
	
}