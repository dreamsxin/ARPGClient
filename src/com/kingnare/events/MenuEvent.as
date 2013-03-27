package com.kingnare.events
{
	import flash.events.Event;
	
	public final class MenuEvent extends Event
	{
		public static var CELL_CLICK:String = 'CELL_CLICK';
		private var _body:Object;
		public function MenuEvent(type:String, body:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_body = body;
		}

		public function get body():Object
		{
			return _body;
		}

		public function set body(value:Object):void
		{
			_body = value;
		}

	}
}