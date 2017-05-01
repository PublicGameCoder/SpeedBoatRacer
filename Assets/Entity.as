package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import fl.transitions.Rotate;
	
	
	public class Entity extends MovieClip {
		
		public var Position,PrevPos,Velocity,Acceleration:Vector3;
		
		public function Entity() {
			// constructor code
		}
		
		public function CounterClockWise(obj:MovieClip) {
			obj.rotation -= 2;
		}
		
		public function ClockWise(obj:MovieClip) {
			obj.rotation += 2;
		}
		
		public function MoveToDir(obj:MovieClip) {
			var Angle:Number = obj.rotation;
			var PlacePos = new Vector3( Math.cos((Angle * (Math.PI / 180))) , Math.sin((Angle * (Math.PI / 180))) ,0);
			PlacePos.normalize();
			PlacePos.multS(5);
			obj.Position.add(PlacePos);
		}
		/*
		public function CheckBoxCollision(obj:MovieClip, target, isStage:Boolean):void {
			for () {
				if (obj.hitTestObject(ObstructedBlocks[i]) ) {
					
				}
			}
			
			if (!isStage) {
				if (obj.Position.x + (obj.width/2) > (target.x - (target.width/2) ) ) { obj.Position.x = (target.x - (target.width/2) ) } //Obj Coll left with target
				if (obj.Position.x - (obj.width/2) < (target.x + (target.width/2) ) ) { obj.Position.x = (target.x + (target.width/2) ) } //Obj Coll right with target
				if (obj.Position.y + (obj.height/2) > (target.y - (target.height/2) ) ) { obj.Position.y = (target.y - (target.height/2) ) } //Obj Coll bottom with target
				if (obj.Position.y - (obj.height/2) < (target.y + (target.height/2) ) ) { obj.Position.y = (target.y + (target.height/2) ) } //Obj Coll top with target
			}
			else {
				if (obj.Position.x + (obj.width/2) > target.stageWidth ) { obj.Position.x = target.stageWidth-(obj.width/2)-1 } //Obj Coll left with stage
				if (obj.Position.x - (obj.width/2) < 0) { obj.Position.x = (obj.width/2)+1 } //Obj Coll right with stage
				if (obj.Position.y + (obj.height/2) > target.stageHeight ) { obj.Position.y = target.stageHeight-(obj.height/2)-1 } //Obj Coll bottom with stage
				if (obj.Position.y - (obj.height/2) < 0 ) { obj.Position.y = (obj.width/2)+1 } //Obj Coll top with stage
			}
		}
		*/
	}
	
}
