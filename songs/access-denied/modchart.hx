function numericForInterval(start, end, interval, func){
    var index = start;
    while(index < end){
        func(index);
        index += interval;
    }
}

function tr(deg)
{
    return deg * (3.141592653595 / 180);
}

function onCreatePost()
{
    if(ClientPrefs.modcharts) loadModchart();
}

function loadModchart()
{
    for(i in 0...4) { modManager.queueEase(8, 42, 'transform' + i + "Y", 0, 'quadOut'); } 
    modManager.queueFuncOnce(8, function(step, event){
        twn = FlxTween.num(16, 1, 2.75, {ease: FlxEase.quadOut});
        twn.onUpdate = function(tw:FlxTween){
            strength = tw.value;
        }
    });
    
    modManager.queueEase(8,42, 'alpha', 0, 'quadOut');
    modManager.queueEase(8, 48, 'centerrotateZ', 0, 'quadOut');
    modManager.queueEase(8, 42, 'centered', 1, 'quadOut');
    modManager.queueEase(8, 42, 'transformZ', 0, 'quadOut');
    
    modManager.queueSet(50, "split", 0);
	modManager.queueSet(50, 'downscrollDenied', 0);
    for(i in 0...4){
        for(j in 0...2){
            modManager.queueSet(50, "transform" + i + "X", FlxG.random.int(-500, 500), j);
            modManager.queueSet(50, "transform" + i + "Y", FlxG.random.int(-300, 300), j);
        }
        modManager.queueEase(57 + (i * 0.5), 66 + (i * 0.5), "transform" + i + "X", 0, "backInOut");
        modManager.queueEase(57 + (i * 0.5), 66 + (i * 0.5), "transform" + i + "Y", 0, "backInOut");
    }
    modManager.queueEase(57, 66, "centered", 0, 'backInOut');
    modManager.queueEase(57, 66, "opponentSwap", 0, "backInOut");

    modManager.queueFunc(76, 80, function(step, shit2){ for(i in 0...4){ modManager.setValue("transform" + i + "X", FlxG.random.float(-7.5, 7.5), 1); modManager.setValue("transform" + i + "Y", FlxG.random.float(-7.5, 7.5), 1); } });

    for(i in 0...4){ modManager.queueEase(86, 92, "transform" + i + "X", 0, 'quadOut', 1); modManager.queueEase(86, 90, "transform" + i + "Y", 0, 'quadInOut', 1); }

    modManager.queueFunc(108, 112, function(step, shit2){ for(i in 0...4){ modManager.setValue("transform" + i + "X", FlxG.random.float(-7.5, 7.5), 1); modManager.setValue("transform" + i + "Y", FlxG.random.float(-7.5, 7.5), 1); } });

    modManager.queueFunc(114, 118, function(step, shit2){ for(i in 0...4){ modManager.setValue("transform" + i + "X", FlxG.random.float(-7.5, 7.5), 1); modManager.setValue("transform" + i + "Y", FlxG.random.float(-7.5, 7.5), 1); modManager.setValue("confusionOffset" + i, FlxG.random.int(0, 360), 1); } });
    modManager.queueEase(114, 118, "reverse", 1, 'circOut', 1);

    modManager.queueEase(129, 130, "invert", 1, "circOut", 1);
    modManager.queueEase(130, 134, "invert", 0, "circOut", 1);

     modManager.queueSet(186, "centered", 0.5);
    modManager.queueSet(188, "centered", 1);
    modManager.queueSet(190, "centered", 0.5);
    modManager.queueSet(190, "reverse", 0, 1);
    modManager.queueSet(190, "reverse", 1, 0);
    modManager.queueSet(192, "centered", 0);

    modManager.queueEase(316, 320, "opponentSwap", 0.5, 'backInOut');
    modManager.queueEase(316, 320, "stealth", 0.5, 'backInOut', 1);
    modManager.queueEase(316, 320, "alpha", 0.5, 'backInOut', 1);

    modManager.queueEase(384, 432, "centered", 1, 'quartInOut');
    modManager.queueEase(448, 464, "centerrotateZ", 15 , 'quartIn');
    modManager.queueEase(448, 464, "transformZ", 1, 'quartIn');
    modManager.queueEase(448, 464, "alpha", 1, 'quartIn');

    modManager.queueSet(464, "transformZ", 0);
    modManager.queueSet(464, "centered", 0);
    modManager.queueSet(464, "centerrotateZ", 0);
    modManager.queueSet(464, "reverse", 0);
    strength = 1;
    for( i in 0...4) { modManager.queueSet(464, "transform" + i + "Z", 0); }
    modManager.queueSet(700, "opponentSwap", 0);
    modManager.queueSet(700, "sudden", 0);
    modManager.queueSet(700, "centerrotateZ", 0);

    modManager.queueEase(700, 704, "alpha", 0, 'quadInOut');

    modManager.queueEase(946, 952, "flip", 0, 'cubeOut');
    modManager.queueEase(946, 952, "opponentSwap", 0, 'cubeOut');
    modManager.queueEase(946, 952, "transformZ", 0, 'cubeOut');

    var f = 1;
	numericForInterval(960, 1216, 2, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');

		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
        });
          //modManager.queueSet(960, "beat", 1);

     numericForInterval(960, 1216, 1, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		modManager.queueSet(i, "xmod", 0.7);
		modManager.queueEase(i, i+4, "xmod", 1, 'quadOut');

		modManager.queueSet(i, "drunk", 1.5 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		modManager.queueEase(i, i+4, "drunkOffset", Math.sin(i * 0.75), 'expoOut');

		f *= -1;
	});

    modManager.queueEase(1022, 1024, "opponentSwap", 0, 'bounceOut', 1);
    modManager.queueEase(1054, 1056, "opponentSwap", 0, 'bounceOut', 0);

    modManager.queueSet(1088, "alpha", 0.25, 0);
    modManager.queueSet(1091, "alpha", 0.5, 0);
    modManager.queueSet(1094, "alpha", 0.75, 0);
    modManager.queueSet(1096, "alpha", 1, 0);
    modManager.queueSet(1096, "reverse", 0, 1);
    modManager.queueSet(1094, "reverse", 0.25, 1);
    modManager.queueSet(1091, "reverse", 0.5, 1);
    modManager.queueSet(1088, "reverse", 0.75, 1);
    for(i in 1...3){ 
        modManager.queueSet(1088, "alpha" + i, 0.25, 1);
        modManager.queueSet(1091, "alpha" + i, 0.5, 1);
        modManager.queueSet(1094, "alpha" + i, 0.75, 1);
        modManager.queueSet(1096, "alpha" + i, 1, 1);
    }

    modManager.queueEase(1112, 1120, "alpha", 0, 0);
    for( i in 1...3){ modManager.queueSet(1119, "alpha" + i, 0, 1); }
    modManager.queueSet(1119, "transform0X", 0, 1);
    modManager.queueSet(1119, "transform0Y", 0, 1);
    modManager.queueSet(1119, "transform0Z", 0, 1);
    modManager.queueSet(1119, "transform3X", 0, 1);
    modManager.queueSet(1119, "transform3Y", 0, 1);
    modManager.queueSet(1119, "transform3Z", 0, 1);

    modManager.queueEase(1216,1248, "alpha", 1, 'quadInOut');
    modManager.queueEase(1216,1248, "transformY", 720, 'quadIn');
    modManager.queueEase(1216,1248, "transformZ", 0.5, 'quadIn');

    modManager.queueSet(1408, "alpha", 0);
    modManager.queueSet(1408, "stealth", 0);
    modManager.queueSet(1408, "transformY", 0);
    modManager.queueSet(1408, "transformZ", 0);
    modManager.queueSet(1408, "transformX", -50);

     modManager.queueFunc(1708, 1791.999, function(step, event){ 
        for( i in 0...4){
            modManager.setValue("transform" + i + "X", FlxG.random.int); 
            modManager.setValue("transform" + i + "Y", FlxG.random.int); 
        }
    });
     
     for( i in 0...4){ 
    modManager.queueSet(1792, "transform" + i + "X", 0); modManager.queueSet(1792, "transform" + i + "Y", 0); }
    modManager.queueSet(1792, "opponentSwap", 0.5);
    modManager.queueSet(1792, "transformX", 0);
    modManager.queueSet(1792, "reverse", 1, 1);
    modManager.queueSet(1792, "stealth", 0.5, 1);
    modManager.queueSet(1792, "alpha", 0.5, 1);

    modManager.queueSet(1952, "centered", 0);

      var f = 1;
    numericForInterval(1952, 2272, 2, function(i){
        modManager.queueSet(i, "xmod", 1.15);
        modManager.queueEase(i, i + 4, "xmod", 0.9, 'cubeOut');
        modManager.queueSet(i, "drunk", 0.25 * f);
        modManager.queueEase(i, i + 16, "drunk", 0, 'cubeOut');

        modManager.queueSet(i, "invert", 0.2);
        modManager.queueEase(i, i + 4, "invert", 0, 'cubeOut');        

        modManager.queueSet(i, "opponentSwap", 0);
        modManager.queueEase(i, i + 16, "opponentSwap", 0.25, 'cubeOut');
        f *= -1;
    });

    modManager.queueEase(2272, 2278, "centerrotateX", 0, 'backInOut');
    modManager.queueEase(2272, 2278, "reverse", 0, 'backInOut');
    modManager.queueEase(2272, 2278, "opponentSwap", 1, 'backInOut');
    modManager.queueEase(2272, 2278, "reverse", 0, 'backInOut');
    modManager.queueEase(2272, 2278, "transformZ", 0, 'backInOut');
    modManager.queueEase(2272, 2278, "stealth", 0, 'quartOut');

    modManager.queueEase(2432, 2436, 'dark', 1, 'sineOut');
    modManager.queueEase(2432, 2436, 'stealth', 1, 'quadOut');

    modManager.queueSet(2436, 'opponentSwap', 0.5);
    modManager.queueSet(2436, 'drunk', 0.5);
    
    modManager.queueEase(2436, 2496, 'opponentSwap', 1, 'sineOut');
    modManager.queueEase(2436, 2466, 'dark', 0, 'sineOut');
    modManager.queueEase(2436, 2496, 'stealth', 0, 'sineOut');
    
    modManager.queueEase(2486, 2504, 'stealth', 1, 'sineOut');
    modManager.queueEase(2486, 2504, 'dark', 1, 'sineOut');

    modManager.queueSet(2504, 'drunk', 0);
    modManager.queueSet(2504, 'reverse', 1, 0);
    modManager.queueSet(2504, 'alpha', 0, 1);
    modManager.queueEase(2504, 2508, 'dark', 0, 'quadOut');
    modManager.queueEase(2504, 2508, 'stealth', 0, 'quadOut');
     
    modManager.queueEase(2512, 2514, 'drunk', 4, 'expoOut', 1);

    modManager.queueEase(2514, 2520, 'drunk', 0, 'circOut', 1);

    modManager.queueSet(2540, 'reverse', 0, 0);
    modManager.queueSet(2540, 'alpha', 0.5, 1);
    modManager.queueSet(2540, 'opponentSwap', 0.5);
    modManager.queueSet(2540, 'flip', 1);

     modManager.queueEase(2560.5, 2561, 'drunk', 7, 'expoOut');
    modManager.queueEase(2562, 2564, 'drunk', 2, 'circOut');
    modManager.queueEase(2565, 2568, 'drunk', -3, 'circOut');
    modManager.queueEase(2570, 2574, 'drunk', 0, 'circOut');

    modManager.queueEase(2570, 2576, 'stealth', 1, 'sineOut');
    modManager.queueEase(2570, 2576, 'dark', 1, 'sineOut');
    modManager.queueSet(2576, 'digital', 0);
    modManager.queueSet(2576, 'drunk', 0);
    modManager.queueSet(2576, 'flip', 0);
    modManager.queueSet(2576, 'transformZ', 0);
    modManager.queueSet(2576, 'opponentSwap', 0);
    modManager.queueSet(2576, 'alpha', 0);

    modManager.queueEase(2580, 2584, 'stealth', 0, 'cubeOut');
    modManager.queueEase(2580, 2584, 'dark', 0, 'cubeOut');

     modManager.queueFunc(2610, 2623, function(event, step){ 
        var c3 = (step - 2610) * 0.035;
        for( i in 0...4){
            modManager.setValue("transform" + i + "X", FlxG.random.int(-25 * c3, 25 * c3), 0); 
            modManager.setValue("transform" + i + "Y", FlxG.random.int(-25 * c3, 25 * c3), 0); 
        }
    });

    modManager.queueEase(2610, 2622, 'drunk', 0.5, 'cubeOut');
    modManager.queueEase(2610, 2622, 'drunkZ', -0.5, 'cubeOut');

    for( i in 0...4){
        modManager.queueEase(2624, 2628, 'transform' + i + 'X', 0, 'expoIn');
        modManager.queueEase(2624, 2628, 'transform' + i + 'Y', 0, 'expoIn');
    }

    modManager.queueEase(2624, 2628, 'drunkZ', 0, 'expoIn');
    modManager.queueEase(2624, 2628, 'drunk', 0, 'expoIn');
    modManager.queueEase(2624, 2628, 'opponentSwap', 0.5, 'expoIn');
}
function opponentNoteHit(note){
    if(game.curStep >= 1792 && game.curStep < 1952){
        modManager.setValue("centered", (note.beat % 16) / 16);
        modManager.setValue("opponentSwap", ((note.beat * 2) % 16) / 16);
    }
}

function goodNoteHit(note){
    if(game.curStep >= 1792 && game.curStep < 1952){
        modManager.setValue("centered", (note.beat % 16) / 16);
        modManager.setValue("opponentSwap", ((note.beat * 2) % 16) / 16);
    }
}
