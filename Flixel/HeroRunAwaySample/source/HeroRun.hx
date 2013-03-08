
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
import org.flixel.FlxTileblock;
import org.flixel.FlxU;
import org.flixel.FlxCamera;

class HeroRun extends FlxState {

	private var hero:FlxSprite;
	private var tileGround:FlxTileblock;

	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.show();
		drawHero();
		drawGround();
		addStateFunction();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		FlxU.collide(hero, tileGround);
		super.update();
	}	

	private function drawGround():Void
	{
		hero = new Hero(100,50);
		add(hero);
	}
	private function drawHero():Void
	{
		tileGround = new FlxTileblock(0,400,800,40);
		tileGround.loadTiles("images/tech_tiles.png",0,0,0);  //修改参数查看不同的效果
		add(tileGround);
	}

	private function addStateFunction():Void 
	{
		FlxG.camera.follow(hero);
		FlxG.camera.followAdjust(0.5, 0.0);
		FlxG.camera.setBounds(0, 0, 640, 480);
		// FlxG.camera.setWorldBounds(0, 0, 640, 480);
	}

}