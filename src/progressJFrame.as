package
{
	import org.aswing.JFrame;
	import org.aswing.JProgressBar;

	public class progressJFrame extends JFrame
	{
		public function progressJFrame(owner:Object=null, title:String='连接中...', modal:Boolean=true)
		{
			
			super(owner, title, modal);
		
			this.setClosable(false);
			this.setResizable(false);
			var progressBar:JProgressBar = new JProgressBar;
			progressBar.setIndeterminate(true);
			progressBar.setIndeterminateDelay(60);
			progressBar.setSizeWH(100, 30);
			this.getContentPane().append(progressBar);
		}
		
	}
}