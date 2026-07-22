/*
var bfTrail:FlxTrail;
var evilTrail:FlxTrail;

function addTrail(who:Character, which:Int = 0, ?length:Int = 4, ?delay:Int = 24, ?alpha:Float = 0.4, ?diff:Float = 0.069)
{
    if(length==null)length = 4;
    if(delay==null)delay = 24;
    if(alpha==null)alpha = 0.4;
    if(diff==null)diff = 0.069;

    if (which == 0){
        bfTrail = new FlxTrail(who, null, length, delay, alpha, diff);
        addF(bfTrail);
    } else if (which == 1) {
        evilTrail = new FlxTrail(who, null, length, delay, alpha, diff);
        add(evilTrail);
    }
}


function onCreatePost(){
	addTrail(dad, 1, 8, 5, 0.4, 0.030);
	addTrail(dad, 1);	
}
*/

import flixel.math.FlxMath;
import openfl.filters.ShaderFilter;
import openfl.Lib;

var numTunnel:FlxSprite;
var numTunnel2:FlxSprite;
var curBg:Int = 0;
var numAccX = 200;
var numAccY = 0;
var numScale = 5;
var ext = 'stages/chkdsk/';
var staticOverlay:FlxSprite;
var glitchBump:FlxSprite;
var bfSigh:FlxSprite;
var helpme:FlxSprite;
var timer:Float = 0;
var speedLines:FlxSprite;
var tweenStarted:Bool = false;
var handGrabEnd:FlxSprite;
//var video6:FunkinVideoSprite;
//var video7:FunkinVideoSprite;
//var video8:FunkinVideoSprite;

function onLoad()
{

    numTunnel = new FlxSprite();
    numTunnel.frames = Paths.getSparrowAtlas(ext + 'NumberTunnel');
    numTunnel.animation.addByPrefix('anim', 'NumberTunnel idle', 30, true);
    numTunnel.animation.play('anim', true);
    numTunnel.scrollFactor.set();
    numTunnel.alpha = 0;
    numTunnel.updateHitbox();
    numTunnel.screenCenter();
    numTunnel.scale.set(2.8,2.8);
    numTunnel.zIndex = 0;
    add(numTunnel);

    numTunnel2 = new FlxSprite();
    numTunnel2.frames = Paths.getSparrowAtlas(ext + 'NumberTunnel');
    numTunnel2.animation.addByPrefix('anim', 'NumberTunnel idle', 30, true);
    numTunnel2.animation.play('anim', true);
    numTunnel2.scrollFactor.set();
    numTunnel2.alpha = 0;
    numTunnel2.updateHitbox();
    numTunnel2.screenCenter();
    numTunnel2.scale.set(2.8,2.8);
numTunnel2.zIndex = -2;
    add(numTunnel2);

//numTunnel.blend = 12;



	video8 = new FunkinVideoSprite();
	video8.antialiasing = false;
	video8.onFormat(function()
	{
        video8.setPosition(-130,-110);
        video8.setGraphicSize(1920, 1080);
        video8.updateHitbox();
        video8.scale.x *= 1.4;
        video8.scale.y *= 1.4;
	});
	video8.load(Paths.video('glitch intermission', [':input-repeat=65545']));
	video8.blend = 12;
		add(video8);

	video5 = new FunkinVideoSprite();
	video5.onFormat(function()
	{
        video5.setGraphicSize(1920, 1080);
        video5.updateHitbox();

        video5.scale.x *= 1.3;
        video5.scale.y *= 1.3;

        video5.setPosition(-130,-110);
	});
	video5.antialiasing = false;
	video5.load(Paths.video('hands loop', [':input-repeat=65545']));

    video5.blend = 12;
    //video5.alpha = 0.00001;
add(video5);
		video5.alpha = 0.85;

	video6 = new FunkinVideoSprite();
	//video6.antialiasing = ClientPrefs.globalAntialiasing;
	video6.onFormat(function()
	{
          video6.setGraphicSize(1920, 1080);
          video6.updateHitbox();

        video6.scale.x *= 1.1;
        video6.scale.y *= 1.3;
        video6.setPosition(-200,-100);
	
	});
	video6.antialiasing = false;
	video6.load(Paths.video('SecondTunnel'), [':input-repeat=65545']);


	video7 = new FunkinVideoSprite();
	video7.onFormat(function()
	{
        video7.setGraphicSize(1920, 1080);
        video7.updateHitbox();

        video7.scale.x *= 1.1;
        video7.scale.y *= 1.3;
        video7.setPosition(-200,-100);
	
	});
	video7.antialiasing = false;
	video7.load(Paths.video('SecondTunnel'), [':input-repeat=65545']);

add(video6);
		//video6.play();
//insert(0, video7);
		//video7.play();


    video6.alpha = 0.3;  
    video6.blend = 12;
    video7.alpha = 0.7;
    //video7.blend = 12;


	video4 = new FunkinVideoSprite();
	video4.onFormat(function()
	{
        video4.setGraphicSize(1920, 1080);
        video4.updateHitbox();

        video4.scale.x *= 1.4;
        video4.scale.y *= 1.4;
        video4.setPosition(-130,-110);
	});
	video4.antialiasing = false;
	video4.load(Paths.video('hand transition'));
	video4.blend12;
                add(video4);


}

function onCreatePost() 
{
	
	skipCountdown = true;
	gfGroup.alpha = 0.0001;
	isCameraOnForcedPos = true;
	snapCamToPos(810, 420);
	defaultCamZoom = 0.5;
	camGame.zoom = game.defaultCamZoom;
    boyfriend.setPosition(790, 741);
dadGroup.zIndex = -1;
    dad.setPosition(740,45);
    dad.scale.set(3,3);



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
    add(scanlinesFake);

    staticOverlay = new FlxSprite();
    staticOverlay.frames = Paths.getSparrowAtlas(ext + "tv_static");
    staticOverlay.animation.addByPrefix("anim", "tv_static idle", 25, true);
    staticOverlay.animation.play("anim", true);
    staticOverlay.updateHitbox();
    staticOverlay.scale.set(1.7,1.7);
    staticOverlay.antialiasing = false;
    staticOverlay.alpha = 1;
    staticOverlay.screenCenter();
    staticOverlay.cameras = [game.camOther];
    game.add(staticOverlay);

    glitchBump = new FlxSprite();
    glitchBump.frames = Paths.getSparrowAtlas(ext + 'spiritBump');
    glitchBump.animation.addByPrefix('anim', 'spiritBump', 24, true);
    glitchBump.animation.play('anim', true);
    glitchBump.scrollFactor.set();
    glitchBump.alpha = 0;
    glitchBump.updateHitbox();
    glitchBump.screenCenter();
    glitchBump.scale.set(1.9,1.9);
    game.add(glitchBump);


    bfSigh = new FlxSprite();
    
    bfSigh.frames = Paths.getSparrowAtlas(ext + 'BfSigh');
    bfSigh.animation.addByPrefix('anim', 'BfSigh', 24, false);
    bfSigh.animation.play('anim', true);
    //bfSigh.scrollFactor.set();
    bfSigh.alpha = 1;
    bfSigh.scale.set(13,13);
    bfSigh.setPosition(4000,1055);
    game.add(bfSigh);

    helpme = new FlxSprite();
    helpme.frames = Paths.getSparrowAtlas(ext + 'HelpMe');
    helpme.animation.addByPrefix('anim', 'HelpMe idle', 16, false);
    helpme.animation.play('anim', true);
    helpme.scrollFactor.set();
    helpme.alpha = 1;
    helpme.updateHitbox();
    helpme.screenCenter();
    helpme.scale.set(3.2,3.2);
    helpme.antialiasing = false;
    helpme.visible = false;
    add(helpme);

	school = new FlxSprite();
	school.frames = Paths.getSparrowAtlas('stages/roots/animatedEvilSchool');
	school.animation.addByPrefix('bg2', 'background 2 instance 1', 24, true);
	school.updateHitbox();
	school.animation.play('bg2');
	school.alpha = 0.0001;
	school.zIndex = -3;
    	school.x = 560;
    	school.y = -10;
	school.scale.set(8, 8);
	add(school);

    speedLines = new FlxSprite();
    speedLines.frames = Paths.getSparrowAtlas(ext + "speedlines");
    speedLines.animation.addByPrefix("anim", "speedlines idle", 25, true);
    speedLines.animation.play("anim", true);
    speedLines.updateHitbox();
    speedLines.scale.set(1,1);
    speedLines.antialiasing = false;
    speedLines.alpha = 1;
    speedLines.blend = 0;
    speedLines.setPosition(-9000,200);
    speedLines.scale.set(3,3);

    add(speedLines);

    handGrabEnd = new FlxSprite();
    handGrabEnd.frames = Paths.getSparrowAtlas(ext + "hand_grab_end");
    handGrabEnd.animation.addByPrefix("anim", "hand_grab_end idle", 15, false);
    handGrabEnd.animation.play("anim", true);
    handGrabEnd.updateHitbox();
    handGrabEnd.scale.set(1,1);
    handGrabEnd.antialiasing = false;
    handGrabEnd.alpha = 1;
    handGrabEnd.blend = 0;
    handGrabEnd.setPosition(-9000,-9000);
    handGrabEnd.scale.set(3,3);
    game.add(handGrabEnd);

}

function opponentNoteHit(){

    if (curBg == 0){
        game.dad.x = FlxG.random.float(-30, 1570);
        game.dad.y = FlxG.random.float(-175, 355);
        var scaleLol:Float = FlxG.random.float(1, 4);
        game.dad.scale.set(scaleLol,scaleLol);
    }else{

	}
    
}

function onUpdate(elapsed){
    if (game.dad.animation.curAnim.name == "idle" && curBg == 0){
        game.dad.x = -4000;
    }

    if (glitchBump.alpha > 0){
        glitchBump.alpha -= elapsed;
    }

    if (curBeat == 20){
       staticOverlay.kill();
    }

    if(curBg == 2){
        timer += elapsed * 0.35;
        school.alpha = ((FlxMath.fastSin(timer) * 0.5) + (glitchBump.alpha * 0.75)) * game.dad.alpha;
    }else{
        timer = 0;
        school.alpha = 0;
    }
}


var playing = false;
var playing2 = false;
var alpha:Float =0.0;

function onEvent(eventName, value1, value2){
    switch(eventName){
        case 'Song Event':
            if(value1 == 'zoom'){
               // barrel.data.offset.value = [640, 360];
               // barrel.data.zoom.value[0] = 1 / Std.parseFloat(value2);
            }
        case "addelement":
            switch (value1){
                case "speedlines":
                    speedLines.x = 300;
                case "nospeedlines":
                    speedLines.x = -9000;
            }
        case 'removechars':
            glitchBump.alpha = 0.25;
            FlxG.camera.zoom += 0.08;
			game.camHUD.zoom += 0.10;
            
            FlxTween.tween(game.dad, {alpha: 0}, 1.0);
            FlxTween.tween(game.boyfriend, {alpha: 0}, 1.0);
        case 'playendanim':
            //senpaiEvil.animation.play('idle',true);
            //FlxTween.tween(senpaiEvil, {alpha: 1}, 0.3);
            handGrabEnd.animation.play("anim", true);
            handGrabEnd.setPosition(300,200);
	    iconP1.alpha = iconP2.alpha = playHUD.healthBar.alpha = 0.00001;
            video5.kill();
        case 'specialbump':
            if (value1 == "2"){
                glitchBump.alpha = 0.5;
                FlxG.camera.zoom += 0.16;
                game.camHUD.zoom += 0.15;
            }
            else if (value1 == "3"){
                //glitchBump.alpha = 0.5;
                FlxG.camera.zoom += 0.03;
                game.camHUD.zoom += 0.05;
            }
            else if (value1 == "4"){
                FlxG.camera.zoom += 0.03;
                game.camHUD.zoom += 0.05;
            }
            else if (value1 == "5"){
                glitchBump.alpha = 0.25;
                FlxG.camera.zoom += 0.08;
                game.camHUD.zoom += 0.10;
            }
            else if (value1 == "6"){
                glitchBump.alpha = 0.15;
                FlxG.camera.zoom += 0.04;
                game.camHUD.zoom += 0.05;
            }
            else if (value1 == "7"){
                FlxG.camera.zoom += 0.03;
                game.camHUD.zoom += 0.05;
            }
            else if (value1 == "8"){
                FlxG.camera.zoom += 0.1;
                game.camHUD.zoom += 0.5;
            }
	    else if (value1 == "glitch"){
                //bigGlitch.data.time.value[0] = FlxG.random.float(0.0, 999.0);
            }
            else {
                glitchBump.alpha = 0.25;
                FlxG.camera.zoom += 0.08;
                game.camHUD.zoom += 0.05;
            }

case 'playvideo':
            if (value1 == "help"){ // help me intermission
                helpme.visible = true;
                hideJudge = true;
                helpme.animation.play('anim', true);
            }
            else if (value1 == "hand"){ // hand reach at screen intermission
		video6.kill();
                video7.kill(); // show tunnel 2
		video4.play();
		boyfriend.alpha = 0.00001;
/*                 game.camHUD.alpha = 0; */ // this is done during gameplay so pls no
                hideJudge = true;
            }else if (value1 == "handloop"){ // hands grabbing at screen loop
                //video5.visible = true;
                //game.camHUD.alpha = 0;
                //video5.setPosition(-130,-110);
		video5.play();
                 
            }
            else if (value1 == "intermission"){ // glitch intermission
		iconP1.alpha = iconP2.alpha = numTunnel.alpha = numTunnel2.alpha = dad.alpha = boyfriend.alpha = playHUD.healthBar.alpha = 0.0001;
                //game.remove(evilTrail);


                //game.dadField.noteField.visible = false;
                game.camHUD.alpha = 0.5;

                hideJudge = true;
                //game.camGame.setFilters([]);

                // give max health cuz this part is hard lololol
                // if you want true chkdsk experience, disable this and play without ghost tapping :3
                game.health = 2; 

		video8.play();
                //object = video8;
                //FlxG.debugger.track(object);


            }
            else if (value1 == "tunnel2"){ // second free fall tunnel
                if(playing2)return;
                playing2 = true;

		//school.kill();
                //add(video6);
		video6.play();
		insert(0, video7);
		//video7.play();

                //video.x = 4000; // hide off screen lol
                numTunnel.x = 4000;
                numTunnel2.x = 4000;
                //video2.x = 4000; // prolly bad for low end pcs so oopsy

            }else if (value1 == "remove"){ // remove intermission vids
                if (value2 == "4"){
                    video4.kill();
		    boyfriend.alpha = 1;
                    video4.x = 8000;
                    //video.x = -200;
                    numTunnel.x = 240;
                    numTunnel.alpha = 0.3;
                    //video.visible = true;
                    hideJudge = false;
                }
                else if (value2 == "5"){
                    video5.kill();
                }
                else if (value2 == "hands"){
                    //FlxTween.tween(video5, {alpha: 0}, 1.0);
                }
                else{ // video 3 lol
                    FlxTween.tween(helpme, {alpha: 0}, 0.2);
                    hideJudge = false;
			//game.camHUD.alpha = 1;
                }
                //game.camHUD.alpha = 1;
            
            }else{ // free fall tunnel 1
                numTunnel.animation.play('anim', true);
                numTunnel2.animation.play('anim', true);  
                glitchBump.alpha = 0.25;
                FlxG.camera.zoom += 0.08;
                game.camHUD.zoom += 0.10;
            }
        case 'addtrail':
            addTrail(game.boyfriend, 0, 4, 2);
            bfTrail.color = FlxColor.fromRGB(0,142,255,255);
        case 'removetrail':
            game.remove(bfTrail);

 case 'changeBf': 
            if (value1 == "fall"){ // free fall view
                game.changeCharacter("bf-pixel-dive", 0);
                game.boyfriend.setPosition(740 - 200,500);
                game.boyfriend.scale.set(6,6);

                bfSigh.setPosition(4000,1055);

                game.changeCharacter("spiritBack", 1);

                //game.remove(evilTrail);
                //addTrail(game.dad, 1);
                curBg = 1;
                game.dad.scrollFactor.set(1,1);
                game.dad.setPosition(640 + 100,220+25);
                game.dad.scale.set(10,10);

                numAccY = -500;
                numAccX = -1000;
                numScale = 10;

                if (tweenStarted == false){


                    FlxTween.tween(game.boyfriend,  {x: game.boyfriend.x + 400}, 4.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                    FlxTween.tween(game.boyfriend,  {y: game.boyfriend.y + 100}, 1.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                    FlxTween.tween(game.boyfriend.scale,  {x: 7, y: 7}, 3.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
    
                    dadTweenX = FlxTween.tween(game.dad,  {x: game.dad.x - 200}, 4.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                    dadTweenY = FlxTween.tween(game.dad,  {y: game.dad.y - 50}, 1.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                    

			//camGame.angle = Math.sin((Conductor.songPosition / 1200) * (Conductor.bpm / 60) * -1.0) * 4;


		tweenStarted = true;


                } else if (tweenStarted == true){
                    dadTweenX.cancel();
                    dadTweenY.cancel();
                    game.dad.x + 200;
                    game.dad.y + 50;
                    dadTweenX = FlxTween.tween(game.dad,  {x: game.dad.x - 200}, 4.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                    dadTweenY = FlxTween.tween(game.dad,  {y: game.dad.y - 50}, 1.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                }





                //video6.visible = false;
                //video7.visible = false; // hide tunnel 2

               // video.play();
                //video2.play();

               // video.visible = true;
               // video2.visible = true; // show tunnel 1

                numTunnel2.alpha = 0.7;
                numTunnel2.x = 240;
                numTunnel.alpha = 0.3;
                numTunnel.x = 240;

               // video2.x = -200;
               // video.x = -200; // put back on screen cuz i hid them earlier idk why

                //nullGlitch.data.glitchAmplitude.value = [10.0];
            }else if (value1 == "altfall"){ // free fall but different bg and spirit is sad
                //game.dadField.noteField.visible = true;

                //modManager.setValue("fieldX", 0, 1); 
                //modManager.setValue("noteSpawnTime", 1500);
                //modManager.setValue("fieldY", 0, 1); 
                //bgField.visible = false;
                game.changeCharacter("bf-pixel-dive", 0);
                game.boyfriend.setPosition(740 - 200,500);
                game.boyfriend.scale.set(6,6);

		
                bfSigh.setPosition(4000,1055);

                //game.changeCharacter("spiritSad", 1);
                
                game.dad.setPosition(640 + 100,220+25);
                game.dad.scale.set(10,10);

                //game.remove(evilTrail);
                //addTrail(game.dad, 1);

                numAccY = -500;
                numAccX = -1000;
                numScale = 10;

                dadTweenX.cancel();
                dadTweenY.cancel();
                game.dad.x - 200;
                game.dad.y - 50;
                dadTweenX = FlxTween.tween(game.dad,  {x: game.dad.x + 200}, 4.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                dadTweenY = FlxTween.tween(game.dad,  {y: game.dad.y + 50}, 1.0, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
                tweenStarted = true;

                curBg = 1;
                game.dad.scrollFactor.set(1,1);

                // never being used again so we can dispose of them
                //video.destroy();
                //video2.destroy();

                numTunnel.alpha = 0.0001;
                numTunnel2.alpha = 0.00001;
/*                 video.visible = false;
                video2.visible = false; // hide tunnel 1 */

                //video6.visible = false;
                //video7.visible = false; // show tunnel 2

                //nullGlitch.data.glitchAmplitude.value = [10.0];
            }
            else if (value1 == "remove"){
                if (value2 == "overlay"){
                    //game.camGame.setFilters([new ShaderFilter(barrel), new ShaderFilter(vignette), new ShaderFilter(bigGlitch), new ShaderFilter(chroma),new ShaderFilter(bloom),new ShaderFilter(nullGlitch), new ShaderFilter(pixelate)]);
                    //game.camHUD.setFilters([new ShaderFilter(chroma),new ShaderFilter(bloom),new ShaderFilter(nullGlitch)]);
                } else if (value2 == "addoverlay"){
                    //game.camGame.setFilters([new ShaderFilter(barrel), new ShaderFilter(vignette), new ShaderFilter(bigGlitch), new ShaderFilter(chroma),new ShaderFilter(bloom),new ShaderFilter(nullGlitch), new ShaderFilter(overlay), new ShaderFilter(pixelate)]);
                    //game.camHUD.setFilters([new ShaderFilter(chroma),new ShaderFilter(bloom),new ShaderFilter(nullGlitch), new ShaderFilter(overlay)]);
                }
                else {
                    game.boyfriend.x = 4000;
                }
                
            }
            else if (value1 == "main"){ // original view
                curBg = 0;

                game.changeCharacter("nullbf", 0);
                game.boyfriend.scale.set(6,6);
                game.boyfriend.setPosition(790, 741);

                game.changeCharacter("spiritBack", 1);
                game.dad.setPosition(740,45);
                game.dad.scale.set(3,3);

                //game.remove(evilTrail);
                //addTrail(game.dad, 1, 8, 5, 0.4, 0.030);

              //  video.visible = false;
              //  video2.visible = false;
                numTunnel.kill();
                numTunnel2.kill();

                //nullGlitch.data.glitchAmplitude.value = [10.0];

                    dadTweenX.cancel();
                    dadTweenY.cancel();


            
            }else if (value1 == "sigh"){ // sigh anim
                //game.camGame.setFilters([new ShaderFilter(barrel), new ShaderFilter(vignette), new ShaderFilter(bigGlitch), new ShaderFilter(chroma),new ShaderFilter(bloom),new ShaderFilter(nullGlitch), new ShaderFilter(pixelate)]);


                game.changeCharacter("frontfacingbf", 0);
                game.boyfriend.setPosition(4000,810);
                game.boyfriend.scale.set(13,13);
                bfSigh.setPosition(754,1055);
                bfSigh.animation.play('anim', true);

		curBg = 2;
                numAccY = 200;
                numAccX = 0;
                numScale = 5;
		game.changeCharacter("spiritSad", 1);
                game.dad.setPosition(540,-105);
                game.dad.scale.set(6.7,6.7);
                game.dad.scrollFactor.set(0.2,0.2);
                game.dad.alpha = 0;
		game.boyfriend.alpha = 1;
		iconP1.alpha = playHUD.healthBar.alpha = 1;

                //hide intermission video
                //video8.visible = false;
                video8.kill();
                //video8.destroy(); // to prevent having videos that're not being used ever again still loaded
                //video8.x = 8000;
		//game.remove(video8);
                hideJudge = false;
                game.camHUD.alpha = 1;
                

                arrT = [0.0,0.0,255.0];   // change overlay to blue
                arrR = [0.0,0.0,255.0];
                overlay.data.rT.value = [arrT[0]/255];
                overlay.data.gT.value = [arrT[1]/255];
                overlay.data.bT.value = [arrT[2]/255];
                overlay.data.rR.value = [arrR[0]/255];
                overlay.data.gR.value = [arrR[1]/255];
                overlay.data.bR.value = [arrR[2]/255];

                if (value2 == "1"){
                    //game.changeCharacter("senpaiBackFirst", 1);
                } else{
                    
                }


              //  video.visible = false;
              //  video2.visible = false;
              //  video.stop(); // no point in processing whats invisible
              //  video2.stop(); // no point in processing whats invisible

                //numTunnel.animation.pause();
                numTunnel.alpha = 0;
                //numTunnel2.animation.pause();
                numTunnel2.alpha = 0;

                //game.remove(evilTrail);
                //game.add(evilTrail);

                nullGlitch.data.glitchAmplitude.value = [10.0];
                //object = video8;
                FlxG.debugger.track(object);
            }else if (value1 == "showbf"){ // normal bf returns
                game.boyfriend.setPosition(770,810);
                bfSigh.setPosition(4000,1055);
            }else if (value1 == "showspirit"){ // spirit fade in
		FlxTween.tween(iconP2, {alpha: 1}, 4.0);
                FlxTween.tween(game.dad, {alpha: 1}, 4.0);
		
                //FlxTween.tween(bgField, {alpha: 1}, 4.0);
            }else if (value1 == "removeStatic"){
                FlxTween.tween(staticOverlay,  {alpha: 0}, 3.0);
            }else{ // front view
                //game.dadField.noteField.visible = false;

               // modManager.setValue("fieldX", 400, 1); 
                //modManager.setValue("noteSpawnTime", 3000);
                //modManager.setValue("fieldY", -200, 1); 
                //bgField.visible = true;

                //game.changeCharacter("bf-pixelFront", 0);
                game.boyfriend.setPosition(770,810);
                game.boyfriend.scale.set(13,13);
                //bfSigh.setPosition(754,1055);
                //bfSigh.animation.play('anim', true);

                if (value2 == "1"){
                    //game.changeCharacter("senpaiBackFirst", 1);
                } else{
                    game.changeCharacter("spiritSad", 1);
                }

                if (tweenStarted == true){ // stop freefall tween near end of song
                    dadTweenX.cancel();
                    dadTweenY.cancel();
                }
                

                curBg = 2;
                numAccY = 200;
                numAccX = 0;
                numScale = 5;
                game.dad.setPosition(540,-105);
                game.dad.scale.set(6.7,6.7);
                game.dad.scrollFactor.set(0.2,0.2);

                game.remove(evilTrail);
                //game.add(evilTrail);

                nullGlitch.data.glitchAmplitude.value = [10.0];
                //object = bfSigh;
                FlxG.debugger.track(object);
            }

}
}
