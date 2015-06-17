package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
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
			if(bulletOwner == Constants.PLAYER_ONE_TYPE)
				image = new Image(Assets.BULLET)
			else
				image = new Image(Assets.BULLET2);
				
			graphic = image;
			this.goRight = goRight;
			this.owner = bulletOwner;
			super(x, y, graphic, mask);
			setHitbox(4, 4);
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