package
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;
	import org.myleft.data.Define;
	
	public final class Zhubajie extends Character
	{
		public function Zhubajie(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/zhubajie_01.png', 226, 170, -110, -100);
			this.walkSprite = new BitmapSprite('assets/character/zhubajie_02.png', 214, 155, -104, -92);
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			this.duration = 0.6;
		}
	}
}