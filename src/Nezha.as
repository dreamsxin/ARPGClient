package
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;
	import org.myleft.data.Define;
	
	public final class Nezha extends Character
	{
		protected var daxiaoSprite:BitmapSprite;
		protected var shuaitoufaSprite:BitmapSprite;
		
		public function Nezha(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/nezha_01.png', 164, 155, -80, -110);
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
		}
	}
}