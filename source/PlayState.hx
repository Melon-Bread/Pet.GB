package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.debug.FlxDebugger;
import flixel.util.FlxSave;

class PlayState extends FlxState
{
	private var _sprBackground:FlxSprite;

	private var _gelPet:Gel;

	private var _clock:Clock;

	private var _hud:HUD;

	private var _infoMenu:InfoMenu;


	override public function create():Void
	{
		// SAVE BEGIN
		var _save:FlxSave = new FlxSave();
		_save.bind("Pet.GB");

		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		_clock = new Clock();

		if (_save.data.GelPet == null)
		{
			_gelPet = new Gel(0, 0, _clock);
			_gelPet.x = ((FlxG.width/2) - (_gelPet.width/2));
			_gelPet.y = ((FlxG.height/2) - (_gelPet.height/2));
		}
		else
		{
			_gelPet = _save.data.gel;
			_gelPet._clock = _save.data.clock;
		}
		add(_gelPet);

		// Interface
		_infoMenu = new InfoMenu(_gelPet);
		if (_save.data.HUD == null)
			_hud = new HUD(_gelPet, _clock, _infoMenu);
		else
			_hud = _save.data.hud;
		add(_hud);
		add(_infoMenu);

		super.create();
		
		// DEBUG
		FlxG.debugger.setLayout(FlxDebuggerLayout.RIGHT);

		// SAVE END
		_save.close();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_infoMenu.visible)
		{
			_gelPet.active = false;
			_clock.pause(true);
			_hud.active = false;
		}
		else
		{
			_gelPet.active = true;
			_clock.pause(false);
			_hud.active = true;
			saveGame();
		}

		if (_gelPet.CurrentMood == Gel.Mood.EXCITED || _gelPet.CurrentMood == Gel.Mood.ASHAMED)
			_clock.pause();
		else
			_clock.pause(false);
	}

	private function saveGame()
	{
		// SAVE BEGIN
		var _save:FlxSave = new FlxSave();
		_save.bind("Pet.GB");

		// SAVED DATA
		_save.data.gel = _gelPet;
		_save.data.clock = _gelPet._clock;
		_save.data.hud = _hud;
		//_save.data.age = _gel.age;

		// WRITE SAVE
		//_save.flush();

		// SAVE END
		_save.close;
	}

	private function quitGame():Void
	{
		// SAVE BEGIN
		var _save:FlxSave = new FlxSave();
		_save.bind("Pet.GB");

		// SAVED DATA
		_save.data.HUD = _hud;

		// SAVE END
		_save.close;
	}
}
