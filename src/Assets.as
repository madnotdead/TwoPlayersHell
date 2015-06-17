package 
{
	/**
	 * ...
	 * @author madnotdead
	 */
	public class Assets 
	{
		[Embed(source="../assets/image/background.png")]
		public static const BACKGROUND:Class;
		
		[Embed(source ="../assets/image/player1.png")]
		public static const PLAYER_ONE:Class;
		
		[Embed(source = "../assets/image/player2.png")]
		public static const PLAYER_TWO:Class;
		
		[Embed(source = "../assets/image/lofi_environment.png")]
		public static const TILES:Class;
		
		[Embed(source = "../levels/L_01_2.oel", mimeType = "application/octet-stream")]
		public static const LEVEL_01:Class;
		
		[Embed(source="../assets/image/bullet.png")]
		public static const BULLET:Class;
		
		[Embed(source="../assets/image/bullet2.png")]
		public static const BULLET2:Class;
		
		[Embed(source="../assets/image/god.png")]
		public static const ITEM_GOD:Class;
		[Embed(source="../assets/image/health.png")]
		public static const ITEM_HEALTH:Class;
		
		[Embed(source="../assets/image/shield_anim.png")]
		public static const ITEM_SHIELD_ANIM:Class;
		
		[Embed(source="../assets/image/player1_god.png")]
		public static const PLAYER_ONE_GOD:Class;
		
		[Embed(source="../assets/image/player2_god.png")]
		public static const PLAYER_TWO_GOD:Class;
		
		[Embed(source="../assets/audio/main.mp3")]
		public static const MAIN_THEME:Class;
		
		[Embed(source="../assets/audio/shoot1.mp3")]
		public static const PLAYER_ONE_SHOOT:Class;
		
		[Embed(source="../assets/audio/shoot2.mp3")]
		public static const PLAYER_TWO_SHOOT:Class;
		
	}

}