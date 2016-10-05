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
	private var _madeWaste:Bool = false;
	public var _isTired:Bool = false;
	private var _isAsleep:Bool = false;

	// Mood/Needs
	public var CurrentMood:Mood = HAPPY;
	public var CurrentNeed:Need = NONE;

	//
	public var Wait:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);

		loadGraphic(AssetPaths.Player__png, true, 64, 64);
		animation.add("neutral", [0, 1, 2, 3, 4, 5, 4, 5, 2, 1], 4, true);
		animation.add("happy", [6, 7, 8, 9, 10, 11, 10, 9, 8, 7], 4, true);
		animation.add("angry", [12, 13, 14, 13], 4, true);
		animation.add("sleeping", [15, 16, 17, 16], 3, true);
		animation.add("excited", [18, 19, 20, 19], 5, false);
		animation.add("ashamed", [21, 22, 23, 22], 5, false);

		// DEBUG
		FlxG.watch.add(this, "CurrentMood");
		FlxG.watch.add(this, "CurrentNeed");
		FlxG.watch.add(this.animation, "curAnim");
		FlxG.watch.add(this, "Wait");
		FlxG.watch.add(this, "Happiness");
		FlxG.watch.add(this, "Discipline");
		FlxG.watch.add(this, "Fullness");
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		checkMood();
		checkNeed();
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
		// TODO: Add need flah triggers
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
			// TODO:  Add another penelty
		}
		else
		{
			Fullness += 25;
			Happiness += 10;
			Discipline -=5;
		}

		checkRange();
	}

	public function Praise():Void
	{
		Wait = true;

		Happiness += 10;
		Discipline -= 10;
		checkRange();
	}

	public function Scold():Void
	{
		Wait = true;

		Happiness -= 10;
		Discipline += 10;
		checkRange();
	}

	private function checkRange():Void
	{
		if (Fullness > MAX_LEVEL)
			Fullness = MAX_LEVEL;
		else if (Fullness < MIN_LEVEL)
			Fullness = MIN_LEVEL;

		if (Happiness > MAX_LEVEL)
			Happiness = MAX_LEVEL;
		else if (Happiness < MIN_LEVEL)
			Happiness = MIN_LEVEL;

		if (Discipline > MAX_LEVEL)
			Discipline = MAX_LEVEL;
		else if (Discipline < MIN_LEVEL)
			Discipline = MIN_LEVEL;
	}
}

enum Mood 
{
	NEUTRAL;
	HAPPY;
	ANGRY;

	WASTING;
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