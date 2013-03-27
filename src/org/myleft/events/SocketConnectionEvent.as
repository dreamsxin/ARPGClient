package org.myleft.events
{
	import flash.events.Event;
	import flash.xml.XMLNode;

	public class SocketConnectionEvent extends Event
	{		
		private var _body:XML = new XML("<event/>");//如果是 XML 元素，则为 1；如果是文字节点，则为 3
		public function SocketConnectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super( type, false, false );
		}
		
		public function set body(value:XML):void{
			_body = value;
		}
		
		public function get body():XML{
			return _body;
		}

		override public function toString():String
		{
			return '[SocketConnectionEvent type="' + type + '" bubbles=' + bubbles +
				' cancelable=' + cancelable + ' eventPhase=' + eventPhase + ']';
		}
	}
}
