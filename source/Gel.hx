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
	private var _isHungry:Bool = false;
	private var _wasteReady:Bool = false;
	private var _madeWaste:Bool = false;
	private var _isTired:Bool = false;
	private var _isAsleep:Bool = false;

	// Mood
	private var _currentMood:Mood = NEUTRAL;

	//
	public var Wait:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);

		loadGraphic(AssetPaths.Player__png, true, 64, 64);
		animation.add("neutral", [1, 2, 3, 4, 5, 6, 5, 4, 3, 2], 5, true);
		animation.add("happy", [1, 2, 3, 4, 5, 6, 5, 4, 3, 2], 5, true);
		animation.add("angry", [1, 2, 3, 4, 5, 6, 5, 4, 3, 2], 5, true);

		// DEBUG
		FlxG.watch.add(this, "Wait");
		FlxG.watch.add(this, "Happiness");
		FlxG.watch.add(this, "Discipline");
		FlxG.watch.add(this, "Fullness");
	}

	override function update(elsapsed:Float):Void
	{
		if (animation.curAnim == null)
			animation.play("neutral");

		super.update(elsapsed);
	}

	private function checkMood():Void
	{

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
	HUNGRY;
	SLEEPY;

	WASTING;
	SLEEPING;

	ENCOURAGED;
	SAD;
}