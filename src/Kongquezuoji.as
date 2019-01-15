package 
{
	import org.myleft.core.BitmapSprite;
	import org.myleft.core.Character;

	public class Kongquezuoji extends Character 
	{
		
		public function Kongquezuoji(username:String='') 
		{
			this.standSprite = new BitmapSprite('assets/character/kongquezuoji_01.png', 548, 354, -274, -177);
			this.walkSprite = new BitmapSprite('assets/character/kongquezuoji_02.png', 646, 392, -323, -196);
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			this.duration = 0.6;
		}
		
	}

}