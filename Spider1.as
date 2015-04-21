package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class Spider1 extends MovieClip
	{
		
		private var stageRef:Stage;
		private var target:Fly;
		private var _powerSpeed:Number = 2;
		public var _screenRect:Rectangle = new Rectangle(0, 0, 1024, 768);
		public var _spawnRect:Rectangle = new Rectangle();
		private var dx:Number = 0;
		private var dy:Number = 0;
		private var vy:Number = 3;
		private var vx:Number = 3;
		private var distanceTotal:Number;
		private var agroRange:int = 200;
		private var rotateSpeed:Number = 6;
		private var friction:Number = 0.93;
		private var maxSpeed:Number = 100;
		private var maxRotation:Number = 20;
		public var _fly:Fly = new Fly;
		
		public function Spider1(stageRef:Stage, target:Fly):void
		{
			this.stageRef = stageRef;
			this.target = target;
		
			var spawnX:Number;
			var spawnY:Number;
			
			// We set the spawn rectangle to the size of the screen but
			// expand it out by the size of the object being spawned.
			// This will allow enemies of any size to always be moved off screen.
			var padX:Number = this.width;
			var padY:Number = this.height;
			
			_spawnRect.x = _screenRect.x - padX;
			_spawnRect.width = _screenRect.width + padX;
			_spawnRect.y = _screenRect.y - padY;
			_spawnRect.height = _screenRect.height + padY;
			
			// Pick randomly between X and Y, and move the spawn position to the full extent on
			// that axis. Then randomise the other axis.
			if (Math.random() > 0.5)
			{
				// We are setting the X to its full distance on the left or right, randomly pick which
				if (Math.random() > 0.5)
				{
					// left
					spawnX = _spawnRect.x;
				}
				else
				{
					// right
					spawnX = _spawnRect.width;
				}
				// Randomise the other axis.
				spawnY = randomWithinRange(_spawnRect.y, _spawnRect.height);
			}
			else
			{
				// We are setting the Y to its full distance up or down, randomly pick which
				if (Math.random() > 0.5)
				{
					// Up
					spawnY = _spawnRect.y;
				}
				else
				{
					// down
					spawnY = _spawnRect.height;
				}
				// Randomise the other axis.
				spawnX = randomWithinRange(_spawnRect.x, _spawnRect.width);
			}
			
			// Move the enemy to the new position
			this.x = spawnX;
			this.y = spawnY;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true)
		}
		
		private function randomWithinRange(min:Number, max:Number):Number
		{
			return Math.random() * (max - min) + min;
			
		}

		
		private function loop(event:Event):void
		
		{	
			var distanceX:Number = target.x - this.x; 
			var distanceY:Number = target.y- this.y; 
			
			//get total distance as one number 
			distanceTotal = Math.sqrt(distanceX*distanceX+distanceY*distanceY); 
			
			//check if target is within agro range 
			if (distanceTotal <= agroRange)
			{ 
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