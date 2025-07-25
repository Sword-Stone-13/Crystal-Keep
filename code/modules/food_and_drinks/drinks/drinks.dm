////////////////////////////////////////////////////////////////////////////////
/// Drinks.
////////////////////////////////////////////////////////////////////////////////
/obj/item/reagent_containers/food/drinks
	name = "drink"
	desc = ""
	icon = 'icons/obj/drinks.dmi'
	icon_state = null
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	reagent_flags = OPENCONTAINER
	var/gulp_size = 5 //This is now officially broken ... need to think of a nice way to fix it.
	possible_transfer_amounts = list(5,10,15,20,25,30,50)
	volume = 50
	resistance_flags = NONE
	var/isGlass = TRUE //Whether the 'bottle' is made of glass or not so that milk cartons dont shatter when someone gets hit by it

/obj/item/reagent_containers/food/drinks/on_reagent_change(changetype)
	. = ..()
	gulp_size = max(round(reagents.total_volume / 5), 5)

/obj/item/reagent_containers/food/drinks/attack(mob/living/M, mob/user, def_zone)

	if(!reagents || !reagents.total_volume)
		to_chat(user, span_warning("[src] is empty!"))
		return 0

	if(!canconsume(M, user))
		return 0

	if (!is_drainable())
		to_chat(user, span_warning("[src]'s lid hasn't been opened!"))
		return 0

	if(M == user)
		user.visible_message(span_notice("[user] swallows a gulp of [src]."), \
			span_notice("I swallow a gulp of [src]."))
		if(HAS_TRAIT(M, TRAIT_VORACIOUS))
			M.changeNext_move(CLICK_CD_MELEE * 0.5) //chug! chug! chug!

	else
		M.visible_message(span_danger("[user] attempts to feed [M] the contents of [src]."), \
			span_danger("[user] attempts to feed you the contents of [src]."))
		if(!do_mob(user, M))
			return
		if(!reagents || !reagents.total_volume)
			return // The drink might be empty after the delay, such as by spam-feeding
		M.visible_message(span_danger("[user] fed [M] the contents of [src]."), \
			span_danger("[user] fed you the contents of [src]."))
		log_combat(user, M, "fed", reagents.log_list())

	var/fraction = min(gulp_size/reagents.total_volume, 1)
	checkLiked(fraction, M)
	reagents.reaction(M, INGEST, fraction)
	reagents.trans_to(M, gulp_size, transfered_by = user)
	playsound(M.loc,'sound/blank.ogg', rand(10,50), TRUE)
	return 1

/obj/item/reagent_containers/food/drinks/afterattack(obj/target, mob/user , proximity)
	. = ..()
	if(!proximity)
		return

	if(target.is_refillable() && is_drainable()) //Something like a glass. Player probably wants to transfer TO it.
		if(!reagents.total_volume)
			to_chat(user, span_warning("[src] is empty."))
			return

		if(target.reagents.holder_full())
			to_chat(user, span_warning("[target] is full."))
			return

		var/refill = reagents.get_master_reagent_id()
		var/trans = src.reagents.trans_to(target, amount_per_transfer_from_this, transfered_by = user)
		to_chat(user, span_notice("I transfer [trans] units of the solution to [target]."))

		if(iscyborg(user)) //Cyborg modules that include drinks automatically refill themselves, but drain the borg's cell
			var/mob/living/silicon/robot/bro = user
			bro.cell.use(30)
			addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, add_reagent), refill, trans), 600)

	else if(target.is_drainable()) //A dispenser. Transfer FROM it TO us.
		if (!is_refillable())
			to_chat(user, span_warning("[src]'s tab isn't open!"))
			return

		if(!target.reagents.total_volume)
			to_chat(user, span_warning("[target] is empty."))
			return

		if(reagents.holder_full())
			to_chat(user, span_warning("[src] is full."))
			return

		var/trans = target.reagents.trans_to(src, amount_per_transfer_from_this, transfered_by = user)
		to_chat(user, span_notice("I fill [src] with [trans] units of the contents of [target]."))

/obj/item/reagent_containers/food/drinks/attackby(obj/item/I, mob/user, params)
	var/hotness = I.get_temperature()
	if(hotness && reagents)
		reagents.expose_temperature(hotness)
		to_chat(user, span_notice("I heat [name] with [I]!"))
	..()

/obj/item/reagent_containers/food/drinks/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if the bottle wasn't caught
		smash(hit_atom, throwingdatum?.thrower, TRUE)

/obj/item/reagent_containers/food/drinks/proc/smash(atom/target, mob/thrower, ranged = FALSE)
	if(!isGlass)
		return
	if(QDELING(src) || !target)		//Invalid loc
		return
	if(bartender_check(target) && ranged)
		return
	var/obj/item/broken_bottle/B = new (loc)
	B.icon_state = icon_state
	var/icon/I = new('icons/obj/drinks.dmi', src.icon_state)
	I.Blend(B.broken_outline, ICON_OVERLAY, rand(5), 1)
	I.SwapColor(rgb(255, 0, 220, 255), rgb(0, 0, 0, 0))
	B.icon = I
	B.name = "broken [name]"
	if(prob(33))
		var/obj/item/shard/S = new(drop_location())
		target.Bumped(S)
	playsound(src, "shatter", 70, TRUE)
	transfer_fingerprints_to(B)
	qdel(src)
	target.Bumped(B)

/obj/item/reagent_containers/food/drinks/bullet_act(obj/projectile/P)
	. = ..()
	if(!(P.nodamage) && P.damage_type == BRUTE && !QDELETED(src))
		var/atom/T = get_turf(src)
		smash(T)
		return



////////////////////////////////////////////////////////////////////////////////
/// Drinks. END
////////////////////////////////////////////////////////////////////////////////


/obj/item/reagent_containers/food/drinks/trophy
	name = "pewter cup"
	desc = ""
	icon_state = "pewter_cup"
	w_class = WEIGHT_CLASS_TINY
	force = 1
	throwforce = 1
	amount_per_transfer_from_this = 5
	custom_materials = list(/datum/material/iron=100)
	possible_transfer_amounts = list()
	volume = 5
	flags_1 = CONDUCT_1
	spillable = TRUE
	resistance_flags = FIRE_PROOF
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/trophy/gold_cup
	name = "gold cup"
	desc = ""
	icon_state = "golden_cup"
	w_class = WEIGHT_CLASS_BULKY
	force = 14
	throwforce = 10
	amount_per_transfer_from_this = 20
	custom_materials = list(/datum/material/gold=1000)
	volume = 150

/obj/item/reagent_containers/food/drinks/trophy/silver_cup
	name = "silver cup"
	desc = ""
	icon_state = "silver_cup"
	w_class = WEIGHT_CLASS_NORMAL
	force = 10
	throwforce = 8
	amount_per_transfer_from_this = 15
	custom_materials = list(/datum/material/silver=800)
	volume = 100


/obj/item/reagent_containers/food/drinks/trophy/bronze_cup
	name = "bronze cup"
	desc = ""
	icon_state = "bronze_cup"
	w_class = WEIGHT_CLASS_SMALL
	force = 5
	throwforce = 4
	amount_per_transfer_from_this = 10
	custom_materials = list(/datum/material/iron=400)
	volume = 25

///////////////////////////////////////////////Drinks
//Notes by Darem: Drinks are simply containers that start preloaded. Unlike condiments, the contents can be ingested directly
//	rather then having to add it to something else first. They should only contain liquids. They have a default container size of 50.
//	Formatting is the same as food.

/obj/item/reagent_containers/food/drinks/coffee
	name = "robust coffee"
	desc = ""
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/coffee = 30)
	spillable = TRUE
	resistance_flags = FREEZE_PROOF
	isGlass = FALSE
	foodtype = BREAKFAST

/obj/item/reagent_containers/food/drinks/ice
	name = "ice cup"
	desc = ""
	custom_price = 5
	icon_state = "coffee"
	list_reagents = list(/datum/reagent/consumable/ice = 30)
	spillable = TRUE
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/ice/prison
	name = "dirty ice cup"
	desc = ""
	list_reagents  = list(/datum/reagent/consumable/ice = 25, /datum/reagent/liquidgibs = 5)

/obj/item/reagent_containers/food/drinks/mug/ // parent type is literally just so empty mug sprites are a thing
	name = "mug"
	desc = ""
	icon_state = "tea"
	item_state = "coffee"
	spillable = TRUE

/obj/item/reagent_containers/food/drinks/mug/on_reagent_change(changetype)
	if(reagents.total_volume)
		icon_state = "tea"
	else
		icon_state = "tea_empty"

/obj/item/reagent_containers/food/drinks/mug/tea
	name = "King Purple tea"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/tea = 30)

/obj/item/reagent_containers/food/drinks/mug/coco
	name = "Dutch hot coco"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/hot_coco = 15, /datum/reagent/consumable/sugar = 5)
	foodtype = SUGAR
	resistance_flags = FREEZE_PROOF
	custom_price = 42


/obj/item/reagent_containers/food/drinks/dry_ramen
	name = "cup ramen"
	desc = ""
	icon_state = "ramen"
	list_reagents = list(/datum/reagent/consumable/dry_ramen = 15, /datum/reagent/consumable/sodiumchloride = 3)
	foodtype = GRAIN
	isGlass = FALSE
	custom_price = 38

/obj/item/reagent_containers/food/drinks/beer
	name = "space beer"
	desc = ""
	icon_state = "beer"
	list_reagents = list(/datum/reagent/consumable/ethanol/beer = 30)
	foodtype = GRAIN | ALCOHOL

/obj/item/reagent_containers/food/drinks/beer/light
	name = "Carp Lite"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/ethanol/beer/light = 30)

/obj/item/reagent_containers/food/drinks/ale
	name = "Magm-Ale"
	desc = ""
	icon_state = "alebottle"
	item_state = "beer"
	list_reagents = list(/datum/reagent/consumable/ethanol/ale = 30)
	foodtype = GRAIN | ALCOHOL

/obj/item/reagent_containers/food/drinks/sillycup
	name = "paper cup"
	desc = ""
	icon_state = "water_cup_e"
	possible_transfer_amounts = list()
	volume = 10
	spillable = TRUE
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/sillycup/on_reagent_change(changetype)
	if(reagents.total_volume)
		icon_state = "water_cup"
	else
		icon_state = "water_cup_e"

/obj/item/reagent_containers/food/drinks/sillycup/smallcarton
	name = "small carton"
	desc = ""
	icon_state = "juicebox"
	volume = 15 //I figure if you have to craft these it should at least be slightly better than something you can get for free from a watercooler

/obj/item/reagent_containers/food/drinks/sillycup/smallcarton/smash(atom/target, mob/thrower, ranged = FALSE)
	if(bartender_check(target) && ranged)
		return
	var/obj/item/broken_bottle/B = new (loc)
	B.icon_state = icon_state
	var/icon/I = new('icons/obj/drinks.dmi', src.icon_state)
	I.Blend(B.broken_outline, ICON_OVERLAY, rand(5), 1)
	I.SwapColor(rgb(255, 0, 220, 255), rgb(0, 0, 0, 0))
	B.icon = I
	B.name = "broken [name]"
	B.force = 0
	B.throwforce = 0
	B.desc = ""
	transfer_fingerprints_to(B)
	qdel(src)
	target.Bumped(B)

/obj/item/reagent_containers/food/drinks/sillycup/smallcarton/on_reagent_change(changetype)
	if (reagents.reagent_list.len)
		switch(reagents.get_master_reagent_id())
			if(/datum/reagent/consumable/orangejuice)
				icon_state = "orangebox"
				name = "orange juice box"
				desc = ""
				foodtype = FRUIT | BREAKFAST
			if(/datum/reagent/consumable/milk)
				icon_state = "milkbox"
				name = "carton of milk"
				desc = ""
				foodtype = DAIRY | BREAKFAST
			if(/datum/reagent/consumable/applejuice)
				icon_state = "juicebox"
				name = "apple juice box"
				desc = ""
				foodtype = FRUIT
			if(/datum/reagent/consumable/grapejuice)
				icon_state = "grapebox"
				name = "grape juice box"
				desc = ""
				foodtype = FRUIT
			if(/datum/reagent/consumable/milk/chocolate_milk)
				icon_state = "chocolatebox"
				name = "carton of chocolate milk"
				desc = ""
				foodtype = SUGAR
			if(/datum/reagent/consumable/ethanol/eggnog)
				icon_state = "nog2"
				name = "carton of eggnog"
				desc = ""
				foodtype = MEAT
	else
		icon_state = "juicebox"
		name = "small carton"
		desc = ""



//////////////////////////drinkingglass and shaker//
//Note by Darem: This code handles the mixing of drinks. New drinks go in three places: In Chemistry-Reagents.dm (for the drink
//	itself), in Chemistry-Recipes.dm (for the reaction that changes the components into the drink), and here (for the drinking glass
//	icon states.

/obj/item/reagent_containers/food/drinks/shaker
	name = "shaker"
	desc = ""
	icon_state = "shaker"
	custom_materials = list(/datum/material/iron=1500)
	amount_per_transfer_from_this = 10
	volume = 100
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/flask
	name = "flask"
	desc = ""
	custom_price = 30
	icon_state = "flask"
	custom_materials = list(/datum/material/iron=250)
	volume = 60
	isGlass = FALSE

/obj/item/reagent_containers/food/drinks/flask/gold
	name = "captain's flask"
	desc = ""
	icon_state = "flask_gold"
	custom_materials = list(/datum/material/gold=500)

/obj/item/reagent_containers/food/drinks/flask/det
	name = "detective's flask"
	desc = ""
	icon_state = "detflask"
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 30)

/obj/item/reagent_containers/food/drinks/britcup
	name = "cup"
	desc = ""
	icon_state = "britcup"
	volume = 30
	spillable = TRUE

//////////////////////////soda_cans//
//These are in their own group to be used as IED's in /obj/item/grenade/ghettobomb.dm

/obj/item/reagent_containers/food/drinks/soda_cans
	name = "soda can"
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	reagent_flags = NONE
	spillable = FALSE
	isGlass = FALSE
	custom_price = 10

/obj/item/reagent_containers/food/drinks/soda_cans/suicide_act(mob/living/carbon/human/H)
	if(!reagents.total_volume)
		H.visible_message(span_warning("[H] is trying to take a big sip from [src]... The can is empty!"))
		return SHAME
	if(!is_drainable())
		open_soda()
		sleep(10)
	H.visible_message(span_suicide("[H] takes a big sip from [src]! It looks like [H.p_theyre()] trying to commit suicide!"))
	playsound(H,'sound/blank.ogg', 80, TRUE)
	reagents.trans_to(H, src.reagents.total_volume, transfered_by = H) //a big sip
	sleep(5)
	H.say(pick("Now, Outbomb Cuban Pete, THAT was a game.", "All these new fangled arcade games are too slow. I prefer the classics.", "They don't make 'em like Orion Trail anymore.", "You know what they say. Worst day of spess carp fishing is better than the best day at work.", "They don't make 'em like good old fashioned singularity engines anymore."))
	if(H.age >= 30)
		H.Stun(50)
		sleep(50)
		playsound(H,'sound/blank.ogg', 80, TRUE)
		H.say(pick("Another day, another dollar.", "I wonder if I should hold?", "Diversifying is for young'ns.", "Yeap, times were good back then."))
		return MANUAL_SUICIDE_NONLETHAL
	sleep(20) //dramatic pause
	return TOXLOSS

/obj/item/reagent_containers/food/drinks/soda_cans/attack(mob/M, mob/user)
	if(istype(M, /mob/living/carbon) && !reagents.total_volume && user.used_intent.type == INTENT_HARM && user.zone_selected == BODY_ZONE_HEAD)
		if(M == user)
			user.visible_message(span_warning("[user] crushes the can of [src] on [user.p_their()] forehead!"), span_notice("I crush the can of [src] on your forehead."))
		else
			user.visible_message(span_warning("[user] crushes the can of [src] on [M]'s forehead!"), span_notice("I crush the can of [src] on [M]'s forehead."))
		playsound(M,'sound/blank.ogg', rand(10,50), TRUE)
		var/obj/item/trash/can/crushed_can = new /obj/item/trash/can(M.loc)
		crushed_can.icon_state = icon_state
		qdel(src)
		return TRUE
	. = ..()

/obj/item/reagent_containers/food/drinks/soda_cans/bullet_act(obj/projectile/P)
	. = ..()
	if(!(P.nodamage) && P.damage_type == BRUTE && !QDELETED(src))
		var/obj/item/trash/can/crushed_can = new /obj/item/trash/can(src.loc)
		crushed_can.icon_state = icon_state
		var/atom/throw_target = get_edge_target_turf(crushed_can, pick(GLOB.alldirs))
		crushed_can.throw_at(throw_target, rand(1,2), 7)
		qdel(src)
		return

/obj/item/reagent_containers/food/drinks/soda_cans/proc/open_soda(mob/user)
	to_chat(user, "You pull back the tab of \the [src] with a satisfying pop.") //Ahhhhhhhh
	ENABLE_BITFIELD(reagents.flags, OPENCONTAINER)
	playsound(src, "can_open", 50, TRUE)
	spillable = TRUE

/obj/item/reagent_containers/food/drinks/soda_cans/attack_self(mob/user)
	if(!is_drainable())
		open_soda(user)
	return ..()

/obj/item/reagent_containers/food/drinks/soda_cans/cola
	name = "Space Cola"
	desc = ""
	icon_state = "cola"
	list_reagents = list(/datum/reagent/consumable/space_cola = 30)
	foodtype = SUGAR

/obj/item/reagent_containers/food/drinks/soda_cans/tonic
	name = "T-Borg's tonic water"
	desc = ""
	icon_state = "tonic"
	list_reagents = list(/datum/reagent/consumable/tonic = 50)
	foodtype = ALCOHOL

/obj/item/reagent_containers/food/drinks/soda_cans/sodawater
	name = "soda water"
	desc = ""
	icon_state = "sodawater"
	list_reagents = list(/datum/reagent/consumable/sodawater = 50)

/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime
	name = "orange soda"
	desc = ""
	icon_state = "lemon-lime"
	list_reagents = list(/datum/reagent/consumable/lemon_lime = 30)
	foodtype = FRUIT

/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime/Initialize()
	. = ..()
	name = "lemon-lime soda"

/obj/item/reagent_containers/food/drinks/soda_cans/space_up
	name = "Space-Up!"
	desc = ""
	icon_state = "space-up"
	list_reagents = list(/datum/reagent/consumable/space_up = 30)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/starkist
	name = "Star-kist"
	desc = ""
	icon_state = "starkist"
	list_reagents = list(/datum/reagent/consumable/space_cola = 15, /datum/reagent/consumable/orangejuice = 15)
	foodtype = SUGAR | FRUIT | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind
	name = "Space Mountain Wind"
	desc = ""
	icon_state = "space_mountain_wind"
	list_reagents = list(/datum/reagent/consumable/spacemountainwind = 30)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/thirteenloko
	name = "Thirteen Loko"
	desc = ""
	icon_state = "thirteen_loko"
	list_reagents = list(/datum/reagent/consumable/ethanol/thirteenloko = 30)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb
	name = "Dr. Gibb"
	desc = ""
	icon_state = "dr_gibb"
	list_reagents = list(/datum/reagent/consumable/dr_gibb = 30)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game
	name = "Pwr Game"
	desc = ""
	icon_state = "purple_can"
	list_reagents = list(/datum/reagent/consumable/pwr_game = 30)

/obj/item/reagent_containers/food/drinks/soda_cans/shamblers
	name = "Shambler's juice"
	desc = ""
	icon_state = "shamblers"
	list_reagents = list(/datum/reagent/consumable/shamblers = 30)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/grey_bull
	name = "Grey Bull"
	desc = ""
	icon_state = "energy_drink"
	list_reagents = list(/datum/reagent/consumable/grey_bull = 20)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/monkey_energy
	name = "Monkey Energy"
	desc = ""
	icon_state = "monkey_energy"
	item_state = "monkey_energy"
	list_reagents = list(/datum/reagent/consumable/monkey_energy = 50)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/soda_cans/air
	name = "canned air"
	desc = ""
	icon_state = "air"
	list_reagents = list(/datum/reagent/nitrogen = 24, /datum/reagent/oxygen = 6)
