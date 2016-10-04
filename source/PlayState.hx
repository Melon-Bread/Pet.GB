package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _sprBackground:FlxSprite;

	private var _gelPet:Gel;

	private var _hud:HUD;

	override public function create():Void
	{
		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		_gelPet = new Gel();
		_gelPet.x = ((FlxG.width/2) - (_gelPet.width/2));
		_gelPet.y = ((FlxG.height/2) - (_gelPet.height/2));
		add(_gelPet);

		_hud = new HUD(_gelPet);
		add(_hud);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
