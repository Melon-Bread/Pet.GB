package;

import flixel.FlxG;
import flixel.util.FlxTimer;

class Clock {
	
	private var _hours:Int = 0;
	private var _timer:FlxTimer;

	public var HourPassed:Bool = false;
	public var DayPassed:Bool = false;

	public function new(RtG:Int = 20):Void //120
	{
		_timer = new FlxTimer();
		// Every 3 real-time minutes 1 in-game hour passes
		_timer.start(RtG, hourEnd, 5); //24

		// DEBUG
		FlxG.watch.add(_timer, "progress", "Day Completion:");
		FlxG.watch.add(_timer, "loopsLeft","Hours Left:");
	}

	public function update():Void
	{
		if (_timer.finished)
			dayEnd();
	}

	private function hourEnd(Timer:FlxTimer):Void
	{
		// TODO: alert the Gel a hour has passed make it do its stat changes
		HourPassed = true;
	}

	private function dayEnd():Void
	{
		// TODO: alert the Gel a day has passed to age++
		_timer.reset();
		DayPassed = true;
	}
}