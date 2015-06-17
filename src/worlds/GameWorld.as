package worlds  
{
	import entities.*;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
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
		private var restartText:Text = null;
		private var playerOne:PlayerOne = null;
		private var winnerOwner:Entity = null;
		private var restartOwner:Entity = null;
		private var dropTime:int;
		private var dropTimeCounter:Number = 0 ;
		
		private var mainTheme:Sfx = null;
		public function GameWorld() 
		{
			dropTime = Utils.randomRange(3, 10);
			
			mainTheme = new Sfx(Assets.MAIN_THEME);
		

		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new BackGround());
			add(new Level(Assets.LEVEL_01));

/*			mainTheme.volume = 1;
				mainTheme.loop();
			if (!mainTheme.playing)
				mainTheme.play();*/
				

		}
		
		override public function update():void 
		{
			super.update();
			//
			//if(!mainTheme.playing)
				//mainTheme.loop();
		
			existP1 = (this.classCount(PlayerOne) > 0)
			existP2 = (this.classCount(PlayerTwo) > 0)
			
			if (!existP1 || !existP2)
			{
				trace("A player has died");
				
				var winner:String = existP1 ? "player one" : "player two";
				
				if (winText == null ||restartText ==null )
				{
					winText = new Text(winner + " is the WINNER");
					winText.scale = 3;
					winText.x = (FP.screen.width - winText.scaledWidth) / 2;
					winText.y = 100;
					winnerOwner = addGraphic(winText);
					
					restartText = new Text("press space to restart");
					restartText.scale = 3.5;
					restartText.x = (FP.screen.width - restartText.scaledWidth) / 2; 
					restartText.y = FP.screen.height - 75;
					restartOwner = addGraphic(restartText);
				}

				
				
				if (Input.check(Key.SPACE))
				{
					remove(winnerOwner);
					remove(restartOwner);
					restartText = null;
					winText = null;
					removeAll();
					
					add(new BackGround());
					add(new Level(Assets.LEVEL_01));
					
					if (mainTheme.playing)
					{
						mainTheme.stop();
						mainTheme.play();
					}
				}
			}
			
			dropTimeCounter += FP.elapsed;
			//trace(dropTimeCounter);
			if (dropTimeCounter >= dropTime)
			{
				add(new Item());
				dropTimeCounter = 0;
				dropTime = Utils.randomRange(3, 10);
			}
		}
	}

}