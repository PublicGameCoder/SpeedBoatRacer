package {

	public class Vector3 {
		// ####################################################
		// properties
		// ####################################################
		public var x:Number;
		public var y:Number;
		public var z:Number;

		// ####################################################
		// constructor
		// ####################################################
		public function Vector3(xx:Number = 0, yy:Number = 0, zz:Number = 0) {
			this.x = xx;
			this.y = yy;
			this.z = zz;
		}

		// ####################################################
		// methods
		// ####################################################
		// creators (setters)
		public function setTo(xx:Number, yy:Number, zz:Number):Vector3 {
			this.x = xx;
			this.y = yy;
			this.z = zz;
			return this;
		}

		public function create(begin:Vector3, end:Vector3):Vector3 {
			this.x = end.x - begin.x;
			this.y = end.y - begin.y;
			this.z = end.z - begin.z;
			return this;
		}

		public function fromAngle(angle:Number):Vector3 {
			this.setTo(Math.cos(angle), Math.sin(angle), Math.tan(angle));
			return this;
		}

		public function copy():Vector3 {
			return new Vector3(this.x, this.y, this.z);
		}

		// info (getters)
		public function mag():Number {
			return Math.sqrt( magSq() );
		}

		public function magSq():Number {
			return (x*x) + (y*y) + (z*z);
		}

		public function dist(other:Vector3):Number {
			var dx:Number = this.x - other.x;
			var dy:Number = this.y - other.y;
			var dz:Number = this.z - other.z;
			return Math.sqrt( (dx*dx) + (dy*dy) + (dz*dz) );
		}

		public function getNormalized():Vector3 {
			return new Vector3( this.x/mag(), this.y/mag(), this.z/mag());
		}

		public function normalize():Vector3 {
			var m:Number = mag();
			this.x /= m;
			this.y /= m;
			this.z /= m;
			return this;
		}

		public function limit(max:Number):Vector3 {
			if (mag() > max) {
				this.normalize();
				this.multS(max);
			}
			return this;
		}

		public function setMag(magnitude:Number):Vector3 {
			this.normalize();
			this.multS(magnitude);
			return this;
		}

		public function getAngle():Number {
			return Math.atan2(y,x);
		}

		public function heading():Number {
			return getAngle();
		}

		public function getAngleToVector(other:Vector3):Number {
			var dot:Number = this.dot(other);
			var l1:Number = this.mag();
			var l2:Number = other.mag();
			return Math.acos(dot/(l1*l2));
		}

		public function dot(other:Vector3):Number {
			return (this.x * other.x) + (this.y * other.y) + (this.z * other.z);
		}

		// manipulators
		public function rotate(angle:Number):Vector3 {
			var currAngle:Number = this.getAngle();
			currAngle += angle;
			var xx:Number = Math.cos(currAngle);
			var yy:Number = Math.sin(currAngle);
			var zz:Number = Math.tan(currAngle);//Not Sure if this works!
			var currLength:Number = this.mag();
			this.x = xx * currLength;
			this.y = yy * currLength;
			this.z = zz * currLength;
			return this;
		}

		public function add(other:Vector3):Vector3 {
			this.x += other.x;
			this.y += other.y;
			this.z += other.z;
			return this;
		}

		public function sub(other:Vector3):Vector3 {
			this.x -= other.x;
			this.y -= other.y;
			this.z -= other.z;
			return this;
		}

		public function mult(other:Vector3):Vector3 {
			this.x *= other.x;
			this.y *= other.y;
			this.z *= other.z;
			return this;
		}

		public function multS(scalar:Number):Vector3 {
			this.x *= scalar;
			this.y *= scalar;
			this.z *= scalar;
			return this;
		}

		public function div(other:Vector3):Vector3 {
			this.x /= other.x;
			this.y /= other.y;
			this.z /= other.z;
			return this;
		}

		public function divS(scalar:Number):Vector3 {
			this.x /= scalar;
			this.y /= scalar;
			this.z /= scalar;
			return this;
		}

		public static function rad2deg(a:Number):Number {
			return a * (180 / Math.PI);
		}

		public static function deg2rad(a:Number):Number {
			return a * (Math.PI / 180);
		}

		public function toString():String {
			return new String("[ "+this.x+", "+this.y+", "+this.z+" ]");
		}

	}
}
