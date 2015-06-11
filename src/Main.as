package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(800, 600);
			
			FP.world = new GameWorld();
		}
		
		override public function update():void 
		{
			super.update();
			
			 if (Input.pressed(Key.F1))
				FP.console.enable();
		}
	}
	
}