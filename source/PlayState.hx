package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.debug.FlxDebugger;

class PlayState extends FlxState
{
	private var _sprBackground:FlxSprite;

	private var _gelPet:Gel;

	private var _hud:HUD;

	private var _infoMenu:InfoMenu;

	public static var GameVolume = 1;

	override public function create():Void
	{
		// SAVE BEGIN
		var _save:FlxSave = new FlxSave();
		_save.bind("Pet.GB")

		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		if (_save.data.GelPet == null)
		{
			_gelPet = new Gel();
			_gelPet.x = ((FlxG.width/2) - (_gelPet.width/2));
			_gelPet.y = ((FlxG.height/2) - (_gelPet.height/2));
		}
		else
		{
			_gelPet = _save.data.GelPet;
			_gelPet._clock = _save.data.GelPet.Clock;
		}
		add(_gelPet);

		// Interface
		_infoMenu = new InfoMenu(_gelPet);
		if (_save.data.HUD == null)
			_hud = new HUD(_gelPet, _infoMenu);
		else
			_hud = _save.data.HUD;
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
			_gelPet._clock.pause(true);
			_hud.active = false;
		}
		else
		{
			_gelPet.active = true;
			_gelPet._clock.pause(false);
			_hud.active = true;
		}
	}
}
