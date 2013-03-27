package skins
{
	import org.aswing.UIDefaults;
	import org.aswing.plaf.ASColorUIResource;
	import org.aswing.plaf.InsetsUIResource;
	import org.aswing.plaf.basic.BasicLookAndFeel;
	import org.aswing.skinbuilder.*;
	public class ALookAndFeel extends BasicLookAndFeel
	{
		//----------------------------------------------------------------------
		//___________________________ Button scale-9 ___________________________
		//======================================================================
		[Embed(source="assets/Button_defaultImage.png", scaleGridTop="11", scaleGridBottom="12", 
			scaleGridLeft="6", scaleGridRight="51")]
		private var Button_defaultImage:Class;
		
		[Embed(source="assets/Button_pressedImage.png", scaleGridTop="11", scaleGridBottom="12", 
			scaleGridLeft="6", scaleGridRight="51")]
		private var Button_pressedImage:Class;
		
		[Embed(source="assets/Button_rolloverImage.png", scaleGridTop="11", scaleGridBottom="12", 
			scaleGridLeft="6", scaleGridRight="51")]
		private var Button_rolloverImage:Class;
		
		[Embed(source="assets/Button_disabledImage.png", scaleGridTop="11", scaleGridBottom="12", 
			scaleGridLeft="6", scaleGridRight="51")]
		private var Button_disabledImage:Class;
		
		[Embed(source="assets/Button_DefaultButton_defaultImage.png", scaleGridTop="11", scaleGridBottom="12", 
			scaleGridLeft="6", scaleGridRight="51")]
		private var Button_DefaultButton_defaultImage:Class;
	
	
		//----------------------------------------------------------------------
		//___________________________ TabbedPane _______________________________
		//======================================================================
		//========= header top scale-9 =======
		[Embed(source="assets/TabbedPane_top_tab_defaultImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_defaultImage:Class;
		
		[Embed(source="assets/TabbedPane_top_tab_pressedImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_pressedImage:Class;
		
		[Embed(source="assets/TabbedPane_top_tab_rolloverImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_rolloverImage:Class;
		
		[Embed(source="assets/TabbedPane_top_tab_disabledImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_disabledImage:Class;
		
		[Embed(source="assets/TabbedPane_top_tab_selectedImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_selectedImage:Class;
		
		[Embed(source="assets/TabbedPane_top_tab_rolloverSelectedImage.png", scaleGridTop="12", scaleGridBottom="14", 
			scaleGridLeft="12", scaleGridRight="45")]
		private var TabbedPane_top_tab_rolloverSelectedImage:Class;
		
		
		
		//========= Background Image scale-9 =======
		[Embed(source="assets/TabbedPane_top_contentRoundImage.png", scaleGridTop="20", scaleGridBottom="80", 
			scaleGridLeft="20", scaleGridRight="80")]
		private var TabbedPane_top_contentRoundImage:Class;
		
		//========= Left Arrow Images =======
		[Embed(source="assets/TabbedPane_arrowLeft_defaultImage.png")]
		private var TabbedPane_arrowLeft_defaultImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowLeft_pressedImage.png")]
		private var TabbedPane_arrowLeft_pressedImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowLeft_disabledImage.png")]
		private var TabbedPane_arrowLeft_disabledImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowLeft_rolloverImage.png")]
		private var TabbedPane_arrowLeft_rolloverImage:Class;
		
		//========= Right Arrow Images =======
		[Embed(source="assets/TabbedPane_arrowRight_defaultImage.png")]
		private var TabbedPane_arrowRight_defaultImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowRight_pressedImage.png")]
		private var TabbedPane_arrowRight_pressedImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowRight_disabledImage.png")]
		private var TabbedPane_arrowRight_disabledImage:Class;
		
		[Embed(source="assets/TabbedPane_arrowRight_rolloverImage.png")]
		private var TabbedPane_arrowRight_rolloverImage:Class;
		
	
		//========= Close Button Images =======
		[Embed(source="assets/TabbedPane_closeButton_defaultImage.png")]
		private var TabbedPane_closeButton_defaultImage:Class;
		
		[Embed(source="assets/TabbedPane_closeButton_pressedImage.png")]
		private var TabbedPane_closeButton_pressedImage:Class;
		
		[Embed(source="assets/TabbedPane_closeButton_disabledImage.png")]
		private var TabbedPane_closeButton_disabledImage:Class;
		
		[Embed(source="assets/TabbedPane_closeButton_rolloverImage.png")]
		private var TabbedPane_closeButton_rolloverImage:Class;
		
		
		//------------------------------------------------------------------------
		//___________________________ ComboBox scale-9 ___________________________
		//========================================================================
		
		//========= Background Images =======
		[Embed(source="assets/ComboBox_defaultImage.png", scaleGridTop="3", scaleGridBottom="20", 
			scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_defaultImage:Class;
		
		[Embed(source="assets/ComboBox_uneditableImage.png", scaleGridTop="3", scaleGridBottom="20", 
			scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_uneditableImage:Class;
		//by default the rollover state is null(means same to normal state), but you can add it by remove the comments
		//[Embed(source="assets/ComboBox_defaultRolloverImage.png", scaleGridTop="3", scaleGridBottom="20", 
		//	scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_defaultRolloverImage:Class;
		//[Embed(source="assets/ComboBox_uneditableRolloverImage.png", scaleGridTop="3", scaleGridBottom="20", 
		//	scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_uneditableRolloverImage:Class;
		//[Embed(source="assets/ComboBox_defaultPressedImage.png", scaleGridTop="3", scaleGridBottom="20", 
		//	scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_defaultPressedImage:Class;
		//[Embed(source="assets/ComboBox_uneditablePressedImage.png", scaleGridTop="3", scaleGridBottom="20", 
		//	scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_uneditablePressedImage:Class;
			
		[Embed(source="assets/ComboBox_disabledImage.png", scaleGridTop="3", scaleGridBottom="20", 
			scaleGridLeft="3", scaleGridRight="131")]
		private var ComboBox_disabledImage:Class;
		
		//========= Arrow Button Images =======
		[Embed(source="assets/ComboBox_arrowButton_defaultImage.png")]
		private var ComboBox_arrowButton_defaultImage:Class;
		
		[Embed(source="assets/ComboBox_arrowButton_pressedImage.png")]
		private var ComboBox_arrowButton_pressedImage:Class;
		
		[Embed(source="assets/ComboBox_arrowButton_disabledImage.png")]
		private var ComboBox_arrowButton_disabledImage:Class;
		
		[Embed(source="assets/ComboBox_arrowButton_rolloverImage.png")]
		private var ComboBox_arrowButton_rolloverImage:Class;

		public function ALookAndFeel()
		{
			super();
		}
		
		override protected function initClassDefaults(table:UIDefaults):void{
			super.initClassDefaults(table);
			var uiDefaults:Array = [ 
				  
					"TabbedPaneUI", SkinTabbedPaneUI,
					"ClosableTabbedPaneUI", SkinClosableTabbedPaneUI,
			  		"ComboBoxUI", SkinComboBoxUI
			   ];
			table.putDefaults(uiDefaults);
		}
		
		override protected function initComponentDefaults(table:UIDefaults):void{
			super.initComponentDefaults(table);
			// *** Button
			var comDefaults:Array = [
				"Button.background", new ASColorUIResource(0x2a578f),
				"Button.opaque", false, 
				"Button.defaultImage", Button_defaultImage,
				"Button.pressedImage", Button_pressedImage,
				"Button.disabledImage", Button_disabledImage,
				"Button.rolloverImage", Button_rolloverImage, 
				"Button.DefaultButton.defaultImage", Button_DefaultButton_defaultImage, 
				"Button.bg", SkinButtonBackground,
				"Button.margin", new InsetsUIResource(3, 3, 4, 4), //modify this to fit the image border margin 
				"Button.textShiftOffset", 0
			];
			table.putDefaults(comDefaults);
			
			// *** TabbedPane
			comDefaults = [
				"TabbedPane.tab", SkinTabbedPaneTab, 
				"TabbedPane.tabMargin", new InsetsUIResource(3, 3, 1, 3),
				"TabbedPane.tabBorderInsets", new InsetsUIResource(0, 4, 0, 4),
				//"TabbedPane.defaultTabExpandInsets", new InsetsUIResource(0, 4, 0, 4),
				"TabbedPane.selectedTabExpandInsets", new InsetsUIResource(0, 4, 0, 4), 
				"TabbedPane.top.tab.defaultImage", TabbedPane_top_tab_defaultImage,
				"TabbedPane.top.tab.pressedImage", TabbedPane_top_tab_pressedImage,
				"TabbedPane.top.tab.disabledImage", TabbedPane_top_tab_disabledImage,
				"TabbedPane.top.tab.rolloverImage", TabbedPane_top_tab_rolloverImage, 
				"TabbedPane.top.tab.selectedImage", TabbedPane_top_tab_selectedImage, 
				"TabbedPane.top.tab.rolloverSelectedImage", TabbedPane_top_tab_rolloverSelectedImage, 
				
				"TabbedPane.arrowLeft.defaultImage", TabbedPane_arrowLeft_defaultImage, 
				"TabbedPane.arrowLeft.pressedImage", TabbedPane_arrowLeft_pressedImage, 
				"TabbedPane.arrowLeft.disabledImage", TabbedPane_arrowLeft_disabledImage, 
				"TabbedPane.arrowLeft.rolloverImage", TabbedPane_arrowLeft_rolloverImage, 
				
				"TabbedPane.arrowRight.defaultImage", TabbedPane_arrowRight_defaultImage, 
				"TabbedPane.arrowRight.pressedImage", TabbedPane_arrowRight_pressedImage, 
				"TabbedPane.arrowRight.disabledImage", TabbedPane_arrowRight_disabledImage, 
				"TabbedPane.arrowRight.rolloverImage", TabbedPane_arrowRight_rolloverImage, 
				
				"TabbedPane.contentMargin", new InsetsUIResource(4, 4, 4, 4), //modify this to fit TabbedPane_contentRoundImage
				"TabbedPane.top.contentRoundImage", TabbedPane_top_contentRoundImage, 
				"TabbedPane.contentRoundLineThickness", 1, //modify this to fit contentRoundImage
				"TabbedPane.bg", null //bg is managed by SkinTabbedPaneUI
			];
			table.putDefaults(comDefaults);
			
			// *** ComboBox
			comDefaults = [
				"ComboBox.opaque", false, 
				"ComboBox.bg", SkinComboBoxBackground,
				"ComboBox.border", new SkinEmptyBorder(3, 3, 3, 3), //modify this to fit the bg image
				"ComboBox.defaultImage", ComboBox_defaultImage, 
				"ComboBox.uneditableImage", ComboBox_uneditableImage, 
				"ComboBox.disabledImage", ComboBox_disabledImage, 
				"ComboBox.defaultRolloverImage", ComboBox_defaultRolloverImage, 
				"ComboBox.uneditableRolloverImage", ComboBox_uneditableRolloverImage, 
				"ComboBox.defaultPressedImage", ComboBox_defaultPressedImage, 
				"ComboBox.uneditablePressedImage", ComboBox_uneditablePressedImage, 
				"ComboBox.arrowButton.defaultImage", ComboBox_arrowButton_defaultImage,
				"ComboBox.arrowButton.pressedImage", ComboBox_arrowButton_pressedImage,
				"ComboBox.arrowButton.disabledImage", ComboBox_arrowButton_disabledImage,
				"ComboBox.arrowButton.rolloverImage", ComboBox_arrowButton_rolloverImage
			];
			table.putDefaults(comDefaults);
		}
	}
}