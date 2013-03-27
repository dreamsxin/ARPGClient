package org.myleft.data
{
	import as3isolib.display.IsoSprite;
	
	import com.gskinner.motion.GTween;
	
	import org.myleft.geom.IntPoint;
	
	public class User
	{
		public var id:int;
		public var username:String;
		public var leading:Boolean = false;
		public var character:String;
		public var avatar:String;
		public var role:int;
		public var type:int;
		public var point:IntPoint;
		public var nextpoint:IntPoint;
		public var display:IsoSprite;
		public var solution:Array;
		public var gt:GTween;
		public function User(username:String=null, display:IsoSprite=null, character:String = 'Monkey', x:int=1, y:int=1)
		{
			this.id = 0;
			this.avatar = '';
			this.role = 0;
			this.type = 0;
			this.username = username;
			this.gt = new GTween;
			this.display = display;
			this.point = new IntPoint(x, y);
			this.nextpoint = new IntPoint(x, y);
			this.solution = [];
		}
		
		public function toString():String{
			return this.username;
		}
		
		public function clear():void
		{
			this.point = new IntPoint(1, 1);
			this.nextpoint = new IntPoint(1, 1);
			this.solution = [];
		}

	}
}