package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
	// Top 
	private var _sprTop:FlxSprite;
	private var _txtInfo:FlxText;
	private var _sprInfo:FlxSprite;
	private var _txtFeed:FlxText;
	private var _sprFeed:FlxSprite;
	private var _txtStudy:FlxText;
	private var _sprStudy:FlxSprite;
	private var _txtRest:FlxText;
	private var _sprRest:FlxSprite;

	// Bottom
	private var _sprBottom:FlxSprite;
	private var _txtCheer:FlxText;
	private var _sprCheer:FlxSprite;
	private var _txtScold:FlxText;
	private var _sprScold:FlxSprite;
	private var _txtWipe:FlxText;
	private var _sprWipe:FlxSprite;
	private var _txtConfig:FlxText;
	private var _sprConfig:FlxSprite;

	// Gel Boxes
	private var _sprEmotion:FlxSprite;
	private var _sprInteraction:FlxSprite;

	// Sounds
	private var _sndSelect:FlxSound;
	private var _sndNext:FlxSound;

	// Misc
	private var _menuOption:Int;
	private var _sprSelect:FlxSprite;
	private var _tmpText:FlxText;

	private var _gel:Gel;
	
	public function new(g:Gel)
	{
		super();

		// Misc
		_menuOption = 0;
		_gel = g;

		// Top
		_sprTop = new FlxSprite(0, 0, AssetPaths.HUD_Background__png);
		add(_sprTop);

		// Info
		_txtInfo = new FlxText(1, (_sprTop.height - 13), 0, "Info", 8);
		_txtInfo.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtInfo);
		_sprInfo = new FlxSprite((_txtInfo.x + 3), (_txtInfo.y - 17), AssetPaths.Info__png);
		add(_sprInfo);

		// Feed
		_txtFeed = new FlxText((_txtInfo.x + _txtInfo.width + 4), (_sprTop.height - 13), 0, "Feed", 8);
		_txtFeed.setFormat(AssetPaths.EarlyGameBoy__ttf, 8 , FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtFeed);
		_sprFeed = new FlxSprite((_txtFeed.x + 2), (_txtFeed.y - 17), AssetPaths.Feed__png);
		add(_sprFeed);

		// Study
		_txtStudy = new FlxText((_txtFeed.x + _txtFeed.width - 1), (_sprTop.height - 13), 0, "Study", 8);
		_txtStudy.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtStudy);
		_sprStudy = new FlxSprite((_txtStudy.x + 6), (_txtStudy.y - 17), AssetPaths.Study__png);
		add(_sprStudy);

		// Rest
		_txtRest = new FlxText((_txtStudy.x + _txtStudy.width), (_sprTop.height - 13), 0, "Rest", 8);
		_txtRest.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtRest);
		_sprRest = new FlxSprite((_txtRest.x + 2), (_txtRest.y - 17), AssetPaths.Rest__png);
		add(_sprRest);

		// Bottom
		_sprBottom = new FlxSprite(0, (FlxG.height - _sprTop.height), AssetPaths.HUD_Background__png);
		add(_sprBottom);

		// Cheer
		_txtCheer = new FlxText(-2, (FlxG.height - 13), 0, "Cheer", 8);
		_txtCheer.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtCheer);
		_sprCheer = new FlxSprite((_txtCheer.x + 6), (_txtCheer.y - 17), AssetPaths.Cheer__png);
		add (_sprCheer);

		// Scold
		_txtScold = new FlxText((_txtCheer.x + _txtCheer.width - 5), (FlxG.height - 13), 0, "Scold", 8);
		_txtScold.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtScold);
		_sprScold = new FlxSprite((_txtScold.x + 6), (_txtScold.y - 17), AssetPaths.Scold__png);
		add(_sprScold);

		// Wipe
		_txtWipe = new FlxText((_txtScold.x + _txtScold.width - 1), (FlxG.height - 13), 0, "Wipe", 8);
		_txtWipe.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtWipe);
		_sprWipe = new FlxSprite((_txtWipe.x + 2), (_txtWipe.y - 17), AssetPaths.Wipe__png);
		add(_sprWipe);

		// Config
		_txtConfig = new FlxText((_txtWipe.x + _txtWipe.width + 3), (FlxG.height - 13), 0, "Conf", 8);
		_txtConfig.setFormat(AssetPaths.EarlyGameBoy__ttf, 8, FlxColor.fromRGB(8, 24, 32, 0), CENTER);
		add(_txtConfig);
		_sprConfig = new FlxSprite((_txtConfig.x + 2), (_txtConfig.y - 17), AssetPaths.Config__png);
		add(_sprConfig);

		// Sound
		_sndSelect = FlxG.sound.load(AssetPaths.Select__ogg);
		_sndNext = FlxG.sound.load(AssetPaths.Next__ogg);

		// Menu Selecter
		_sprSelect = new FlxSprite(0, 0, AssetPaths.tmpSelect__png);
		add(_sprSelect);

		// Gel Boxes
		_sprEmotion = new FlxSprite(26, 51, AssetPaths.tmp24__png);
		_sprEmotion.visible = false;
		add(_sprEmotion);

		_sprInteraction = new FlxSprite(111, 78, AssetPaths.tmp24__png);
		_sprInteraction.visible = false;
		add(_sprInteraction);

		_tmpText = new FlxText(_sprInteraction.x, _sprInteraction.y, 0, "", 8);
		add(_tmpText);

		// DEBUG
		FlxG.watch.add(this, "_menuOption", "Menu Index");
		FlxG.watch.add(_sprInteraction, "alpha", "Interact Alpha");
		FlxG.watch.add(_sprInteraction, "visible", "Interact Visible");
		FlxG.watch.add(_tmpText, "text", "Temp Text");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.RIGHT)
			nextOption(true);
		else if (FlxG.keys.justPressed.LEFT)
			nextOption(false);
		else if (FlxG.keys.justPressed.X) 
			makeOption(_menuOption);

	}


	private function nextOption(increment:Bool):Void
	{
		if (increment)
		{
			if (_menuOption >= 7)
				_menuOption = 0;
			else
				_menuOption++;

			if (_menuOption >= 4)
			{
				_sprSelect.x = (_menuOption - 4) * 40;
				_sprSelect.y = _sprBottom.y;
			}
			else
			{
				_sprSelect.x = _menuOption * 40;
				_sprSelect.y = 0;
			}

		}
		else
		{
			if (_menuOption <= 0)
				_menuOption = 7;
			else
				_menuOption--;

			if (_menuOption >= 4)
			{
				_sprSelect.x = (_menuOption - 4) * 40;
				_sprSelect.y = _sprBottom.y;
			}
			else
			{
				_sprSelect.x = _menuOption * 40;
				_sprSelect.y = 0;
			}

		}
		_sndNext.play(true);
	}

	private function makeOption(option:Int):Void
	{
		if(!_gel.Wait)
		{
			switch(option)
			{
				// INFO
				case 0:
				//

				// FEED
				case 1:
					feedGel();

				// TRAIN
				case 2:
					//

				// REST
				case 3:
					//

				// CHEER
				case 4:
					praiseGel();

				// SCOLD
				case 5:
					scoldGel();

				// WIPE
				case 6:
					//

				// CONFIG
				case 7:
					//
			}
			_sndSelect.play(true);
		}

	}

	private function feedGel():Void
	{
		itemJoin("F");
		_gel.EatFood();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function praiseGel():Void
	{
		itemJoin("C");
		_gel.Praise();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function scoldGel():Void
	{
		itemJoin("S");
		_gel.Scold();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function itemJoin(letter:String = ""):Void
	{
		_sprInteraction.visible = true;
		_tmpText.text = letter;
	}

	private function itemLeave(_):Void
	{
		_sprInteraction.visible = false;
		_tmpText.text = "";
		_sprInteraction.alpha = 1;
		_gel.Wait = false;
	}

}

// TODO: Actually use this instead of _menuChoice
enum MenuOption
{
	INFO;
	FEED;
	STUDY;
	REST;
	CHEER;
	SCOLD;
	WIPE;
	CONFIG;
}