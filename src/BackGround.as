package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class BackGround extends Entity 
	{		
		public function BackGround(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Backdrop(Assets.BACKGROUND);
			graphic.scrollY = .5;
			graphic.scrollX = .5;
			layer = 100;
			super(x, y, graphic, mask);
		}
		
		override public function update():void 
		{
			super.update();
			
			x -= FP.elapsed * 10;
			y -= FP.elapsed * 20;
			
		}
		
	}

}