package com.kingnare.events
{

	import flash.events.Event;

	dynamic public class FlashDynamicEvent extends Event
	{

		public function FlashDynamicEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false)
		{
			super(type,bubbles,cancelable);
		}
	}
}