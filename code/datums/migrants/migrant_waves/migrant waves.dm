//Bandit wave


/datum/migrant_wave/bandit
	name = "Bandit Raid"
	downgrade_wave = /datum/migrant_wave/bandit_down_one
	weight = 8
	spawn_landmark = "Bandit"
	roles = list(
		/datum/migrant_role/bandit = 2,
	)

/datum/migrant_wave/bandit_down_one
	name = "Bandit Raid"
	downgrade_wave = /datum/migrant_wave/bandit_down_two
	can_roll = FALSE
	spawn_landmark = "Bandit"
	roles = list(
		/datum/migrant_role/bandit = 2,
	)

/datum/migrant_wave/bandit_down_two
	name = "Bandit Raid"
	can_roll = FALSE
	spawn_landmark = "Bandit"
	roles = list(
		/datum/migrant_role/bandit = 1,
	)

//ADVENTURER PARTY

/datum/migrant_wave/adventurer
	name = "Adventure Party"
	downgrade_wave = /datum/migrant_wave/adventurer_down_one
	roles = list(
		/datum/migrant_role/adventurer = 4,
	)
	greet_text = "Together with a party of trusted friends we decided to venture out, seeking thrills, glory and treasure, ending up in the misty and damp bog underneath Crystal Keep, perhaps getting ourselves into more than what we bargained for."

/datum/migrant_wave/adventurer_down_one
	name = "Adventure Party"
	downgrade_wave = /datum/migrant_wave/adventurer_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/adventurer = 3,
	)
	greet_text = "Together with a party of trusted friends we decided to venture out, seeking thrills, glory and treasure, ending up in the misty and damp bog underneath Crystal Keep, perhaps getting ourselves into more than what we bargained for."

/datum/migrant_wave/adventurer_down_two
	name = "Adventure Party"
	downgrade_wave = /datum/migrant_wave/adventurer_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/adventurer = 2,
	)
	greet_text = "Together with my trusted friend I decided to venture out, seeking thrills, glory and treasure, ending up in the misty and damp bog underneath Crystal Keep, perhaps getting ourselves into more than what we bargained for."

/datum/migrant_wave/adventurer_down_three
	name = "Adventure Party"
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/adventurer = 1,
	)
	greet_text = "I sprang forth to go on with merry adventure, heave ho!"

//Mercenary group




/datum/migrant_wave/mercenary
	name = "Mercenary Party"
	downgrade_wave = /datum/migrant_wave/mercenary_down_one
	weight = 6 
	roles = list(
		/datum/migrant_role/mercenary = 4,
	)
	greet_text = "With a band of hardened sellswords, we took a contract that led us to the creviced castle of Crystal Keep. Coin and glory await, but the mists hide dangers we may not be ready for."

/datum/migrant_wave/mercenary_down_one
	name = "Mercenary Company"
	downgrade_wave = /datum/migrant_wave/mercenary_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/mercenary = 3,
	)
	greet_text = "With a small crew of trusted sellswords, we accepted a contract leading us to the creviced castle of Crystal Keep. The pay better be worth the trouble lurking in these mists."

/datum/migrant_wave/mercenary_down_two
	name = "Mercenary Company"
	downgrade_wave = /datum/migrant_wave/mercenary_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/mercenary = 2,
	)
	greet_text = "My fellow sellsword and I signed on for a risky contract, landing us in the creviced castle of Crystal Keep. We’ll need sharp blades and sharper wits to earn our coin."

/datum/migrant_wave/mercenary_down_three
	name = "Mercenary Company"
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/mercenary = 1,
	)
	greet_text = "I took a solo contract, chasing gold in the creviced castle of Crystal Keep. Alone in the mists, I’ll carve my fortune or meet my end."

//fablefield
/datum/migrant_wave/fablefield
	name = "The Fablefield Troupe"
	max_spawns = 1
	weight = 30
	downgrade_wave = /datum/migrant_wave/fablefield_down_one
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 3,
	)
	greet_text = "A troupe of troubadours from fair Fablefield, you travel to Crystal Keep seeking inspiration, drawn at every step seemingly by the whims of Xylix. The people here look like they could do with a good show, give them one they'll remember!"

/datum/migrant_wave/fablefield_down_one
	name = "The Fablefield Troupe"
	shared_wave_type = /datum/migrant_wave/fablefield
	downgrade_wave = /datum/migrant_wave/fablefield_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 2,
	)
	greet_text = "A troupe of troubadours from fair Fablefield, you travel to Crystal Keep seeking inspiration, drawn at every step seemingly by the whims of Xylix. The people here look like they could do with a good show, give them one they'll remember!"

/datum/migrant_wave/fablefield_down_two
	name = "The Fablefield Troupe"
	shared_wave_type = /datum/migrant_wave/fablefield
	downgrade_wave = /datum/migrant_wave/fablefield_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
		/datum/migrant_role/fablefield/troubadour = 1,
	)
	greet_text = "A troupe of troubadours from fair Fablefield, you travel to Crystal Keep seeking inspiration, drawn at every step seemingly by the whims of Xylix. The people here look like they could do with a good show, give them one they'll remember!"

/datum/migrant_wave/fablefield_down_three
	name = "The Fablefield Troupe"
	shared_wave_type = /datum/migrant_wave/fablefield
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/fablefield/goliard = 1,
	)
	greet_text = "A troupe of troubadours from fair Fablefield, you travel to Crystal Keep seeking inspiration, drawn at every step seemingly by the whims of Xylix. The people here look like they could do with a good show, give them one they'll remember!"

//Werewolf spawn

/datum/migrant_wave/werewolf
	name = "Roving Pack"
	downgrade_wave = /datum/migrant_wave/werewolf_down_one
	can_roll = TRUE
	weight = 2 //Significantly Rarer than bandits, due to the fact these guys can convert.
	max_spawns = 1
	roles = list(
		/datum/migrant_role/werewolf = 2,
	)
	greet_text = "You are a part of a roving pair- Scouts sent by the Alpha of your pack, to begin converting and spreading your lupine mark to far-off lands. You are strangers to this land, and uncertain in these times of trial- but the pack takes care of it's own. Assist one another, and above all- Stay alive."

/datum/migrant_wave/werewolf_down_one
	name = "Isolated Packmate"
	can_roll = TRUE
	weight = 4 //Half as rare. 
	max_spawns = 2 //Can roll more often. 
	roles = list(
		/datum/migrant_role/werewolf = 1,
	)
	greet_text = "You were seperated during a fight, driven from your ancient, ancestral grounds - you have known nothing but the beat of freedom; the pounding of your heart during nightly hunts... Yet now, alone - you are forced into a new decision. Shall you try and cast off your curse, to live a solitary life- or shall you create a pack anew?"
