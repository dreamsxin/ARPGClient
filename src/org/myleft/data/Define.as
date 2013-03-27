package org.myleft.data
{
	public class Define
	{
		//模式
		public static const PLAY_MODE_NOCYCLE:int = 0;
		public static const PLAY_MODE_CYCLE:int = 1;
		public static const PLAY_MODE_NEXT:int = 2;
		
		//方向
		public static const DIRECTION_LEFT:int = 2;
		public static const DIRECTION_RIGHT:int = 0;
		public static const DIRECTION_UP:int = 1;
		public static const DIRECTION_DOWN:int = 3;
		
		//动作
		public static const ACT_STAND:int = 1;
		public static const ACT_WALK:int = 2;
		public static const ACT_SIT:int = 3;
		public static const ACT_SMILE:int = 4;
		public static const ACT_SWAG:int = 5;
		
		//类型
		public static const WINDOW_TYPE_MAIN:String = "WINDOW_TYPE_MAIN";
		public static const WINDOW_TYPE_ROOM:String = "WINDOW_TYPE_ROOM";
		public static const WINDOW_TYPE_CHAT:String = "WINDOW_TYPE_CHAT";
		
		public static const AUTH_TYPE_AUTH:String = "AUTH_TYPE_AUTH";
		public static const AUTH_TYPE_ANONYMOUS:String = "AUTH_TYPE_ANONYMOUS";
		public static const AUTH_TYPE_SIGN:String = "AUTH_TYPE_SIGN";
		
		public static const STATUS_AUTH_SUCCESS:String = "STATUS_AUTH_SUCCESS";
		public static const STATUS_AUTH_FAILURE:String = "STATUS_AUTH_FAILURE";
		
		//事件	
		public static const CONNECTING:String = "CONNECTING";
		public static const CONNECT:String = "CONNECT";
		public static const ACTIVATE:String = "ACTIVATE";
		
		public static const CLOSE:String = "CLOSE";
		public static const NODEFINE:String = "NODEFINE";
		
		public static const DECODE_OK:String = "DECODE_OK";
		public static const DECODE_ERROR:String = "DECODE_ERROR";		
		
		public static const EV_TYPE_PING:String = '0';
		
		public static const EV_TYPE_AUTH:String = '10';
		public static const EV_TYPE_AUTH_OTHER_LOGIN:String = '11';
		public static const EV_TYPE_AUTH_SUCCESS:String = '12';
		public static const EV_TYPE_AUTH_FAILURE:String = '13';
		public static const EV_TYPE_CHANGE_CHARACTER:String = '14';
		
		public static const EV_TYPE_USER_LOGIN:String = '20';
		public static const EV_TYPE_USER_LOGOUT:String = '21';
		public static const EV_TYPE_USER_ADD:String = '22';
		
		public static const EV_TYPE_MESSAGE:String = '30';
		public static const EV_TYPE_SYSTEM_MESSAGE:String = '31';
		public static const EV_TYPE_PUBLIC_MESSAGE:String = '32';
		public static const EV_TYPE_PRIVATE_MESSAGE:String = '33';
		
		public static const EV_TYPE_CHANGE_ROOM:String = '40';
		public static const EV_TYPE_GET_ROOM_LIST:String = '41';
		public static const EV_TYPE_ROOM_ADD:String = '42';
		public static const EV_TYPE_LEAVE_ROOM:String = '43';
		
		public static const EV_TYPE_ADMIN_COMMAND_GOOUT:String = '90';
		public static const EV_TYPE_ADMIN_COMMAND_SHUTUP:String = '91';
		
		public static const EV_TYPE_MOVE:String = '100';
		public static const EV_TYPE_DOING:String = '101';
	}
}