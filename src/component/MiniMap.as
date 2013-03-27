package component
{
	import flash.display.Shape;
	
	import org.aswing.EmptyLayout;
	import org.aswing.JPanel;
	import org.aswing.VectorListModel;
	import org.myleft.astar.IAStarSearchable;
	import org.myleft.data.User;
	import org.myleft.geom.IntPoint;

	public class MiniMap extends JPanel
	{
		private var map:IAStarSearchable;
		private var w:int;
		private var h:int;
		private var border:int = 5;
		private var wcellSize:int;
		private var hcellSize:int;
		
		private var gridShape:Shape;
		private var wallShape:Shape
		private var pathShape:Shape
		
		private var roleShape:Shape
		
		public function MiniMap(m:IAStarSearchable=null, w:int=200, h:int=200)
		{
			super(new EmptyLayout);
			this.width = w;
			this.height = h;
			this.setSizeWH(width+border, height+border);
			gridShape = new Shape;
			gridShape.y = 2;
			this.addChild(gridShape);
			
			wallShape = new Shape;
			wallShape.y = 2;
			this.addChild(wallShape);
			
			pathShape = new Shape;
			pathShape.y = 2;
			this.addChild(pathShape);
			
			roleShape = new Shape;
			roleShape.y = 2;
			this.addChild(roleShape);
			if (m) initialize(m);
		}
		
		public function initialize(m:IAStarSearchable):void
		{
			map = m;
			w=map.getWidth();
			h=map.getHeight();
			
			this.wcellSize =  this.width / w;
			this.hcellSize =  this.height / h;
			
			this.drawGrid();
			this.drawWall();
			
		}

		private function drawGrid(col:uint=0xFFFFFF):void
		{
			this.gridShape.graphics.clear();
			this.gridShape.graphics.lineStyle(1, col, 0.5);
			trace('w', w);
			trace('wcellSize', wcellSize);
			trace('hcellSize', hcellSize);
			for (var i:int=0; i < w + 1; i++)
			{
				this.gridShape.graphics.moveTo(i * wcellSize, 0);
				this.gridShape.graphics.lineTo(i * wcellSize, h * hcellSize);
			}

			for (i=0; i < h + 1; i++)
			{
				this.gridShape.graphics.moveTo(0, i * hcellSize);
				this.gridShape.graphics.lineTo(w * wcellSize, i * hcellSize);
			}
		}

		public function drawWall():void
		{
			this.wallShape.graphics.clear();
			for (var x:int=0; x<w; x++) {
				for (var y:int=0; y<h; y++) {
					if (!map.isWalkable(x,y))
					{
						drawPoint(this.wallShape, new IntPoint(x,y), 0x000000);
					}
				}
			}
		}

		public function drawPath(solution:Array):void
		{
			this.pathShape.graphics.clear();
			for (var i:int=0; i < solution.length-1; i++)
			{
				var n2:IntPoint=IntPoint(solution[i]);
				var n:IntPoint=IntPoint(solution[i+1]);
				drawLine(this.pathShape, n, n2);
				drawPoint(this.pathShape, n2);
			}
		}

		public function drawRole(model:VectorListModel, lcolor:Number=0x009900, color:Number=0x33FF00):void
		{
			this.roleShape.graphics.clear();
			for (var i:int=0;i < model.getSize(); i++)
			{
				var user:User =User(model.get(i));
				if (user.display) {
					drawPoint(this.roleShape, user.point, user.leading ? lcolor : color);
				}

			}
		}

		private function drawLine(shape:Shape, a:IntPoint, b:IntPoint, linecol:uint=0xFFFFFF):void
		{
			shape.graphics.lineStyle(1, linecol);
			shape.graphics.moveTo(a.x * wcellSize, a.y * hcellSize);
			shape.graphics.lineTo(b.x * wcellSize, b.y * hcellSize);
		}

		private function drawPoint(shape:Shape, a:IntPoint, fillcol:uint=0xFF0000, linecol:uint=0xffffff):void
		{
			shape.graphics.beginFill(fillcol, 1);
			shape.graphics.lineStyle(2, linecol);
			shape.graphics.drawCircle(a.x * wcellSize+wcellSize*0.5, a.y * hcellSize+hcellSize*0.5, 3);
			shape.graphics.endFill();
		}
	}
}