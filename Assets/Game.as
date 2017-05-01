package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage; 
	import flash.display.StageAlign; 
	import flash.display.StageScaleMode;
	
	
	public class Game extends MovieClip {
		
		public static var world:World;
		private var player:MovieClip;
		private var enemy:MovieClip;
		
		public function Game() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		private function Init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, Init);
			createWorld();
			spawnPlayer();
		}
		private function createWorld():void {
			world = new World(this);
			addEventListener(Event.ENTER_FRAME, world.Update);
		}
		private function spawnPlayer():void {
			player = new Player(this);
			player.Position.x = 300;
			player.Position.y = stage.stageHeight-200;
			stage.addChild(player);
			world.setPlayer(player);
		}
	}
	
}
