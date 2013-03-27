package org.myleft.core {
	
	import com.greensock.TweenLite;
	import com.greensock.events.TweenEvent;
	import com.greensock.easing.Strong;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.aswing.ASColor;
	import org.aswing.JLabel;
	import org.aswing.JTextArea;
	import org.aswing.border.LineBorder;
	import org.myleft.core.BitmapSprite;
	import org.myleft.events.CharacterEvent;

	public class Character extends Sprite
	{
		public var duration:Number = 1;
		public var menuArray:Array = [
			{id:"stand", label:"站立", alpha:0.7},
			{id:"walk", label:"跑步", alpha:0.7}
			];
		
		private var _sprite:BitmapSprite;
		
		protected var standSprite:BitmapSprite;
		protected var walkSprite:BitmapSprite;
		protected var sitdownSprite:BitmapSprite;
		
		protected var tile:BitmapSprite;
		
		protected var c:Sprite;
		protected var label:JLabel;
		protected var message:JTextArea;
		
		public function Character(username:String='')
		{
			if (tile)
			{
				tile.x = -tile.width/2;
				this.addChild(tile);
			}
			
			_sprite = standSprite;
			
			c = new Sprite;
			c.addChild(sprite);
			this.addChild(c);

			label = new JLabel(username);
			label.setForeground(new ASColor(0xff6600));
			label.setOpaque(true);
			label.setBackground(new ASColor(0xffffff));
			
			label.setBorder(new LineBorder());
			label.pack();
			label.setLocationXY(tile.x+tile.width/2-label.width/2, tile.y - 2*tile.height);
			this.addChild(label);
			
			message = new JTextArea();
			message.setPreferredWidth(160);
			message.setWordWrap(true);
			message.alpha = 0;
			message.setBackground(new ASColor(0, 0));
			message.setForeground(new ASColor(0xff0000));
			//message.setOpaque(true);
			message.setBorder(new LineBorder());
			this.addChild(message);
		}		
		
		public function get sprite():BitmapSprite
		{
			return _sprite;
		}

		public function walk(frame:int=0):void
		{
			doing('walk', walkSprite, frame);
		}
		
		public function stand(frame:int=0):void
		{
			doing('stand', standSprite, frame);
		}
		
		public function talk(m:String):void
		{
			trace('talk', m);
			message.setHtmlText(m);
			message.pack();
			message.setAlpha(0);
			message.setLocationXY(label.x, label.y);
			
			//object: 你要移动的对象。例如：a[i]，就是10个小球。
			//property: 就是要按照那个属性运动。例如：_x就是沿着水平方向运动。
			//function: easing类的一个方法。我用的是easing.Elastic.easeOut，easing有六大类方法：Strong，Back，Elastic，Regular，Bounce，None。每个类都有四个方法 easeIn，easeOut，easeInOut，easeNone。要看各个方法的效果，就看上面提到的那个老外的blog里面各种方法的效果都有。
			//begin，end: 属性的初始值和结束值。
			//duration: 效果需要运行的时间或帧数
			//useSeconds: 布尔变量,false为取决于帧,true为取决于时间,默认为false 
			TweenLite.to(message, 2, {alpha:1, "y":label.y - message.height, ease:Strong.easeInOut, onComplete:function ():void {
				TweenLite.to(message, 2, { alpha:0, ease:Strong.easeInOut, delay:1 } );
			}});			
		}
		
		public function toggleDirection():void
		{
			if (sprite.Direction<=2)
			{
				setDirection(sprite.Direction + 1);
			}
			else
			{
				setDirection(0);
			}
		}

		public function setDirection(v:int):void
		{
			if (v<=3 && v>=0) {
				sprite.Direction = v;
				sprite.play();
			}
		}

		public function getDirection():int
		{
			return sprite.Direction;
		}
		
		public function call(func:String, frame:int=-1):void
		{
			if (func.length<=0)
			{
				return;
			}
			var methodExist:Boolean;
			try {
				methodExist = this[func] !=null;
				this[func](frame);
			} catch (e:Error) {
				methodExist = false;
			} finally {
			}
		}
		
		public function doing(value:String, sprite:BitmapSprite, frame:int):void
		{
			if (sprite)
			{
				dispatchEvent(new CharacterEvent(CharacterEvent.DOING, value));
				if (_sprite.hasEventListener(Event.COMPLETE))
				{
					_sprite.removeEventListener(Event.COMPLETE, complete);
				}
				sprite.Direction = _sprite.Direction;
				
				_sprite.stop();
				c.removeChild(_sprite);
				
				_sprite = sprite;
				
				c.addChild(_sprite);
				_sprite.play(frame);
				if (!_sprite.hasEventListener(Event.COMPLETE))
				{
					_sprite.addEventListener(Event.COMPLETE, complete);
				}
			}
		}
		
		public function complete(e:Event):void
		{
			if (_sprite.hasEventListener(Event.COMPLETE))
			{
				_sprite.removeEventListener(Event.COMPLETE, complete);
			}
			if (_sprite.nextdoing)
			{
				call(_sprite.nextdoing, 0);
			}
		}
	}
}
