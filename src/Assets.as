package 
{
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Assets 
	{
		[Embed(source="../assets/background.png")]
		public static const BACKGROUND:Class;
		
		[Embed(source ="../assets/player1.png")]
		public static const PLAYER_ONE:Class;
		
		[Embed(source = "../assets/player2.png")]
		public static const PLAYER_TWO:Class;
		
		[Embed(source = "../assets/lofi_environment.png")]
		public static const TILES:Class;
		
		[Embed(source = "../levels/L_01.oel", mimeType = "application/octet-stream")]
		public static const LEVEL_01:Class;
		
		[Embed(source="../assets/bullet.png")]
		public static const BULLET:Class;
	}

}