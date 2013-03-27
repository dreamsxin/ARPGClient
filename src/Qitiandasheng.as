package
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;
	import org.myleft.data.Define;
	
	public final class Qitiandasheng extends Character
	{
		protected var daxiaoSprite:BitmapSprite;
		protected var shuaitoufaSprite:BitmapSprite;
		protected var fenshenSprite:BitmapSprite;
		protected var waitSprite:BitmapSprite;
		protected var attackSprite:BitmapSprite;
		
		public function Qitiandasheng(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/qitiandasheng_01.png', 250, 220, -170, -150);
			this.walkSprite = new BitmapSprite('assets/character/qitiandasheng_02.png', 255, 199, -140, -140);
			this.fenshenSprite = new BitmapSprite('assets/character/qitiandasheng_03.png', 305, 279, -160, -169, Define.PLAY_MODE_NOCYCLE, 'stand');
			this.waitSprite = new BitmapSprite('assets/character/qitiandasheng_04.png', 250, 228, -170, -158, Define.PLAY_MODE_NOCYCLE, 'stand');
			this.attackSprite = new BitmapSprite('assets/character/qitiandasheng_05.png', 361, 319, -206, -219, Define.PLAY_MODE_NOCYCLE, 'stand');
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			this.duration = 0.5;
			this.menuArray.push(
				{id:"fenshen", label:"分身", alpha:0.7},
				{id:"wait", label:"等待", alpha:0.7},
				{id:"attack", label:"攻击", alpha:0.7}
			);
		}
		
		public function fenshen(frame:int=0):void
		{
			doing('fenshen', fenshenSprite, frame);
		}
		
		public function wait(frame:int=0):void
		{
			doing('wait', waitSprite, frame);
		}
		
		public function attack(frame:int=0):void
		{
			doing('attack',attackSprite, frame);
		}
	}
}