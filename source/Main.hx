package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.util.FlxSave;
import openfl.display.Sprite;

class Main extends Sprite
{

	public function new()
	{
		// SAVE BEGIN
		var _save = new FlxSave();
		_save.bind("Pet.GB");

		super();
		addChild(new FlxGame(0, 0, MenuState));

		// Loads volume if exists
		if (_save.data.volume != null)
			FlxG.sound.volume = _save.data.volume;
		// Set save data volume to default (100%)
		else
			_save.data.volume = 1;

		// SAVE WRITE
		_save.flush();

		// SAVE END
		_save.close();
	}
}
