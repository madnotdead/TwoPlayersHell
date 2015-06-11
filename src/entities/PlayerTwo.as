package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class PlayerTwo extends Entity 
	{
		// Movement constants. 
		public const MAXX:Number = 300;
		public const MAXY:Number = 800;
		public const GRAV:Number = 1500;
		public const FLOAT:Number = 3000;
		public const ACCEL:Number = 1200;
		public const DRAG:Number = 800;
		public const JUMP:Number = -500;
		public const LEAP:Number = 1.5;
	
		private var OnGround:Boolean = false;
		
		private var image:Image = new Image(Assets.PLAYER_TWO);
		
		public var onSolid:Boolean;
		public var spdX:Number = 0;
		public var spdY:Number = 0;
		private var goRight:Boolean = true;
		//private var shootSpawn:Point;
		public function PlayerTwo(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = image;
			
/*			image.centerOO();
			image.smooth = true;*/
			
			setHitbox(16, 16, 0, 0);
			super(x, y, graphic);
			
						// Define input keys.
			Input.define("R2", Key.RIGHT);
			Input.define("L2", Key.LEFT);
			Input.define("JUMP2", Key.CONTROL);
			Input.define("SHOOT2", Key.DIGIT_0);
			type = "playerTwo";
			
			//shootSpawn = new Point(image.originX + 16, image.originY + 2);
		}
		
		
/** Update the player. */
		private const SPEED:int = 100;

		
		override public function update():void 
		{
			super.update();
			/*
			if (Input.check(Key.LEFT)) {
				moveBy( -SPEED * FP.elapsed, 0, "level");
				image.flipped = true;
			} else if (Input.check(Key.RIGHT)) {
				moveBy( SPEED * FP.elapsed, 0, "level");
				image.flipped = false;
			}
			
			if (Input.check(Key.UP)) {
				moveBy(0, -SPEED * FP.elapsed, "level");
			} else if (Input.check(Key.DOWN)) {
				moveBy(0, SPEED * FP.elapsed, "level");
			} */
			
			checkFloor();
			gravity();
			acceleration();
			jumping();
			moveBy(spdX * FP.elapsed, spdY * FP.elapsed, "level");
			animation();
			
			
			if (Input.pressed("SHOOT2"))
			{
				world.add(new Bullet(x, y, goRight));
			}
			
		/*	if (spdY != 0) emitter.emit("trail", x - 10 + FP.rand(20), y - 10 + FP.rand(20));*/
		}
		
		private function checkFloor():void
		{
			if (collide("level", x, y + 16)) onSolid = true;
			else onSolid = false;
		}
		
		/** Applies gravity to the player. */
		private function gravity():void
		{
			if (onSolid) return;
			var g:Number = GRAV;
			if (spdY < 0 && !Input.check("JUMP2")) g += FLOAT;
			spdY += g * FP.elapsed;
			if (spdY > MAXY) spdY = MAXY;
		}
		
		/** Accelerates the player based on input. */
		private function acceleration():void
		{
			// evaluate input
			var accel:Number = 0;
			if (Input.check("R2")) 
			{accel += ACCEL; goRight = true; }
			if (Input.check("L2")) { accel -= ACCEL; goRight = false; }
			
			// handle acceleration
			if (accel != 0)
			{
				if (accel > 0)
				{
					// accelerate right
					if (spdX < MAXX)
					{
						spdX += accel * FP.elapsed;
						if (spdX > MAXX) spdX = MAXX;
					}
					else accel = 0;
				}
				else
				{
					// accelerate left
					if (spdX > -MAXX)
					{
						spdX += accel * FP.elapsed;
						if (spdX < -MAXX) spdX = -MAXX;
					}
					else accel = 0;
				}
			}
			
			// handle decelleration
			if (accel == 0)
			{
				if (spdX > 0)
				{
					spdX -= DRAG * FP.elapsed;
					if (spdX < 0) spdX = 0;
				}
				else
				{
					spdX += DRAG * FP.elapsed;
					if (spdX > 0) spdX = 0;
				}
			}
		}
		
		/** Makes the player jump on input. */
		private function jumping():void
		{
			if (onSolid && Input.pressed("JUMP2"))
			{
				spdY = JUMP;
				onSolid = false;
				if (spdX < 0 && image.flipped) spdX *= LEAP;
				else if (spdX > 0 && !image.flipped) spdX *= LEAP;
				
				//SCALE.setMotion(1, 1.2, 1, 1, .2, Ease.quadIn);
				//ROTATE.tween(0, 360 * -FP.sign(spdX), FP.scale(Math.abs(spdX), 0, MAXX, .7, .5), Ease.quadInOut);
				
				//var i:int = 10;
				//while (i --) emitter.emit("dust", x - 10 + FP.rand(20) , y + 16);
			}
		}
		
		/** Handles animation. */
		private function animation():void
		{
			// control facing direction
			if (spdX != 0) image.flipped = spdX < 0;
			
			// image scale tweening
			//image.scaleX = SCALE.x;
			//image.scaleY = SCALE.y;
			
			//// image rotation
			//if (onSolid)
			//{
				//image.angle = 0;
				////ROTATE.active = false;
				////ROTATE.value = 0;
			//}
			//else image.angle = (spdX / MAXX) * 10 + ROTATE.value;
		}
		
		///** Horizontal collision handler. */
		//override protected function collideX(e:Entity):void 
		//{
			//if (spdX > 100 || spdX < -100) SCALE.setMotion(1, 1.2, 1, 1, .2, Ease.quadIn);
			//spdX = 0;
		//}
		//
		///** Vertical collision handler. */
		//override protected function collideY(e:Entity):void 
		//{
			//if (spdY > 0)
			//{
				//SCALE.setMotion(1.2, 1, 1, 1, .2, Ease.quadIn);
				//spdY = 0;
				//spdX /= 2;
			//}
			//else
			//{
				//SCALE.setMotion(1.2, 1, 1, 1, .1, Ease.quadOut);
				//spdY /= 2;
			//}
		//}
	}

}