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
	private var _configMenu:ConfigMenu;


	override public function create():Void
	{
		// SAVE BEGIN
		var _save:FlxSave = new FlxSave();
		_save.bind("Pet.GB");

		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		_clock = new Clock();

		_gelPet = new Gel(0, 0, _clock);
		_gelPet.x = ((FlxG.width/2) - (_gelPet.width/2));
		_gelPet.y = ((FlxG.height/2) - (_gelPet.height/2));
		add(_gelPet);

		// Interface
		_infoMenu = new InfoMenu(_gelPet);
		_configMenu = new ConfigMenu();
		_hud = new HUD(_gelPet, _clock, _infoMenu, _configMenu);
		add(_hud);
		add(_infoMenu);
		add(_configMenu);

		super.create();
		
		// DEBUG
		FlxG.debugger.setLayout(FlxDebuggerLayout.RIGHT);

		// Loads Settings
		FlxG.sound.muted = _save.data.muted;


		// SAVE END
		_save.close();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_infoMenu.visible || _configMenu.visible)
		{
			_gelPet.active = false;
			_clock.pause();
			_hud.active = false;
		}
		else
		{
			_gelPet.active = true;
			_clock.pause(false);
			_hud.active = true;
		}

		if (_gelPet.CurrentMood == Gel.Mood.EXCITED || _gelPet.CurrentMood == Gel.Mood.ASHAMED)
			_clock.pause();
		else
			_clock.pause(false);
	}
}
