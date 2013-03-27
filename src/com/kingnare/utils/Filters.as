package com.kingnare.utils
{
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterType;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	
	public class Filters
	{
		//获取BevelFilter滤镜
		public static  function getBevelFilter():BitmapFilter
		{
			var distance:Number       = 6;
			var angleInDegrees:Number = 45;
			var highlightColor:Number = 0xFFFFFF;
			var highlightAlpha:Number = 0.6;
			var shadowColor:Number    = 0xFFFFFF;
			var shadowAlpha:Number    = 0;
			var blurX:Number          = 10;
			var blurY:Number          = 10;
			var strength:Number       = 0.8;
			var quality:Number        = BitmapFilterQuality.LOW;
			var type:String           = BitmapFilterType.INNER;
			var knockout:Boolean      = false;
			return new BevelFilter(distance,angleInDegrees,highlightColor,highlightAlpha,shadowColor,shadowAlpha,blurX,blurY,strength,quality,type,knockout);
		}

		//获取DropShadow滤镜
		public static function getDropShadowFilter():BitmapFilter
		{
			var color:Number = 0x000000;
			var angle:Number = 45;
			var alpha:Number = 0.9;
			var blurX:Number = 5;
			var blurY:Number = 5;
			var distance:Number = 5;
			var strength:Number = 0.9;
			var inner:Boolean = false;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.LOW;
			return new DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout);
		}
		
	}
	
}