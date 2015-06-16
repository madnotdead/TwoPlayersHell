package entities 
{
	import entities.PlayerOne;
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
		private var currentPlayer:Player = null;
		
		public function Health(x:Number=0, y:Number=0, player:Player = null,graphic:Graphic=null, mask:Mask=null) 
		{
			graphic = new Text("Health: 0");
			super(x, y, graphic, mask);
			
			currentPlayer = player;
		}
		
		public function get GetHeath():int { return currentPlayer.GetHealth; }
		
		public function SetHealth(health:int):void
		{
			Text(graphic).text = "Health: " + health;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (currentPlayer)
				SetHealth(currentPlayer.GetHealth);
			
		}
	}

}