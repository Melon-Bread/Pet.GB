package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class InfoMenu extends FlxTypedGroup<FlxSprite>
{
	private var _sprBackground:FlxSprite;

	private var _txtTitle:FlxText;
	private var _txtAGE:FlxText;
	private var _txtINT:FlxText;
	private var _txtHAP:FlxText;
	private var _txtDIS:FlxText;
	private var _txtFooter:FlxText;

	private var _gel:Gel;

	public function new(gel:Gel)
	{
		super();
		_gel = gel;

		_sprBackground = new FlxSprite(9, 9, AssetPaths.Menu__png);
		add(_sprBackground);

		_txtTitle = new FlxText((_sprBackground.x + 11), (_sprBackground.y + 2), 0, "Gel Info", 16);
		_txtTitle.setFormat(AssetPaths.EarlyGameBoy__ttf, 16, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtTitle);

		// Content
		_txtAGE = new FlxText((_txtTitle.x + 7), (_sprBackground.y + 33), 0 , "Age:       " + _gel.Age + " Days");
		_txtAGE.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtAGE);

		_txtINT = new FlxText(_txtAGE.x, (_txtAGE.y + _txtAGE.height + 1), 0, "Int:       " + _gel.Intellect + " Pts");
		_txtINT.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add (_txtINT);

		_txtHAP = new FlxText(_txtINT.x, (_txtINT.y + _txtINT.height + 1), 0, "HAP:       " + _gel.Happiness + " Pct");
		_txtHAP.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add (_txtHAP);

		_txtDIS = new FlxText(_txtHAP.x, (_txtHAP.y + _txtHAP.height + 1), 0, "DIS:       " + _gel.Discipline + " Pct");
		_txtDIS.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add (_txtDIS);


		// Footer
		_txtFooter = new FlxText((_sprBackground.x + 12), (_sprBackground.height - 12), 0, "Press B To Close", 8);
		_txtFooter.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtFooter);

		active = false;
		visible = false;
	}	

	public function OpenMenu():Void
	{
		//_sprBackground.drawFrame();
		
		visible = true;
		active = true;
		updateInfo();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.Z || FlxG.gamepads.anyJustPressed(B))
			closeMenu();
	}

	private function closeMenu():Void
	{
		active = false;
		visible = false;
	}

	private function updateInfo():Void
	{
		_txtAGE.text = "Age:       " + _gel.Age + " Days";
		_txtINT.text = "Int:       " + _gel.Intellect + " Pts";
		_txtHAP.text = "HAP:       " + _gel.Happiness + " Pct";
		_txtDIS.text = "DIS:       " + _gel.Discipline + " Pct";
	}
}