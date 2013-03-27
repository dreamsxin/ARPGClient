package
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;
	import org.myleft.data.Define;
	
	public final class Foxfairy extends Character
	{
		protected var daxiaoSprite:BitmapSprite;
		protected var shuaitoufaSprite:BitmapSprite;
		protected var qinganSprite:BitmapSprite;
		protected var jiaoxiaoSprite:BitmapSprite;
		
		public function Foxfairy(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/foxfairy_01.png', 96, 109, -45, -65);//以这个为基础坐标
			this.walkSprite = new BitmapSprite('assets/character/foxfairy_02.png', 116, 112, -55, -75);//基础坐标 + 跟基础值差/2
			this.sitdownSprite = new BitmapSprite('assets/character/foxfairy_03.png', 124, 124, -59, -64, Define.PLAY_MODE_NOCYCLE);
			
			this.daxiaoSprite = new BitmapSprite('assets/character/foxfairy_04.png', 110, 110, -52, -66, Define.PLAY_MODE_NOCYCLE, 'stand');
			this.jiaoxiaoSprite = new BitmapSprite('assets/character/foxfairy_07.png', 96, 108, -45, -65, Define.PLAY_MODE_NOCYCLE, 'stand');
			this.shuaitoufaSprite = new BitmapSprite('assets/character/foxfairy_05.png', 92, 110, -43, -67, Define.PLAY_MODE_NOCYCLE, 'stand');
			this.qinganSprite = new BitmapSprite('assets/character/foxfairy_06.png', 94, 118, -44, -69, Define.PLAY_MODE_NOCYCLE, 'stand');
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			this.duration = 0.7;
			this.menuArray.push(
				{id:"sitdown", label:"坐下", alpha:0.7},
				{id:"daxiao", label:"大笑", alpha:0.7},
				{id:"jiaoxiao", label:"娇笑", alpha:0.7},
				{id:"shuaitoufa", label:"撒娇", alpha:0.7},
				{id:"qingan", label:"请安", alpha:0.7}
			);
		}
		
		public function sitdown(frame:int=0):void
		{
			doing('sitdown', sitdownSprite, frame);
		}
		
		public function daxiao(frame:int=0):void
		{
			doing('daxiao', daxiaoSprite, frame);
		}
		
		public function shuaitoufa(frame:int=0):void
		{
			doing('shuaitoufa', shuaitoufaSprite, frame);
		}
		
		public function qingan(frame:int=0):void
		{
			doing('qingan', qinganSprite, frame);
		}
		
		public function jiaoxiao(frame:int=0):void
		{
			doing('jiaoxiao', jiaoxiaoSprite, frame);
		}
	}
}