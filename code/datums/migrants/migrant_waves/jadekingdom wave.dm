/datum/migrant_wave/jadekingdom
	name = "The Court of jadekingdom"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/jadekingdom
	weight = 50
	downgrade_wave = /datum/migrant_wave/jadekingdom_down_one
	roles = list(
		/datum/migrant_role/jadekingdom/emperor = 1,
		/datum/migrant_role/jadekingdom/empress = 1,
		/datum/migrant_role/jadekingdom/shogun = 1,
		/datum/migrant_role/jadekingdom/hatamoto = 1,
		/datum/migrant_role/jadekingdom/onmyoji = 1,
		/datum/migrant_role/jadekingdom/guji = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of jadekingdom. Stay close and watch out for each other, for all of your sakes!"

/datum/migrant_wave/jadekingdom_down_one
	name = "The Court of jadekingdom"
	shared_wave_type = /datum/migrant_wave/jadekingdom
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/jadekingdom_down_two
	roles = list(
		/datum/migrant_role/jadekingdom/emperor = 1,
		/datum/migrant_role/jadekingdom/shogun = 1,
		/datum/migrant_role/jadekingdom/hatamoto = 1,
		/datum/migrant_role/jadekingdom/onmyoji = 1,
		/datum/migrant_role/jadekingdom/guji = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of jadekingdom. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/jadekingdom_down_two
	name = "The Court of jadekingdom"
	shared_wave_type = /datum/migrant_wave/jadekingdom
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/jadekingdom_down_three
	roles = list(
		/datum/migrant_role/jadekingdom/emperor = 1,
		/datum/migrant_role/jadekingdom/shogun = 1,
		/datum/migrant_role/jadekingdom/hatamoto = 1,
		/datum/migrant_role/jadekingdom/guji = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of jadekingdom. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."


/datum/migrant_wave/jadekingdom_down_three
	name = "The Court of jadekingdom"
	shared_wave_type = /datum/migrant_wave/jadekingdom
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/jadekingdom/emperor = 1,
		/datum/migrant_role/jadekingdom/hatamoto = 1,
		/datum/migrant_role/jadekingdom/shogun = 1,
		/datum/migrant_role/jadekingdom/guji = 1
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of jadekingdom. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."
