#~Gel Lyfe~
---

##TOP PRIORITIES:
* **Translate real time to game time**
* **Decide what it means for a hour to pass in game**
	* **Also what a day means, besides age**
* **Communication Success formula** 
	* **Based on Int & Discipline**
* **Figure out END_GAME**
	* *What triggers it???* 

---

#Time

##One Hour
	* Every 3min real time is 1 game hour
	* Effects Stats/Modifers
		* Hun

##One Day:
	* 24 hours = 1 Day
	* Resets back to 0 when hours = 24
	* Age +1

#Moods

##Main Moods  
	
###HAPPY:
	* Reqiures Happiness 61-100
	* MainAnimation = happy
	* Rasies change of int gain when studying?
	* Long term happy prevent END_GAME?

###NEUTRAL:
	* Requires Happiness 40-60
	* MainAnimation = netrual
	* Smallest of the main mood windows
	* No real loss or real gain

###ANGRY:
	* Requires Happiness 0-39
	* MainAnimation = angry
	* Will not study
		* Need another penelty?
	* Long term anger triggers END_GAME?

##Sub Moods

###HUNGRY:
	* Requires _isHungry (Fullness<50)
	* SubMoodBox = "candy" 
	* Every hour _isHungry Happiness -10
	* Long term hunger triggers END_GAME?

###SLEEPY:
	* Requires _madeWaste (Sleepiness >= 90)
	* SubMoodBox = "ZzZz"
	* Will not study

##Special Moods

###WASTING:
	* Requires _madeWaste
	* Untriggers _wasteReady
	* Every hour with waste lowers stats
		* Discipline -10
		* Happiness -10
	* Long term waste WILL trigger END_GAME

###SLEEPING
	* Requires isAsleep
	* MainAnimation = "sleeping"
	* Last 6-9 hours 
	* No real way to interact

---


##Main Modifiers

#
		* 0-39 = ANGRY   252
	  	* 40-59 = NEUTRAL  
	  	* 61-100 = HAPPY  
	* Shifts the most out of the main modifiers
	* Kinda decides the overall health of the gel
		* Need to make this more of a factor for END_GAME

###Discipline:  
	* First factor in determining how well the slime communicates
	* Only factor on how much it is willing to study
	* Hardest stat to raise?

###Intellect:
	* Second factor in determining how well the slime communicates
	* Can only be raised by studying and nothing else
	* Can not be lost (may change with age factor)


##Sub Modifiers

###Fullness:  
	* Every hour 10 fullness lost
	* <=50 = _isHungry  
	* Every hour _isHungry 10 Happiness is lost
	* _isHungry untriggered when fullness >=75

###Sleepiness:
	* >=90 = _isTired
	* Every hour _isTired loses 5 happiness  
	* Every hour adds 5 points
	* Studying, when is successful, adds 10 points
	* Resting resets Sleepiness
	* Resting can last 6-9 hours (random)

###Waste:  
	* Only increases when !_isHungry by random value (10, 20, 25) every hour after eating
	* Leaves a small window for player to WIPE
	* Ability to communicate based on Int & Discipline
---

#Menu Options
	* Save after every selection
	* Have to wait for slection to play out before selecting a new one

###INFO:
	* Displays basic info on the gel
		* Age (HoursPassed/24)
		* Happiness (percent)
		* Discipline (percent)
		* Current Hour (out of 24);
	* Many stats are hidden
		* Fullness
		* Waste
		* Sleepiness
	* Pauses timer when viewing

###FEED:
	* InteractionBox = food
	* Fullness +25
	* Happiness +10;
	* Discipline -5
	* Over feeding (Fullness>100) leads to punishment

###STUDY:
	* InteractionBox = book
	* Can only be done once per hour
	* Requires a discipline check
		* On fail, cant try again till new hour
	* Int +1
		* May increase more based on Age & Happiness
	* Sleepiness +10
	* Happiness -5
	* Forces time by one hour

###REST:
	* Can only be done when _isTired
	* Puts player in Sleeping Mood
		* Last 6-9 hours (random, may make discipline be a factor)
		* Can only view INFO & CONF
		* Happiness change determined by level
			* HAPPY = Happiness - 15;
			* NEUTRAL = Happiness +10
			* ANGRY = Happiness +10;
		* Fullness -50;
		* Sleepiness =0;

###CHEER:
	* Happiness +10
	* Discipline -10;
	* Plays a short Encouraged animation before going back to current mood animation

###SCOLD:
	* Discipline +10
	* Happiness -10;
	* Plays a short Sad/Ashamed animation before going back to current mood animation

###WIPE:
	* Can only do once per hour
	* Three outcomes
		* Early Wipe
			* Happiness -10
		* Good Wipe
			* Discipline +10
			* Happiness +10
			* !_wasteReady
		* Late Wipe
			* _madeWaste
			* Discipline -10
			* Happiness -10
			* removes waste from InteractionBox

##CONF:
	* Lets player change basic settings
		* SE Volume
		* Brightness?
	* Pauses timer when viewing
