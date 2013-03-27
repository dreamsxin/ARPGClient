package org.myleft.core
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	public class HitTester
	{
		public static function realHitTest(object:Object, point:Point):Boolean {

				if(!object.hitTestPoint(point.x, point.y, true)) {
					return false;
				}
				else {
					
					var returnVal:Boolean = object.unitBitmapData.hitTest(new Point(object.unitX, object.unitY), 0, object.globalToLocal(point));
					
					return returnVal;
				}
		}
	}
}