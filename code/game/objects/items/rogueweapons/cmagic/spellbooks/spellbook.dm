/obj/item/gun/magic/spellbook
	name = "spellbook of nothing"
	desc = "A beginner's spellbook, closed and unassuming."
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "basic_book_1"
	possible_item_intents = list(/datum/intent/shoot/tome, INTENT_GENERIC)
	desc = "baby's first spell."
	ammo_type = /obj/item/ammo_casing/magic
	recharge_rate = 4
	randomspread = 0
	spread = 0
	damtype = BURN
	can_parry = FALSE
	force = 2
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL // Book-like when closed
	slot_flags = ITEM_SLOT_HIP
	can_charge = TRUE
	max_charges = 100
	attack_verb = list("bashed", "whacked", "educated")
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	pickup_sound = 'sound/blank.ogg'
	hitsound = 'sound/blank.ogg'
	associated_skill = /datum/skill/magic/arcane
	// State-specific variables
	var/on = FALSE // Closed by default
	var/on_icon_state = "basic_book_1"
	var/off_icon_state = "basic_book_0"
	var/force_on = 5 // Slightly higher force when open
	var/throw_speed_on = 1 // Book-like throw speed when closed
	var/throw_speed_off = 1
	var/throw_range_on = 5 // Book-like throw range when closed
	var/throw_range_off = 5
	var/w_class_on = WEIGHT_CLASS_BULKY // Larger when open
	var/brightness_on = 5 // Light when open
	var/on_sound = 'sound/items/book_open.ogg'
	var/off_sound = 'sound/items/book_close.ogg'




/obj/item/gun/magic/spellbook/Initialize()
	. = ..()
	update_state() // Ensure initial state is set correctly

/obj/item/gun/magic/spellbook/update_icon()
	if(on)
		icon_state = on_icon_state
		item_state = on_icon_state // Consistent in-hand sprite
	else
		icon_state = off_icon_state
		item_state = off_icon_state
	if(loc && ismob(loc))
		var/mob/M = loc
		M.regenerate_icons()

/obj/item/gun/magic/spellbook/proc/update_state()
	if(on)
		w_class = w_class_on
		force = force_on
		throw_speed = throw_speed_on
		throw_range = throw_range_on
		set_light(brightness_on)
		possible_item_intents = list(/datum/intent/shoot/tome, INTENT_GENERIC)
	else
		w_class = WEIGHT_CLASS_NORMAL
		force = 2
		throw_speed = throw_speed_off
		throw_range = throw_range_off
		set_light(0)
		possible_item_intents = list(INTENT_GENERIC) // No shooting when closed
	update_icon()

/obj/item/gun/magic/spellbook/getonmobprop(tag)
	. = ..()
	if(tag && on)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4)
			if("onbelt")
				return list("shrink" = 0.3)

/obj/item/gun/magic/spellbook/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(!on)
		to_chat(user, "<span class='info'>Open the spellbook first!</span>")
		return FALSE
	var/obj/item/ammo_casing/magic/cur_casing = chambered
	var/spell_class = cur_casing.spell_element
	var/obj/projectile/cur_proj = cur_casing.BB
	if(spell_class)
		switch(spell_class)
			if(STYPE_FIRE) //includes poison
				cur_proj.damage = cur_proj.damage + (user.STAMAG)
			if(STYPE_LIGHTNING) //includes light and healing
				cur_proj.damage = cur_proj.damage + (user.STAFTH)
			if(STYPE_FROST) //includes time magic
				cur_proj.damage = cur_proj.damage + (user.STAMAG * 0.5) + (user.STASKL * 0.5)
			if(STYPE_CRYSTAL) //misc magic like magic missile 
				cur_proj.damage = cur_proj.damage + (user.STAMAG * 0.5) + (user.STAFTH * 0.5)
	return. = ..()


/obj/item/gun/magic/spellbook/attack_self(mob/user)
	on = !on
	if(on)
		to_chat(user, "<span class='warning'>I open the spellbook!</span>")
		playsound(loc, on_sound, 50, TRUE)
	else
		to_chat(user, "<span class='notice'>I close the spellbook.</span>")
		playsound(loc, off_sound, 50, TRUE)
	update_state()
	user.update_inv_hands()

/obj/item/gun/magic/spellbook/can_shoot(mob/living/user)
	if(!on)
		to_chat(user, "<span class='info'>Open me first.</span>")
		return FALSE
	return ..()

/obj/item/gun/magic/spellbook/attackby(obj/item/I, mob/user, params)
	// Prevent reading interactions
	if(istype(I, /obj/item/pen) || istype(I, /obj/item/paper))
		to_chat(user, "<span class='warning'>This is a magical tome, not a writable book!</span>")
		return
	return ..()

/obj/item/gun/magic/spellbook/examine(mob/user)
	. = ..()
	if(!on)
		. += "<span class='notice'>It is closed and looks like an ordinary book.</span>"
	else
		. += "<span class='warning'>It is open and pulses with magical energy.</span>"

	return

// Intent for shooting
/datum/intent/shoot/tome
	chargetime = 1
	chargedrain = 2
	charging_slowdown = 3

/datum/intent/shoot/tome/can_charge()
	if(mastermob && mastermob.get_inactive_held_item())
		return FALSE
	return TRUE

/datum/intent/shoot/tome/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] charges the [masteritem]!"))
		playsound(mastermob, 'sound/magic/charged.ogg', 100, FALSE)

/datum/intent/shoot/tome/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 12 - (mastermob.mind.get_skill_level(/datum/skill/combat/tomes) * 2) // Skill reduces by 2 per level (max 6 levels = 12)
		newtime += 10 - (mastermob.STASKL * 0.5) // Skill reduces by 0.5 per point (max 20 = 10)
		newtime += 20 - mastermob.STAMAG // Magic reduces by 1 per point (max 20 = 20)
		return max(newtime, 0.1)
	return chargetime

// Example subtype (others follow similar pattern)
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

/datum/intent/arc/tome/tier2
	chargetime = 2.0
	chargedrain = 3.0
	charging_slowdown = 3.0

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

/datum/intent/arc/tome/tier3
	chargetime = 5.0
	chargedrain = 4.0
	charging_slowdown = 3.0

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

