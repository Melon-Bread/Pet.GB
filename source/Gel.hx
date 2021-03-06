package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxSave;

class Gel extends FlxSprite
{	
	// Modifiers Range
	private var MIN_LEVEL(default, never):Int = 0;
	private var MAX_LEVEL(default, never):Int = 100;

	// END_GAME
	public var ENDGAME:Bool = false;
	private var _endFlags:Int = 0;
	private var _hoursSuffering:Int = 0;

	// Usless Stats that have no pupose yet
	public var Intellect:Int = 1; // Had to be somewhat smart to get out of the egg
	public var Age:Int = 1;

	// Mood Modifiers
	public var Happiness:Int = 50;
	public var Discipline:Int = 50;
	public var Fullness = 50;
	public var Sleepiness = 0;
	public var Waste = 0;

	//private var _inEgg:Bool = true;
	public var _isHungry:Bool = false;
	public var _wasteReady:Bool = false;
	public var _madeWaste:Bool = false;
	public var _isTired:Bool = false;
	public var _isAsleep:Bool = false;

	// Menu Locks
	public var Wait:Bool = false;
	private var _hasStudied:Bool = false;

	// Mood/Needs
	public var CurrentMood:Mood = NEUTRAL;
	public var CurrentNeed:Need = NONE;

	// Sleep Timer
	private var _hoursAsleep:Int = 0;
	
	// Sound Effects
	private var _sndExcited:FlxSound;
	private var _sndAshamed:FlxSound;

	// Gels internal clock
	public var _clock:Clock;

	public function new(?X:Float=0, ?Y:Float=0, clock:Clock)
	{
		super(X, Y);

		loadGraphic(AssetPaths.Player__png, true, 64, 64);
		animation.add("neutral", [0, 1, 2, 3, 4, 5, 4, 3, 2, 1], 5, true);
		animation.add("happy", [6, 7, 8, 9, 10, 11, 10, 9, 8, 7], 5, true);
		animation.add("angry", [12, 13, 14, 13], 5, true);
		animation.add("sleeping", [15, 16, 17, 16], 3, true);
		animation.add("excited", [18, 19, 20, 20, 19, 18], 6, false);
		animation.add("ashamed", [21, 22, 23, 22], 4, false);

		_clock = clock;

		// Sound Effects
		_sndExcited = FlxG.sound.load(AssetPaths.Excited__ogg);
		_sndAshamed = FlxG.sound.load(AssetPaths.Ashamed__ogg);

		// DEBUG
		FlxG.watch.add(this, "ENDGAME");
		FlxG.watch.add(this, "_endFlags");
		FlxG.watch.add(this, "_hoursSuffering");
		FlxG.watch.add(this, "Age");
		FlxG.watch.add(this, "CurrentMood");
		FlxG.watch.add(animation, "finished");
		FlxG.watch.add(this, "CurrentNeed");
		FlxG.watch.add(this.animation, "name", "Gel.animation");
		FlxG.watch.add(this, "Wait");
		FlxG.watch.add(this, "Intellect");
		FlxG.watch.add(this, "_hasStudied");
		FlxG.watch.add(this, "Happiness");
		FlxG.watch.add(this, "Discipline");
		FlxG.watch.add(this, "Fullness");
		FlxG.watch.add(this, "_isHungry");
		FlxG.watch.add(this, "Waste");
		FlxG.watch.add(this, "_wasteReady");
		FlxG.watch.add(this, "_madeWaste");
		FlxG.watch.add(this, "Sleepiness");
		FlxG.watch.add(this, "_isTired");
		FlxG.watch.add(this, "_isAsleep");
		FlxG.watch.add(this, "_hoursAsleep");
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		loadSettings(); 

		if (_endFlags > 2)
			ENDGAME = true;

		_clock.update();
		if (_clock.HourPassed)
			newHour();
		if (_clock.DayPassed)
			newDay();

		if (animation.name == "excited" && !_sndExcited.playing)
			resumeMood();
		else if (animation.name == "ashamed" && !_sndAshamed.playing)
			resumeMood();

		checkMood();
		checkNeed();
		checkRange();
	}

	private function checkMood():Void
	{
		if (_isAsleep)
			CurrentMood = SLEEPING;
		else if (CurrentMood == EXCITED)
			return;
		else if (CurrentMood == ASHAMED)
			return;
		else 
		{
			if (Happiness >= 61)
				CurrentMood = HAPPY;
			else if (Happiness >= 40 && Happiness <= 60)
				CurrentMood = NEUTRAL;
			else if (Happiness <= 39)
				CurrentMood = ANGRY;
		}
	}

	private function checkNeed():Void
	{
		// Fullness Checks
		if(Fullness < 50)
			_isHungry = true;
		else
			_isHungry = false;

		// Waste Check
		if (Waste > 85 && Waste < 100)
			_wasteReady = true;
		else if (Waste >= 100)
			makeWaste();
		else
			_wasteReady = false;

		// Sleepy Check
		if (Sleepiness >= 90)
			_isTired = true;
		else
			_isTired = false;

		// Sets active needs
		if (_isHungry)
			CurrentNeed = HUNGRY;
		else if (_wasteReady)
			CurrentNeed = POOPY;
		else if (_isTired)
			CurrentNeed = SLEEPY;
		else
			CurrentNeed = NONE;
	}

	public function EatFood():Void
	{
		Wait = true;
		// Stat changes

		if ((Fullness + 25) > 100)
		{
			Happiness -= 5; // Unhappy from over feeding
			Discipline -= 5;
			beAshamed();
		}
		else
		{
			Fullness += 25;
			Happiness += 10;
			//Discipline -=5;
			Waste +=5;
		}
	}

	public function Study():Void
	{
		var _ageBonus:Float = Age/4;

		if (FlxG.random.bool(Discipline))
		{
			if (!_hasStudied && !_isTired)
			{
				Intellect += (1 * (1 + Std.int(_ageBonus)));
				Happiness -= 5;
				Fullness -= 5;
				Sleepiness += 15;
				beExcited();
			}
		}
		else
		{
			beAshamed();
		}
		// Can only study once per hour, even if check failed
		_hasStudied = true;
	}

	public function Sleep():Void
	{
		if (!_isTired)
		{
			Happiness -= 5;
			beAshamed();
		}
		else
		{
			_isAsleep = true;
			_isTired = false;
			Sleepiness = 0;
		}
	}

	public function Praise():Void
	{
		Wait = true;

		// Can't Prasie if you have no Happiness to give
		if (Discipline < 10)
			return;

		Happiness += 10;
		Discipline -= 10;
		beExcited();
	}

	public function Scold():Void
	{
		Wait = true;

		// Can't Scold if you have no Discipline to give
		if (Discipline < 10)
			return;

		Happiness -= 10;
		Discipline += 10;
		beAshamed();
	}
	public function Wipe():Void
	{
		Wait = true;

		// Early Wipe
		if (!_wasteReady && !_madeWaste)
		{
			Happiness -=5;
			beAshamed();
			return;
		}

		// Good Wipe
		else if (!_madeWaste)
		{
			Happiness += 10;
			Discipline += 10;
			beExcited();
		}

		// Late Wipe
		else 
		{
			Happiness -= 10;
			Discipline -= 10;
			_madeWaste = false;
		}
		Waste = 0;
	}

	private function makeWaste():Void
	{
		Waste = 0;
		_madeWaste = true;
		_wasteReady = false;
	}

	private function wakeUp():Void
	{
		_isAsleep = false;
		_hoursAsleep = 0;

		// Reset back to one of the 3 normal moods
		checkMood();
		if (CurrentMood == Mood.HAPPY)
			Happiness -= 15;
		else if (CurrentMood == Mood.NEUTRAL)
			Happiness += 10;
		else if (CurrentMood == Mood.ANGRY)
			Happiness += 15;

		Fullness -= 50;
		Waste += 10;

		checkRange();
	}

	private function beExcited():Void
	{
		CurrentMood = EXCITED;
		this.animation.play("excited");
		_sndExcited.play(true);
	}	

	private function beAshamed():Void
	{
		CurrentMood = ASHAMED;
		this.animation.play("ashamed");
		_sndAshamed.play(true);
	}

	private function resumeMood():Void
	{
		CurrentMood = NEUTRAL;
		checkMood;
	}

	private function newHour():Void
	{
		if (!_isAsleep)
		{
			Fullness -= 10;
			Sleepiness += 5;
			if (!_madeWaste)
				Waste += (FlxG.random.int(2, 5) * 5);
			
			// TODO: Add other stat changing conditions
			if (_isHungry)
				Happiness -= 10;
			if (_isTired)
			{
				Happiness -= 10;
				Discipline -= 5;
			}
			if (_madeWaste)
			{
				Happiness -=10;
				Discipline -=10;
			}
		}
		else 
		{
			if (_hoursAsleep >= 9)
				wakeUp();
			else if (_hoursAsleep > 5 && _hoursAsleep < 9)
			{
				// Discipline determines chance of early wake up
				if (FlxG.random.bool(Discipline))
					wakeUp();
			}
			else
				_hoursAsleep++;
		}
		// Unlock menu options
		_hasStudied = false;

		_clock.HourPassed = false;

		// END_GAME Checks
		if (CurrentMood == ANGRY || _madeWaste || _isHungry)
			_hoursSuffering ++;
		else
			_hoursSuffering = 0;

		if (_hoursSuffering > 1)
			_endFlags++;
		else if (_hoursSuffering > 3)
			ENDGAME = true;
	}

	private function newDay():Void
	{
		Age++;
		_clock.DayPassed = false;
	}

	private function checkRange():Void
	{
		// TODO: clean this up, make a for loop to loop array ints
		if (Happiness > MAX_LEVEL)
			Happiness = MAX_LEVEL;
		else if (Happiness < MIN_LEVEL)
			Happiness = MIN_LEVEL;

		if (Discipline > MAX_LEVEL)
			Discipline = MAX_LEVEL;
		else if (Discipline < MIN_LEVEL)
			Discipline = MIN_LEVEL;

		if (Fullness > MAX_LEVEL)
			Fullness = MAX_LEVEL;
		else if (Fullness < MIN_LEVEL)
			Fullness = MIN_LEVEL;

		if (Sleepiness > MAX_LEVEL)
			Sleepiness = MAX_LEVEL;
		else if (Sleepiness < MIN_LEVEL)
			Sleepiness = MIN_LEVEL;

		if (Waste > MAX_LEVEL)
			Waste = MAX_LEVEL;
		else if (Waste < MIN_LEVEL)
			Waste = MIN_LEVEL;
	}
	private function loadSettings():Void
	{
		var _save = new FlxSave();
		_save.bind("Pet.GB");

		FlxG.sound.muted = _save.data.muted;

		_save.close();
	}
}

enum Mood 
{
	NEUTRAL;
	HAPPY;
	ANGRY;
	SLEEPING;
	EXCITED;
	ASHAMED;
}

enum Need
{
	NONE;
	HUNGRY;
	SLEEPY;
	POOPY;
}