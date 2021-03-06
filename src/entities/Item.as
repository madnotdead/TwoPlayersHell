package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Item extends Entity 
	{
		private var customGravity:int= 40;
		private var touchGround:Boolean = false;
	
		public var itemName:String;
		private var timeLife:int = 3;
		private var timeLifeCounter:Number = 0;
		private var itemIndex:int;
		private var image:Image;
		private var position:Point = null;
		private var pickUpSfx:Sfx = null;
		private var spriteS:Spritemap = null;
		public function Item(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			
			itemIndex = Utils.randomRange(0, 902);
			//trace("itemIndex: " + itemIndex);
			if (itemIndex < 800)
			{
				image = new Image(Assets.ITEM_HEALTH);
				spriteS = new Spritemap(Assets.ITEM_HEALTH_ANIM, 14, 14);
				spriteS.add("play", [0, 1, 2], 6);
				spriteS.play("play");
				itemName = Constants.ITEM_HEALTH_TYPE;
				pickUpSfx = new Sfx(Assets.PICK_UP);
			}
			else
			{	
				spriteS = new Spritemap(Assets.ITEM_GOD_ANIM, 14, 14);
				spriteS.add("play", [0, 1, 2], 6);
				spriteS.play("play");
				itemName = Constants.ITEM_GOD_TYPE;
				pickUpSfx = new Sfx(Assets.PICK_UP_GOD);
			}
			
			graphic = spriteS;
			
			mask = new Pixelmask(Assets.ITEM_GOD);
			
			setHitbox(14, 14);
			
			super(x, y, graphic, mask);
			
			type = "item";
		}
		
		override public function added():void 
		{
			super.added();
			
			position = new Point(Utils.randomRange(0, FP.screen.width), Utils.randomRange(0, FP.screen.height));
		
			var entity:Entity = collide("level", position.x, position.y) as Entity;
			
			while (entity)
			{
				position = new Point(Utils.randomRange(0, FP.screen.width), Utils.randomRange(0, FP.screen.height));
				entity = collide("level", position.x, position.y)  as Entity;
			}
			
			x = position.x;
			y = position.y;		
		}
		
		override public function update():void 
		{
			super.update();
			checkGround();
			if (touchGround)
			{
				timeLifeCounter += FP.elapsed;
				
				if (timeLifeCounter >= timeLife)
					FP.world.remove(this);
					
				return;
			}
				
			y += customGravity * FP.elapsed;
		}
		
		private function checkGround():void
		{
			if (collide("level", x, y))
			 touchGround = true;
			 else
			 touchGround = false;
		}
		
		public function collected():void{
			pickUpSfx.play();
			
			FP.world.remove(this);
		}
	}

}