package org.myleft.events
{
	import flash.events.Event;
	
	public final class CharacterEvent extends Event
	{
		public static var COMPLETE:String = 'COMPLETE';
		public static var DOING:String = 'DOING';
		private var _body:*;
		public function CharacterEvent(type:String, body:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_body = body
		}

		public function get body():*
		{
			return _body;
		}

		public function set body(value:*):void
		{
			_body = value;
		}

	}
}