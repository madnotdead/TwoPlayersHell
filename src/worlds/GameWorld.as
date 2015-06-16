package worlds  
{
	import entities.*;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class GameWorld extends World 
	{
		
		private var existP1:Boolean = true;
		private var existP2:Boolean = true;
		private var p2Health:Health = null;
		private var winText:Text = null;
		private var playerOne:PlayerOne = null;
		
		private var dropTime:int;
		private var dropTimeCounter:Number = 0 ;
		public function GameWorld() 
		{
			dropTime = Utils.randomRange(3, 10);
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new BackGround());
			add(new Level(Assets.LEVEL_01));
		}
		
		override public function update():void 
		{
			super.update();
			
		
			existP1 = (this.classCount(PlayerOne) > 0)
			existP2 = (this.classCount(PlayerTwo) > 0)
			
			if (!existP1 || !existP2)
			{
				trace("A player has died");
				
				var winner:String = existP1 ? "player one" : "player two";
				
				winText = new Text(winner + " is the WINNER");
				winText.scale = 3;
				winText.x = (FP.screen.width - winText.scaledWidth) / 2;
				winText.y = 100;
				var graphicOwner:Entity = addGraphic(winText);
				
				
				if (Input.check(Key.SPACE))
				{
					remove(graphicOwner);
					removeAll();
					
					add(new BackGround());
					add(new Level(Assets.LEVEL_01));
				}
			}
			
			dropTimeCounter += FP.elapsed;
			//trace(dropTimeCounter);
			if (dropTimeCounter >= dropTime)
			{
				add(new Item(Utils.randomRange(40, 730), 65));
				dropTimeCounter = 0;
				dropTime = Utils.randomRange(3, 10);
			}
		}
	}

}