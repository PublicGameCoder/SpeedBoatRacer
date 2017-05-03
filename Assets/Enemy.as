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
			
			_root.stage.addEventListener(Event.ENTER_FRAME, _Update);
			addChild(enemy);
		}

		private function _Update(e: Event): void {

		}
	}
}