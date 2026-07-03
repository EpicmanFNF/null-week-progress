import flixel.math.FlxMath;
import openfl.Lib;
var ext = 'stages/nullandvoid/';
var girl:FlxSprite;
function onCreate()
{



}



function onEvent(eventName, value1, value2)
{
    switch(eventName){
        case 'girl':
	var girl = new FlxSprite(760 + FlxG.random.float(-600, 600), game.boyfriend.y - FlxG.random.float(1400, 1800));

    var girlExplosion = new FlxEmitter();
    girlExplosion.clear();
    girlExplosion.color.active = false;
    var girlColours = [0xFFA4B6F2, 0xFFA4B6F2, 0xFFA4B6F2, 0xFFFFF5FC, 0xFFFFF5FC];
    for(i in 0...1200){
        var p:FlxParticle = new FlxParticle();
        p.makeGraphic(16, 16, 0xFFFFFFFF);
        p.color = girlColours[FlxG.random.int(0, girlColours.length-1)];
        p.exists=false;
        girlExplosion.add(p);
    }
    girlExplosion.lifespan.set(0.3, 0.9);
/*     girlExplosion.x += 300;
    girlExplosion.y += 300; */
    girlExplosion.alpha.set(1, 1, 0, 0);
    girlExplosion.speed.set(
        240,
        500
    );
    
/*     girlExplosion.start(true, 0, 50); */
    game.add(girlExplosion);

	    var ranbool:Bool = FlxG.random.bool(50);

            if (ranbool == true){
                girl.x = FlxG.random.float(10, 500);
            } else {
                girl.x = FlxG.random.float(1200, 1650);
            }

	
	    girl.frames = Paths.getSparrowAtlas(ext + "bgGirlGlitch");
            girl.animation.addByPrefix('idle', 'BackgroundGirlFall', 24, true);
            //girl.animation.addByPrefix('wait', 'BackgroundGirlFall', 0, true);
            //girl.animation.play("idle", true);

            girl.scale.set(2, 2);
            girl.scrollFactor.set(1, 1);
            girl.updateHitbox();
            girl.antialiasing = false;
            girl.offset.x += 200;
            girl.offset.y += 100;
            //add(girl);
	    //girl.zIndex = 10;
		
	//}else{

		//}

            //modManager.queueFuncOnce(0.1, function(e, s){
                girl.animation.play("idle", true);
                girl.velocity.y = FlxG.random.float(1200, 1400);
                girl.acceleration.y = 5000;
                girl.maxVelocity.set(20000, 20000);
                add(girl);

            //});

            //modManager.queueFuncOnce(1, function(e, s){
                //girlExplosion.x = girl.x;
                //girlExplosion.y = girl.y;
                //girlExplosion.start(true, 0, 150);
                //game.remove(girl);
                //girl.kill();
            //});

		new FlxTimer().start(0.55, function(tmr:FlxTimer) {
		girlExplosion.x = girl.x;
                girlExplosion.y = girl.y;
                girlExplosion.start(true, 0, 150);
		girl.kill();
		});

        }
    //}

}



