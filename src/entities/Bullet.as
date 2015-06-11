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
		private var image:Image = new Image(Assets.BULLET);
		private var speed:int = 200;
		public function Bullet(x:Number=0, y:Number=0, goRight:Boolean = false, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = image;
			this.goRight = goRight;
			super(x, y, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (goRight)
				x += speed * FP.elapsed;
			else
				x -= speed * FP.elapsed;
			
			trace ("x: " + x);
			if (x >= FP.screen.width || x < 0)
				FP.world.remove(this);
		}
		
	}

}