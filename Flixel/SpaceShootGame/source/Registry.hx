
package ;

import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxSpecialFX;
import org.flixel.plugin.photonstorm.fx.StarfieldFX;

class Registry {

	public static var player:Player;
    public static var bullets:BulletManager;
    public static var stars:FlxSprite;
     
    // public static var enemyBullets:EnemyBulletManager;
    // public static var enemies:EnemyManager;
     
    // public static var effects:Fx;
    // public static var hud:HUD;
    
    // public static var godmode:Bool;
     
    // public static var background:ScrollingBackground;
 
    //Setup the Registry Objects to create your instances
    public static function init()
    {
        //load the special effect for a fancy stars bg
        if (FlxG.getPlugin(FlxSpecialFX) == null)
        {
            FlxG.addPlugin(new FlxSpecialFX());
        }
        var starfield = FlxSpecialFX.starfield();
        stars = starfield.create(0, 0, FlxG.width,FlxG.height, 300);
        starfield.setStarSpeed ( 0, 1 );
     
        //create the player ship
        player = new Player();
         
        //create the Bullet manager with a default of 40 bullets
        bullets = new BulletManager(100);
        //if you want more bullets available for the quadshot just insert your desired amount
        //see the Object Pool article
        //bullets = new BulletManager(100);
    }
}