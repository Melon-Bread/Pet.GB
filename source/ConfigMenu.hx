package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import haxe.xml.Parser;

class ConfigMenu extends FlxTypedGroup<FlxSprite>
{
	private var _sprBackground:FlxSprite;
	
	private var _sprCursor:FlxSprite;
	private var _menuChoice:Int = 0;

	private var _txtTitle:FlxText;
	private var _txtVolume:FlxText;
	private var _txtControls:FlxText;

	private var _txtFooter:FlxText;

	private var _gameMuted:Bool = false;
	private var _strMuted:String = "On";

	private var _usingArrows:Bool = true;
	private var _strControls:String = "Arrows"; 

	public function new()
	{
		super();
		
		loadSettings();

		_sprBackground = new FlxSprite(9, 9, AssetPaths.Menu__png);
		add(_sprBackground);

		// Title
		_txtTitle = new FlxText((_sprBackground.x + 11), (_sprBackground.y + 2), 0, "Config", 16);
		_txtTitle.setFormat(AssetPaths.EarlyGameBoy__ttf, 16, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		_txtTitle.x = (FlxG.width/2) - (_txtTitle.width/2);
		add(_txtTitle);

		_sprCursor = new FlxSprite(0, 0, AssetPaths.Cursor__png);
		_sprCursor.x = (_txtTitle.x - 15);
		_sprCursor.y = (_sprBackground.y + 37);
		add(_sprCursor);

		// Content 
		_txtVolume = new FlxText((_sprCursor.x + _sprCursor.width), (_sprBackground.y + 33), 0 , "Sound: " + _strMuted);
		_txtVolume.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtVolume);

		_txtControls = new FlxText(_txtVolume.x, (_txtVolume.y + _txtVolume.height + 1), 0, "Controls: " + _strControls);
		_txtControls.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add (_txtControls);

		// Footer
		_txtFooter = new FlxText((_sprBackground.x), (_sprBackground.height - 12), 0, "Press Start To Save", 8);
		_txtFooter.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtFooter);

		active = false;
		visible = false;
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.ENTER || FlxG.gamepads.anyJustPressed(START))
			saveConfig();

		if (_usingArrows)
		{
			if (FlxG.keys.justPressed.UP || FlxG.gamepads.anyJustPressed(DPAD_UP))
				nextChoice(-1);
			else if (FlxG.keys.justPressed.DOWN || FlxG.gamepads.anyJustPressed(DPAD_DOWN))
				nextChoice(1);
			else if (FlxG.keys.justPressed.LEFT || FlxG.gamepads.anyJustPressed(DPAD_LEFT))
				makeChoice();
			else if (FlxG.keys.justPressed.RIGHT || FlxG.gamepads.anyJustPressed(DPAD_RIGHT))
				makeChoice();


		}
		else
		{
			if (FlxG.keys.justPressed.W || FlxG.gamepads.anyJustPressed(DPAD_UP))
				nextChoice(-1);
			else if (FlxG.keys.justPressed.S || FlxG.gamepads.anyJustPressed(DPAD_DOWN))
				nextChoice(1);
			else if (FlxG.keys.justPressed.A || FlxG.gamepads.anyJustPressed(DPAD_LEFT))
				makeChoice();
			else if (FlxG.keys.justPressed.D || FlxG.gamepads.anyJustPressed(DPAD_RIGHT))
				makeChoice();
		}

	}

	private function nextChoice(amount:Int)
	{
		_menuChoice += amount;
		if (_menuChoice < 0)
			_menuChoice = 2;
		else if (_menuChoice > 1)
			_menuChoice = 0;

		switch (_menuChoice)
		{
			case 0:
				_sprCursor.y = (_sprBackground.y + 37);

			case 1:
				_sprCursor.y = (_txtControls.y + 4);
		}
	}

	private function makeChoice()
	{
		switch (_menuChoice)
		{
			case 0:
				_gameMuted = !_gameMuted;
			case 1:
				_usingArrows = !_usingArrows;
		}
		updateInfo();
	}

	private function saveConfig():Void
	{

		var _save = new FlxSave();
		_save.bind("Pet.GB");

		if (_gameMuted)
			_save.data.muted = true;
		else if (!_gameMuted)
			_save.data.muted = false;
			
		if (_usingArrows)
			_save.data.arrowInput = true;
		else if (!_usingArrows)
			_save.data.arrowInput = false;

		_save.close();

		closeMenu();
	}

	public function OpenMenu():Void
	{
		loadSettings();

		visible = true;
		active = true;
		updateInfo();
	}

	private function closeMenu():Void
	{
		active = false;
		visible = false;
	}

	private function updateInfo():Void
	{
		if (!_gameMuted)
			_strMuted = "On";
		else
			_strMuted = "Off";

		if (_usingArrows)
			_strControls = "Arrows";
		else
			_strControls = "WASD";

		_txtVolume.text = "Volume: " + _strMuted;
		_txtControls.text = "Controls: " + _strControls;
	}

	private function loadSettings():Void
	{
		var _save = new FlxSave();
		_save.bind("Pet.GB");

		_usingArrows = _save.data.arrowInput;
		FlxG.sound.muted = _save.data.muted;

		_save.close();
	}
}