package
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	
	public class mySound
	{
		[Embed(source="sound/msn_msg.mp3")]
		public static var msg:Class;
		
		[Embed(source="sound/msn_online.mp3")]
		public static var online:Class;
		
		private var playStatus:int = 0;
		public function mySound():void
		{
		}
		
		public function play(sound:Class):void
		{
			if (playStatus==0)
			{
				playStatus = 1;
				var s:Sound = new sound();
				var channel:SoundChannel = s.play();
				channel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);
			}
		}
		
		public function onPlaybackComplete(e:Event):void
		{
		    playStatus = 0;
		    trace('onPlaybackComplete');
		} 
	}
}