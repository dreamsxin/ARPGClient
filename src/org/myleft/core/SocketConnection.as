package org.myleft.core
{
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.Socket;
	import flash.system.Security;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.Timer;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	import org.myleft.data.Define;
	import org.myleft.events.SocketConnectionEvent;
	
	import spark.events.IndexChangeEvent;
	
	public class SocketConnection extends EventDispatcher
	{
		private var socket:Socket;
		private var host:String;
		private var port:int;
		
		private var keepAlive:Timer;
		private var lastSendTime:Number;


		
		public function SocketConnection(target:IEventDispatcher=null)
		{
			super(target);
			socket = new Socket;

			//socket.endian=Endian.LITTLE_ENDIAN;
			socket.endian=Endian.BIG_ENDIAN;
			
			socket.addEventListener(Event.CONNECT, socketEventFunction);
			socket.addEventListener(Event.CLOSE, socketEventFunction);
			
			socket.addEventListener(Event.ACTIVATE, socketEventFunction);
			socket.addEventListener(IOErrorEvent.IO_ERROR, socketIOErrorEventFunction);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, socketSecurityErrorEventFunction);
			
			socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataFunction);
			
			keepAlive = new Timer(30000);
  			keepAlive.addEventListener(TimerEvent.TIMER, onKeepAliveLoop);

		}
		
		public function  get connected():Boolean
		{
			return socket.connected;
		}
		
		private function onKeepAliveLoop(evt:TimerEvent):void
		{       
			
			//if((new Date().getTime() - lastSendTime > 15000))
			if ( socket.connected ) {
				this.sendKeepAlive();
			}
			else
			{
				keepAlive.stop();
				
				var e:SocketConnectionEvent;
				e = new SocketConnectionEvent(Define.CLOSE);
				dispatchEvent( e );
			}
			
		}
		
		public function connect(host:String, port:int):void
		{
			if ( !socket.connected ) {
				
				dispatchEvent( new SocketConnectionEvent(Define.CONNECTING) );
				//Security.loadPolicyFile("xmlsocket://"+host+":"+port.toString());
				this.host = host;
				this.port = port;
				socket.connect(this.host, this.port);
			}
		}

		public function disconnect():void
		{
			keepAlive.stop();
			socket.close();
		}

		public function send( message:String ):void
		{
			trace('send', message);
			if ( socket.connected ) {
				
				var bytes:ByteArray = new ByteArray();
				//bytes.endian = Endian.BIG_ENDIAN;
				bytes.writeUTFBytes(message);
				bytes.compress();
				
				var endbytes:ByteArray = new ByteArray();
				endbytes.writeUnsignedInt(bytes.length);
				endbytes.writeBytes(bytes);
				try {
					socket.writeBytes(endbytes);//writeUTFBytes(message);
				} catch (e:IOError) {
					trace(e);
				}
				
				socket.flush();
			}
		}

		public function sendKeepAlive():void
		{
			this.send("<ping/>");
		}
		
		private function socketEventFunction(event:Event):void
		{
			var e:SocketConnectionEvent;
			switch (event.type)
			{
				case Event.CONNECT:
					//this.send(Event.CONNECT);
					e = new SocketConnectionEvent(Define.CONNECT);
					keepAlive.start();
					break;
				case Event.CLOSE:
					//this.send(Event.CONNECT);
					e = new SocketConnectionEvent(Define.CLOSE);
					keepAlive.stop();
					break;
				case Event.ACTIVATE:
					e = new SocketConnectionEvent(Define.ACTIVATE);
					break;
				default:
					e = new SocketConnectionEvent(Define.NODEFINE);
			}
			
			//dispatchEvent( new Event(Event.CONNECT) );
			dispatchEvent( e );
		}
		
		private function socketIOErrorEventFunction(event:IOErrorEvent):void
		{
			var e:SocketConnectionEvent;
			e = new SocketConnectionEvent(Define.CLOSE);
			dispatchEvent( e );
		}
		
		
		private function socketSecurityErrorEventFunction(event:SecurityErrorEvent):void
		{
			var e:SocketConnectionEvent;
			e = new SocketConnectionEvent(Define.CLOSE);
			dispatchEvent( e );
		}
		
		private var isHeader:Boolean = true;
		private var isBody:Boolean = false;
		private var msgLength:uint = 0;
		private var msgBody:ByteArray = new ByteArray();
		private function socketDataFunction(event:ProgressEvent):void
		{
			
			trace('socketDataFunction socket.bytesAvailable', socket.bytesAvailable);
			var str:String = "";
			while (socket.bytesAvailable > 0) {
				trace('socketDataFunction isHeader', isHeader);
				if (isHeader == true) {
					if (socket.bytesAvailable>=4) {
						msgLength = socket.readUnsignedInt();
						trace('socketDataFunction msgLength', msgLength);
						if (msgLength > 0) {
							isHeader = false;
						}
					} else {
						break;
					}
				} else {
					
					if (socket.bytesAvailable >= msgLength) {
						socket.readBytes(msgBody, 0, msgLength);
						
						uncompress(msgBody);					
						
						msgBody.clear();
						msgLength = 0;
						isHeader = true;
					} else {
						break;
					}
				}
			}
		}
		
		private function uncompress(bytedata:ByteArray):void {
			var e:SocketConnectionEvent;
			try{
				bytedata.position = 0;
				bytedata.uncompress();
				trace('uncompress bytedata', bytedata.toString());
				e = new SocketConnectionEvent(Define.DECODE_OK);
				dispatchEvent( e );
			} catch (error:Error) {
				e = new SocketConnectionEvent(Define.DECODE_ERROR);
				dispatchEvent( e );
				
			}
			parseDataReceived(bytedata);
		}
		
		private function parseDataReceived( bytedata:ByteArray ):void
		{			
			bytedata.position = 0;
			var data:String = bytedata.readUTFBytes( bytedata.length );
			//trace('parseData:', data);
			
			
			try
			{
				var nodes:XMLList = new XMLList(data).normalize();
				for(var i:int=0; i < nodes.length(); i++)
				{
					var node:XML = nodes[i];
					handleNodeType(node);
				}
		
			}
			catch (err:Error)
			{
				trace(err.toString());
			}
		}
		
		private function handleNodeType(node:XML):void
		{
			var nodeName:String = node.name();

			var e:SocketConnectionEvent;
			//trace('nodeName:', nodeName, node.attribute('type'));
			e = new SocketConnectionEvent(node.attribute('type'));
			e.body = node;
			dispatchEvent( e );
		}
	}
}