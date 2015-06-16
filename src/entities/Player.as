package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Player extends Entity 
	{
		public var jumpTag:String;
		public var leftTag:String;
		public var rightTag:String;
		public var shootTag:String;
		
		// Movement constants. 
		public const MAXX:Number = 300;
		public const MAXY:Number = 800;
		public const GRAV:Number = 1500;
		public const FLOAT:Number = 3000;
		public const ACCEL:Number = 1200;
		public const DRAG:Number = 800;
		public const JUMP:Number = -500;
		public const LEAP:Number = 1.5;
		public var onSolid:Boolean;
		public var spdX:Number = 0;
		public var spdY:Number = 0;
		public var image:Image = null;
		public var godImage:Image = null;
		private const SPEED:int = 100;
		private var OnGround:Boolean = false;
		private var goRight:Boolean = true;
		private var showHealth:entities.Health = null;
		private var health:int = 100;
		private var isGod:Boolean = false;
		private var godTimer:Number = 0;
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
		}
		
		public function get GetHealth():int
		{
			return this.health;
		}
		
		override public function update():void 
		{
			super.update();
			
			checkFloor();
			gravity();
			acceleration();
			jumping();
			moveBy(spdX * FP.elapsed, spdY * FP.elapsed, "level");
			animation();
			handleItemCollision();
			
			if (isGod)
			{
				godTimer += FP.elapsed;
				
				isGod = godTimer <= 7;
				
				if (!isGod)
				{
					graphic = image;
					godTimer = 0;
				}
			}
			
			if (Input.pressed(shootTag))
			{
				world.add(new Bullet(x, y, goRight,type));
			}
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
			if (spdY < 0 && !Input.check(jumpTag)) g += FLOAT;
			spdY += g * FP.elapsed;
			if (spdY > MAXY) spdY = MAXY;
		}
		
		/** Accelerates the player based on input. */
		private function acceleration():void
		{
			// evaluate input
			var accel:Number = 0;
			if (Input.check(rightTag)) 
			{accel += ACCEL; goRight = true; }
			if (Input.check(leftTag)) { accel -= ACCEL; goRight = false; }
			
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
			if (onSolid && Input.pressed(jumpTag))
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
		
		public function takeDamage(damage:uint):void {
			
			if (isGod)
			return;
			
			this.health -= damage;
			
			if (health <= 0)
				FP.world.remove(this);
		}
		
		public function addHealth(amount:uint):void
		{
			health += amount;
			
			if (health > 100)
				health = 100;
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
			
		
		private function handleItemCollision():void
		{
			var item:Item = collide("item", x, y) as Item;
			
			if (item)
			{
				if (item.itemName ==  Constants.ITEM_HEALTH_TYPE)
					addHealth(10);	
				
				if (item.itemName == Constants.ITEM_GOD_TYPE)
				{
					isGod = true;
					graphic = godImage;
				}
				
				FP.world.remove(item);
			}
		}
	}

}