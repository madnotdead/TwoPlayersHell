package worlds 
{
	import flash.display.Graphics;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Instruction extends World 
	{
	
		private var instruction:Text = null;
		private var background:Image = null;
		private var clickSound:Sfx = null;
		public function Instruction() 
		{
			super();
			clickSound = new Sfx(Assets.CLICK);
			clickSound.volume = 1;
		}
		
		override public function begin():void 
		{

			
			background = new Image(Assets.INSTRUCTION);
			addGraphic(background);
			
			instruction = new Text("\n\t\t      INSTRUCTIONS \n\n\n\n player one: \t  player two: \n\n A S to move \t  LEFT RIGHT to move \n W to jump \t  UP to jump \n F to shoot \t  0 to shoot\n \n\n\n\t     press space to play", 0, 0);
			instruction.scale = 2.5;
			addGraphic(instruction);
			super.begin();
		}
		
		
		override public function update():void 
		{
			super.update();
			clickSound.play();
			if (Input.pressed(Key.SPACE))
				FP.world = new GameWorld();
		}
	}

}