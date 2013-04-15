//class MapScene
package 
{
    import as3isolib.display.scene.*;
    import org.myleft.core.*;
    
    public class MapScene extends as3isolib.display.scene.IsoScene
    {
        public function MapScene()
        {
            super();
            return;
        }

        public function initialize(name:String, sizew:int, sizeh:int, w:int, h:int):void
        {
            var filename:String=null;
            var mapsprite:BitmapSprite=null;
            this.removeAllChildren();
            var path:String="assets/map/" + name + "/";
            var px:int=sizew *  w / 2;
            var py:int=sizeh * h / 2;
            var x:int=0;
            var y:int=0;
            while (x < w) 
            {
                y = 0;
                while (y < h) 
                {
                    filename = path + x + "_" + y + ".png";
                    mapsprite = new BitmapSprite(filename, sizew, sizeh);
                    mapsprite.x = sizew * x - px;
                    mapsprite.y = sizeh * y - py;
                    this.container.addChild(mapsprite);
                    trace("MapScene initialize filename:" + filename);
                    ++y;
                }
                ++x;
            }
            return;
        }
    }
}


