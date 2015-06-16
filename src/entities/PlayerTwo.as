package entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author madnotdead
	 */
	public class PlayerTwo extends Player 
	{
		
				public function PlayerTwo(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			
			image = new Image(Assets.PLAYER_TWO);
			graphic = image;
			mask = new Pixelmask(Assets.PLAYER_TWO);
			
			super(x, y, graphic,mask);
			
			setHitbox(image.width, image.height);
			
			leftTag = "L2";
			rightTag = "R2";
			jumpTag = "JUMP2";
			shootTag = "SHOOT2";
			// Define input keys.
			Input.define(rightTag, Key.RIGHT);
			Input.define(leftTag, Key.LEFT);
			Input.define(jumpTag, Key.UP);
			Input.define(shootTag, Key.DIGIT_0);
			
			name = Constants.PLAYER_TWO_TYPE;
			type = Constants.PLAYER_TWO_TYPE;
			
			FP.world.add(new entities.Health (700,30,this));
		}
	}

}