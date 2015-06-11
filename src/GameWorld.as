package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new BackGround());
			add(new Level(Assets.LEVEL_01));
		}
		
	}

}