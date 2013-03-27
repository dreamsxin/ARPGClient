package org.myleft.events
{
	import flash.events.Event;

	public class UIEvent extends Event
	{
		public function UIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		override public function toString():String
		{
			return '[SocketConnectionEvent type="' + type + '" bubbles=' + bubbles +
				' cancelable=' + cancelable + ' eventPhase=' + eventPhase + ']';
		}
		
	}
}