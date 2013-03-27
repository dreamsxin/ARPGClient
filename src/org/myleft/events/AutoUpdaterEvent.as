package org.myleft.events
{
	import flash.events.Event;
	
	public class AutoUpdaterEvent extends Event
	{
		public static const VERSION_CHECK_COMPLETE:String = "versionCheckComplete";
		public function AutoUpdaterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}