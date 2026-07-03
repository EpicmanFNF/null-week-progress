
// This whole script goes into the song folder, alongside the inst, vocals, info ect. Not the data folder

function onCreatePost()
{
	intro = new FunkinVideoSprite();
	intro.onFormat(() -> {
		intro.cameras = [camOther];
		intro.setGraphicSize(FlxG.width);
		intro.screenCenter();
		add(intro);
	});
	intro.onEnd(() -> {
		camGame.alpha = 1;
		camHUD.alpha = 1;
		intro.kill();
	});
	intro.load(Paths.video('didyouforget'), [FunkinVideoSprite.muted]); 	// Change the name in parenthesis to be your file name (Assuming it's not in any folders other then video)
	intro.antialiasing = ClientPrefs.globalAntialiasing;
	
	// Desync prevention (at least as much as I can do)
	intro.play();
	intro.pause();
	intro.tiedToGame = false;
}

function onStepHit()
{
    if (curStep == 448) 	// Change this to the step you want it to start on
    {
        camGame.alpha = camHUD.alpha = 0;
	    intro.play();
	    intro.tiedToGame = true;
    }
}

