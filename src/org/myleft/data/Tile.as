package org.myleft.data
{
	public class Tile
	{
		
		public var walkable:Boolean;
		public var id:int;
		
		
		function Tile(walkable:Boolean=true, id:int=-1)
		{
			this.id = id;
			this.walkable = walkable;
		}
		
		
	}
}