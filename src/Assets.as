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
		
		[Embed(source = "../levels/L_01_2.oel", mimeType = "application/octet-stream")]
		public static const LEVEL_01:Class;
		
		[Embed(source="../assets/bullet.png")]
		public static const BULLET:Class;
		
		[Embed(source="../assets/bullet2.png")]
		public static const BULLET2:Class;
		
		[Embed(source="../assets/god.png")]
		public static const ITEM_GOD:Class;
		[Embed(source="../assets/health.png")]
		public static const ITEM_HEALTH:Class;
		
		[Embed(source="../assets/shield_anim.png")]
		public static const ITEM_SHIELD_ANIM:Class;
	}

}