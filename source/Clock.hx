package;

import flixel.FlxG;
import flixel.util.FlxTimer;

class Clock 
{
	private var _timer:FlxTimer;

	public var CurrentHour:Int = 0;

	public var HourPassed:Bool = false;
	public var DayPassed:Bool = false;

	public function new(RtG:Int = 10, HtD = 24) //60 & 24
	{
		_timer = new FlxTimer();
		// Every 3 real-time minutes 1 in-game hour passes
		_timer.start(RtG, hourEnd, HtD); 

		// DEBUG
		FlxG.watch.add(_timer, "progress", "Day Completion:");
		FlxG.watch.add(_timer, "loopsLeft","Hour:");
	}

	public function update():Void
	{
		if (_timer.finished)
			dayEnd();
	}

	private function hourEnd(Timer:FlxTimer):Void
	{
		HourPassed = true;
		CurrentHour = _timer.elapsedLoops;
	}

	private function dayEnd():Void
	{
		_timer.reset();
		DayPassed = true;
	}

	public function pause(isPaused:Bool = true):Void
	{
		if (isPaused)
		{
			_timer.active = false;
		}
		else
		{
			_timer.active = true;
		}
	}
}