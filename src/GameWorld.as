package  
{
	import entities.*;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class GameWorld extends World 
	{
		
		private var existP1:Boolean = true;
		private var existP2:Boolean = true;
		public function GameWorld() 
		{
			
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
			}
		}
	}

}