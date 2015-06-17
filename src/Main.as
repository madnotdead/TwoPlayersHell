package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import worlds.*;
	
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(800, 600);
			
			FP.world = new Intro();
			//
			//FP.console.enable(); 
			//FP.console.toggleKey = 188; 
		}
		
	}
	
}