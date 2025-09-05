/datum/status_effect/buff
	status_type = STATUS_EFFECT_REFRESH


/datum/status_effect/buff/drunk
	id = "drunk"
	alert_type = /atom/movable/screen/alert/status_effect/buff/drunk
	effectedstats = list("mageability" = -2, "endurance" = 1)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/buff/drunk
	name = "Drunk"
	desc = ""
	icon_state = "drunk"

/datum/status_effect/buff/drunk/on_apply()
	. = ..()
	if(HAS_TRAIT(owner, TRAIT_DRUNK_HEALING))
		owner.reagents.add_reagent(/datum/reagent/medicine/healthpot,6)//a sip of weak red every 30 seconds whilst drunk
		addtimer(CALLBACK(src, PROC_REF(top_up_healing)), 30 SECONDS)

/datum/status_effect/buff/drunk/proc/top_up_healing()//this is hacky as fuck but it doesn't throw up runtimes and just werks so
	if(!QDELETED(src) && owner && HAS_TRAIT(owner, TRAIT_DRUNK_HEALING))
		owner.reagents.add_reagent(/datum/reagent/medicine/healthpot,6)
		addtimer(CALLBACK(src, PROC_REF(top_up_healing)), 30 SECONDS)

/datum/status_effect/buff/foodbuff
	id = "foodbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/foodbuff
	effectedstats = list("constitution" = 1,"endurance" = 1)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/buff/foodbuff
	name = "Great Meal"
	desc = ""
	icon_state = "foodbuff"

/datum/status_effect/buff/packtactics
	id = "packtacktics"
	alert_type = /atom/movable/screen/alert/status_effect/buff/packtactics
	effectedstats = list("fortune" = 1, "strength" = 1)
	duration = 5 MINUTES 

/atom/movable/screen/alert/status_effect/buff/packtactics
	name = "Pack Tactics"
	desc = "I just saw my kin, and know I am not alone."
	icon_state = "buff"

/datum/status_effect/buff/burstofspeed
	id = "burstofspeed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/burstofspeed
	duration = 0.5 SECONDS
	var/speed_modifier_id

/datum/status_effect/buff/burstofspeed/on_apply()
	. = ..()
	speed_modifier_id = "burstofspeed"
	owner.add_movespeed_modifier(speed_modifier_id, TRUE, 100, override = TRUE, multiplicative_slowdown = -1)

/datum/status_effect/buff/burstofspeed/on_remove()
	owner.remove_movespeed_modifier(speed_modifier_id)
	return ..()	

/atom/movable/screen/alert/status_effect/buff/burstofspeed
	name = "Burst of speed"
	desc = "I am the fastest!"
	icon_state = "buff"

/datum/status_effect/buff/godspeak
	id = "godspeak"
	alert_type = /atom/movable/screen/alert/status_effect/buff/godspeak
	effectedstats = list("strength" = 1)
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/buff/godspeak
	name = "Godspeak"
	desc = "I feel closer to divinity."
	icon_state = "buff"

/datum/status_effect/buff/mothfire
	id = "mothfire"
	alert_type = /atom/movable/screen/alert/status_effect/buff/mothfire
	effectedstats = list("endurance" = 1, "faith" = 1)
	duration = 15 MINUTES //short enough to encourage moths looking at fires here and there, long enough to be usable

/atom/movable/screen/alert/status_effect/buff/mothfire
	name = "Fire-trance"
	desc = "How the flames dance... "
	icon_state = "buff"

/datum/status_effect/buff/druqks
	id = "druqks"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("mageability" = 5,"speed" = 3,"fortune" = -5)
	duration = 10 SECONDS

/datum/status_effect/buff/druqks/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

/datum/status_effect/buff/druqks/on_remove()
	owner.remove_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

	. = ..()

/atom/movable/screen/alert/status_effect/buff/druqks
	name = "High"
	desc = ""
	icon_state = "acid"

/datum/status_effect/buff/ozium
	id = "ozium"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = -5, "skill" = 2)
	duration = 30 SECONDS

/datum/status_effect/buff/ozium/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/ozium)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/ozium/on_remove()
	owner.remove_stress(/datum/stressevent/ozium)
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	. = ..()

/datum/status_effect/buff/moondust
	id = "moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 4, "endurance" = 4, "skill" = -3)
	duration = 30 SECONDS

/datum/status_effect/buff/moondust/nextmove_modifier()
	return 0.5

/datum/status_effect/buff/moondust/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/moondust)

/datum/status_effect/buff/moondust/on_remove()
	. = ..()
	owner.apply_status_effect(/datum/status_effect/debuff/moondust_crash)


/datum/status_effect/buff/moondust_purest
	id = "purest moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 5, "endurance" = 5, "skill" = -2)
	duration = 40 SECONDS

/datum/status_effect/buff/moondust_purest/nextmove_modifier()
	return 0.5

/datum/status_effect/buff/moondust_purest/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/moondust_purest)

/datum/status_effect/buff/moondust_purest/on_remove()
	. = ..()
	owner.apply_status_effect(/datum/status_effect/debuff/moondust_crash)

/datum/status_effect/buff/weed
	id = "weed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/weed
	effectedstats = list("mageability" = 2,"speed" = -2,"fortune" = 2)
	duration = 10 SECONDS

/datum/status_effect/buff/weed/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/weed)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

/datum/status_effect/buff/weed/on_remove()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

	. = ..()

/atom/movable/screen/alert/status_effect/buff/weed
	name = "Dazed"
	desc = ""
	icon_state = "weed"

/atom/movable/screen/alert/status_effect/buff/featherfall
	name = "Featherfall"
	desc = "I am somewhat protected against falling from heights."
	icon_state = "buff"

/datum/status_effect/buff/featherfall
	id = "featherfall"
	alert_type = /atom/movable/screen/alert/status_effect/buff/featherfall
	duration = 1 MINUTES

/datum/status_effect/buff/featherfall/on_apply()
	. = ..()
	to_chat(owner, span_warning("I feel lighter."))
	ADD_TRAIT(owner, TRAIT_NOFALLDAMAGE1, MAGIC_TRAIT)

/datum/status_effect/buff/featherfall/on_remove()
	. = ..()
	to_chat(owner, span_warning("The feeling of lightness fades."))
	REMOVE_TRAIT(owner, TRAIT_NOFALLDAMAGE1, MAGIC_TRAIT)

/atom/movable/screen/alert/status_effect/buff/darkvision
	name = "Darkvision"
	desc = "I can see in the dark somewhat."
	icon_state = "buff"

/datum/status_effect/buff/darkvision
	id = "darkvision"
	alert_type = /atom/movable/screen/alert/status_effect/buff/darkvision
	duration = 10 MINUTES

/datum/status_effect/buff/darkvision/on_apply()
	. = ..()
	to_chat(owner, span_warning("The darkness fades somewhat."))
	ADD_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)

/datum/status_effect/buff/darkvision/on_remove()
	. = ..()
	to_chat(owner, span_warning("The darkness returns to normal."))
	REMOVE_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)

/atom/movable/screen/alert/status_effect/buff/haste
	name = "Haste"
	desc = "I am magically hastened."
	icon_state = "buff"

/datum/status_effect/buff/haste
	id = "haste"
	alert_type = /atom/movable/screen/alert/status_effect/buff/haste
	effectedstats = list("speed" = 3)
	duration = 1.5 MINUTES

/atom/movable/screen/alert/status_effect/buff/enlarge
	name = "Enlarged"
	desc = "I am magically enlarged."
	icon_state = "buff"

/datum/status_effect/buff/enlarge
	id = "enlarge"
	alert_type = /atom/movable/screen/alert/status_effect/buff/enlarge
	effectedstats = list("strength" = 2,"constitution" = 2, "speed" = -2)
	duration = 1.5 MINUTES

/datum/status_effect/buff/enlarge/on_apply()
	. = ..()
	if(!(isseelie(owner)))
		to_chat(owner, span_warning("I feel myself growing leaps and bounds!"))
		ADD_TRAIT(owner, TRAIT_BIGGUY, MAGIC_TRAIT)
		owner.transform = owner.transform.Scale(1.25, 1.25)
		owner.transform = owner.transform.Translate(0, (0.25 * 16))
		owner.mob_size += 1
		owner.update_transform()
	else
		to_chat(owner, span_warning("I can feel arcyne magick supplement my tiny frame!"))




/datum/status_effect/buff/enlarge/on_remove()
	. = ..()   
	if(!(isseelie(owner)))
		to_chat(owner, span_warning("I feel myself shrinking again.."))
		REMOVE_TRAIT(owner, TRAIT_BIGGUY, MAGIC_TRAIT) 
		owner.transform = owner.transform.Translate(0, -(0.25 * 16))
		owner.transform = owner.transform.Scale(1/1.25, 1/1.25)
		owner.mob_size -= 1  
		owner.update_transform()
	else
		to_chat(owner, span_warning("I can feel the strengthening magicks fade from my small body.."))

/datum/status_effect/buff/seelie_drugs
	id = "seelie drugs"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("mageability" = 2, "endurance" = 4, "speed" = -3)
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/buff/seelie_drugs
	name = "High"
	desc = ""
	icon_state = "acid"

/datum/status_effect/buff/seelie_drugs/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

/datum/status_effect/buff/seelie_drugs/on_remove()
	owner.remove_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
	. = ..()

/datum/status_effect/buff/seelie/happy
	id = "Seelie Blessing"
	alert_type = /atom/movable/screen/alert/status_effect/buff/seelie/happy
	effectedstats = list("fortune" = 2)
	duration = 60 SECONDS

/atom/movable/screen/alert/status_effect/buff/seelie/happy
	name = "Seelie Blessing"
	desc = "A nearby Seelie has brought me fortune."
	icon_state = "stressg"

/datum/status_effect/buff/cured_moondust
	id = "Cured Moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 2, "endurance" = 2, "fortune" = 2)
	duration = 40 SECONDS

/datum/status_effect/buff/cured_moondust/nextmove_modifier()
	return 0.5

/datum/status_effect/buff/cured_moondust/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/vvizard_lean)

/datum/status_effect/buff/cured_moondust/on_remove()
	. = ..()
	owner.apply_status_effect(/datum/status_effect/debuff/moondust_crash)

/datum/status_effect/buff/gazeuponme
	id = "gazeuponme"
	alert_type = /atom/movable/screen/alert/status_effect/buff/gazeuponme
	effectedstats = list("endurance" = 1, "faith" = 1)
	duration = 999 MINUTES

/atom/movable/screen/alert/status_effect/buff/gazeuponme
	name = "Excommunicated heretic"
	desc = "My PATRON is proud of ME!"
	icon_state = "buff"

/datum/status_effect/buff/magicknowledge
	id = "arcane attunement"
	alert_type = /atom/movable/screen/alert/status_effect/buff/knowledge
	effectedstats = list("mageability" = 2)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/buff/knowledge
	name = "runic cunning"
	desc = "I am magically astute."
	icon_state = "buff"

/datum/status_effect/buff/magicstrength
	id = "strength"
	alert_type = /atom/movable/screen/alert/status_effect/buff/strength
	effectedstats = list("strength" = 3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/strength
	name = "arcane reinforced strength"
	desc = "I am magically strengthened."
	icon_state = "buff"

/datum/status_effect/buff/magicstrength/lesser
	id = "lesser strength"
	alert_type = /atom/movable/screen/alert/status_effect/buff/strength/lesser
	effectedstats = list("strength" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/strength/lesser
	name = "lesser arcane strength"
	desc = "I am magically strengthened."
	icon_state = "buff"


/datum/status_effect/buff/magicspeed
	id = "speed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/speed
	effectedstats = list("speed" = 3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/speed
	name = "arcane swiftness"
	desc = "I am magically swift."
	icon_state = "buff"

/datum/status_effect/buff/magicspeed/lesser
	id = "lesser speed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/speed/lesser
	effectedstats = list("speed" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/speed/lesser
	name = "arcane swiftness"
	desc = "I am magically swift."
	icon_state = "buff"

/datum/status_effect/buff/magicendurance
	id = "endurance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/endurance
	effectedstats = list("endurance" = 3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/endurance
	name = "arcane endurance"
	desc = "I am magically resilient."
	icon_state = "buff"

/datum/status_effect/buff/magicendurance/lesser
	id = "lesser endurance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/endurance/lesser
	effectedstats = list("endurance" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/endurance/lesser
	name = "lesser arcane endurance"
	desc = "I am magically resilient."
	icon_state = "buff"


/datum/status_effect/buff/magicconstitution
	id = "constitution"
	alert_type = /atom/movable/screen/alert/status_effect/buff/constitution
	effectedstats = list("constitution" = 3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/constitution
	name = "arcane constitution"
	desc = "I feel reinforced by magick."
	icon_state = "buff"

/datum/status_effect/buff/magicconstitution/lesser
	id = "lesser constitution"
	alert_type = /atom/movable/screen/alert/status_effect/buff/constitution/lesser
	effectedstats = list("constitution" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/constitution/lesser
	name = "lesser arcane constitution"
	desc = "I feel reinforced by magick."
	icon_state = "buff"

/datum/status_effect/buff/magicperception
	id = "perception"
	alert_type = /atom/movable/screen/alert/status_effect/buff/perception
	effectedstats = list("skill" = 3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/perception
	name = "arcane perception"
	desc = "I can see everything."
	icon_state = "buff"

/datum/status_effect/buff/magicperception/lesser
	id = "lesser perception"
	alert_type = /atom/movable/screen/alert/status_effect/buff/perception/lesser
	effectedstats = list("skill" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/perception/lesser
	name = "lesser arcane perception"
	desc = "I can see somethings."
	icon_state = "buff"

/datum/status_effect/buff/nocblessing
	id = "nocblessing"
	alert_type = /atom/movable/screen/alert/status_effect/buff/nocblessing
	effectedstats = list("mageability" = 1)
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/buff/nocblessing
	name = "Noc's blessing"
	desc = "Gazing Noc helps me think."
	icon_state = "buff"

/datum/status_effect/buff/fentanyl
	id = "dream fold"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("endurance" = 4, "speed" = -1, "strength" = -2)
	duration = 5 MINUTES

/datum/status_effect/buff/fentanyl/nextmove_modifier()
	return 1.25

/datum/status_effect/buff/fentanyl/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/ozium)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/fentanyl/on_remove()
	owner.remove_stress(/datum/stressevent/ozium)
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	. = ..()
