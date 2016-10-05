package;

import flixel.FlxG;
import flixel.FlxSprite;

class Gel extends FlxSprite
{	
	// Modifiers Range
	private var MIN_LEVEL(default, never):Int = 0;
	private var MAX_LEVEL(default, never):Int = 100;

	// Usless Stats that have no pupose yet
	public var Intellect:Int = 1; // had to be somewhat smart to get out of the egg
	public var Age:Int = 0;

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

	// Mood/Needs
	public var CurrentMood:Mood = NEUTRAL;
	public var CurrentNeed:Need = NONE;

	//
	public var Wait:Bool = false;

	// Gels internal clock
	private var _clock:Clock;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);

		loadGraphic(AssetPaths.Player__png, true, 64, 64);
		animation.add("neutral", [0, 1, 2, 3, 4, 5, 4, 3, 2, 1], 2, true);
		animation.add("happy", [6, 7, 8, 9, 10, 11, 10, 9, 8, 7], 2, true);
		animation.add("angry", [12, 13, 14, 13], 2, true);
		animation.add("sleeping", [15, 16, 17, 16], 2, true);
		animation.add("excited", [18, 19, 20, 19], 3, false);
		animation.add("ashamed", [21, 22, 23, 22], 3, false);

		_clock = new Clock();

		// DEBUG
		FlxG.watch.add(this, "Age");
		FlxG.watch.add(this, "CurrentMood");
		FlxG.watch.add(this, "CurrentNeed");
		FlxG.watch.add(this, "Wait");
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
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		_clock.update();
		if (_clock.HourPassed)
			newHour();
		if (_clock.DayPassed)
			newDay();

		checkMood();
		checkNeed();
		checkRange();
	}

	private function checkMood():Void
	{
		if (Happiness >= 61)
			CurrentMood = HAPPY;
		else if (Happiness >= 40 && Happiness <= 60)
			CurrentMood = NEUTRAL;
		else if (Happiness <= 39)
			CurrentMood = ANGRY;
	}

	private function checkNeed():Void
	{
		// TODO: Add need stat triggers

		// Fullness Checks
		if(Fullness < 50)
			_isHungry = true;
		else
			_isHungry = false;

		// Waste Check
		if(Waste > 75 && Waste < 100)
			_wasteReady = true;
		else if (Waste >= 100)
			makeWaste();
		else
			_wasteReady = false;


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
			// TODO: Play ashamed animationx
			// TODO:  Add another penelty
		}
		else
		{
			Fullness += 25;
			Happiness += 10;
			Discipline -=5;
			Waste +=5;
		}
	}x

	public function Praise():Void
	{
		Wait = true;

		// Can't Prasie if you have no Happiness to give
		if (Discipline < 10)
			return;

		Happiness += 10;
		Discipline -= 10;
		// TODO: Play excited animation
	}

	public function Scold():Void
	{
		Wait = true;

		// Can't Scold if you have no Discipline to give
		if (Discipline < 10)
			return;

		Happiness -= 10;
		Discipline += 10;
		// TODO: Play ashamed animation
	}

	public function Wipe():Void
	{
		Wait = true;
		// TODO: Lock Wipe down for the rest of hour
		
		// Early Wipe
		if (!_wasteReady)
		{
			Happiness -=5;
			// TODO: Pay ashamed animation to show bad wipe
			return;
		}

		// Good Wipe
		if (!_madeWaste)
		{
			Happiness += 10;
			Discipline += 10;
			// TODO: Play excited animation to show good wipe
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
	private function newHour():Void
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


		// TODO: Unlock Wipe
		_clock.HourPassed = false;
	}

	private function newDay():Void
	{
		Age++;
		// TODO: Add END_GAME checks here
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
}

enum Mood 
{
	NEUTRAL;
	HAPPY;
	ANGRY;
	SLEEPING;

	ENCOURAGED;
	SAD;
}

enum Need
{
	NONE;
	HUNGRY;
	SLEEPY;
	POOPY;
}