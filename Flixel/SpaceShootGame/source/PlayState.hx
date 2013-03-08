package;

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
import org.flixel.plugin.photonstorm.FlxDisplay;

class PlayState extends FlxState
{
	//this will be the text displayed to show some vital  info on object pools
    private var debug:FlxText;
    //used to show the player instructions on inputs
    private var controls:FlxText;

	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.show();

		//initialise the game Registry
            Registry.init();
             
        //create your text
        controls = new FlxText(0, 0, 360, "Press Ctrl to Fire! ---------- Press 1 / 2 / 3 / 4 to change Fire Type!");
        debug = new FlxText(0, 10, 200, "");
         
        //add your objects to the game stage to be drawn
        add(Registry.stars);
        add(Registry.bullets);
        add(Registry.player);
        add(debug);
        add(controls);

	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		
		//update the debug text to tell us some useful things about the bullets FlxGroup
        debug.text = "Bullet Pool: " + Registry.bullets.countLiving() + "/" + Registry.bullets.members.length;
             
        //setup the logic to change fire modes
        if (FlxG.keys.justPressed("ONE"))
        {
            Registry.player.fireType = 1;
        }
         
        if (FlxG.keys.justPressed("TWO"))
        {
            Registry.player.fireType = 2;
        }
         
        if (FlxG.keys.justPressed("THREE"))
        {
            Registry.player.fireType = 3;
        }

        if (FlxG.keys.justPressed("FOUR"))
        {
            Registry.player.fireType = 4;
        }
		super.update();
	}	

}