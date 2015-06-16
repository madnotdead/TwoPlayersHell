package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Dropper extends Entity 
	{
		
		private var calmDown:Number;
		private var calmDownTimer:Number;
		
		public function Dropper(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
		}
		
	}

}