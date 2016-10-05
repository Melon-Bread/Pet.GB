package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/EarlyGameBoy.eot", "assets/data/EarlyGameBoy.eot");
			type.set ("assets/data/EarlyGameBoy.eot", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/data/EarlyGameBoy.svg", "assets/data/EarlyGameBoy.svg");
			type.set ("assets/data/EarlyGameBoy.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/EarlyGameBoy.ttf", "assets/data/EarlyGameBoy.ttf");
			type.set ("assets/data/EarlyGameBoy.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/EarlyGameBoy.woff", "assets/data/EarlyGameBoy.woff");
			type.set ("assets/data/EarlyGameBoy.woff", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/icon.png", "assets/icon.png");
			type.set ("assets/icon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Angry/Player-angry1-sheet.png", "assets/images/Animations/Angry/Player-angry1-sheet.png");
			type.set ("assets/images/Animations/Angry/Player-angry1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Angry/Player-angry1.png", "assets/images/Animations/Angry/Player-angry1.png");
			type.set ("assets/images/Animations/Angry/Player-angry1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Angry/Player-angry2.png", "assets/images/Animations/Angry/Player-angry2.png");
			type.set ("assets/images/Animations/Angry/Player-angry2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Angry/Player-angry3.png", "assets/images/Animations/Angry/Player-angry3.png");
			type.set ("assets/images/Animations/Angry/Player-angry3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Ashamed/Player-ashamed1-sheet.png", "assets/images/Animations/Ashamed/Player-ashamed1-sheet.png");
			type.set ("assets/images/Animations/Ashamed/Player-ashamed1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Ashamed/Player-ashamed1.png", "assets/images/Animations/Ashamed/Player-ashamed1.png");
			type.set ("assets/images/Animations/Ashamed/Player-ashamed1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Ashamed/Player-ashamed2.png", "assets/images/Animations/Ashamed/Player-ashamed2.png");
			type.set ("assets/images/Animations/Ashamed/Player-ashamed2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Ashamed/Player-ashamed3.png", "assets/images/Animations/Ashamed/Player-ashamed3.png");
			type.set ("assets/images/Animations/Ashamed/Player-ashamed3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Excited/Player-exitednew1-sheet.png", "assets/images/Animations/Excited/Player-exitednew1-sheet.png");
			type.set ("assets/images/Animations/Excited/Player-exitednew1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Excited/Player-exitednew1.png", "assets/images/Animations/Excited/Player-exitednew1.png");
			type.set ("assets/images/Animations/Excited/Player-exitednew1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Excited/Player-exitednew2.png", "assets/images/Animations/Excited/Player-exitednew2.png");
			type.set ("assets/images/Animations/Excited/Player-exitednew2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Excited/Player-exitednew3.png", "assets/images/Animations/Excited/Player-exitednew3.png");
			type.set ("assets/images/Animations/Excited/Player-exitednew3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood1-sheet.png", "assets/images/Animations/Happy/Player-1happymood1-sheet.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood1.png", "assets/images/Animations/Happy/Player-1happymood1.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood2.png", "assets/images/Animations/Happy/Player-1happymood2.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood3.png", "assets/images/Animations/Happy/Player-1happymood3.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood4.png", "assets/images/Animations/Happy/Player-1happymood4.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood5.png", "assets/images/Animations/Happy/Player-1happymood5.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Happy/Player-1happymood6.png", "assets/images/Animations/Happy/Player-1happymood6.png");
			type.set ("assets/images/Animations/Happy/Player-1happymood6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood1-sheet.png", "assets/images/Animations/Neutral/Player-1neturalmood1-sheet.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood1.png", "assets/images/Animations/Neutral/Player-1neturalmood1.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood2.png", "assets/images/Animations/Neutral/Player-1neturalmood2.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood3.png", "assets/images/Animations/Neutral/Player-1neturalmood3.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood4.png", "assets/images/Animations/Neutral/Player-1neturalmood4.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood5.png", "assets/images/Animations/Neutral/Player-1neturalmood5.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Neutral/Player-1neturalmood6.png", "assets/images/Animations/Neutral/Player-1neturalmood6.png");
			type.set ("assets/images/Animations/Neutral/Player-1neturalmood6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Sleep/Player-sleep1-sheet.png", "assets/images/Animations/Sleep/Player-sleep1-sheet.png");
			type.set ("assets/images/Animations/Sleep/Player-sleep1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Sleep/Player-sleep1.png", "assets/images/Animations/Sleep/Player-sleep1.png");
			type.set ("assets/images/Animations/Sleep/Player-sleep1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Sleep/Player-sleep2.png", "assets/images/Animations/Sleep/Player-sleep2.png");
			type.set ("assets/images/Animations/Sleep/Player-sleep2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations/Sleep/Player-sleep3.png", "assets/images/Animations/Sleep/Player-sleep3.png");
			type.set ("assets/images/Animations/Sleep/Player-sleep3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry1-sheet.png", "assets/images/Animations2/Hungry/thought-hungry1-sheet.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry1.png", "assets/images/Animations2/Hungry/thought-hungry1.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry2.png", "assets/images/Animations2/Hungry/thought-hungry2.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry3.png", "assets/images/Animations2/Hungry/thought-hungry3.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry4.png", "assets/images/Animations2/Hungry/thought-hungry4.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Hungry/thought-hungry5.png", "assets/images/Animations2/Hungry/thought-hungry5.png");
			type.set ("assets/images/Animations2/Hungry/thought-hungry5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop1-sheet.png", "assets/images/Animations2/Poop/thought-poop1-sheet.png");
			type.set ("assets/images/Animations2/Poop/thought-poop1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop1.png", "assets/images/Animations2/Poop/thought-poop1.png");
			type.set ("assets/images/Animations2/Poop/thought-poop1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop2.png", "assets/images/Animations2/Poop/thought-poop2.png");
			type.set ("assets/images/Animations2/Poop/thought-poop2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop3.png", "assets/images/Animations2/Poop/thought-poop3.png");
			type.set ("assets/images/Animations2/Poop/thought-poop3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop4.png", "assets/images/Animations2/Poop/thought-poop4.png");
			type.set ("assets/images/Animations2/Poop/thought-poop4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Poop/thought-poop5.png", "assets/images/Animations2/Poop/thought-poop5.png");
			type.set ("assets/images/Animations2/Poop/thought-poop5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep1-sheet.png", "assets/images/Animations2/Sleepy/thought-sleep1-sheet.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep1-sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep1.png", "assets/images/Animations2/Sleepy/thought-sleep1.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep2.png", "assets/images/Animations2/Sleepy/thought-sleep2.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep3.png", "assets/images/Animations2/Sleepy/thought-sleep3.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep4.png", "assets/images/Animations2/Sleepy/thought-sleep4.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Animations2/Sleepy/thought-sleep5.png", "assets/images/Animations2/Sleepy/thought-sleep5.png");
			type.set ("assets/images/Animations2/Sleepy/thought-sleep5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/background.png", "assets/images/background.png");
			type.set ("assets/images/background.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Cheer.png", "assets/images/Cheer.png");
			type.set ("assets/images/Cheer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Config.png", "assets/images/Config.png");
			type.set ("assets/images/Config.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Egg.png", "assets/images/Egg.png");
			type.set ("assets/images/Egg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Egg2.png", "assets/images/Egg2.png");
			type.set ("assets/images/Egg2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Egg3.png", "assets/images/Egg3.png");
			type.set ("assets/images/Egg3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Feed.png", "assets/images/Feed.png");
			type.set ("assets/images/Feed.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/HUD_Background.png", "assets/images/HUD_Background.png");
			type.set ("assets/images/HUD_Background.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Info.png", "assets/images/Info.png");
			type.set ("assets/images/Info.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Player.png", "assets/images/Player.png");
			type.set ("assets/images/Player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Rest.png", "assets/images/Rest.png");
			type.set ("assets/images/Rest.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Rest_old.png", "assets/images/Rest_old.png");
			type.set ("assets/images/Rest_old.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Scold.png", "assets/images/Scold.png");
			type.set ("assets/images/Scold.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Study.png", "assets/images/Study.png");
			type.set ("assets/images/Study.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tmp20.png", "assets/images/tmp20.png");
			type.set ("assets/images/tmp20.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tmp24.png", "assets/images/tmp24.png");
			type.set ("assets/images/tmp24.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tmp32.png", "assets/images/tmp32.png");
			type.set ("assets/images/tmp32.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tmpSelect.png", "assets/images/tmpSelect.png");
			type.set ("assets/images/tmpSelect.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Wipe.png", "assets/images/Wipe.png");
			type.set ("assets/images/Wipe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/Next.ogg", "assets/sounds/Next.ogg");
			type.set ("assets/sounds/Next.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Select.ogg", "assets/sounds/Select.ogg");
			type.set ("assets/sounds/Select.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/Thoughts.png", "assets/Thoughts.png");
			type.set ("assets/Thoughts.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
