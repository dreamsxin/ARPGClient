package component
{
	public final class ComboboxItem
	{
		private var _id:String;
		private var _name:String;
		public function ComboboxItem(id:String, name:String)
		{ 
			this._id = id;
			this._name = name;
		}
		
		public function set id(value:String):void{
			this._id= value;
		}
		
		public function get id():String{
			return this._id;
		}
		
		
		public function set name(value:String):void{
			this._name = value;
		}
		
		public function get name():String{
			return this._name;
		}
		
		
		//注意这里
		public function toString():String{
			return this._name;
		}
	}
}