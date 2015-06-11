package  
{
	import entities.PlayerOne;
	import entities.PlayerTwo;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author alex larioza
	 */
	public class Level extends Entity 
	{
		private var xml:XML;
		private var tile_layer1:Tilemap;
		private var tile_layer2:Tilemap;
		private var grid:Grid;
		
		public function Level(rawData:Class) 
		{
			super(0, 0);
			
			// to check for level collisions
			type = "level"; 
			
			// FlashPunk function makes get all that data super easy!
			this.xml = FP.getXML(rawData);
		}
		
		override public function added():void 
		{
			super.added();
			
			// load tiles
			// bottom tile layer
			
			tile_layer1 = new Tilemap(Assets.TILES, xml.@width, xml.@height, 16, 16);
			tile_layer1.loadFromString(xml.background);
			trace(xml.tile_layer1);
			
			// top tile layer (details)
			tile_layer2 = new Tilemap(Assets.TILES, xml.@width, xml.@height, 16, 16);
			tile_layer2.loadFromString(xml.tileset);
			
			// set graphic to graphiclist of tilesets, order matters!
			graphic = new Graphiclist(tile_layer1, tile_layer2);
			
			// load the collision grid
			grid = new Grid(xml.@width, xml.@height, 16, 16);
			grid.loadFromString(xml.grid, "");
			
			// set the grid to the mask of this entity
			mask = grid;
			
			// load entities
			var list:XMLList; // holds an xmllist
			var element:XML; // a specific xml element
			
			// for each player in the xml list
			list = xml.entities.player1;
			for each (element in list) {
				// add it
				world.add(new entities.PlayerOne(element.@x, element.@y));
			}
			
			// for each player in the xml list
			list = xml.entities.player2;
			for each (element in list) {
				// add it
				world.add(new entities.PlayerTwo(element.@x, element.@y));
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.SPACE))
				tile_layer1.visible = !tile_layer1.visible ;
		}
		
	}

}