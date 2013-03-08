
package ;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;

class Hero extends FlxSprite {

	static public inline var PLAY_RUN_SPEED:Float = 20;
	static public inline var GRAVITY_ACCELERATION:Float = 420;
	static public inline var JUMP_ACCELERATION:Float=300;

	public function new(x:Float=100,y:Float=50):Void
	{
		super(x,y,null);
		this.loadGraphic("images/spaceman.jpg",true,true,8,8);
		this.drag.x = PLAY_RUN_SPEED*8;
		this.maxVelocity.x = PLAY_RUN_SPEED;
		this.acceleration.y = GRAVITY_ACCELERATION;
		this.maxVelocity.y =JUMP_ACCELERATION;

		addAnimation("idle", [0]);
        addAnimation("run", [1, 2, 3, 0], 12);
        addAnimation("jump", [4]);
        addAnimation("idle_up", [5]);
        addAnimation("run_up", [6, 7, 8, 5], 12);
        addAnimation("jump_up", [9]);
        addAnimation("jump_down", [10]);
	}

	public override function update():Void
	{
		this.acceleration.x = 0;
		if(FlxG.keys.LEFT)
		{
			this.facing = LEFT;
			this.acceleration.x = -this.drag.x;
		}else if(FlxG.keys.RIGHT)
		{
			this.facing = RIGHT;
			this.acceleration.x = this.drag.x;
		}

		if(FlxG.keys.justPressed("X") && onFloor)
		{
			this.velocity.y = -JUMP_ACCELERATION;
		}

		if(velocity.y != 0)
		{
			play("jump");
		}else if(velocity.x == 0){
			play("idle");
		}else{
			play("run");
		}

		super.update();

	}

}