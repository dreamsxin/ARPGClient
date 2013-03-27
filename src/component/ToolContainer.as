package component
{
	import flash.display.Stage;
	
	import org.aswing.FlowLayout;
	import org.aswing.JButton;
	import org.aswing.JComboBox;
	import org.aswing.JPanel;
	import org.aswing.JTextField;

	public class ToolContainer extends JPanel
	{
		public var chatComboBox:JComboBox;
		public var messageText:JTextField;
		public var sendButton:JButton;
		public var quitButton:JButton;
		
		public var menuButton:JButton;
//		public var standButton:JButton;
//		public var sitdownButton:JButton;
//		public var daxiaoButton:JButton;
//		public var shuaitoufaButton:JButton;
		public function ToolContainer()
		{
			super(new FlowLayout);
			
			//底端
			chatComboBox=new JComboBox();
			chatComboBox.setPreferredWidth(60);
			chatComboBox.setListData([
				'世界',
				'地图',
				'队友',
				'好友'
			]);
			chatComboBox.setSelectedIndex(0);
			
			messageText = new JTextField;
			messageText.setMaxChars(256);
			messageText.setWordWrap(true);
			messageText.setPreferredWidth(384);
			
			sendButton = new JButton('发送');
			sendButton.pack();
			
			quitButton = new JButton('退出');
			quitButton.pack();

			this.appendAll(chatComboBox, messageText, sendButton, quitButton);
			
			menuButton = new JButton('显示菜单');
//			sitdownButton = new JButton('坐下');
//			daxiaoButton = new JButton('大笑');
//			shuaitoufaButton = new JButton('甩头发');
			this.appendAll(menuButton);//, sitdownButton, daxiaoButton, shuaitoufaButton
		}
		
	}
}