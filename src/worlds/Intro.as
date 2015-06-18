package worlds 
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.ColorTween;
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
		private var backgroundOwner:Entity;
		private var background:Image;
		private var alphaTween:ColorTween = null;
		private var titleColorTween:ColorTween = null;
		
		public function Intro() 
		{
			super();
			background = new Image(Assets.MAIN_BACKGROUND);
			backgroundOwner = addGraphic(background);
		}
		
		override public function begin():void 
		{
			super.begin();
			
			titleText = new Text("Two players's hell");
			titleText.scale = 3;
			titleText.x = (FP.screen.width - titleText.scaledWidth)/2;
			titleText.y = 100;
			
			titleColorTween = new ColorTween(null,LOOPING);
			titleColorTween.tween(4, 0xCCFFFF, 0x9999FF, 1, 0);
			addTween(titleColorTween, true);
			
			titleOwner = addGraphic(titleText);
			
			pressButtonText = new Text("press any key to play");
			pressButtonText.scale = 2;
			pressButtonText.x =(FP.screen.width - pressButtonText.scaledWidth)/2;
			pressButtonText.y = 500;
			alphaTween = new ColorTween(null,LOOPING);
			alphaTween.tween(.5, 0xffffff, 0xFFFF99, 1, 0);
			addTween(alphaTween, true);
			
			pressOwner = addGraphic(pressButtonText);
		}
		
		override public function removeAll():void 
		{
			super.removeAll();
			remove(backgroundOwner);
			remove(titleOwner);
			remove(pressOwner);
		}
		
		override public function update():void 
		{
			super.update();
			
			pressButtonText.color = alphaTween.color;
			titleText.color = titleColorTween.color;
			if (Input.check(Key.ANY))
			{
				removeAll();
				FP.world = new Instruction();
			}
		}
		
		
		
	}

}