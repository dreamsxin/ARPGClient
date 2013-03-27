package component
{
	import org.aswing.EmptyLayout;
	import org.aswing.JLoadPane;
	import org.aswing.JPanel;
	import org.aswing.JProgressBar;
	import org.aswing.geom.IntDimension;
	import org.aswing.plaf.ASColorUIResource;
	import org.aswing.plaf.ComponentUI;

	public class PlayerStatusContainer extends JPanel
	{
		private var lifeBar:JProgressBar;
		private var magicBar:JProgressBar;
		private var strongBar:JProgressBar;
		
		public function PlayerStatusContainer()
		{
			super(new EmptyLayout);
			//背景
			var bg:JLoadPane = new JLoadPane('assets/bg/01.png');
			bg.setSizeWH(208, 72);
			this.append(bg);
			this.setSizeWH(300, 72);
			
			//生命
			lifeBar = new JProgressBar(JProgressBar.HORIZONTAL);
			lifeBar.setBorder(null);
			var ui:ComponentUI = lifeBar.getUI();
			ui.putDefault("ProgressBar.progressColor", new ASColorUIResource(0xff0000));
			
			lifeBar.setUI(ui);
			
			lifeBar.x = 55;
			lifeBar.y = 5;
			lifeBar.setSize(new IntDimension(62, 9));
			lifeBar.setValue(80);
			
			this.append(lifeBar);
			
			//内力
			magicBar = new JProgressBar(JProgressBar.HORIZONTAL);
			//magicBar.setIndeterminate(true);
			magicBar.setBorder(null);
			ui = magicBar.getUI();
			ui.putDefault("ProgressBar.progressColor", new ASColorUIResource(0x104073));
			
			magicBar.setUI(ui);
			
			magicBar.x = 55;
			magicBar.y = 17;
			magicBar.setSize(new IntDimension(62, 9));
			magicBar.setValue(65);
			
			this.append(magicBar);
			
			//体力
			strongBar = new JProgressBar(JProgressBar.HORIZONTAL);
			strongBar.setBorder(null);
			ui = strongBar.getUI();
			ui.putDefault("ProgressBar.progressColor", new ASColorUIResource(0x18a929));
			
			strongBar.setUI(ui);
			
			strongBar.x = 55;
			strongBar.y = 29;
			strongBar.setSize(new IntDimension(62, 9));
			strongBar.setValue(70);
			
			this.append(strongBar);
		}
		
	}
}