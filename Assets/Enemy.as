package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.geom.Point;


	public class Enemy extends MovieClip {

		private var _root;
		private var enemy: MovieClip;
		private var PathPoints: Array;

		public function Enemy(Main, World: Array) {
			this._root = Main;
			var Selection: Number = Math.random();
			if (Selection < 1 / 3) {
				enemy = new Boot1();
			}
			if (Selection > 1 / 3 * 2) {
				enemy = new Boot2();
			} else {
				enemy = new Boot3();
			}
			this.rotation = -90;

			this.x = _root.stage.stageWidth - 300;
			this.y = _root.stage.stageHeight - 200;

			GeneratePath(World);
			_root.stage.addEventListener(Event.ENTER_FRAME, _Update);
			addChild(enemy);
		}

		private function _Update(e: Event): void {

		}

		private function GeneratePath(World: Array): void {
			var map:Array = new Array();
			for (var index = 0; index < World.length; index++) {
				trace("1");
				if (World[index] is Land) {
					map[index] = 1;
				}else if (World[index] is Rock) {
					map[index] = 1;
				}else {
					map[index] = 0;
				}
			}
			trace("2");
			var pt: Pathfinder = new Pathfinder();
			trace("3");
			pt.loadMap(map, (World.worldBounds.y / 50), (World.worldBounds.x / 50) );
			trace("4");
			var path: Array = pt.getPath(new Point(1, 1), new Point(8, 8), false);
			trace("5");

			var myShape: Shape = new Shape();
			addChild(myShape);

			myShape.graphics.lineStyle(2, 0x990000, 5);

			for (var i: int = 0; i < path.length; i++) {
				trace(path[i].x, path[i].y)
				myShape.graphics.lineTo(path[i].x, path[i].y);;
			}
		}
	}
}