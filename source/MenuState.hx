package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	private var _sprBackground:FlxSprite;
	private var _sprEgg:FlxSprite;

	private var _txtTitle:FlxText;
	private var _txtMessage:FlxText;

	private var _sndSelect:FlxSound;

	override public function create():Void
	{
		set_bgColor(FlxColor.fromRGB(136, 192, 112, 0));
		FlxG.mouse.visible = false;
		FlxG.autoPause = false;

		_sprBackground = new FlxSprite(0, 0, AssetPaths.background__png);
		add(_sprBackground);

		_txtTitle = new FlxText(20, 0, 0, "Pet.GB", 8);
		_txtTitle.setFormat(AssetPaths.EarlyGameBoy__ttf, 16, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		_txtTitle.screenCenter(X);
		add(_txtTitle);

		_sprEgg =  new FlxSprite(0, 0, AssetPaths.Egg__png);
		_sprEgg.x = (FlxG.width/2) - (_sprEgg.width/2);
		_sprEgg.y = (FlxG.height/2) - (_sprEgg.height/2);
		add(_sprEgg);


		_txtMessage = new FlxText(0, FlxG.height - 20, 0, "Press Start", 8);
		_txtMessage.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		_txtMessage.screenCenter(X);
		add(_txtMessage);

		_sndSelect = FlxG.sound.load(AssetPaths.Select__ogg);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if(FlxG.keys.pressed.ENTER)
			pressStart();

		super.update(elapsed);
	}

	private function pressStart():Void
	{
		_sndSelect.play(true);
		FlxG.camera.fade(FlxColor.fromRGB(136, 192, 112, 0), 0.5, true, function()
			{
				FlxG.switchState(new PlayState());
			});
	}
}
