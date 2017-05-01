package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.DisplayObject;
	
	
	public class Player extends Entity {
		
		private var _root;
		private var player:MovieClip;
		private var W,A,D:Boolean;
		public var Moving:Boolean = false;
		
		public function Player(Main) {
			this._root = Main;
			player = new Boot1();
			this.rotation = -90;
			Position = new Vector3(0,0,0);
			PrevPos = new Vector3(0,0,0);
			Velocity = new Vector3(0,0,0);
			Acceleration = new Vector3(0,0,0);
			
			Main.stage.addEventListener(KeyboardEvent.KEY_DOWN, TurnOnControls);
			Main.stage.addEventListener(KeyboardEvent.KEY_UP, TurnOffControls);
			addChild(player);
			
			Main.stage.addEventListener(Event.ENTER_FRAME, _Update);
		}
		
		private function TurnOnControls(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.W) {
				W = true;
			}
			if (e.keyCode == Keyboard.A) {
				A = true;
			}
			if (e.keyCode == Keyboard.D) {
				D = true;
			}
		}
		
		private function TurnOffControls(e:KeyboardEvent):void {
			Moving = false;
			W = false;
			A = false;
			D = false;
		}
		
		private function _Update(e:Event):void {
			Movement();
			CheckIfMoves();
			//CheckBoxCollision(this, _root.stage , true);
			//if (Game.world.getGridPosByCords(this.Position) is Rock) {
			//	CheckBoxCollision(this, Game.world.getGridPosByCords(this.Position) , false);
			//}
		}
		
		private function CheckIfMoves() {
			if (this.Position != this.PrevPos) {
				Moving = true;
				this.PrevPos = this.Position.copy();
			}
			else {
				Moving = false;
			}
		}
		
		private function Movement():void {
			if (W) {
				MoveToDir(this);
			}
			if (W && A) {
				MoveToDir(this);
				CounterClockWise(this);
			}
			if (W && D) {
				MoveToDir(this);
				ClockWise(this);
			}
			if (A) {
				CounterClockWise(this);
			}
			
			if (D) {
				ClockWise(this);
			}
			Position.add(Velocity);
			this.x = Position.x;
			this.y = Position.y;
			this.z = Position.z;
		}
		
		public function isMoving():Boolean {
			return this.Moving;
		}
	}
}
