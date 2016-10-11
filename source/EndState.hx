package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class EndState extends FlxState
{
	private var _txtMessage:FlxText;
	
	override public function create():Void 
	{	
		super.create();


		_txtMessage = new FlxText(9, 9, 0, "Your Pet Gel Buddy\nHas Moved On.\n\nIt Feels You Should\nDo The Same.");
		_txtMessage.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(136, 192, 112, 0), CENTER);
		add(_txtMessage);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		set_bgColor(FlxColor.fromRGB(8, 24, 32, 0));

		if (FlxG.keys.pressed.ENTER || FlxG.gamepads.anyJustPressed(START))
			goMainMenu();
	}
	
	private function goMainMenu():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
		{
			FlxG.switchState(new MenuState());
		});
	}
}