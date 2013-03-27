package {

	import com.gskinner.motion.GTween;
	
	import flash.display.Sprite;
	
	import org.aswing.ASColor;
	import org.aswing.JLabel;
	import org.aswing.border.LineBorder;
	import org.myleft.core.BitmapSprite;

	public class Item extends Sprite
	{		
		private var sprite:BitmapSprite;
		
		private var item01:BitmapSprite = new BitmapSprite('assets/item/item_01.png', 253, 127, -120, -60);
		
		private var c:Sprite;
		public function Item()
		{
			sprite = item01;
			c = new Sprite;
			c.addChild(sprite);
			this.addChild(c);
			
		}
		
		public function toggleDirection():void
		{
			if (sprite.Direction<=2)
			{
				sprite.Direction = sprite.Direction + 1;
			}
			else
			{
				sprite.Direction = 0;
			}
		}

		public function setDirection(v:int):void
		{
			if (v<=3 && v>=0) sprite.Direction = v;
		}

		public function getDirection():int
		{
			return sprite.Direction;
		}
	}
}
