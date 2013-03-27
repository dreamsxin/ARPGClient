package org.myleft.core
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import org.myleft.data.Define;

	public class BitmapSprite extends Sprite
	{
		public static var bitmapdatas:Dictionary = new Dictionary(true);
		private var _loaded:Boolean;
		private var _url:String;
		private var _playMode:int;
		
		private var bitmapcontext:LoaderContext = new LoaderContext();
		private var loader:Loader;
		private var allBitmapData:BitmapData;
			
		private var _unitBitmapData:BitmapData;
		private var _unitX:int;
		private var _unitY:int;
		private var _nextdoing:String;
		
		private var unitWidth:int;
		private var unitHeight:int;
		private var unitRect:Rectangle;
		
		private var unitVerticalNum:int=1;
		private var unitFrameNum:int;
		private var currentFrame:int=0;
		private var direction:int;		
		
		private var ht:Shape;
		//private var bitmap:Bitmap;
		
		public function BitmapSprite(url:String, w:int=80, h:int=91, x:int=0, y:int=0, playMode:int=1, nextdoing:String=null)
		{
			super();
			this.cacheAsBitmap = true;
			this._loaded = false;
			this._url = url;
			this._playMode = playMode;
			this._nextdoing = nextdoing;
			
			this.ht = new Shape();
			this.ht.x = x;
			this.ht.y = y;
			this.addChild(ht);
			//this.bitmap = new Bitmap();
			//this.bitmap.x = x;
			//this.bitmap.y = y;
			//this.addChild(bitmap);
			
			this.unitWidth = w;
			this.unitHeight = h;
			
			this._unitX = x;
			this._unitY = y;
			
			this.direction = 0;
			
			if (!bitmapdatas[_url])
			{
				this.bitmapcontext.applicationDomain = ApplicationDomain.currentDomain;
				loader = new Loader;
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.complete);
				//loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.error);
				//loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.loading);
				loader.load(new URLRequest(_url), bitmapcontext);
			}
			else
			{
				this.allBitmapData = bitmapdatas[_url];
				this.initBitmap();
			}
		}
		
		public function get nextdoing():String
		{
			return _nextdoing;
		}

		private function loading(event:ProgressEvent):void {
			trace("图片已加载"+_url+Math.round((event.bytesLoaded/event.bytesLoaded)*100)+"%");
		}
		
		private function complete(e:Event):void
		{
			trace("图片加载成功"+_url);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.complete);
			var bitmap:Bitmap = Bitmap(e.target.loader.content);
			bitmapdatas[_url] = this.allBitmapData = bitmap.bitmapData;//.clone()
			//loader.unload();
			
			this.initBitmap();
		}
		
		private function error(e:IOErrorEvent):void
		{
			trace(e.toString());
		}
		
		public function get unitBitmapData():BitmapData
		{
			return _unitBitmapData;
		}

		public function get unitX():int
		{
			return _unitX;
		}
		
		public function get unitY():int
		{
			return _unitY;
		}
		
		private function initBitmap():void
		{
			this.unitRect = new Rectangle(0,0,this.unitWidth,this.unitHeight);
			
			this.unitFrameNum = allBitmapData.width/this.unitWidth;
			this.unitVerticalNum = allBitmapData.height/this.unitHeight;
			this._loaded = true;
			this.play(this.currentFrame);
		}
		
		public function play(frame:int=0):void
		{
			this.currentFrame = frame;
			if (!this._loaded)
			{
				return;
			}
			this.gotoAndPlay();
		}
		
		public function stop():void
		{
			if (this.hasEventListener(Event.ENTER_FRAME))
			{
				this.removeEventListener(Event.ENTER_FRAME, next);
			}
		}
		
		private function next(event:Event):void
		{
			//取当前帧
			this.currentFrame = this.currentFrame + 1;
			
			
			this.gotoAndPlay();
		}
		
		/**
		 * 移动到下一个frame
		 */
		public function gotoAndPlay():void
		{
			if (this.currentFrame > this.unitFrameNum-1)	//该方向上最后一帧，回到开始
			{
				this.currentFrame = 0;
			}
			else if (this.currentFrame<0)
			{
				this.currentFrame = this.unitFrameNum-1;
			}
			
			draw();
			
			//this.bitmap.bitmapData = unitBitmapData;
			if (this.currentFrame >= this.unitFrameNum-1 && this._playMode==Define.PLAY_MODE_NOCYCLE)
			{
				if (this.hasEventListener(Event.ENTER_FRAME)) stop();
				dispatchEvent(new Event(Event.COMPLETE));
			} 
			else if (this.unitFrameNum>1 && !this.hasEventListener(Event.ENTER_FRAME))
			{
				this.addEventListener(Event.ENTER_FRAME, next);
			}
		}
		
		public function draw():void
		{
			//根据frame和方向取动作图片
			this.unitRect.x = this.currentFrame * this.unitWidth;	//在原图片中的像素位置
			
			this.direction = this.direction%this.unitVerticalNum;
			this.unitRect.y = this.direction * this.unitHeight;		//在原图片中的像素位置			
			
			if (_unitBitmapData)
			{
				_unitBitmapData.dispose();
				_unitBitmapData = null;
			}
			
			//拷贝该frame的图片
			_unitBitmapData = new BitmapData(this.unitWidth, this.unitHeight,true,0x00000000);
			//unitBitmapData.lock();
			_unitBitmapData.copyPixels(this.allBitmapData, this.unitRect, new Point(0,0));
			//unitBitmapData.unlock();
			this.ht.graphics.clear();
			this.ht.graphics.beginBitmapFill(_unitBitmapData, null, false, true);
			this.ht.graphics.drawRect(0, 0, this.unitWidth, this.unitHeight);
			this.ht.graphics.endFill();
		}
		
		//属性
		override public function get width():Number
		{
			return this.unitWidth;
		}
		override public function get height():Number
		{
			return this.unitHeight;
		}
		
		public function get playMode():int
		{
			return this._playMode;
		}
		
		public function get Direction():int
		{
			return this.direction;
		}
		
		public function set Direction(direction:int):void
		{
			this.direction=direction;
		}
		
		public function set setCurrentFrame(frame:int):void
		{
			this.currentFrame=frame;
		}
	}
}