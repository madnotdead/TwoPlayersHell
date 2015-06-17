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
		private var playerText:String = null;
		
		public function Health(x:Number=0, y:Number=0, player:Player = null,graphic:Graphic=null, mask:Mask=null) 
		{
			playerText = player.type;
			var text:Text = new Text(playerText + "\n"+ "Health: 0");
			text.scale = 1.5;
			graphic = text;
			super(x, y, graphic, mask);
			
			currentPlayer = player;
		}
		
		public function get GetHeath():int { return currentPlayer.GetHealth; }
		
		public function SetHealth(health:int):void
		{
			Text(graphic).text = playerText + "\n"+"Health: " + health;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (currentPlayer)
				SetHealth(currentPlayer.GetHealth);
			
		}
	}

}