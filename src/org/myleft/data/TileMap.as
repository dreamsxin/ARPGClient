package org.myleft.data
{
	import __AS3__.vec.Vector;
	
	import org.myleft.astar.IAStarSearchable;	

	public class TileMap implements IAStarSearchable
	{
		
		private var width:int;
		private var height:int;
		
		private var map:Vector.<Vector.<Tile>>;
		
		/**
		 * 	CONSTRUCTOR
		 * 
		 */
		function TileMap(width:int=0, height:int=0) {
			if (width && height){
				initialize(width, height);
			}
		}
		
		public function getWidth():int {
			return width;
		}
		
		public function getHeight():int {
			return height;
		}
		
		/**
		 * 	Size the map and fill with empty tiles
		 * 
		 */
		public function initialize(width:int, height:int):void
		{
			this.width = width;
			this.height = height;
			map = new Vector.<Vector.<Tile>>(width);//new Array(width);
			for (var x:int=0; x<width; x++) {
				map[x] = new Vector.<Tile>(height);
				for (var y:int=0; y<height; y++) {
					map[x][y] = new Tile();
				}
			}
		}
		
		/**
		 * 	Return a Tile at this position
		 * 
		 */
		public function getTile(x:int, y:int):Tile {
			return map[x][y];
		}

		/**
		 * 
		 */
		public function setWalkableRect(x:int, y:int, w:int, h:int, walkable:Boolean):void
		{
			for (var i:int=0; i<w;i++)
			{
				for (var j:int=0; j<h;j++)
				{
					map[x+i][y+j].walkable = walkable;
				}
			}
		}
		
		
		public function setWalkable(x:int, y:int, walkable:Boolean):void
		{
			map[x][y].walkable = walkable;
		}
			
		public function isWalkable(x:int, y:int):Boolean
		{
			return outOfBoundsCheck(x,y) && Tile(map[x][y]).walkable;
		}

		
		
		private function outOfBoundsCheck(x:int, y:int):Boolean
		{
			return Boolean(!(x<0||x>width-1||y<0||y>height-1));
		}
	
		
	}
}