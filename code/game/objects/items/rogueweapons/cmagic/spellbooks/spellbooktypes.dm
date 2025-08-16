//Combat Tomes. These are for spells that are weaker than the full spell, but can be used in combat.

// Tier 1 Spellbook
/obj/item/gun/magic/spellbook/tier1
	name = "arcane tome of the initiate"
	desc = "A beginner's tome pulsating with latent arcane energy, awaiting a final shape to channel its magic."
	max_charges = 6 // Balanced for tier 1
	recharge_rate = 4
	minmag = 10
	minfth = 10
	var/list/tier1_design_options = list(
		"Firebolt Tome" = /obj/item/gun/magic/spellbook/firebolt,
		"Frostbite Tome" = /obj/item/gun/magic/spellbook/frostbite,
		"Lightning Tome" = /obj/item/gun/magic/spellbook/lightning,
		"Crystal Needle Tome" = /obj/item/gun/magic/spellbook/crystalpeep
	)

/obj/item/gun/magic/spellbook/tier1/attack_right(mob/user)
	if(!on)
		to_chat(user, span_notice("Open the tome first to shape its magic!"))
		return
	if(!picked)
		var/the_time = world.time
		var/choice = input(user, "Select a spell to bind to this tome.", "Arcane Binding") as null|anything in tier1_design_options
		if(!choice || world.time > (the_time + 30 SECONDS))
			return
		var/new_type = tier1_design_options[choice]
		var/obj/item/gun/magic/spellbook/newbook = new new_type(loc)
		newbook.picked = TRUE
		newbook.base_icon_state = base_icon_state // Preserve the chosen design (e.g., green, yellow)
		newbook.on = TRUE // Keep it open
		newbook.update_icon()
		newbook.update_state()
		to_chat(user, span_notice("The tome hums and transforms into a [newbook.name]!"))
		user.put_in_hands(newbook)
		qdel(src)
	else
		..() // Call parent to handle open/close toggle if already picked

// Tier 2 Spellbook
/obj/item/gun/magic/spellbook/tier2
	name = "arcane tome of the adept"
	desc = "A tome humming with potent arcane energy, ready to be shaped into a more powerful form."
	max_charges = 3
	recharge_rate = 6
	possible_item_intents = list(/datum/intent/shoot/tome/tier2, /datum/intent/arc/tome/tier2, INTENT_GENERIC)
	minmag = 12
	minfth = 12
	var/list/tier2_design_options = list(
		"Divine Flame Tome" = /obj/item/gun/magic/spellbook/dflame,
		"Shock Tome" = /obj/item/gun/magic/spellbook/shock,
		"Ray of Frost Tome" = /obj/item/gun/magic/spellbook/rayoffrost,
		"Crystal Spear Tome" = /obj/item/gun/magic/spellbook/crystalspear
	)

/obj/item/gun/magic/spellbook/tier2/attack_right(mob/user)
	if(!on)
		to_chat(user, span_notice("Open the tome first to shape its magic!"))
		return
	if(!picked)
		var/the_time = world.time
		var/choice = input(user, "Select a spell to bind to this tome.", "Arcane Binding") as null|anything in tier2_design_options
		if(!choice || world.time > (the_time + 30 SECONDS))
			return
		var/new_type = tier2_design_options[choice]
		var/obj/item/gun/magic/spellbook/newbook = new new_type(loc)
		newbook.picked = TRUE
		newbook.base_icon_state = base_icon_state
		newbook.on = TRUE
		newbook.update_icon()
		newbook.update_state()
		to_chat(user, span_notice("The tome hums and transforms into a [newbook.name]!"))
		user.put_in_hands(newbook)
		qdel(src)
	else
		..()

// Tier 3 Spellbook
/obj/item/gun/magic/spellbook/tier3
	name = "arcane tome of the master"
	desc = "A tome crackling with powerful arcane energy, awaiting a master’s touch to define its purpose."
	max_charges = 2
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3, INTENT_GENERIC)
	minmag = 14
	minfth = 14
	var/list/tier3_design_options = list(
		"Fireball Tome" = /obj/item/gun/magic/spellbook/fireball,
		"Thoron Tome" = /obj/item/gun/magic/spellbook/thoron,
		"Frost Tome" = /obj/item/gun/magic/spellbook/freezetome,
		"Frog Prince Tome" = /obj/item/gun/magic/spellbook/frogprince
	)

/obj/item/gun/magic/spellbook/tier3/attack_right(mob/user)
	if(!on)
		to_chat(user, span_notice("Open the tome first to shape its magic!"))
		return
	if(!picked)
		var/the_time = world.time
		var/choice = input(user, "Select a spell to bind to this tome.", "Arcane Binding") as null|anything in tier3_design_options
		if(!choice || world.time > (the_time + 30 SECONDS))
			return
		var/new_type = tier3_design_options[choice]
		var/obj/item/gun/magic/spellbook/newbook = new new_type(loc)
		newbook.picked = TRUE
		newbook.base_icon_state = base_icon_state
		newbook.on = TRUE
		newbook.update_icon()
		newbook.update_state()
		to_chat(user, span_notice("The tome hums and transforms into a [newbook.name]!"))
		user.put_in_hands(newbook)
		qdel(src)
	else
		..()

// Tier 4 Spellbook
/obj/item/gun/magic/spellbook/tier4
	name = "arcane tome of the legendary"
	desc = "A tome radiating overwhelming arcane power, ready to be forged into a legendary artifact of magic."
	max_charges = 1
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3, INTENT_GENERIC)
	minmag = 16
	minfth = 16
	var/list/tier4_design_options = list(
		"Explosive Tome" = /obj/item/gun/magic/spellbook/greaterfireball
	)

/obj/item/gun/magic/spellbook/tier4/attack_right(mob/user)
	if(!on)
		to_chat(user, span_notice("Open the tome first to shape its magic!"))
		return
	if(!picked)
		var/the_time = world.time
		var/choice = input(user, "Select a spell to bind to this tome.", "Arcane Binding") as null|anything in tier4_design_options
		if(!choice || world.time > (the_time + 30 SECONDS))
			return
		var/new_type = tier4_design_options[choice]
		var/obj/item/gun/magic/spellbook/newbook = new new_type(loc)
		newbook.picked = TRUE
		newbook.base_icon_state = base_icon_state
		newbook.on = TRUE
		newbook.update_icon()
		newbook.update_state()
		to_chat(user, span_notice("The tome hums and transforms into a [newbook.name]!"))
		user.put_in_hands(newbook)
		qdel(src)
	else
		..()

//Tier 1
/obj/item/gun/magic/spellbook/firebolt
	name = "firebolt tome"
	desc = "A beginner's tome for casting firebolts."
	ammo_type = /obj/item/ammo_casing/magic/firebolt
	max_charges = 6
	recharge_rate = 4
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 10

/obj/item/gun/magic/spellbook/frostbite
	name = "frostbite tome"
	desc = "a catalyse for a spellcasters first, and one of the most fundamental, spells."
	ammo_type = /obj/item/ammo_casing/magic/frostbite
	max_charges = 3
	recharge_rate = 3
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 11

/obj/item/gun/magic/spellbook/lightning
	name = "lightning tome"
	desc = "a catalyse for a spellcasters first, and one of the most fundamental, spells."
	ammo_type = /obj/item/ammo_casing/magic/electrode
	max_charges = 8
	recharge_rate = 6
	damtype = BURN
	can_parry = FALSE
	force = 10
	minfth = 11

/obj/item/gun/magic/spellbook/crystalpeep
	name = "crystal Needle tome"
	desc = "a step up from the fundamentals, this tome is for the more talented and learned. The formation of a crystal shard."
	ammo_type = /obj/item/ammo_casing/magic/crystalpeep
	max_charges = 3
	recharge_rate = 5
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 12
	minfth = 11

//Tier 2
/obj/item/gun/magic/spellbook/dflame
	name = "divine flame tome"
	desc = "a flame mage's first true tome."
	ammo_type = /obj/item/ammo_casing/magic/dflame
	max_charges = 3
	recharge_rate = 6
	possible_item_intents = list(/datum/intent/shoot/tome/tier2, /datum/intent/arc/tome/tier2,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 12

/datum/intent/shoot/tome/tier2
	chargetime = 2.0
	chargedrain = 3.0
	charging_slowdown = 3.0
	no_early_release = TRUE

/datum/intent/arc/tome/tier2
	chargetime = 2.0
	chargedrain = 3.0
	charging_slowdown = 3.0
	no_early_release = TRUE

/obj/item/gun/magic/spellbook/shock
	name = "shock tome"
	desc = " A tome that accumulates salt if left out too long."
	ammo_type = /obj/item/ammo_casing/magic/electrode
	max_charges = 1
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier2, /datum/intent/arc/tome/tier2,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minfth = 13

/obj/item/gun/magic/spellbook/rayoffrost
	name = "Tome of Ray of Frost"
	desc = "A chill tome."
	ammo_type = /obj/item/ammo_casing/magic/rayoffrost
	max_charges = 3
	recharge_rate = 6
	possible_item_intents = list(/datum/intent/shoot/tome/tier2, /datum/intent/arc/tome/tier2,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 13

/obj/item/gun/magic/spellbook/crystalspear
	name = "crystal tome"
	desc = "A beautiful tome."
	ammo_type = /obj/item/ammo_casing/magic/crystalspear
	max_charges = 3
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier2, /datum/intent/arc/tome/tier2,INTENT_GENERIC)
	damtype = BRUTE
	can_parry = FALSE
	force = 12
	minmag = 13
	minfth = 13

/datum/intent/shoot/tome/tier3
	chargetime = 2.0
	chargedrain = 3.0
	charging_slowdown = 3.0
	no_early_release = TRUE

/datum/intent/arc/tome/tier3
	chargetime = 5.0
	chargedrain = 4.0
	charging_slowdown = 3.0
	no_early_release = TRUE

//Tier 3
/obj/item/gun/magic/spellbook/fireball
	name = "Fireball tome"
	desc = " A tome, hot to the touch, not for the novice, or the foolish."
	ammo_type = /obj/item/ammo_casing/magic/fireball
	max_charges = 1
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 14

/obj/item/gun/magic/spellbook/thoron
	name = "Thoron tome"
	desc = " A tome, hot to the touch, not for the novice, or the foolish."
	ammo_type = /obj/item/ammo_casing/magic/thoron
	max_charges = 2
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minfth = 14

/obj/item/gun/magic/spellbook/freezetome
	name = "frost tome"
	desc = " A cold tome."
	ammo_type = /obj/item/ammo_casing/magic/freeze
	max_charges = 2
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 14

/*
/obj/item/gun/magic/spellbook/crystalsword
	name = "Shining sword"
	desc = "A beautiful blue sword that glows in the night."
	ammo_type = /obj/item/ammo_casing/magic/crystalpeep
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/shoot/tome)
	associated_skill = /datum/skill/combat/swords
	attack_verb = list("slashed", "cut", "skewered")
	icon_state = "spellblade"
	item_state = "spellblade"
	max_charges = 5
	recharge_rate = 5
	randomspread = 0
	bigboy = 1
	spread = 0
	damtype = BRUTE
	can_parry = TRUE
	force = 25 // Retain high force for melee
	force_on = 25 // Ensure consistency when open
	minmag = 11 //for now, just to test
//more to come after tests
*/
// Frog Prince
/obj/item/gun/magic/spellbook/frogprince
	name = "Frog Prince tome"
	desc = "A whimsical tome decorated with lily pads and golden crowns. Contains ancient transformation magic."
	max_charges = 3
	recharge_rate = 15
	damtype = STAMINA
	can_parry = FALSE
	force = 8
	minmag = 12
	ammo_type = /obj/item/ammo_casing/magic/frogprince

//Tier 4
/obj/item/gun/magic/spellbook/greaterfireball
	name = "explosive tome"
	desc = " A tome, hot to the touch, not for the novice, or the foolish."
	ammo_type = /obj/item/ammo_casing/magic/greaterfireball
	max_charges = 1
	recharge_rate = 10
	possible_item_intents = list(/datum/intent/shoot/tome/tier3, /datum/intent/arc/tome/tier3,INTENT_GENERIC)
	damtype = BURN
	can_parry = FALSE
	force = 10
	minmag = 16



//Learning Spellbooks
//greater fireball tome
/obj/item/book/granter/spellbook/fireball_greater
	name = "tome of greater fireball"
	desc = "A radiant tome pulsating with fiery arcane energy, its pages inscribed with complex runes that whisper of cataclysmic destruction."
	bookquality = 6 // Comparable to master tier for balance
	sellprice = 300 // High value due to powerful spell

/obj/item/book/granter/spellbook/fireball_greater/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	user.mind?.has_studied = TRUE
	var/qualityoflearn = (gamer.STAMAG * 2 + (user.mind?.get_skill_level(/datum/skill/misc/reading) * 10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane) * 5))
	if(gamer.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the arcyne..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystalline dust scattered upon my tome resonate with the arcyne..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		qualityoflearn *= 0.5
		qualityoflearn = min(qualityoflearn, 15)
	if(born_of_rock)
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	
	// Check if the user has arcane affinity to learn the spell
	if(isarcyne(user))
		var/learn_spell_type = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
		var/spell_known = FALSE
		for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
			if(knownspell.type == learn_spell_type)
				spell_known = TRUE
				break
		if(!spell_known)
			// Calculate spell point cost (base 10, reduced by qualityoflearn)
			var/base_cost = 10 // From learnspell code
			var/cost_reduction = round(qualityoflearn / 100) // Scales with qualityoflearn (e.g., 100 = 1 point reduction)
			var/final_cost = max(1, base_cost - cost_reduction) // Ensure at least 1 point cost
			if(user.mind.spell_points - user.mind.used_spell_points >= final_cost)
				user.mind.used_spell_points += final_cost
				user.mind.AddSpell(new learn_spell_type)
				user.visible_message(span_warning("[user] is engulfed in a blaze of arcyne fire! The tome's secrets unlock the art of greater fireballs!"), \
					span_notice("Noc's fiery wisdom surges through me. The tome has taught me the art of weaving greater fireballs!"))
				user.log_message("learned the spell [learn_spell_type] from a greater fireball tome for [final_cost] spell points", LOG_ATTACK, color="orange")
				onlearned(user)
				if(prob(55))
					to_chat(user, span_notice("The tome's fiery runes have scorched my mind. I must rest before delving into its mysteries again..."))
					user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
				to_chat(user, span_small("The tome's embers linger in my thoughts, their meaning eluding me until I rest..."))
				return
			else
				to_chat(user, span_warning("I lack the arcane experience to weave this spell! [final_cost] spell points required."))
				return
	
	// Default behavior if spell is already known or no arcane affinity
	user.visible_message(span_warning("[user] is filled with arcyne energy! You witness [user.p_their()] body convulse and spark brightly."), \
		span_notice("Noc blesses me with minor insights, but the tome's true power eludes me."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = round(bookquality * qualityoflearn * 0.5) // Reduced points for fallback
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("studied a greater fireball tome and gained [spellpoints] spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded arcyne mysteries, my notes have gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))


//meteor storm
/obj/item/book/granter/spellbook/meteor_storm
	name = "tome of meteor storm"
	desc = "A foreboding tome crackling with cosmic energy, its pages etched with runes that hum with the promise of celestial devastation."
	bookquality = 8 // Expert-tier, slightly above master for balance
	sellprice = 350 // High value due to powerful spell

/obj/item/book/granter/spellbook/meteor_storm/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	user.mind?.has_studied = TRUE
	var/qualityoflearn = (gamer.STAMAG * 2 + (user.mind?.get_skill_level(/datum/skill/misc/reading) * 10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane) * 5))
	if(gamer.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the arcyne..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystalline dust scattered upon my tome resonate with the arcyne..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		qualityoflearn *= 0.5
		qualityoflearn = min(qualityoflearn, 15)
	if(born_of_rock)
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	
	// Check if the user has arcane affinity to learn the spell
	if(isarcyne(user))
		var/learn_spell_type = /obj/effect/proc_holder/spell/invoked/meteor_storm
		var/spell_known = FALSE
		for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
			if(knownspell.type == learn_spell_type)
				spell_known = TRUE
				break
		if(!spell_known)
			// Calculate spell point cost (base 12, reduced by qualityoflearn)
			var/base_cost = 12 // From your specification
			var/cost_reduction = round(qualityoflearn / 100) // Scales with qualityoflearn (e.g., 100 = 1 point reduction)
			var/final_cost = max(1, base_cost - cost_reduction) // Ensure at least 1 point cost
			if(user.mind.spell_points - user.mind.used_spell_points >= final_cost)
				user.mind.used_spell_points += final_cost
				user.mind.AddSpell(new learn_spell_type)
				user.visible_message(span_warning("[user] is surrounded by a tempest of arcyne meteors! The tome's secrets unlock the art of meteor storms!"), \
					span_notice("Noc's cosmic wrath surges through me. The tome has taught me the art of weaving meteor storms!"))
				user.log_message("learned the spell [learn_spell_type] from a meteor storm tome for [final_cost] spell points", LOG_ATTACK, color="orange")
				onlearned(user)
				if(prob(55))
					to_chat(user, span_notice("The tome's celestial runes have overwhelmed my mind. I must rest before delving into its mysteries again..."))
					user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
				to_chat(user, span_small("The tome's starry glyphs linger in my thoughts, their meaning eluding me until I rest..."))
				return
			else
				to_chat(user, span_warning("I lack the arcane experience to weave this spell! [final_cost] spell points required."))
				return
	
	// Default behavior if spell is already known or no arcane affinity
	user.visible_message(span_warning("[user] is filled with arcyne energy! You witness [user.p_their()] body convulse and spark brightly."), \
		span_notice("Noc blesses me with minor insights, but the tome's true power eludes me."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = round(bookquality * qualityoflearn * 0.5) // Reduced points for fallback
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("studied a meteor storm tome and gained [spellpoints] spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded arcyne mysteries, my notes have gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))

//find familiar tome
/obj/item/book/granter/spellbook/findfamiliar
	name = "tome of familiar summoning"
	desc = "A mystical tome shimmering with ethereal light, its pages adorned with sigils that call to otherworldly companions."
	bookquality = 3 // Apprentice-tier for balance
	sellprice = 100 // Moderate value for an apprentice-level spell

/obj/item/book/granter/spellbook/findfamiliar/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	user.mind?.has_studied = TRUE
	var/qualityoflearn = (gamer.STAMAG * 2 + (user.mind?.get_skill_level(/datum/skill/misc/reading) * 10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane) * 5))
	if(gamer.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the arcyne..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystalline dust scattered upon my tome resonate with the arcyne..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		qualityoflearn *= 0.5
		qualityoflearn = min(qualityoflearn, 15)
	if(born_of_rock)
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	
	// Check if the user has arcane affinity to learn the spell
	if(isarcyne(user))
		var/learn_spell_type = /obj/effect/proc_holder/spell/invoked/findfamiliar
		var/spell_known = FALSE
		for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
			if(knownspell.type == learn_spell_type)
				spell_known = TRUE
				break
		if(!spell_known)
			// Calculate spell point cost (base 1, reduced by qualityoflearn)
			var/base_cost = 1 // From your specification
			var/cost_reduction = round(qualityoflearn / 100) // Scales with qualityoflearn (e.g., 100 = 1 point reduction)
			var/final_cost = max(1, base_cost - cost_reduction) // Ensure at least 1 point cost
			if(user.mind.spell_points - user.mind.used_spell_points >= final_cost)
				user.mind.used_spell_points += final_cost
				user.mind.AddSpell(new learn_spell_type)
				user.visible_message(span_warning("[user] is enveloped in a shimmer of arcyne light! The tome's secrets unlock the art of summoning familiars!"), \
					span_notice("Noc's ethereal guidance flows through me. The tome has taught me the art of summoning familiars!"))
				user.log_message("learned the spell [learn_spell_type] from a familiar summoning tome for [final_cost] spell points", LOG_ATTACK, color="orange")
				onlearned(user)
				if(prob(55))
					to_chat(user, span_notice("The tome's ethereal sigils have clouded my mind. I must rest before delving into its mysteries again..."))
					user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
				to_chat(user, span_small("The tome's ghostly symbols linger in my thoughts, their meaning eluding me until I rest..."))
				return
			else
				to_chat(user, span_warning("I lack the arcane experience to weave this spell! [final_cost] spell points required."))
				return
	
	// Default behavior if spell is already known or no arcane affinity
	user.visible_message(span_warning("[user] is filled with arcyne energy! You witness [user.p_their()] body convulse and spark brightly."), \
		span_notice("Noc blesses me with minor insights, but the tome's true power eludes me."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = round(bookquality * qualityoflearn * 0.5) // Reduced points for fallback
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("studied a familiar summoning tome and gained [spellpoints] spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded arcyne mysteries, my notes have gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))


/obj/item/book/granter/spellbook/mageblindness
	name = "tome of arcane blinding"
	desc = "A shimmering tome radiating with blinding light, its pages inscribed with sigils that dazzle the senses."
	bookquality = 3 // Apprentice-tier for balance
	sellprice = 80 // Moderate value for a low-cost spell

/obj/item/book/granter/spellbook/mageblindness/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	user.mind?.has_studied = TRUE
	var/qualityoflearn = (gamer.STAMAG * 2 + (user.mind?.get_skill_level(/datum/skill/misc/reading) * 10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane) * 5))
	if(gamer.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the arcyne..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystalline dust scattered upon my tome resonate with the arcyne..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		qualityoflearn *= 0.5
		qualityoflearn = min(qualityoflearn, 15)
	if(born_of_rock)
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	
	// Check if the user has arcane affinity to learn the spell
	if(isarcyne(user))
		var/learn_spell_type = /obj/effect/proc_holder/spell/invoked/mageblindness
		var/spell_known = FALSE
		for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
			if(knownspell.type == learn_spell_type)
				spell_known = TRUE
				break
		if(!spell_known)
			// Calculate spell point cost (base 2, reduced by qualityoflearn)
			var/base_cost = 2 // From your specification
			var/cost_reduction = round(qualityoflearn / 100) // Scales with qualityoflearn (e.g., 100 = 1 point reduction)
			var/final_cost = max(1, base_cost - cost_reduction) // Ensure at least 1 point cost
			if(user.mind.spell_points - user.mind.used_spell_points >= final_cost)
				user.mind.used_spell_points += final_cost
				user.mind.AddSpell(new learn_spell_type)
				user.visible_message(span_warning("[user] is enveloped in a blinding flash of arcyne light! The tome's secrets unlock the art of arcane blinding!"), \
					span_notice("Noc's radiant guidance flows through me. The tome has taught me the art of arcane blinding!"))
				user.log_message("learned the spell [learn_spell_type] from an arcane blinding tome for [final_cost] spell points", LOG_ATTACK, color="orange")
				onlearned(user)
				if(prob(55))
					to_chat(user, span_notice("The tome's dazzling sigils have clouded my vision. I must rest before delving into its mysteries again..."))
					user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
				to_chat(user, span_small("The tome's radiant symbols linger in my thoughts, their meaning eluding me until I rest..."))
				return
			else
				to_chat(user, span_warning("I lack the arcane experience to weave this spell! [final_cost] spell points required."))
				return
	
	// Default behavior if spell is already known or no arcane affinity
	user.visible_message(span_warning("[user] is filled with arcyne energy! You witness [user.p_their()] body convulse and spark brightly."), \
		span_notice("Noc blesses me with minor insights, but the tome's true power eludes me."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = round(bookquality * qualityoflearn * 0.5) // Reduced points for fallback
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("studied an arcane blinding tome and gained [spellpoints] spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded arcyne mysteries, my notes have gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))

/obj/item/book/granter/spellbook/mageinvisibility
	name = "tome of arcane veil"
	desc = "A shadowy tome cloaked in faint, elusive light, its pages scribed with runes that shimmer and fade from view."
	bookquality = 3 // Apprentice-tier for balance
	sellprice = 80 // Moderate value for a low-cost spell

/obj/item/book/granter/spellbook/mageinvisibility/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	user.mind?.has_studied = TRUE
	var/qualityoflearn = (gamer.STAMAG * 2 + (user.mind?.get_skill_level(/datum/skill/misc/reading) * 10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane) * 5))
	if(gamer.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the arcyne..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystalline dust scattered upon my tome resonate with the arcyne..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		qualityoflearn *= 0.5
		qualityoflearn = min(qualityoflearn, 15)
	if(born_of_rock)
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	
	// Check if the user has arcane affinity to learn the spell
	if(isarcyne(user))
		var/learn_spell_type = /obj/effect/proc_holder/spell/invoked/mageinvisibility
		var/spell_known = FALSE
		for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
			if(knownspell.type == learn_spell_type)
				spell_known = TRUE
				break
		if(!spell_known)
			// Calculate spell point cost (base 2, reduced by qualityoflearn)
			var/base_cost = 2 // From your specification
			var/cost_reduction = round(qualityoflearn / 100) // Scales with qualityoflearn (e.g., 100 = 1 point reduction)
			var/final_cost = max(1, base_cost - cost_reduction) // Ensure at least 1 point cost
			if(user.mind.spell_points - user.mind.used_spell_points >= final_cost)
				user.mind.used_spell_points += final_cost
				user.mind.AddSpell(new learn_spell_type)
				user.visible_message(span_warning("[user] fades into a shimmer of arcyne shadows! The tome's secrets unlock the art of arcane veiling!"), \
					span_notice("Noc's elusive guidance flows through me. The tome has taught me the art of arcane veiling!"))
				user.log_message("learned the spell [learn_spell_type] from an arcane veil tome for [final_cost] spell points", LOG_ATTACK, color="orange")
				onlearned(user)
				if(prob(55))
					to_chat(user, span_notice("The tome's elusive runes have clouded my mind. I must rest before delving into its mysteries again..."))
					user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
				to_chat(user, span_small("The tome's shadowy symbols linger in my thoughts, their meaning eluding me until I rest..."))
				return
			else
				to_chat(user, span_warning("I lack the arcane experience to weave this spell! [final_cost] spell points required."))
				return
	
	// Default behavior if spell is already known or no arcane affinity
	user.visible_message(span_warning("[user] is filled with arcyne energy! You witness [user.p_their()] body convulse and spark brightly."), \
		span_notice("Noc blesses me with minor insights, but the tome's true power eludes me."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = round(bookquality * qualityoflearn * 0.5) // Reduced points for fallback
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("studied an arcane veil tome and gained [spellpoints] spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded arcyne mysteries, my notes have gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, gamer.STAMAG * 10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))
