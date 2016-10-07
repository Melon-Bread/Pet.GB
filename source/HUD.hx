package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.input.gamepad.FlxGamepad;
using flixel.util.FlxSpriteUtil;


// TODO: Make sure the HUD is just displaying & triggering Gel stuff
// TODO: Display in-game time
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
	private var _sprThoughts:FlxSprite;
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

		// Interact Boxes
		_sprInteraction = new FlxSprite(111, 78, AssetPaths.tmp24__png);
		_sprInteraction.visible = false;
		add(_sprInteraction);

		// Thought Box
		_sprThoughts = new FlxSprite(26, 51);
		_sprThoughts.loadGraphic(AssetPaths.Thoughts__png, true, 24, 24);
		_sprThoughts.animation.add("none", [4], 1, false);
		_sprThoughts.animation.add("hungry", [0, 1, 2, 3, 4], 3, true);
		_sprThoughts.animation.add("poopy", [5, 6, 7, 8, 9], 3, true);
		_sprThoughts.animation.add("sleepy", [10, 11, 12, 13, 14], 4, true);
		//_sprThoughts.visible = false;
		add(_sprThoughts);


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

		// TODO: Add WASD support?
		// TODO: Add vertical menu movent
		// TODO: Start + Select gives prompt to delete save file
		if (FlxG.keys.justPressed.RIGHT || FlxG.gamepads.anyJustPressed(DPAD_RIGHT))
			nextOption(true);
		else if (FlxG.keys.justPressed.LEFT || FlxG.gamepads.anyJustPressed(DPAD_LEFT))
			nextOption(false);
		else if (FlxG.keys.justPressed.X || FlxG.gamepads.anyJustPressed(B)) 
			makeOption(_menuOption);

		_gel.update(elapsed);

		// Gel Animation
		if (_gel.CurrentMood == Gel.Mood.NEUTRAL)
			_gel.animation.play("neutral", false);
		else if(_gel.CurrentMood == Gel.Mood.HAPPY)
			_gel.animation.play("happy", false);
		else if (_gel.CurrentMood == Gel.Mood.ANGRY)
			_gel.animation.play("angry", false);
		else if (_gel.CurrentMood == Gel.Mood.SLEEPING)
			_gel.animation.play("sleeping", false);

		// Need Bubble
		if (_gel.CurrentNeed == Gel.Need.NONE)
			_sprThoughts.animation.play("none", false);
		else if (_gel.CurrentNeed == Gel.Need.HUNGRY)
			_sprThoughts.animation.play("hungry", false);
		else if (_gel.CurrentNeed == Gel.Need.POOPY)
			_sprThoughts.animation.play("poopy", false);
		else if (_gel.CurrentNeed == Gel.Need.SLEEPY)
			_sprThoughts.animation.play("sleepy", false);
	}


	private function nextOption(increment:Bool):Void
	{
		// TODO: Add vertical menu movent
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
					if (!_gel._isAsleep)
						feedGel();

				// Study
				case 2:
					if (!_gel._isAsleep)
						studyGel();

				// REST
				case 3:
					if (!_gel._isAsleep)
						sleepGel();

				// CHEER
				case 4:
					if (!_gel._isAsleep)
						praiseGel();

				// SCOLD
				case 5:
					if (!_gel._isAsleep)
						scoldGel();

				// WIPE
				case 6:
					if (!_gel._isAsleep)
						wipeGel();

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

	private function studyGel():Void
	{
		itemJoin("T");
		_gel.Study();
		_sprInteraction.fadeOut(2, itemLeave);
	}	

	private function sleepGel():Void
	{
		itemJoin("R");
		_gel.Sleep();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function praiseGel():Void
	{
		itemJoin("P");
		_gel.Praise();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function scoldGel():Void
	{
		itemJoin("S");
		_gel.Scold();
		_sprInteraction.fadeOut(2, itemLeave);
	}

	private function wipeGel():Void
	{
		itemJoin("W");
		_gel.Wipe();
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