package
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;
	import org.myleft.data.Define;
	
	public final class Huadan extends Character
	{
		protected var shuaixiuSprite:BitmapSprite;
		protected var attackSprite:BitmapSprite;
		public function Huadan(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/huadan_01.png', 136, 126, -76, -62);
			this.walkSprite = new BitmapSprite('assets/character/huadan_02.png', 168, 129, -80, -65);
			
			this.shuaixiuSprite = new BitmapSprite('assets/character/huadan_03.png', 260, 228, -130, -125);
			this.attackSprite = new BitmapSprite('assets/character/huadan_04.png', 320, 298, -160, -202);
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			this.duration = 1;
			this.menuArray.push(
				{id:"shuaixiu", label:"甩袖", alpha:0.7},
				{id:"attack", label:"攻击", alpha:0.7}
			);
		}
		
		public function shuaixiu(frame:int=0):void
		{
			doing('shuaixiu', shuaixiuSprite, frame);
		}
		
		public function attack(frame:int=0):void
		{
			doing('attack',attackSprite, frame);
		}
	}
}