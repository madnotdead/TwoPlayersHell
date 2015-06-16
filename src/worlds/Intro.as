package worlds 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Intro extends World 
	{
		private var titleText:Text;
		private var pressButtonText:Text;
		
		private var titleTween:VarTween = null;
		private var pressButton:VarTween = null;
		private var titleOwner:Entity;
		private var pressOwner:Entity;
		public function Intro() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			titleText = new Text("Two players's hell");
			titleText.scale = 3;
			titleText.x = (FP.screen.width - titleText.scaledWidth)/2;
			titleText.y = 100;
			titleOwner = addGraphic(titleText);
			
			pressButtonText = new Text("press any key to play");
			pressButtonText.scale = 2;
			pressButtonText.x =(FP.screen.width - pressButtonText.scaledWidth)/2;
			pressButtonText.y = 500;
			pressOwner = addGraphic(pressButtonText);
		}
		
		override public function removeAll():void 
		{
			super.removeAll();
			
			remove(titleOwner);
			remove(pressOwner);
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.check(Key.ANY))
			{
				removeAll();
				FP.world = new GameWorld();
			}
		}
		
		
		
	}

}