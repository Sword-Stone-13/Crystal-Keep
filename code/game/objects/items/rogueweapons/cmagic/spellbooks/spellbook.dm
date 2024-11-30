/obj/item/gun/magic/spellbook
	name = "spellbook of nothing"
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
	minmag = 10
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	can_charge = TRUE
	max_charges = 100 //100, 50, 50, 34 (max charge distribution by 25%ths)
	attack_verb = list("bashed", "whacked", "educated")
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	pickup_sound =  'sound/blank.ogg'
	hitsound = 'sound/blank.ogg'
	var/hitsound_on = 'sound/blank.ogg' //to be furled pages bop
	associated_skill = /datum/skill/magic/arcane
	var/list/attack_verb_on = list("bashed", "whacked", "educated")
	var/list/attack_verb_off = list("bashed", "whacked", "educated")
	var/force_on = 5
	var/on_sound = 'sound/items/book_open.ogg'
	var/on = TRUE
	var/on_icon_state = "basic_book_1" // What is our sprite when turned on
	var/off_icon_state = "basic_book_0" // What is our sprite when turned off
	var/on_item_state = "basic_book_0" // What is our in-hand sprite when turned on
	var/force_off = 5 // Damage when off - not stunning
	var/weight_class_on = WEIGHT_CLASS_BULKY // What is the new size class when turned on
	var/active = FALSE
	var/brightness_on = 5
	var/throwforce_on = 5
	var/w_class_on = WEIGHT_CLASS_BULKY


/obj/item/gun/magic/spellbook/getonmobprop(tag)
	. = ..()
	if(tag)
		if(on)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4)
				if("onbelt")
					return list("shrink" = 0.3)




/obj/item/gun/magic/spellbook/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
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
	. = ..()
//new
/obj/item/gun/magic/spellbook/proc/get_on_description()
	. = list()

	.["local_on"] = "<span class ='warning'>I open the spellbook!</span>"
	.["local_off"] = "<span class ='notice'>I close the spellbook.</span>"

	return .


/obj/item/gun/magic/spellbook/attack_self(mob/user)
	on = !on
	var/list/desc = get_on_description()

	if(on)
		to_chat(user, desc["local_on"])
		icon_state = on_icon_state
		item_state = on_item_state
		w_class = weight_class_on
		force = force_on
		playsound(loc, 'sound/items/book_open.ogg', 100)
		set_light(brightness_on)
	else
		to_chat(user, desc["local_off"])
		icon_state = off_icon_state
		force = force_off
		playsound(loc, 'sound/items/book_close.ogg', 100)
	update_icon()
	user.update_inv_hands()
	playsound(src.loc, on_sound, 50, TRUE)
	set_light(0)


/obj/item/gun/magic/spellbook/can_shoot(mob/living/user)
	// Check if the spellbook is open
	if (!on)
		to_chat(user, "<span class='info'>Open me first.</span>")
		return FALSE
	return ..()

/datum/intent/shoot/tome
	chargetime = 1
	chargedrain = 2
	charging_slowdown = 3

/datum/intent/shoot/tome/can_charge()
	if(mastermob)
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/shoot/tome/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] charges the [masteritem]!"))
		playsound(mastermob, pick('sound/magic/charged.ogg'), 100, FALSE)

/datum/intent/shoot/tome/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		//skill block
		newtime = newtime + 12
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/tomes) * (10/5))
		//12 because skills go up to 6 and originally math was skill level * 10/6
		newtime = newtime + 10
		newtime = newtime - (mastermob.STASKL * (10/20))
		//I just think Skill is neat and should be used more
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAMAG * 1) //20/20 is 1
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime



/obj/item/gun/magic/spellbook/firebolt
	name = "firebolt tome"
	desc = "The beginner's tome."
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
	
/obj/item/gun/magic/spellbook/crystalsword
	name = "Shining sword"
	desc = "A beautiful blue sword that glows in the night."
	ammo_type = /obj/item/ammo_casing/magic/crystalpeep
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/shoot/tome/)
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
	force = 25
	minmag = 11 //for now, just to test
//more to come after tests
