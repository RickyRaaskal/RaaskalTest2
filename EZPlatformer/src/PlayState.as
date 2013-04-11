package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Raaskal Games
	 */
	public class PlayState extends FlxState 
	{
		private var collisionGroup: FlxGroup = new FlxGroup;
		
		public var level:FlxTilemap;
		public var level2:FlxTilemap;
		public var level3:FlxTilemap;
		
		public var player:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			var data:Array = new Array(	
			0, 0, 0, 0, 0, 0, 
			1, 1, 1, 1, 1, 1,			
			0, 0, 0, 0, 0, 0, 
			1, 1, 1, 1, 1, 1 );
			
			level = new FlxTilemap();
			level2 = new FlxTilemap();
			level3 = new FlxTilemap();
			
			level.y = FlxG.height-100;
			
			level.loadMap(FlxTilemap.arrayToCSV(data,6),FlxTilemap.ImgAutoAlt,0, 0, 1);
			level2.loadMap(FlxTilemap.arrayToCSV(data, 6), FlxTilemap.ImgAuto, 0, 0, 1);
			level3.loadMap(FlxTilemap.arrayToCSV(data, 6), FlxTilemap.ImgAuto, 0, 0, 1);
			
			add(level);
			add(level2);
			add(level3);
			
			level.y = level.y;
			level2.y = level.y;
			level3.y = level.y;
			level2.x = level.width;
			level3.x = level2.x + level2.width;
			
			collisionGroup.add(level);
			collisionGroup.add(level2);
			collisionGroup.add(level3);
			
			//Create player (a red box)
			//player = new FlxSprite(FlxG.width / 2 - 5);
			player = new FlxSprite(FlxG.width / 5, FlxG.height / 2);
			player.makeGraphic(10,12,0xffaa1111);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x * 4;
			level.maxVelocity.x = 50;
			add(player);
		
			
			
		}
		
		override public function update():void
		{
			player.acceleration.x = 0;			
			if(FlxG.keys.SPACE && player.isTouching(FlxObject.FLOOR))
			player.velocity.y = -player.maxVelocity.y/2;
			level.velocity.x -= 0.2;
			level2.x = level.x + level.width;
			level3.x = level2.x + level2.width;
			super.update();
	
			FlxG.collide(player,collisionGroup);
		}
		
	}

}