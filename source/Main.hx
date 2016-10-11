package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.util.FlxSave;
import openfl.display.Sprite;

class Main extends Sprite
{
	// TODO: Add END_GAME Flags
	// TODO: Makes saving work for at least the config screen
	// TODO: Make Game Over screen
	public function new()
	{
		// SAVE BEGIN
		var _save = new FlxSave();
		_save.bind("Pet.GB");

		super();
		addChild(new FlxGame(0, 0, MenuState, 1, 60, 60, true, false));

		// Loads Settings
		if (_save.data.gameMuted = true)
			FlxG.sound.muted = _save.data.muted;
		if (_save.data.arrowInput == null)
			_save.data.arrowInput = true;

		// SAVE END
		_save.close();
	}
}
