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
   modManager.setValue("alpha", 1);
   modManager.queueEase(0, 4, 'squish', 0, 'quartOut', 1);
   modManager.queueEase(0, 4, 'alpha', 0, 'quartOut', 1);
   modManager.queueSet(60, 'squish', 0.75, 0);
   modManager.queueEase(60, 64, 'squish', 0, 'quartOut', 0);
   modManager.queueEase(60, 64, 'alpha', 0, 'quartOut', 0);
   
   modManager.queueEase(192, 200, 'tipsy', 0.625);
   modManager.queueEase(192, 200, 'beat', 0.625);
   modManager.queueSet(224, "beat", 0);

      modManager.queueSet(224, 'beat', 0);
    var counter = -1;
    numericForInterval(224, 256, 2, function(step){
        counter*=-1;
    });
    var counter = -1;
    numericForInterval(240, 256, 0.5, function(step){
        counter*=-1;
    });
    modManager.queueEase(254, 278, "beat", 0);
    modManager.queueEase(254, 278, "alpha", 1, 'quadIn');
    modManager.queueEase(254, 278, "transformY", 200, 'quadIn');

    // for(i in 0...4){
    //     modManager.queueSet(284, "transform" + i + "Y", 0);
    //     modManager.queueSet(284, "alpha" + i, 0);
    // }
    modManager.queueEase(276, 284, "alpha", 0, 'quadOut', 0);
    modManager.queueSet(276, "transformY", -200);
    modManager.queueSet(276, "opponentSwap", 0.5);
    modManager.queueSet(276, "stretch", 0.5);
    modManager.queueEase(276, 284, "transformY", 0, 'expoInOut');
    modManager.queueEase(276, 284, "stretch", 0, 'bounceOut');

    var f = 1;
	numericForInterval(288, 544, 2, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
    });
    //modManager.queueSet(288, "beat", 1);

    modManager.queueEase(544, 560, "opponentSwap", 0, 'quadOut');
    modManager.queueEase(544, 560, "flip", 0, 'quadOut');
    modManager.queueEase(544, 560, "alpha", 0, 'quadOut', 1);
    modManager.queueEase(544, 560, "beat", 0.125, 'quadOut');
    modManager.queueEase(544, 560, "tipsy", 0, 'quadOut');

    modManager.queueEase(672, 678, "beat", 0.5);
    var counter = -1;

    numericForInterval(672, 928, 2, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
    });
    //modManager.queueSet(672, "beat", 1);

    modManager.queueEase(928, 944, "beat", 0, 'quartOut');
    modManager.queueEase(928, 944, "opponentSwap", 0.5, 'quartOut');
    modManager.queueEase(928, 944, "alpha", 1, 'quartOut', 1);

	var f = 1;
	numericForInterval(928, 960, 4, function(i){
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+6, "tipsy", 0, 'quadOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+6, "drunk", 0, 'quadOut');

		f *= -1;
	});

	numericForInterval(960, 976, 2, function(i){
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
	});

	numericForInterval(976, 992, 1, function(i){
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
	});

     var f = 1;
	
    numericForInterval(992, 1245, 1, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		modManager.queueSet(i, "xmod", 0.7);
		modManager.queueEase(i, i+4, "xmod", 1, 'quadOut');

		modManager.queueSet(i, "drunk", 1.5 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		modManager.queueEase(i, i+4, "drunkOffset", Math.sin(i * 0.75), 'expoOut');

		f *= -1;
	});

    var f = 1;
	numericForInterval(992, 1245, 2, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
	});
    //modManager.queueSet(992, "beat", 1);

    modManager.queueEase(1248, 1258, "alpha", 1, 'quadOut', 0);
    modManager.queueEase(1248, 1260, "transformY", 200, 'quadOut', 0);

    modManager.queueSet(1268, "opponentSwap", 0);
    modManager.queueSet(1268, "transformX", 500, 1);
    modManager.queueEase(1268, 1280, "tipsy", 0.5, 'backOut');
    modManager.queueEase(1268, 1280, "transformY", 0, 'backOut', 0);
    modManager.queueEase(1268, 1280, "alpha", 0, 'backOut', 0);
    modManager.queueEase(1404, 1420, "alpha", 0, 'backOut', 1);
    modManager.queueEase(1404, 1420, "transformX", 0, 'quadOut', 1);

    modManager.queueEase(1528, 1536, "tipsy", 0, 'quadInOut'); 
    modManager.queueEase(1532, 1536, "beat", 0.5, 'quadInOut');
    modManager.queueEase(1532, 1536, "opponentSwap", 0.5, 'quadOut');
    modManager.queueEase(1532, 1536, "reverse", 1, 'bounceOut', 1);
    modManager.queueEase(1532, 1536, "transformY", 75, 'quadOut', 0);
    modManager.queueEase(1532, 1536, "transformY", -75, 'quadOut', 1);

	numericForInterval(1536, 1792, 4, function(i){
		modManager.queueSet(i, "drunkZ", 1.5 * f);
		modManager.queueEase(i, i+4, "drunkZ", 0, 'quartOut');

		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'quartOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'quartOut');

		modManager.queueEase(i, i+4, "drunkOffset", Math.cos(i * 0.75), 'quartOut');
		f *= -1;
	});

    modManager.queueEase(1532, 1536, "alpha", 0.5, 'quadOut', 1);
    modManager.queueEase(1532, 1536, "stealth", 0.25, 'quadOut', 1);

    modManager.queueEase(1728, 1734, "transformZ", 0, 'quadOut');
    modManager.queueEase(1728, 1734, "transformY", 0, 'quadOut');
    modManager.queueEase(1728, 1734, "sudden", 0.75, 'quadOut');
    
    modManager.queueEase(1792, 1804, "opponentSwap", 0);
    modManager.queueEase(1792, 1804, "sudden", 0);
    modManager.queueEase(1792, 1804, "alpha", 0, 'quadOut', 1);
    modManager.queueEase(1792, 1804, "stealth", 0, 'quadOut', 1);

    modManager.queueSet(1856, "beat", 0);
    modManager.queueEase(1856, 1860, "sudden", 0);
    modManager.queueEase(1856, 1860, "alpha", 1, 'quadOut', 1);

   var centerOffset = modManager.getBaseX(0, 0.5, 4);
    var oppSet = modManager.getBaseX(0, 1, 4);

   var f:Int = 1;
    numericForInterval(1856, 2048, 2, function(i){
        modManager.queueSet(i, "drunk", 0.5 * f);
        modManager.queueSet(i, "drunkOffset", game.curDecBeat * 0.01 * f);
        modManager.queueEase(i, i + 4, "drunk", 0, 'cubeOut');
        f *= -1;
    });
	
    modManager.queueFuncOnce(1856, function(sh){
    });

    modManager.queueFunc(1856, 2048, function(event:CallbackEvent, cDS:Float){
        var pos = (cDS - 1856) * 0.9;

        for(pn in 1...3){
            for(col in 0...4){
                var cPos = col * -112;
                if (pn == 2) cPos = cPos - 620;
                var c = (pn - 1) * 4 + col;
                var mn = pn == 2?0:3;

                var cSpacing = 112;

                var newPos = (((col * cSpacing + (pn - 1) * 640 + pos * cSpacing) % (1280))) - 176;
                modManager.setValue("transform" + col + "X", cPos + newPos, mn);
            }
        }
    });

     for(i in 0...4){
        modManager.queueEase(2048, 2056, "transform" + i + "X", 0, 'bounceOut');
    }

    modManager.queueEase(2048, 2056, "alpha", 0, 'quadOut', 1);
    modManager.queueEase(2048, 2056, "drunkOffset", 0, 'quadOut');
    modManager.queueEase(2048, 2056, "reverse", 0, 'bounceOut', 1);

    numericForInterval(2048, 2160, 1, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		modManager.queueSet(i, "xmod", 0.7);
		modManager.queueEase(i, i+4, "xmod", 1, 'quadOut');

		modManager.queueSet(i, "drunk", 1.5 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		modManager.queueEase(i, i+4, "drunkOffset", Math.sin(i * 0.75), 'expoOut');

		f *= -1;
	});

    numericForInterval(2160, 2170, 0.5, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		modManager.queueSet(i, "xmod", 0.5);
		modManager.queueEase(i, i+4, "xmod", 1, 'quadOut');

		modManager.queueSet(i, "tipsy", 1.25 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1.75 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		modManager.queueEase(i, i+4, "drunkOffset", Math.sin(i * 1.25), 'expoOut');

		f *= -1;
	});

      var f = 1;
    numericForInterval(2176, 2432, 2, function(i){
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

     var f = 1;
	numericForInterval(2176, 2342, 2, function(i){
		//modManager.queueSet(i, "xmode", 0.25 * f);
		//modManager.queueEase(i, i+2, "xmode", 0, 'quartOut');
		
		modManager.queueSet(i, "tipsy", 1 * f);
		modManager.queueEase(i, i+4, "tipsy", 0, 'expoOut');

		modManager.queueSet(i, "drunk", 1 * f);
		modManager.queueEase(i, i+4, "drunk", 0, 'expoOut');

		f *= -1;
    });
    //modManager.queueSet(2176, "beat", 1);

    modManager.queueEase(2432, 2448, "alpha", 1, 'quadOut');
    modManager.queueEase(2432, 2448, "beat", 0, 'quadOut');
}
