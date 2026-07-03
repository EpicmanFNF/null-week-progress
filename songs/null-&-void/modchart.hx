function numericForInterval(start, end, interval, func){
    var index = start;
    while(index < end){
        func(index);
        index += interval;
    }
}

function onCreatePost()
{
    modManager.setValue("unboundedReverse", 1);
  	modManager.queueSet(-16, "opponentSwap", 0.5, 0);
	modManager.queueSet(-16, "opponentSwap", -1.5, 1);

	modManager.queueEase(0, 2, "opponentSwap", 0.5, 'circOut', 1);
	modManager.queueEase(0.75, 6, "opponentSwap", -1, 'circOut', 0);

	modManager.queueEase(6, 8, "centered", 1, 'circOut', 1);
		
	modManager.queueEase(16, 20, "centerrotateZ", -90, 'circOut', 1);
	modManager.queueEase(22, 26, "centered", 0, 'quadOut', 1);

	modManager.queueSet(16, "transformY", -50, 1);
	modManager.queueSet(18, "transformY", -100, 1);
	modManager.queueSet(19, "transformY", -150, 1);
	modManager.queueSet(20, "transformY", -200, 1);

	
	
	modManager.queueEase(22, 26, "transformY", -200, 'quadOut', 1);

	modManager.queueEase(32, 36, "centerrotateZ", -180, 'circOut', 1);
	modManager.queueEase(32, 36, "flip", 1, 'circOut', 1);
	modManager.queueEase(32, 36, "transformY", 0, 'circOut', 1);

	modManager.queueSet(36, "reverse", 1, 1);
	modManager.queueSet(36, "flip", 0, 1);
	modManager.queueSet(36, "centerrotateZ", 0, 1);

	modManager.queueEase(38, 40, "flip", 0.75, 'quartOut', 1);
	modManager.queueEase(38, 40, "invert", 0.75, 'quartOut', 1);

	modManager.queueSet(42, "flip", 0.9375, 1);
	modManager.queueSet(42, "invert", 0.375, 1);
	
	modManager.queueSet(43, "invert", 0, 1);
	modManager.queueSet(43, "flip", 1, 1);

	modManager.queueSet(48, "centered", 1, 1);
	modManager.queueSet(50, "reverse", 0, 1);
	modManager.queueSet(50, "centered", 0, 1);
	modManager.queueSet(51, "flip", 0.375, 1);
	modManager.queueSet(52, "flip", 0, 1);

	modManager.queueEase(54, 58, "opponentSwap", 0, 'quadOut');
    
     var f = 1;
    numericForInterval(128, 441, 8, (s)->{
        f *= -1;
        modManager.queueSet(s, 'transformX', -85 * f);
        modManager.queueSetP(s, 'mini', -50);
        modManager.queueEase(s, s + 4, 'transformX', 0, 'cubeOut');
        modManager.queueEaseP(s, s + 4, "mini", 0, "quadOut");

        modManager.queueSet(s, "drunk", 1 * f);
        modManager.queueEase(s,s+4,"drunk",0,'cubeOut');

        var step = s + 4;
        
        modManager.queueSetP(step, 'tipsy', 125);
        modManager.queueSetP(step, 'tipsyOffset', 25);
        modManager.queueSet(step, 'transformX', -75);
        modManager.queueSetP(step, 'mini', -50);
        modManager.queueEase(step, step + 4, 'transformX', 0, 'cubeOut');
        modManager.queueEaseP(step, step + 4, 'tipsy', 0, 'cubeOut');
        modManager.queueEaseP(step, step + 4, 'tipsyOffset', 0, 'cubeOut');
        modManager.queueEaseP(step, step + 4, "mini", 0, "quadOut");

        modManager.queueSet(step, "tipsy", 1 * f);
        modManager.queueEase(step,step+4,"tipsy",0,'cubeOut');
    });
  
    modManager.queueSet(250, "stealth", 1, 1);
	modManager.queueSet(250, "dark", 1);
	modManager.queueFuncOnce(250, (ev, s) -> {
		game.camGame.visible = false;
	});

	modManager.queueFuncOnce(256, (ev, s) -> {
		game.camGame.visible = true;
	});

    modManager.queueEase(256, 264, "stealth", 0, 'quartOut', 1);
	modManager.queueEase(256, 264, "dark", 0, 'quartOut');
    modManager.queueEase(384, 390, "beat", 0.125, 'quadOut');
    
    modManager.queueEase(442, 448, "alpha", 0.5, "quadOut", 0);
    modManager.queueEase(448, 452, "beat", 0.75, 'quadInOut');
    modManager.queueEase(448, 452, "alpha", 0.25, 'backOut', 0);
    modManager.queueEase(448, 452, "stealth", 0.25, 'backOut', 0);
    
    var a = 0.5;
    var lCD:Int = -1;
    modManager.queueFunc(448, 512, function(event, cDS)
    {
        if(lCD == -1)
            lCD = cDS;
        
        a = a + (cDS - lCD);
        lCD = cDS;
        var val = Math.cos(a / 4);
        var val2 = Math.sin(a / 4);
        modManager.setValue("opponentSwap", 0.5 - (0.5 * val), 0);

        modManager.setValue("opponentSwap", ((0.5 * val) * -1) + 0.5, 1);
    });

    modManager.queueEase(512, 516, "beat", 0.125, 'quadInOut');
    modManager.queueEase(512, 516, "alpha", 0, 'backOut', 0);
    modManager.queueEase(512, 516, "transformZ", 0, 'backOut', 0);
    modManager.queueEase(512, 516, "transformZ", 0, 'backOut', 1);
    modManager.queueEase(512, 516, "stealth", 0, 'backOut', 0);
    modManager.queueEase(512, 516, "opponentSwap", 1, "quadOut");

    modManager.queueEase(575, 579, "beat", 0.75, 'quadInOut');
    modManager.queueEase(575, 579, "alpha", 0.25, 'backOut', 1);
    modManager.queueEase(575, 579, "stealth", 0.25, 'backOut', 1);

     var a = 0.5;
    var lCD:Int = -1;
    modManager.queueFunc(575, 639, function(event, cDS)
    {
        if(lCD == -1)
            lCD = cDS;
        
        a = a + (cDS - lCD);
        lCD = cDS;
        var val = Math.cos(a / 4) * -1;
        var val2 = Math.sin(a / 4) * -1;
        // FlxG.log.add(val);
        modManager.setValue("opponentSwap", 0.5 - (0.5 * val), 0);

        // modManager.setValue("centerrotateZ", (val * 0.5) * -1, 0);
        // modManager.setValue("centerrotateZ", (val * 0.5), 1);

        modManager.setValue("opponentSwap", ((0.5 * val) * -1) + 0.5, 1);
    });

    modManager.queueEase(626, 638, "opponentSwap", 0.4, 'quadOut', 1);
    modManager.queueEase(639, 643, "beat", 0.125, 'quadInOut');
    modManager.queueEase(639, 643, "alpha", 0, 'backOut', 1);
    modManager.queueEase(639, 643, "stealth", 0, 'backOut', 1);
	modManager.queueSet(639, "transformY", -250, 1);
	modManager.queueSet(639, "transformX", 250, 1);
    modManager.queueEase(639, 643, "opponentSwap", 0, "quadOut");
    modManager.queueEase(639, 643, "transformZ", 0, 'backOut', 0);
    modManager.queueEase(639, 643, "transformZ", -1, 'backOut', 1);
    modManager.queueEase(639, 643, "sudden", 1, 'quadInOut');

    modManager.queueEase(700, 704, "centered", -0.1, "circOut");
	modManager.queueSet(704, "stretch", 3);
	modManager.queueEase(704, 708, "stretch", 0, "circOut");
	modManager.queueEase(704, 708, "reverse", 1, "quintOut");
	modManager.queueEase(704, 708, "centered", 0, "quintOut");

    modManager.queueEase(767, 772, "reverse", 0, 'bounceOut', 0);
    modManager.queueEase(767, 772, "sudden", 0, 'bounceOut');
    modManager.queueEase(767, 772, "centered", 1, 'bounceOut');
    modManager.queueEase(767, 772, "opponentSwap", 0.5, 'bounceOut', 0);
    modManager.queueEase(767, 772, "alpha", 0.5, 'quadOut', 1);
    modManager.queueEase(767, 772, "stealth", 0.5, 'quadOut', 1);

    modManager.queueEase(767, 772, "invert", .25,'bounceOut',1);
    modManager.queueEase(767, 772, "flip", -.75,'bounceOut',1);
    modManager.queueEase(767, 772, "flip", -.25,'bounceOut',0);
    modManager.queueEase(767, 772, "invert", -.25,'bounceOut',0);

    modManager.queueEase(767, 772, "split", 1, 'bounceOut');
    
    modManager.queueEase(799, 803, "invert", .25,'bounceOut',0);
    modManager.queueEase(799, 803, "flip", -.75,'bounceOut',0);
    modManager.queueEase(799, 803, "flip", -.25,'bounceOut',1);
    modManager.queueEase(799, 803, "invert", -.25,'bounceOut',1);

    modManager.queueEase(831, 835, "invert", .25,'bounceOut',1);
    modManager.queueEase(831, 835, "flip", -.75,'bounceOut',1);
    modManager.queueEase(831, 835, "flip", -.25,'bounceOut',0);
    modManager.queueEase(831, 835, "invert", -.25,'bounceOut',0);

    modManager.queueSet(863, "flip", -.375);
    modManager.queueSet(863, "invert", .125);

    modManager.queueSet(870, "transformY", 100, 0);
    modManager.queueSet(870, "transformY", -100, 1);
    modManager.queueSet(870, "split", 0);
    modManager.queueSet(870, "reverse", 1, 0);
    modManager.queueSet(870, "reverse", 0, 1);

    modManager.queueSet(876, "transformY", -100, 0);
    modManager.queueSet(876, "transformY", 100, 1);
    modManager.queueSet(876, "reverse", 0, 0);
    modManager.queueSet(876, "reverse", 1, 1);

    modManager.queueEase(890, 894, "reverse", 0, 'quadOut');
    modManager.queueEase(890, 894, "invert", 0, 'quadOut');
    modManager.queueEase(890, 894, "flip", 0, 'quadOut');
    modManager.queueEase(890, 894, "centered", 0, 'quadOut');
    modManager.queueEase(890, 894, "transformY", 0, 'quadOut');

    modManager.queueSet(870, "stealth", 0);
	modManager.queueEase(870, 876, "stealth", 1, 'quadOut');

	modManager.queueSet(876, "stealth", 0);
	modManager.queueEase(876, 882, "stealth", 1, 'quadOut');

	modManager.queueEase(882, 888, "stealth", 0, 'sineOut');

    modManager.queueEase(896, 908, "sudden", 0, 'quadOut');
    modManager.queueEase(896, 643, "transformZ", 0, 'backOut', 1);
	modManager.queueSet(896, "transformX", 0, 1);
    modManager.queueEase(896, 908, "stealth", 0, 'quadOut');
    modManager.queueEase(896, 908, "alpha", 0, 'quadOut');
    modManager.queueSet(896, "opponentSwap", 0.5, 1);
    modManager.queueEase(896, 908, "opponentSwap", 0, 'quadOut');

    modManager.queueEase(950, 955, "reverse", 0.05, "linear");
	modManager.queueEase(955, 960, "reverse", 1, "quadIn");

	modManager.queueSet(1023, "transformX", 0, 0);
    modManager.queueSet(1023, "transformX", 0, 1);
    modManager.queueSet(1023, "localrotateZ", 0);
    modManager.queueSet(1023, "sudden", 0);
    modManager.queueSet(1023, "stealth", 0, 1);
    modManager.queueSet(1023, "alpha", 0, 1);
    modManager.queueSet(1023, "opponentSwap", 0);
    modManager.queueSet(1023, "squish", 0.25);
    modManager.queueEase(1023, 1026, "squish", 0, 'circOut');
    modManager.queueEase(1023, 1048, "tipsy", 0.75, 'quadInOut');
    modManager.queueEase(1023, 1048, "drunk", 0.75, 'quadInOut');
	modManager.queueEase(1024, 1046, "stealth", 0.5, 'linear');
	modManager.queueEase(1024, 1046, "dark", 0.5, 'linear');
	modManager.queueSet(1024, "transformY", -250, 1);
    modManager.queueEase(1024, 1025, "transformZ", -1, 'backOut', 1);

	modManager.queueSet(1050, "dark", 0);
	modManager.queueSet(1052, "stealth", 0);

	modManager.queueFuncOnce(1024, (ev, s) -> {
		game.camGame.visible = false;
	});

	modManager.queueFuncOnce(1056, (ev,s)->{
		game.camGame.visible = true;
	});
	modManager.queueSet(1024, "reverse", 0);
	modManager.queueEase(1024, 1050, "opponentSwap", 0.4, 'sineOut', 1);

    modManager.queueSet(1049, "drunk", 0.1);
    modManager.queueSet(1049, "tipsyZ", 3);
	modManager.queueSet(1050, "dark", 0);
	modManager.queueSet(1051, "xmod", 0.9);
	modManager.queueSet(1052, "stealth", 0);
    modManager.queueEase(1055, 1059, "beat", 0.75, 'quadInOut');
	
    modManager.queueSet(1146, "stealth", 1, 1);
	modManager.queueSet(1146, "dark", 1);
	modManager.queueFuncOnce(1146, (ev, s) -> {
		game.camGame.visible = false;
	});

	modManager.queueFuncOnce(1152, (ev, s) -> {
		game.camGame.visible = true;
	});
    
    modManager.queueSet(1152, "stealth", 0.5, 1);
	modManager.queueSet(1152, "dark", 0.5);
	modManager.queueEase(1152, 1160, "stealth", 0, 'quartOut', 1);
	modManager.queueEase(1152, 1160, "dark", 0, 'quartOut');

    modManager.queueEase(1279, 1311, "alpha", 1, 'quadInOut');
}