package {
	import org.myleft.core.Character;
	import org.myleft.core.BitmapSprite;

	public class Monkey extends Character
	{
		public function Monkey(username:String='')
		{
			this.standSprite = new BitmapSprite('assets/character/monkey_01.png', 88, 87, -44, -50);
			this.walkSprite = new BitmapSprite('assets/character/monkey_02.png', 88, 93, -44, -50);
			
			this.tile = new BitmapSprite('assets/tile/0.png', 100, 48);
			
			super(username);
			
		}
	}
}
