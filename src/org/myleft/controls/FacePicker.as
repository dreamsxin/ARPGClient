package org.myleft.controls{
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.Image;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
	import mx.events.FlexMouseEvent;
	import mx.events.SandboxMouseEvent;
	import mx.managers.IFocusManager;
	import mx.managers.PopUpManager;
	
	import org.myleft.controls.facePickerClasses.SwatchPanel;
	
	import spark.components.Group;
	
	[Event(name="itemClick", type="mx.events.ItemClickEvent")]

	[IconFile("FacePicker.png")]
	public final class FacePicker extends Group
	{
		private var initializing:Boolean = true;
		private var showingDropdown:Boolean = false;
		private var triggerEvent:Event;
		
		private var isDown:Boolean = false;
		private var isOpening:Boolean = false;
		
		private var dropdownGap:Number = 6;
		public function FacePicker()
		{
			super();
			this.width = this.height = 22;
		}
		
		[Bindable]
		[Embed("org/myleft/controls/FacePicker.png")]
		private var icoFacePicker:Class
		
		override protected function createChildren():void
		{
			super.createChildren();
			if (!enabled)
				super.enabled = enabled;
			
			initializing = false;
			var image:Image = new Image();
			image.source = icoFacePicker;
			//image.left = image.right = image.top = image.bottom = 0;
			image.horizontalCenter = image.verticalCenter = 0;
			this.addElement(image);
			this.addEventListener(MouseEvent.CLICK, mouseclick);
		}
		
		private function mouseclick(e:MouseEvent):void{
			open();
		}
		
		private var dropdownSwatch:SwatchPanel;
		
		private function getDropdown():SwatchPanel
		{
			if (initializing)
				return null;
			
			initializing = true;
			if (!dropdownSwatch)
			{
				dropdownSwatch = new SwatchPanel();
				dropdownSwatch.owner = this;
				dropdownSwatch.dataProvider = dataProvider;
				dropdownSwatch.cacheAsBitmap = true;
			}
			
			dropdownSwatch.scaleX = scaleX;
			dropdownSwatch.scaleY = scaleY;
			
			return dropdownSwatch;
		}
		
		private function displayDropdown(show:Boolean, trigger:Event = null):void
		{
			if (show == showingDropdown)
				return;

			var point:Point = new Point(0, 0);
			point = localToGlobal(point);
			
			// Save the current triggerEvent
			triggerEvent = trigger; 
			
			if (show) // Open
			{
				getDropdown();  
				if (dropdownSwatch.parent == null)
					PopUpManager.addPopUp(dropdownSwatch, parent, false);
				else
					PopUpManager.bringToFront(dropdownSwatch);

				dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, 
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,
					dropdownSwatch_mouseDownOutsideHandler);
				
				dropdownSwatch.owner = this;
				
				// Position: top or bottom
				var screen:Rectangle = systemManager.topLevelSystemManager.getVisibleApplicationRect();

				if (point.y + height + dropdownGap + dropdownSwatch.height > screen.bottom && 
					point.y > (screen.top + dropdownGap + dropdownSwatch.height)) // Up
				{
					// Dropdown opens up instead of down
					point.y -= dropdownGap + dropdownSwatch.height;
				}
				else // Down
				{
					point.y += dropdownGap + height;
				}
				
				// Position: left or right
				if (point.x + dropdownSwatch.width > screen.right && 
					point.x > (screen.left + dropdownSwatch.width))
				{
					// Dropdown appears to the left instead of right
					point.x -= (dropdownSwatch.width - width);
				}
				
				// Position the dropdown
				point = dropdownSwatch.parent.globalToLocal(point);
				dropdownSwatch.move(point.x, point.y);
				
				//dropdownSwatch.setFocus();
				
				isDown = true;
				isOpening = true;
				
				showingDropdown = show;
			}
			else // Close
			{
				isDown = false;

				showingDropdown = show;
				dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE,
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE,
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE,
					dropdownSwatch_mouseDownOutsideHandler);
				dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE,
					dropdownSwatch_mouseDownOutsideHandler);
				
				PopUpManager.removePopUp(dropdownSwatch);
			}
			
			if (dropdownSwatch)
			{
				dropdownSwatch.visible = true;
				dropdownSwatch.enabled = false;
			}
			
			if (showingDropdown)
			{
				dropdownSwatch.scrollRect = null; 
			}
			else
			{
				dropdownSwatch.visible = false;
				isOpening = false;
			}
			
			if (showingDropdown)
				dropdownSwatch.callLater(dropdownSwatch.setFocus);
			else
				setFocus();

			dropdownSwatch.enabled = true;  
			dispatchEvent(new DropdownEvent(showingDropdown ? DropdownEvent.OPEN : DropdownEvent.CLOSE, false, false, triggerEvent));
		}

		override protected function focusInHandler(event:FocusEvent):void
		{
			var fm:IFocusManager = focusManager;
			if (fm)
				fm.showFocusIndicator = true;
			
			if (isDown && !isOpening)
				close();
			else if (isOpening)
				isOpening = false;
			
			super.focusInHandler(event);
		}
		
		private function dropdownSwatch_mouseDownOutsideHandler(event:Event):void
		{
			if (event is MouseEvent) {
				var mouseEvent:MouseEvent = MouseEvent(event);
				if (!hitTestPoint(mouseEvent.stageX, mouseEvent.stageY, true))
					close(event);
			}
			else if (event is SandboxMouseEvent)
				close(event);
		}
		
		public function open():void
		{
			displayDropdown(true);
		}
		
		public function close(trigger:Event = null):void
		{
			displayDropdown(false, trigger);
		}
		
		

		public var _enable:Boolean = false;
		public function get enable():Boolean
		{
			return _enable;
		}
		
		[Inspectable(defaultValue=true,category="Common")]
		public function set enable(value:Boolean):void
		{
			
			_enable = value;
		}
		
		private var _dataProvider:Object;
		public function get dataProvider():Object
		{
			return _dataProvider;
		}
		
		[Inspectable(category="Data")]		
		
		public function set dataProvider(value:Object):void{
			_dataProvider = value;
			if (dropdownSwatch)
				dropdownSwatch.dataProvider = value;
		}
		
		public function emotions(str:String):String{
			var regex:RegExp = new RegExp("\\[face:(\\d+)\\]", "gi");
			return str.replace(regex, "<img src='assets\/face\/$1.gif'/>");
		}
		
		public function unemotions(str:String):String{
			return str;
		}
	}
}