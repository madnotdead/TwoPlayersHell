package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Bullet extends Entity 
	{
		
		private var goRight:Boolean = true;
		private var image:Image = null;// new Image(Assets.BULLET);
		private var speed:int = 200;
		private var isActive:Boolean = true;
		private var damage:int = 10;
		private var owner:String;
		private var bulletSS:Spritemap;
		
		public function get IsActive():Boolean 
		{ return isActive; }
		
		
		public function SetIsActive(active:Boolean, goRight:Boolean=false):void
		{
			isActive = active;
			visible = active;
			
			this.goRight = goRight;
		}
		
		
		public function SetDamage(newDamage:int):void
		{
			this.damage = newDamage;
		}
		
		public function Bullet(x:Number=0, y:Number=0, goRight:Boolean = false,bulletOwner:String= "none", graphic:Graphic=null, mask:Mask=null) 
		{
			
			
			if (bulletOwner == Constants.PLAYER_ONE_TYPE)
				bulletSS = new Spritemap(Assets.BULLET_SS, 6, 4);
			else
				bulletSS = new Spritemap(Assets.BULLET2_SS, 6, 4);
			
			bulletSS.add("beBullet", [0, 1, 2], 6);
			
			graphic = bulletSS;
			
			mask = new Pixelmask(Assets.BULLET_MASK);
		
			this.goRight = goRight;
			this.owner = bulletOwner;
			
			bulletSS.flipped = !goRight;
			
			super(x, y, graphic, mask);
			setHitbox(6, 4);
			
			bulletSS.play("beBullet");
		}
		private var lifeTime:Number = 0;
		override public function update():void 
		{
			super.update();
			if (!IsActive)
				return;
				
			if (goRight)
				x += speed * FP.elapsed;
			else
				x -= speed * FP.elapsed;
			
			trace ("x: " + x);
			
			//lifeTime += FP.elapsed;

			var target:String = owner == Constants.PLAYER_ONE_TYPE ? Constants.PLAYER_TWO_TYPE : Constants.PLAYER_ONE_TYPE;
			
			var p1:PlayerOne = null;
			var p2:PlayerTwo = null;
			if (target ==  Constants.PLAYER_ONE_TYPE)
			{
				p1 = collide(target, x, y) as PlayerOne;
				
				if(p1)
					p1.takeDamage(this.damage);
			}
			else
			{
				p2 = collide(target, x, y) as PlayerTwo;
				
				if(p2)
					p2.takeDamage(this.damage);
			}
			
			
			var level:Entity =  collide("level", x, y);
			
			if (x >= FP.screen.width || x < 0 || p1 || p2 || level)
				destroy();
			
		}
		
		
		private function destroy():void
		{
			
			graphic = null;
			FP.world.remove(this);
		}
		
	}

}