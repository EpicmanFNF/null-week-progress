
import flixel.math.FlxMath;
import openfl.filters.ShaderFilter;
import openfl.Lib;

var bgVideo:FunkinVideoSprite;
var ext = 'stages/nullandvoid/';
var school:FlxSprite;
var glitchBump:FlxSprite;
var curBg:Int = 1;
var timer:Float = 0;
var scanlinesFake:FlxSprite;

function onLoad()
{
	gfGroup.alpha = 0.0001;
	bgVideo = new FunkinVideoSprite();
	bgVideo.cameras = [camGame];
	bgVideo.scrollFactor.set(0.23, 0.23);
	bgVideo.antialiasing = ClientPrefs.globalAntialiasing;
	bgVideo.tiedToGame = true;

	bgVideo.onFormat(function()
	//bgVideo.bitmap.onFormatSetup.add(function()
	{
	bgVideo.setGraphicSize(1920, 1080);
	bgVideo.updateHitbox();
	//bgVideo.screenCenter();
	bgVideo.y = -200;
	bgVideo.x = -300;
		bgVideo.scale.x *= 1.1;
		bgVideo.scale.y *= 1.4;
	});
	add(bgVideo);

	bgVideo.load(Paths.video("SenpaiIdle"));

	glitchBump = new FlxSprite(-400, -500);
	glitchBump.frames = Paths.getSparrowAtlas(ext + 'senpaibump');
	glitchBump.animation.addByPrefix('bop', 'SenpaiBump', 24, true);
	glitchBump.animation.play('bop');
	glitchBump.updateHitbox();
    	glitchBump.screenCenter();
	glitchBump.antialiasing = ClientPrefs.globalAntialiasing;
	glitchBump.zIndex = 1;
	glitchBump.alpha = 0.0001;
	glitchBump.scale.set(1.9,1.9);
	add(glitchBump);
	
	school = new FlxSprite();
	school.frames = Paths.getSparrowAtlas('stages/roots/animatedEvilSchool');
	school.animation.addByPrefix('idle', 'normal', 24, true);
	school.animation.addByPrefix('bg2', 'background 2 instance 1', 24, true);
	school.updateHitbox();
	school.animation.play('bg2');
	school.alpha = 0.0001;
    	school.x = 560;
    	school.y = -10;
	school.scale.set(8, 8);
	add(school);



}

function onCreatePost()
{
	game.isCameraOnForcedPos = true;
	game.snapCamToPos(810, 420);

	game.boyfriend.setPosition(1260,600);
	game.gf.setPosition(1260,600);
    	game.dad.setPosition(640,310);
    	game.dad.scale.set(6,6);

    game.defaultCamZoom = 0.55;
    game.camGame.zoom = game.defaultCamZoom;

    scanlinesFake = new FlxSprite();
    scanlinesFake.frames = Paths.getSparrowAtlas("ScanlinesThin");
    scanlinesFake.animation.addByPrefix("anim", "ScanlinesThin idle", 24, true);
    scanlinesFake.animation.play("anim", true);
    scanlinesFake.updateHitbox();
    scanlinesFake.antialiasing = true;
    scanlinesFake.alpha = 0.1;
    scanlinesFake.blend = 9;
    scanlinesFake.setPosition(280,170);
    scanlinesFake.scale.set(1.9,1.9);
    scanlinesFake.scrollFactor.set(0,0);
    scanlinesFake.cameras = [game.camOther];
    game.add(scanlinesFake);
		//for (i in opponentStrums){
		//i.visible = false;

			//for (note in game.playFields.members[0].members) {
			//note.cameras = [game.camGame];
			//modManager.setValue("transformZ", -1, note.ID);
			//}
			//modManager.setValue("transformZ", -2, note);
			//modManager.setValue("noteAlpha", 1, i.ID);
			//}
}

function onUpdate(elapsed)
{

    if (game.dad.animation.curAnim.name == "idle" && curBg == 1){
	dad.x = -4000;
	bgVideo.alpha = 1;
	}else{
	dad.x = 640;
	bgVideo.alpha = 0.0001;
	}

    if(curBg == 2){
        timer += elapsed * 0.35;
        school.alpha = ((FlxMath.fastSin(timer) * 0.5) + (glitchBump.alpha * 0.75)) * game.dad.alpha;
    }else{
        timer = 0;
        school.alpha = 0;
    }

    if (glitchBump.alpha > 0){
        glitchBump.alpha -= elapsed;
    }

}

function onEvent(eventName, value1, value2){
    switch(eventName){
        case 'removechars':
            glitchBump.alpha = 0.25;
            FlxG.camera.zoom += 0.08;
			game.camHUD.zoom += 0.075;
            
            FlxTween.tween(game.dad, {alpha: 0}, 1.0);
            FlxTween.tween(game.boyfriend, {alpha: 0}, 1.0);
        case 'playendanim':
        case 'specialbump':
            glitchBump.alpha = 0.25;
            FlxG.camera.zoom += 0.08;
			game.camHUD.zoom += 0.05;
        case 'playvideo':
	bgVideo.play();	            


            glitchBump.alpha = 0.25;
            FlxG.camera.zoom += 0.08;
			game.camHUD.zoom += 0.10;
        case 'changeBf':
            if (value1 == "1"){
		curBg = 1;
                game.changeCharacter("nullbf", 0);
                game.boyfriend.setPosition(1260,600);
                game.boyfriend.scale.set(6,6);
                game.changeCharacter("null", 1);
                game.dad.setPosition(-4000,310);
                game.dad.scale.set(6,6);
                game.dad.scrollFactor.set(1,1);
            } else{ 
                
                game.changeCharacter("frontfacingbf", 0);
                game.boyfriend.setPosition(770,710);
                game.boyfriend.scale.set(9,9);
		                curBg = 2;
                game.dad.scale.set(14.6,14.6);
                game.dad.setPosition(630,140);
                game.dad.scrollFactor.set(0.2,0.2);

                object = game.dad;
                FlxG.debugger.track(object);
		}
                if (value2 == "1"){
                    game.changeCharacter("senpaiBack", 1);

			
                } 
		if (value2 == "2"){
                    game.changeCharacter("senpaiBack2", 1);
			bgVideo.kill();
			//uuuu();
                }

            
            glitchBump.alpha = 0.75;
            FlxG.camera.zoom += 0.08;
			game.camHUD.zoom += 0.10;
            
    }
}

