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


	override public function create():Void
	{
		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		_gelPet = new Gel();
		_gelPet.x = ((FlxG.width/2) - (_gelPet.width/2));
		_gelPet.y = ((FlxG.height/2) - (_gelPet.height/2));
		add(_gelPet);

		// Interface
		_infoMenu = new InfoMenu(_gelPet);
		_hud = new HUD(_gelPet, _infoMenu);
		add(_hud);
		add(_infoMenu);

		super.create();
		
		// DEBUG
		FlxG.debugger.setLayout(FlxDebuggerLayout.RIGHT);
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
