package 
{
	import flash.display3D.textures.Texture;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Health extends Entity 
	{
		private var _health:int = 0;
		
		public function Health(x:Number=0, y:Number=0,graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Text("Health: 0");
			super(x, y, graphic, mask);
		}
		
		public function get GetHeath():int { return _health; }
		
		public function AddHealth(health:int):void
		{
			_health += health;
			
			Text(graphic).text = "Health: " + _health;
		}
	}

}