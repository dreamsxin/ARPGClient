/*
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
Contact: auzn1982@gmail.com
*/
package com.kingnare.containers
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import com.greensock.TweenLite;
	import com.greensock.events.TweenEvent;
	import com.greensock.easing.Strong;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.geom.Rectangle;
	
	import com.kingnare.utils.Filters;
	import com.kingnare.events.FlashDynamicEvent;

	public class SectorCreator extends Sprite
	{
		private var _line_thickness:uint=1;
		private var _line_color:uint=0x008EE6;
		private var _fill_color:uint=0x007ED7;
		private var _fill_alpha:Number=0.7;
		private var _fill_alpha_old:Number=0.7;
		private var _rotation:Number=0;
		private var _x:Number=0;
		private var _y:Number=0;
		private var _r:Number=0;
		private var _R:Number=10;
		private var _angle:Number=360;
		private var _start:Number=0;
		private var _fold:Boolean=false;
		private var _tween:TweenLite;
		private var _label:TextField;
		private var _labelText:String = "";

		//Init
		public function SectorCreator(x:Number, y:Number, r:Number, R:Number, angle:Number,start:Number)
		{
			_x=x;
			_y=y;
			_r=r;
			_R=R;
			_angle=angle;
			_start=start;
			_label = new TextField();

			drawSector(_x, _y, _r, _R, _angle, _start);

			this.addEventListener(MouseEvent.ROLL_OVER, rollOverEvent);
			this.addEventListener(MouseEvent.ROLL_OUT, rollOutEvent);
		}
		
		private function drawSector(x:Number, y:Number, r:Number, R:Number, angle:Number, startA:Number):void
		{
			this.graphics.clear();

			this.graphics.lineStyle(_line_thickness, _line_color);
			this.graphics.beginFill(_fill_color, _fill_alpha);

			if (Math.abs(angle) > 360)
			{
				angle=360;
			}
			var n:Number = Math.ceil(Math.abs(angle) / 45);
			var angleA:Number=angle / n;
			angleA = angleA * Math.PI / 180;
			startA = startA * Math.PI / 180;
			var startB:Number = startA;
			//起始边
			this.graphics.moveTo(x + r * Math.cos(startA), y + r * Math.sin(startA));
			this.graphics.lineTo(x + R * Math.cos(startA), y + R * Math.sin(startA));
			//外圆弧
			for (var i:uint=1; i <= n; i++)
			{
				startA += angleA;
				var angleMid1:Number=startA - angleA / 2;
				var bx:Number = x + R / Math.cos(angleA / 2) * Math.cos(angleMid1);
				var by:Number = y + R / Math.cos(angleA / 2) * Math.sin(angleMid1);
				var cx:Number = x + R * Math.cos(startA);
				var cy:Number = y + R * Math.sin(startA);
				this.graphics.curveTo(bx, by, cx, cy);
			}
			//内圆起点
			this.graphics.lineTo(x + r * Math.cos(startA),y + r * Math.sin(startA));
			//内圆弧
			for (var j:uint = n; j >= 1; j--)
			{
				startA-= angleA;
				var angleMid2:Number=startA + angleA / 2;
				var bx2:Number=x + r / Math.cos(angleA / 2) * Math.cos(angleMid2);
				var by2:Number=y + r / Math.cos(angleA / 2) * Math.sin(angleMid2);
				var cx2:Number=x + r * Math.cos(startA);
				var cy2:Number=y + r * Math.sin(startA);
				this.graphics.curveTo(bx2, by2, cx2, cy2);
			}
			//内圆终点
			this.graphics.lineTo(x + r * Math.cos(startB),y + r * Math.sin(startB));
			//完成填充
			this.graphics.endFill();
		}
		//rollover event
		private function rollOverEvent(event:MouseEvent):void
		{
			_fill_alpha = 1;
			update();
		}
		//rollout event
		private function rollOutEvent(event:MouseEvent):void
		{
			_fill_alpha = _fill_alpha_old;
			update();
		}
		//
		public function createTweenAfter(time:Number, value:Number, tweenTime:Number=0.6, angle:Number=0):void
		{
			var timer:Timer = new Timer(time, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerEnd);
			timer.start();
			function timerEnd(event:TimerEvent):void
			{
				createAfter(value, tweenTime, angle);
			}
		}
		//
		public function createAfter(value:Number, tweenTime:Number, angle:Number):void
		{
			var oldStart:Number = this.start;
			TweenLite.to(this, tweenTime, {"start":value, ease:Strong.easeInOut, onComplete:motioned, onUpdate:motioning});
			var tmp:SectorCreator = this;			
			function motioning():void
			{

				if (Math.abs(tmp.angle) >= angle)
				{
					tmp.angle = angle;
				}
				else
				{
					tmp.angle=Math.abs(oldStart - tmp.start);
				}
			}
			function motioned():void
			{
				tmp.createText();
				tmp.dispatchEvent(new FlashDynamicEvent("created"));
			}
		}
		public function removeTweenAfter(time:Number, value:Number, tweenTime:Number=0.6, angle:Number=0):void
		{
			var timer:Timer=new Timer(time, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerEnd);
			timer.start();
			function timerEnd(event:TimerEvent):void
			{
				removeAfter(value, tweenTime, angle);
			}
		}
		public function removeAfter(value:Number, tweenTime:Number, angle:Number):void
		{
			removeText();
			var oldStart:Number = this.start;
			TweenLite.to(this, tweenTime, {"start":value, ease:Strong.easeInOut, onComplete:motioned, onUpdate:motioning});
			var tmp:SectorCreator = this;
			function motioning():void
			{
				if (Math.abs(value - tmp.start) < angle)
				{
					tmp.angle=Math.abs(value - tmp.start);
				}
				else
				{
					tmp.angle = angle;
				}
			}
			function motioned():void
			{
				tmp.dispatchEvent(new FlashDynamicEvent("cellRemoved"));
			}
		}
		public function createText():void
		{
			_label = new TextField();
			_label.selectable = false;
			_label.autoSize = "center";
			_label.textColor = 0xFFFFFF;
			var fmt:TextFormat = new TextFormat();
			fmt.font = "Arial";
			_label.defaultTextFormat = fmt;
			_label.text = _labelText;
			var rect:Rectangle = this.getBounds(this.parent);
			_label.x = rect.x+rect.width/2-_label.width/2;
			_label.y = rect.y+rect.height/2-_label.height/2;
			addChild(_label);
		}
		public function removeText():void
		{
			if (_label)
			{
				removeChild(_label);
				_label = null;
			}
		}
		protected function update():void
		{
			drawSector(_x, _y, _r, _R, _angle, _start);
		}

		public function set angle(value:Number):void
		{
			_angle = value;
			update();
		}
		public function get angle():Number
		{
			return _angle;
		}
		public function set start(value:Number):void
		{
			_start = value;
			update();
		}
		public function get start():Number
		{
			return _start;
		}
		public function set label(value:String):void
		{
			_labelText = value;
			if (_label)
			{
				_label.text = value;
				var rect:Rectangle = this.getBounds(this.parent);
				_label.x = rect.x+rect.width/2 - _label.width/2;
				_label.y = rect.y+rect.height/2 - _label.height/2;
			}
		}
		public function set lineColor(value:Number):void
		{
			_line_color = value;
			update();
		}
		public function set fillColor(value:Number):void
		{
			_fill_color = value;
			update();
		}
		public function set fillAlpha(value:Number):void
		{
			_fill_alpha = value;
			_fill_alpha_old = value;
			update();
		}
	}
}