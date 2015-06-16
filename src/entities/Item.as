package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Item extends Entity 
	{
		private var customGravity:int= 40;
		private var touchGround:Boolean = false;
	
		public var itemName:String;
		private var timeLife:int = 1.5;
		private var timeLifeCounter:Number = 0;
		private var itemIndex:int;
		private var image:Image;
		
		public function Item(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			
			itemIndex = Utils.randomRange(0, 902);
			trace("itemIndex: " + itemIndex);
			if (itemIndex < 900)
			{
				image = new Image(Assets.ITEM_HEALTH);
				itemName = Constants.ITEM_HEALTH_TYPE;
			}
			else
			{
				image = new Image(Assets.ITEM_GOD);
				itemName = Constants.ITEM_GOD_TYPE;
			}
			
			graphic = image;
			super(x, y, graphic, mask);
			setHitbox(image.width, image.height);
			type = "item";
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
	}

}