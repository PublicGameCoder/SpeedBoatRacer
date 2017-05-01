package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;


	public class World extends Game {

		public static var worldBounds: Vector3;
		private var WorldList: Array = new Array();
		private var _root;
		private var LandGrid: Array;
		public var Speed: Number = 25 / 20;
		private var player: MovieClip;
		public var enemies: Array;
		public var Friction: Vector3;
		public var ObstructedBlocks: Array = new Array();

		public function World(Main) {
			enemies = new Array();
			Friction = new Vector3(0, Speed / 5000, 0);
			// constructor code
			this._root = Main;
			generateWorld();
			trace("World Created!");
			spawnEnemy();
		}

		private function generateWorld(): void {
			trace("Generating World.  [ This might take a moment! ]");
			worldBounds = new Vector3(_root.stage.stageWidth + 150, 5000, 0);
			LandGrid = new Array();
			var LandPieceLocation: Vector3 = new Vector3(0, 0, 0);
			var Counter: Number = 0;
			var OldProcentage: Number;
			for (var ypos = 0; ypos < (worldBounds.y / 50); ypos++) {
				LandGrid[ypos] = new Array();
				for (var xpos = 0; xpos < (worldBounds.x / 50); xpos++) {
					var Selector: Number = Math.random();
					if (xpos == 0 || xpos >= (worldBounds.x / 50) - 2) {
						LandGrid[ypos][xpos] = new Land();
						ObstructedBlocks.push(LandGrid[ypos][xpos]);
					} else if (ypos >= 20 && ypos <= (worldBounds.y / 50) - 10 && xpos >= 1 && xpos <= (worldBounds.x / 50) - 2 && Selector < 0.005) {
						LandGrid[ypos][xpos] = new Rock();
						ObstructedBlocks.push(LandGrid[ypos][xpos]);
					} else {
						LandGrid[ypos][xpos] = new Water();
					}
					CreateLandIn2DGrid(LandGrid, ypos, xpos);
					if (ypos == 15 && xpos >= 1 && xpos <= (worldBounds.x / 50) - 2) {
						LandGrid[ypos][xpos].addChild(new FinishMiddle());
					}
					LandGrid[ypos][xpos].x = LandPieceLocation.x - 60;
					LandGrid[ypos][xpos].y = LandPieceLocation.y - (worldBounds.y - _root.stage.stageHeight);
					_root.stage.addChild(LandGrid[ypos][xpos]);
					WorldList.push(LandGrid[ypos][xpos]);
					LandPieceLocation.x += 50;
					Counter++;
					var Procentage: Number = Math.round(100 / ((worldBounds.y / 50) * (worldBounds.y / 50)) * Counter);
					if (Procentage != OldProcentage) {
						for (var i = 0; i <= 100; i += 10) {
							if (Procentage == i) {
								trace(Procentage + "%");
							}
						}
						OldProcentage = Procentage;
					}
				}
				LandPieceLocation.y += 50;
				LandPieceLocation.x = 0;
			}
		}

		private function CreateLandIn2DGrid(Container: Array, ypos, xpos): void {
			var limit: Number = makeRangedNumber(0, 6);
			for (var i = 0; i < limit; i++) {
				if ((Container[ypos][xpos - i] == Container[ypos][0] && Container[ypos][xpos - i] is Land) || (xpos < (worldBounds.x / 50) && Container[ypos][xpos + i] is Land)) {
					Container[ypos][xpos] = new Land();
				}
			}
		}

		public static function makeRangedNumber(min: Number, max: Number): Number {
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}

		private function RandomNumber(): int {
			return Math.round(Math.random() * 100);
		}

		public function Update(e: Event): void {
			MoveWorld();
		}

		private function MoveWorld(): void {
			if (player != null) {
				if (player.isMoving()) {
					for (var ypos = 0; ypos < (worldBounds.y / 50); ypos++) {
						for (var xpos = 0; xpos < (worldBounds.x / 50); xpos++) {
							if (LandGrid[1][1].y <= 50) {
								LandGrid[ypos][xpos].y += Speed;
								if (player.Position.y <= (_root.stage.stageHeight - 15)) {
									player.Position.add(Friction);
								}
							}
						}
					}
				}
			} else {
				trace("Player = " + player);
				return;
			}
		}

		private function spawnEnemy(): void {
			var enemy = new Enemy(_root, WorldList);
			enemies.push(enemy);
			_root.stage.addChild(enemies[enemies.length - 1]);
			trace(enemies[enemies.length - 1]);
		}

		public function setPlayer(player: MovieClip): void {
			this.player = player;
		}

		public function getGridPosByCords2D(object:Object): Object {
			
			var topLeftStage: Point = object.localToGlobal(new Point(0, 0));

			var bottomRightStage: Point = object.localToGlobal(new Point(width, height));
			
			for (var yval = 0; yval < LandGrid.length; yval++) {
				for (var xval = 0; xval < LandGrid[yval].length; xval++) {

					if (LandGrid[yval][xval]) {

					}
				}
			}
			return object;
		}
	}

}