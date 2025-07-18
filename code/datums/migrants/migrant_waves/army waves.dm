//Gronn stuff, avarikyo stuff too


///Lizardfolk tribefolk
/datum/migrant_wave/lizardtribe
	name = "Lizard Folk Tribe"
	downgrade_wave = /datum/migrant_wave/lizardtribe_down_one
	weight = 20
	roles = list(
		/datum/migrant_role/lizardtribe/shaman = 2,
		/datum/migrant_role/lizardtribe/tribesmen = 6,
	)
	greet_text = "Your tribe ventures near this settlement, driven by the need for sustenance and survival in the harsh lands. Together, you seek resources to ensure your people’s future."

/datum/migrant_wave/lizardtribe_down_one
	name = "Lizard Folk Tribe"
	downgrade_wave = /datum/migrant_wave/lizardtribe_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/shaman = 1,
		/datum/migrant_role/lizardtribe/tribesmen = 5,
	)
	greet_text = "Your tribe ventures near this settlement, driven by the need for sustenance and survival in the harsh lands. Together, you seek resources to ensure your people’s future."

/datum/migrant_wave/lizardtribe_down_two
	name = "Lizard Folk Tribe"
	downgrade_wave = /datum/migrant_wave/lizardtribe_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/shaman = 1,
		/datum/migrant_role/lizardtribe/tribesmen = 3,
	)
	greet_text = "Your tribe ventures near this settlement, driven by the need for sustenance and survival in the harsh lands. Together, you seek resources to ensure your people’s future."

/datum/migrant_wave/lizardtribe_down_three
	name = "Lizard War Tribe"
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/tribesmen = 2,
	)
	greet_text = "You and a single kin venture toward the settlement, desperate for sustenance. Survival depends on your cunning."


//Lizardfolk war band 
/datum/migrant_wave/lizardwartribe
	name = "Lizard War Tribe"
	downgrade_wave = /datum/migrant_wave/lizardwartribe_down_one
	weight = 5 
	roles = list(
		/datum/migrant_role/lizardtribe/chieftess = 1,
		/datum/migrant_role/lizardtribe/shaman = 2,
		/datum/migrant_role/lizardtribe/lizardwarrior = 6,
	)
	greet_text = "There's man flesh near, and you crave it!"

/datum/migrant_wave/lizardwartribe_down_one
	name = "Lizard War Tribe"
	downgrade_wave = /datum/migrant_wave/lizardwartribe_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/chieftess = 1,
		/datum/migrant_role/lizardtribe/shaman = 1,
		/datum/migrant_role/lizardtribe/lizardwarrior = 5,
	)
	greet_text = "There's man flesh near, and you crave it!"

/datum/migrant_wave/lizardwartribe_down_two
	name = "Lizard War Tribe"
	downgrade_wave = /datum/migrant_wave/lizardwartribe_down_three
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/chieftess = 1,
		/datum/migrant_role/lizardtribe/shaman = 1,
		/datum/migrant_role/lizardtribe/lizardwarrior = 3,
	)
	greet_text = "There's man flesh near, and you crave it!"

/datum/migrant_wave/lizardwartribe_down_three
	name = "Lizard War Tribe"
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/lizardtribe/chieftess = 1,
		/datum/migrant_role/lizardtribe/shaman = 1,
		/datum/migrant_role/lizardtribe/lizardwarrior = 1,
	)
	greet_text = "There's man flesh near, and you crave it!"


////STEPPE////

/datum/migrant_wave/gronn
	name = "Gronn Raiding Party"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/gronn
	weight = 5
	downgrade_wave = /datum/migrant_wave/gronn_down_one
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1,
		/datum/migrant_role/gronn/warrior = 2,
		/datum/migrant_role/gronn/tribal = 4,
		/datum/migrant_role/gronn/slave = 2
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, could you hope to survive, and, perhaps, thrive?"

/datum/migrant_wave/gronn_down_one
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/gronn_down_two
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1,
		/datum/migrant_role/gronn/warrior = 1,
		/datum/migrant_role/gronn/tribal = 2,
		/datum/migrant_role/gronn/slave = 1
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, you've lost a handful of men. Things are starting to look sour."

/datum/migrant_wave/gronn_down_two
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/gronn_down_three
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1,
		/datum/migrant_role/gronn/warrior = 1,
		/datum/migrant_role/gronn/tribal = 1,
		/datum/migrant_role/gronn/slave = 1
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, you've lost many. Could you hope to survive?"

/datum/migrant_wave/gronn_down_three
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/gronn_down_four
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1,
		/datum/migrant_role/gronn/warrior = 1,
		/datum/migrant_role/gronn/slave = 1
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, you've lost most of your party. What chance do you have?"

/datum/migrant_wave/gronn_down_four
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/gronn_down_five
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1,
		/datum/migrant_role/gronn/warrior = 1
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, you've lost most of your party. Now, it's just the three of you."

/datum/migrant_wave/gronn_down_five
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/gronn_down_six
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1,
		/datum/migrant_role/gronn/shaman = 1
	)
	greet_text = "You're a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, on this odd isle, you've lost most of your party. Now, it's just the two of you."

/datum/migrant_wave/gronn_down_six
	name = "Gronn Raiding Party"
	shared_wave_type = /datum/migrant_wave/gronn
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/gronn/chieftain = 1
	)
	greet_text = "You were a scouting party sent directly from the steppes of Gronn itself. Without the main support of your warband, all but you have fallen. For what little hope there is, perhaps Graggah himself could guide you."
