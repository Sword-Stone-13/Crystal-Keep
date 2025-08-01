
/datum/action/innate/cult/blood_magic //Blood magic handles the creation of blood spells (formerly talismans)
	name = "Prepare Blood Magic"
	button_icon_state = "carve"
	desc = ""
	var/list/spells = list()
	var/channeling = FALSE

/datum/action/innate/cult/blood_magic/Grant()
	..()
	button.screen_loc = DEFAULT_BLOODSPELLS
	button.moved = DEFAULT_BLOODSPELLS
	button.ordered = FALSE

/datum/action/innate/cult/blood_magic/Remove()
	for(var/X in spells)
		qdel(X)
	..()

/datum/action/innate/cult/blood_magic/IsAvailable()
	if(!iscultist(owner))
		return FALSE
	return ..()

/datum/action/innate/cult/blood_magic/proc/Positioning()
	var/list/screen_loc_split = splittext(button.screen_loc,",")
	var/list/screen_loc_X = splittext(screen_loc_split[1],":")
	var/list/screen_loc_Y = splittext(screen_loc_split[2],":")
	var/pix_X = text2num(screen_loc_X[2])
	for(var/datum/action/innate/cult/blood_spell/B in spells)
		if(B.button.locked)
			var/order = pix_X+spells.Find(B)*31
			B.button.screen_loc = "[screen_loc_X[1]]:[order],[screen_loc_Y[1]]:[screen_loc_Y[2]]"
			B.button.moved = B.button.screen_loc

/datum/action/innate/cult/blood_magic/Activate()
	var/rune = FALSE
	var/limit = RUNELESS_MAX_BLOODCHARGE
	for(var/obj/effect/rune/empower/R in range(1, owner))
		rune = TRUE
		break
	if(rune)
		limit = MAX_BLOODCHARGE
	if(spells.len >= limit)
		if(rune)
			to_chat(owner, span_cultitalic("I cannot store more than [MAX_BLOODCHARGE] spells. <b>Pick a spell to remove.</b>"))
		else
			to_chat(owner, span_cultitalic("<b><u>I cannot store more than [RUNELESS_MAX_BLOODCHARGE] spells without an empowering rune! Pick a spell to remove.</b></u>"))
		var/nullify_spell = input(owner, "Choose a spell to remove.", "Current Spells") as null|anything in spells
		if(nullify_spell)
			qdel(nullify_spell)
		return
	var/entered_spell_name
	var/datum/action/innate/cult/blood_spell/BS
	var/list/possible_spells = list()
	for(var/I in subtypesof(/datum/action/innate/cult/blood_spell))
		var/datum/action/innate/cult/blood_spell/J = I
		var/cult_name = initial(J.name)
		possible_spells[cult_name] = J
	possible_spells += "(REMOVE SPELL)"
	entered_spell_name = input(owner, "Pick a blood spell to prepare...", "Spell Choices") as null|anything in possible_spells
	if(entered_spell_name == "(REMOVE SPELL)")
		var/nullify_spell = input(owner, "Choose a spell to remove.", "Current Spells") as null|anything in spells
		if(nullify_spell)
			qdel(nullify_spell)
		return
	BS = possible_spells[entered_spell_name]
	if(QDELETED(src) || owner.incapacitated() || !BS || (rune && !(locate(/obj/effect/rune/empower) in range(1, owner))) || (spells.len >= limit))
		return
	to_chat(owner,span_warning("I begin to carve unnatural symbols into my flesh!"))
	SEND_SOUND(owner, sound('sound/blank.ogg',0,1,10))
	if(!channeling)
		channeling = TRUE
	else
		to_chat(owner, span_cultitalic("I are already invoking blood magic!"))
		return
	if(do_after(owner, 100 - rune*60, target = owner))
		if(ishuman(owner))
			var/mob/living/carbon/human/H = owner
			H.bleed(40 - rune*32)
		var/datum/action/innate/cult/blood_spell/new_spell = new BS(owner)
		new_spell.Grant(owner, src)
		spells += new_spell
		Positioning()
		to_chat(owner, span_warning("My wounds glow with power, you have prepared a [new_spell.name] invocation!"))
	channeling = FALSE

/datum/action/innate/cult/blood_spell //The next generation of talismans, handles storage/creation of blood magic
	name = "Blood Magic"
	button_icon_state = "telerune"
	desc = ""
	var/charges = 1
	var/magic_path = null
	var/obj/item/melee/blood_magic/hand_magic
	var/datum/action/innate/cult/blood_magic/all_magic
	var/base_desc //To allow for updating tooltips
	var/invocation
	var/health_cost = 0

/datum/action/innate/cult/blood_spell/Grant(mob/living/owner, datum/action/innate/cult/blood_magic/BM)
	if(health_cost)
		desc += "<br>Deals <u>[health_cost] damage</u> to my arm per use."
	base_desc = desc
	desc += "<br><b><u>Has [charges] use\s remaining</u></b>."
	all_magic = BM
	..()
	button.locked = TRUE
	button.ordered = FALSE

/datum/action/innate/cult/blood_spell/Remove()
	if(all_magic)
		all_magic.spells -= src
	if(hand_magic)
		qdel(hand_magic)
		hand_magic = null
	..()

/datum/action/innate/cult/blood_spell/IsAvailable()
	if(!iscultist(owner) || owner.incapacitated()  || !charges)
		return FALSE
	return ..()

/datum/action/innate/cult/blood_spell/Activate()
	if(magic_path) //If this spell flows from the hand
		if(!hand_magic)
			hand_magic = new magic_path(owner, src)
			if(!owner.put_in_hands(hand_magic))
				qdel(hand_magic)
				hand_magic = null
				to_chat(owner, span_warning("I have no empty hand for invoking blood magic!"))
				return
			to_chat(owner, span_notice("My wounds glow as you invoke the [name]."))
			return
		if(hand_magic)
			qdel(hand_magic)
			hand_magic = null
			to_chat(owner, span_warning("I snuff out the spell, saving it for later."))


//Cult Blood Spells
/datum/action/innate/cult/blood_spell/stun
	name = "Stun"
	desc = ""
	button_icon_state = "hand"
	magic_path = "/obj/item/melee/blood_magic/stun"
	health_cost = 10

/datum/action/innate/cult/blood_spell/teleport
	name = "Teleport"
	desc = ""
	button_icon_state = "tele"
	magic_path = "/obj/item/melee/blood_magic/teleport"
	health_cost = 7

/datum/action/innate/cult/blood_spell/emp
	name = "Electromagnetic Pulse"
	desc = ""
	button_icon_state = "emp"
	health_cost = 10
	invocation = "Ta'gh fara'qha fel d'amar det!"

/datum/action/innate/cult/blood_spell/emp/Activate()
	owner.visible_message(span_warning("[owner]'s hand flashes a bright blue!"), \
						 span_cultitalic("I speak the cursed words, emitting an EMP blast from my hand."))
	empulse(owner, 2, 5)
	owner.whisper(invocation, language = /datum/language/common)
	charges--
	if(charges<=0)
		qdel(src)

/datum/action/innate/cult/blood_spell/shackles
	name = "Shadow Shackles"
	desc = ""
	button_icon_state = "cuff"
	charges = 4
	magic_path = "/obj/item/melee/blood_magic/shackles"

/datum/action/innate/cult/blood_spell/construction
	name = "Twisted Construction"
	desc = ""
	button_icon_state = "transmute"
	magic_path = "/obj/item/melee/blood_magic/construction"
	health_cost = 12

/datum/action/innate/cult/blood_spell/equipment
	name = "Summon Equipment"
	desc = ""
	button_icon_state = "equip"
	magic_path = "/obj/item/melee/blood_magic/armor"

/datum/action/innate/cult/blood_spell/equipment/Activate()
	var/choice = alert(owner,"Choose my equipment type",,"Combat Equipment","Ritual Dagger","Cancel")
	if(choice == "Ritual Dagger")
		var/turf/T = get_turf(owner)
		owner.visible_message(span_warning("[owner]'s hand glows red for a moment."), \
			span_cultitalic("Red light begins to shimmer and take form within my hand!"))
		var/obj/O = new /obj/item/melee/cultblade/dagger(T)
		if(owner.put_in_hands(O))
			to_chat(owner, span_warning("A ritual dagger appears in my hand!"))
		else
			owner.visible_message(span_warning("A ritual dagger appears at [owner]'s feet!"), \
				 span_cultitalic("A ritual dagger materializes at my feet."))
		SEND_SOUND(owner, sound('sound/blank.ogg',0,1,25))
		charges--
		desc = base_desc
		desc += "<br><b><u>Has [charges] use\s remaining</u></b>."
		if(charges<=0)
			qdel(src)
	else if(choice == "Combat Equipment")
		..()

/datum/action/innate/cult/blood_spell/horror
	name = "Hallucinations"
	desc = ""
	button_icon_state = "horror"
	var/obj/effect/proc_holder/horror/PH
	charges = 4

/datum/action/innate/cult/blood_spell/horror/New()
	PH = new()
	PH.attached_action = src
	..()

/datum/action/innate/cult/blood_spell/horror/Destroy()
	var/obj/effect/proc_holder/horror/destroy = PH
	. = ..()
	if(destroy  && !QDELETED(destroy))
		QDEL_NULL(destroy)

/datum/action/innate/cult/blood_spell/horror/Activate()
	PH.toggle(owner) //the important bit
	return TRUE

/obj/effect/proc_holder/horror
	active = FALSE
	ranged_mousepointer = 'icons/effects/cult_target.dmi'
	var/datum/action/innate/cult/blood_spell/attached_action

/obj/effect/proc_holder/horror/Destroy()
	var/datum/action/innate/cult/blood_spell/AA = attached_action
	. = ..()
	if(AA && !QDELETED(AA))
		QDEL_NULL(AA)

/obj/effect/proc_holder/horror/proc/toggle(mob/user)
	if(active)
		remove_ranged_ability(span_cult("I dispel the magic..."))
	else
		add_ranged_ability(user, span_cult("I prepare to horrify a target..."))

/obj/effect/proc_holder/horror/InterceptClickOn(mob/living/caller, params, atom/target)
	if(..())
		return
	if(ranged_ability_user.incapacitated() || !iscultist(caller))
		remove_ranged_ability()
		return
	var/turf/T = get_turf(ranged_ability_user)
	if(!isturf(T))
		return FALSE
	if(target in view(7, get_turf(ranged_ability_user)))
		if(!ishuman(target) || iscultist(target))
			return
		var/mob/living/carbon/human/H = target
		H.hallucination = max(H.hallucination, 120)
		SEND_SOUND(ranged_ability_user, sound('sound/blank.ogg',0,1,50))
		var/image/C = image('icons/effects/cult_effects.dmi',H,"bloodsparkles", ABOVE_MOB_LAYER)
		add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/cult, "cult_apoc", C, NONE)
		addtimer(CALLBACK(H,TYPE_PROC_REF(/atom, remove_alt_appearance),"cult_apoc",TRUE), 2400, TIMER_OVERRIDE|TIMER_UNIQUE)
		to_chat(ranged_ability_user,span_cult("<b>[H] has been cursed with living nightmares!</b>"))
		attached_action.charges--
		attached_action.desc = attached_action.base_desc
		attached_action.desc += "<br><b><u>Has [attached_action.charges] use\s remaining</u></b>."
		attached_action.UpdateButtonIcon()
		if(attached_action.charges <= 0)
			remove_ranged_ability(span_cult("I have exhausted the spell's power!"))
			qdel(src)

/datum/action/innate/cult/blood_spell/veiling
	name = "Conceal Presence"
	desc = ""
	invocation = "Kla'atu barada nikt'o!"
	button_icon_state = "gone"
	charges = 10
	var/revealing = FALSE //if it reveals or not

/datum/action/innate/cult/blood_spell/veiling/Activate()
	if(!revealing)
		owner.visible_message(span_warning("Thin grey dust falls from [owner]'s hand!"), \
			span_cultitalic("I invoke the veiling spell, hiding nearby runes."))
		charges--
		SEND_SOUND(owner, sound('sound/blank.ogg',0,1,25))
		owner.whisper(invocation, language = /datum/language/common)
		for(var/obj/effect/rune/R in range(5,owner))
			R.conceal()
		for(var/obj/structure/destructible/cult/S in range(5,owner))
			S.conceal()
		for(var/turf/open/floor/engine/cult/T  in range(5,owner))
			T.realappearance.alpha = 0
		for(var/obj/machinery/door/airlock/cult/AL in range(5, owner))
			AL.conceal()
		revealing = TRUE
		name = "Reveal Runes"
		button_icon_state = "back"
	else
		owner.visible_message(span_warning("A flash of light shines from [owner]'s hand!"), \
			 span_cultitalic("I invoke the counterspell, revealing nearby runes."))
		charges--
		owner.whisper(invocation, language = /datum/language/common)
		SEND_SOUND(owner, sound('sound/blank.ogg',0,1,25))
		for(var/obj/effect/rune/R in range(7,owner)) //More range in case you weren't standing in exactly the same spot
			R.reveal()
		for(var/obj/structure/destructible/cult/S in range(6,owner))
			S.reveal()
		for(var/turf/open/floor/engine/cult/T  in range(6,owner))
			T.realappearance.alpha = initial(T.realappearance.alpha)
		for(var/obj/machinery/door/airlock/cult/AL in range(6, owner))
			AL.reveal()
		revealing = FALSE
		name = "Conceal Runes"
		button_icon_state = "gone"
	if(charges<= 0)
		qdel(src)
	desc = base_desc
	desc += "<br><b><u>Has [charges] use\s remaining</u></b>."
	UpdateButtonIcon()

/datum/action/innate/cult/blood_spell/manipulation
	name = "Blood Rites"
	desc = ""
	invocation = "Fel'th Dol Ab'orod!"
	button_icon_state = "manip"
	charges = 5
	magic_path = "/obj/item/melee/blood_magic/manipulator"


// The "magic hand" items
/obj/item/melee/blood_magic
	name = "\improper magical aura"
	desc = ""
	icon = 'icons/obj/items_and_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/misc/touchspell_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/touchspell_righthand.dmi'
	icon_state = "disintegrate"
	item_state = "disintegrate"
	item_flags = NEEDS_PERMIT | ABSTRACT | DROPDEL

	w_class = WEIGHT_CLASS_HUGE
	throwforce = 0
	throw_range = 0
	throw_speed = 0
	var/invocation
	var/uses = 1
	var/health_cost = 0 //The amount of health taken from the user when invoking the spell
	var/datum/action/innate/cult/blood_spell/source

/obj/item/melee/blood_magic/New(loc, spell)
	source = spell
	uses = source.charges
	health_cost = source.health_cost
	..()

/obj/item/melee/blood_magic/Destroy()
	if(!QDELETED(source))
		if(uses <= 0)
			source.hand_magic = null
			qdel(source)
			source = null
		else
			source.hand_magic = null
			source.charges = uses
			source.desc = source.base_desc
			source.desc += "<br><b><u>Has [uses] use\s remaining</u></b>."
			source.UpdateButtonIcon()
	return ..()

/obj/item/melee/blood_magic/attack_self(mob/living/user)
	afterattack(user, user, TRUE)

/obj/item/melee/blood_magic/attack(mob/living/M, mob/living/carbon/user)
	if(!iscarbon(user) || !iscultist(user))
		uses = 0
		qdel(src)
		return
	log_combat(user, M, "used a cult spell on", source.name, "")
	M.lastattacker = user.real_name
	M.lastattackerckey = user.ckey

/obj/item/melee/blood_magic/afterattack(atom/target, mob/living/carbon/user, proximity)
	. = ..()
	if(invocation)
		user.whisper(invocation, language = /datum/language/common)
	if(health_cost)
		if(user.active_hand_index == 1)
			user.apply_damage(health_cost, BRUTE, BODY_ZONE_L_ARM)
		else
			user.apply_damage(health_cost, BRUTE, BODY_ZONE_R_ARM)
	if(uses <= 0)
		qdel(src)
	else if(source)
		source.desc = source.base_desc
		source.desc += "<br><b><u>Has [uses] use\s remaining</u></b>."
		source.UpdateButtonIcon()

//Stun
/obj/item/melee/blood_magic/stun
	name = "Stunning Aura"
	desc = ""
	color = RUNE_COLOR_RED
	invocation = "Fuu ma'jin!"

/obj/item/melee/blood_magic/stun/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!isliving(target) || !proximity)
		return
	var/mob/living/L = target
	if(iscultist(target))
		return
	if(iscultist(user))
		user.visible_message(span_warning("[user] holds up [user.p_their()] hand, which explodes in a flash of red light!"), \
							span_cultitalic("I attempt to stun [L] with the spell!"))

		user.mob_light(_range = 3, _color = LIGHT_COLOR_BLOOD_MAGIC, _duration = 0.2 SECONDS)

		var/anti_magic_source = L.anti_magic_check()
		if(anti_magic_source)

			L.mob_light(_range = 2, _color = LIGHT_COLOR_HOLY_MAGIC, _duration = 10 SECONDS)
			var/mutable_appearance/forbearance = mutable_appearance('icons/effects/genetics.dmi', "servitude", -MUTATIONS_LAYER)
			L.add_overlay(forbearance)
			addtimer(CALLBACK(L, TYPE_PROC_REF(/atom, cut_overlay), forbearance), 100)

			if(istype(anti_magic_source, /obj/item))
				var/obj/item/ams_object = anti_magic_source
				target.visible_message(span_warning("[L] starts to glow in a halo of light!"), \
									   span_danger("My [ams_object.name] begins to glow, emitting a blanket of holy light which surrounds you and protects you from the flash of light!"))
			else
				target.visible_message(span_warning("[L] starts to glow in a halo of light!"), \
									   span_danger("A feeling of warmth washes over you, rays of holy light surround my body and protect you from the flash of light!"))
		else
			to_chat(user, span_cultitalic("In a brilliant flash of red, [L] falls to the ground!"))
			L.Paralyze(160)
			L.flash_act(1,1)
			if(issilicon(target))
				var/mob/living/silicon/S = L
				S.emp_act(EMP_HEAVY)
			else if(iscarbon(target))
				var/mob/living/carbon/C = L
				C.silent += 6
				C.stuttering += 15
				C.cultslurring += 15
				C.Jitter(15)
		uses--
	..()

//Teleportation
/obj/item/melee/blood_magic/teleport
	name = "Teleporting Aura"
	color = RUNE_COLOR_TELEPORT
	desc = ""
	invocation = "Sas'so c'arta forbici!"

/obj/item/melee/blood_magic/teleport/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!iscultist(target) || !proximity)
		to_chat(user, span_warning("I can only teleport adjacent cultists with this spell!"))
		return
	if(iscultist(user))
		var/list/potential_runes = list()
		var/list/teleportnames = list()
		for(var/R in GLOB.teleport_runes)
			var/obj/effect/rune/teleport/T = R
			potential_runes[avoid_assoc_duplicate_keys(T.listkey, teleportnames)] = T

		if(!potential_runes.len)
			to_chat(user, span_warning("There are no valid runes to teleport to!"))
			log_game("Teleport talisman failed - no other teleport runes")
			return

		var/turf/T = get_turf(src)
		if(is_away_level(T.z))
			to_chat(user, span_cultitalic("I are not in the right dimension!"))
			log_game("Teleport spell failed - user in away mission")
			return

		var/input_rune_key = input(user, "Choose a rune to teleport to.", "Rune to Teleport to") as null|anything in potential_runes //we know what key they picked
		var/obj/effect/rune/teleport/actual_selected_rune = potential_runes[input_rune_key] //what rune does that key correspond to?
		if(QDELETED(src) || !user || !user.is_holding(src) || user.incapacitated() || !actual_selected_rune || !proximity)
			return
		var/turf/dest = get_turf(actual_selected_rune)
		if(is_blocked_turf(dest, TRUE))
			to_chat(user, span_warning("The target rune is blocked. You cannot teleport there."))
			return
		uses--
		var/turf/origin = get_turf(user)
		var/mob/living/L = target
		if(do_teleport(L, dest, channel = TELEPORT_CHANNEL_CULT))
			origin.visible_message(span_warning("Dust flows from [user]'s hand, and [user.p_they()] disappear[user.p_s()] with a sharp crack!"), \
				span_cultitalic("I speak the words of the talisman and find myself somewhere else!"), "<i>I hear a sharp crack.</i>")
			dest.visible_message(span_warning("There is a boom of outrushing air as something appears above the rune!"), null, "<i>I hear a boom.</i>")
		..()

//Shackles
/obj/item/melee/blood_magic/shackles
	name = "Shackling Aura"
	desc = ""
	invocation = "In'totum Lig'abis!"
	color = "#000000" // black

/obj/item/melee/blood_magic/shackles/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(iscultist(user) && iscarbon(target) && proximity)
		var/mob/living/carbon/C = target
		if(C.get_num_arms(FALSE) >= 2 || C.get_arm_ignore())
			CuffAttack(C, user)
		else
			user.visible_message(span_cultitalic("This victim doesn't have enough arms to complete the restraint!"))
			return
		..()

/obj/item/melee/blood_magic/shackles/proc/CuffAttack(mob/living/carbon/C, mob/living/user)
	if(!C.handcuffed)
		playsound(loc, 'sound/blank.ogg', 30, TRUE, -2)
		C.visible_message(span_danger("[user] begins restraining [C] with dark magic!"), \
								span_danger("[user] begins shaping dark magic shackles around my wrists!"))
		if(do_mob(user, C, 30))
			if(!C.handcuffed)
				C.handcuffed = new /obj/item/restraints/handcuffs/energy/cult/used(C)
				C.update_handcuffed()
				C.silent += 5
				to_chat(user, span_notice("I shackle [C]."))
				log_combat(user, C, "shackled")
				uses--
			else
				to_chat(user, span_warning("[C] is already bound."))
		else
			to_chat(user, span_warning("I fail to shackle [C]."))
	else
		to_chat(user, span_warning("[C] is already bound."))


/obj/item/restraints/handcuffs/energy/cult //For the shackling spell
	name = "shadow shackles"
	desc = ""
	trashtype = /obj/item/restraints/handcuffs/energy/used
	item_flags = DROPDEL

/obj/item/restraints/handcuffs/energy/cult/used/dropped(mob/user)
	user.visible_message(span_danger("[user]'s shackles shatter in a discharge of dark magic!"), \
							span_danger("My [src] shatters in a discharge of dark magic!"))
	. = ..()


//Construction: Converts 50 metal to a construct shell, plasteel to runed metal, airlock to brittle runed airlock, a borg to a construct, or borg shell to a construct shell
/obj/item/melee/blood_magic/construction
	name = "Twisting Aura"
	desc = ""
	invocation = "Ethra p'ni dedol!"
	color = "#000000" // black
	var/channeling = FALSE

/obj/item/melee/blood_magic/construction/examine(mob/user)
	. = ..()
	. += {"<u>A sinister spell used to convert:</u>\n
	Plasteel into runed metal\n
	[METAL_TO_CONSTRUCT_SHELL_CONVERSION] metal into a construct shell\n
	Living cyborgs into constructs after a delay\n
	Cyborg shells into construct shells\n
	Airlocks into brittle runed airlocks after a delay (harm intent)"}

/obj/item/melee/blood_magic/construction/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(proximity_flag && iscultist(user))
		if(channeling)
			to_chat(user, span_cultitalic("I are already invoking twisted construction!"))
			return
		var/turf/T = get_turf(target)
		if(istype(target, /obj/item/stack/sheet/metal))
			var/obj/item/stack/sheet/candidate = target
			if(candidate.use(METAL_TO_CONSTRUCT_SHELL_CONVERSION))
				uses--
				to_chat(user, span_warning("A dark cloud emanates from my hand and swirls around the metal, twisting it into a construct shell!"))
				new /obj/structure/constructshell(T)
				SEND_SOUND(user, sound('sound/blank.ogg',0,1,25))
			else
				to_chat(user, span_warning("I need [METAL_TO_CONSTRUCT_SHELL_CONVERSION] metal to produce a construct shell!"))
				return
		else if(istype(target, /obj/item/stack/sheet/plasteel))
			var/obj/item/stack/sheet/plasteel/candidate = target
			var/quantity = candidate.amount
			if(candidate.use(quantity))
				uses --
				new /obj/item/stack/sheet/runed_metal(T,quantity)
				to_chat(user, span_warning("A dark cloud emanates from you hand and swirls around the plasteel, transforming it into runed metal!"))
				SEND_SOUND(user, sound('sound/blank.ogg',0,1,25))
		else if(istype(target,/mob/living/silicon/robot))
			var/mob/living/silicon/robot/candidate = target
			if(candidate.mmi)
				channeling = TRUE
				user.visible_message(span_danger("A dark cloud emanates from [user]'s hand and swirls around [candidate]!"))
				playsound(T, 'sound/blank.ogg', 80, TRUE)
				var/prev_color = candidate.color
				candidate.color = "black"
				if(do_after(user, 90, target = candidate))
					candidate.emp_act(EMP_HEAVY)
					var/construct_class = alert(user, "Please choose which type of construct you wish to create.",,"Juggernaut","Wraith","Artificer")
					if(QDELETED(candidate))
						channeling = FALSE
						return
					user.visible_message(span_danger("The dark cloud receedes from what was formerly [candidate], revealing a\n [construct_class]!"))
					switch(construct_class)
						if("Juggernaut")
							makeNewConstruct(/mob/living/simple_animal/hostile/construct/armored, candidate, user, 0, T)
						if("Wraith")
							makeNewConstruct(/mob/living/simple_animal/hostile/construct/wraith, candidate, user, 0, T)
						if("Artificer")
							makeNewConstruct(/mob/living/simple_animal/hostile/construct/builder, candidate, user, 0, T)
					SEND_SOUND(user, sound('sound/blank.ogg',0,1,25))
					uses--
					candidate.mmi = null
					qdel(candidate)
					channeling = FALSE
				else
					channeling = FALSE
					candidate.color = prev_color
					return
			else
				uses--
				to_chat(user, span_warning("A dark cloud emanates from you hand and swirls around [candidate] - twisting it into a construct shell!"))
				new /obj/structure/constructshell(T)
				SEND_SOUND(user, sound('sound/blank.ogg',0,1,25))
				qdel(candidate)
		else if(istype(target,/obj/machinery/door/airlock))
			channeling = TRUE
			playsound(T, 'sound/blank.ogg', 50, TRUE)
			do_sparks(5, TRUE, target)
			if(do_after(user, 50, target = user))
				if(QDELETED(target))
					channeling = FALSE
					return
				target.narsie_act()
				uses--
				user.visible_message(span_warning("Black ribbons suddenly emanate from [user]'s hand and cling to the airlock - twisting and corrupting it!"))
				SEND_SOUND(user, sound('sound/blank.ogg',0,1,25))
				channeling = FALSE
			else
				channeling = FALSE
				return
		else
			to_chat(user, span_warning("The spell will not work on [target]!"))
			return
		..()

//Armor: Gives the target a basic cultist combat loadout
/obj/item/melee/blood_magic/armor
	name = "Arming Aura"
	desc = ""
	color = "#33cc33" // green

/obj/item/melee/blood_magic/armor/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(iscarbon(target) && proximity)
		uses--
		var/mob/living/carbon/C = target
		C.visible_message(span_warning("Otherworldly armor suddenly appears on [C]!"))
		C.equip_to_slot_or_del(new /obj/item/clothing/under/color/black,SLOT_PANTS)
		C.equip_to_slot_or_del(new /obj/item/clothing/suit/hooded/cultrobes/alt(user), SLOT_ARMOR)
		C.equip_to_slot_or_del(new /obj/item/clothing/shoes/cult/alt(user), SLOT_SHOES)
		C.equip_to_slot_or_del(new /obj/item/storage/backpack/cultpack(user), SLOT_BACK)
		if(C == user)
			qdel(src) //Clears the hands
		C.put_in_hands(new /obj/item/melee/cultblade(user))
		C.put_in_hands(new /obj/item/restraints/legcuffs/bola/cult(user))
		..()

/obj/item/melee/blood_magic/manipulator
	name = "Blood Rite Aura"
	desc = ""
	color = "#7D1717"

/obj/item/melee/blood_magic/manipulator/examine(mob/user)
	. = ..()
	. += "Blood spear, blood bolt barrage, and blood beam cost [BLOOD_SPEAR_COST], [BLOOD_BARRAGE_COST], and [BLOOD_BEAM_COST] charges respectively."

/obj/item/melee/blood_magic/manipulator/afterattack(atom/target, mob/living/carbon/human/user, proximity)
	if(proximity)
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			if(NOBLOOD in H.dna.species.species_traits)
				to_chat(user,span_warning("Blood rites do not work on species with no blood!"))
				return
			if(iscultist(H))
				if(H.stat == DEAD)
					to_chat(user,span_warning("Only a revive rune can bring back the dead!"))
					return
				if(H.blood_volume < BLOOD_VOLUME_SAFE)
					var/restore_blood = BLOOD_VOLUME_SAFE - H.blood_volume
					if(uses*2 < restore_blood)
						H.blood_volume += uses*2
						to_chat(user,span_danger("I use the last of my blood rites to restore what blood you could!"))
						uses = 0
						return ..()
					else
						H.blood_volume = BLOOD_VOLUME_SAFE
						uses -= round(restore_blood/2)
						to_chat(user,span_warning("My blood rites have restored [H == user ? "your" : "[H.p_their()]"] blood to safe levels!"))
				var/overall_damage = H.getBruteLoss() + H.getFireLoss() + H.getToxLoss() + H.getOxyLoss()
				if(overall_damage == 0)
					to_chat(user,span_cult("That cultist doesn't require healing!"))
				else
					var/ratio = uses/overall_damage
					if(H == user)
						to_chat(user,span_cult("<b>My blood healing is far less efficient when used on yourself!</b>"))
						ratio *= 0.35 // Healing is half as effective if you can't perform a full heal
						uses -= round(overall_damage) // Healing is 65% more "expensive" even if you can still perform the full heal
					if(ratio>1)
						ratio = 1
						uses -= round(overall_damage)
						H.visible_message(span_warning("[H] is fully healed by [H==user ? "[H.p_their()]":"[H]'s"]'s blood magic!"))
					else
						H.visible_message(span_warning("[H] is partially healed by [H==user ? "[H.p_their()]":"[H]'s"] blood magic."))
						uses = 0
					ratio *= -1
					H.adjustOxyLoss((overall_damage*ratio) * (H.getOxyLoss() / overall_damage), 0)
					H.adjustToxLoss((overall_damage*ratio) * (H.getToxLoss() / overall_damage), 0)
					H.adjustFireLoss((overall_damage*ratio) * (H.getFireLoss() / overall_damage), 0)
					H.adjustBruteLoss((overall_damage*ratio) * (H.getBruteLoss() / overall_damage), 0)
					H.updatehealth()
					playsound(get_turf(H), 'sound/blank.ogg', 25)
					new /obj/effect/temp_visual/cult/sparks(get_turf(H))
					user.Beam(H,icon_state="sendbeam",time=15)
			else
				if(H.stat == DEAD)
					to_chat(user,span_warning("[H.p_their(TRUE)] blood has stopped flowing, you'll have to find another way to extract it."))
					return
				if(H.cultslurring)
					to_chat(user,span_danger("[H.p_their(TRUE)] blood has been tainted by an even stronger form of blood magic, it's no use to us like this!"))
					return
				if(H.blood_volume > BLOOD_VOLUME_SAFE)
					H.blood_volume -= 100
					uses += 50
					user.Beam(H,icon_state="drainbeam",time=10)
					playsound(get_turf(H), 'sound/blank.ogg', 50)
					H.visible_message(span_danger("[user] has drained some of [H]'s blood!"))
					to_chat(user,span_cultitalic("My blood rite gains 50 charges from draining [H]'s blood."))
					new /obj/effect/temp_visual/cult/sparks(get_turf(H))
				else
					to_chat(user,span_warning("[H.p_theyre(TRUE)] missing too much blood - you cannot drain [H.p_them()] further!"))
					return
		if(isconstruct(target))
			var/mob/living/simple_animal/M = target
			var/missing = M.maxHealth - M.health
			if(missing)
				if(uses > missing)
					M.adjustHealth(-missing)
					M.visible_message(span_warning("[M] is fully healed by [user]'s blood magic!"))
					uses -= missing
				else
					M.adjustHealth(-uses)
					M.visible_message(span_warning("[M] is partially healed by [user]'s blood magic!"))
					uses = 0
				playsound(get_turf(M), 'sound/blank.ogg', 25)
				user.Beam(M,icon_state="sendbeam",time=10)
		if(istype(target, /obj/effect/decal/cleanable/blood))
			blood_draw(target, user)
		..()

/obj/item/melee/blood_magic/manipulator/proc/blood_draw(atom/target, mob/living/carbon/human/user)
	var/temp = 0
	var/turf/T = get_turf(target)
	if(T)
		for(var/obj/effect/decal/cleanable/blood/B in view(T, 2))
			if(B.blood_state == BLOOD_STATE_HUMAN)
				if(B.bloodiness == 100) //Bonus for "pristine" bloodpools, also to prevent cheese with footprint spam
					temp += 30
				else
					temp += max((B.bloodiness**2)/800,1)
				new /obj/effect/temp_visual/cult/turf/floor(get_turf(B))
				qdel(B)
		for(var/obj/effect/decal/cleanable/trail_holder/TH in view(T, 2))
			qdel(TH)
		var/obj/item/clothing/shoes/shoecheck = user.shoes
		if(shoecheck && shoecheck.bloody_shoes[/datum/reagent/blood])
			temp += shoecheck.bloody_shoes[/datum/reagent/blood]/20
			shoecheck.bloody_shoes[/datum/reagent/blood] = 0
		if(temp)
			user.Beam(T,icon_state="drainbeam",time=15)
			new /obj/effect/temp_visual/cult/sparks(get_turf(user))
			playsound(T, 'sound/blank.ogg', 50)
			to_chat(user, span_cultitalic("My blood rite has gained [round(temp)] charge\s from blood sources around you!"))
			uses += max(1, round(temp))

/obj/item/melee/blood_magic/manipulator/attack_self(mob/living/user)
	if(iscultist(user))
		var/list/options = list("Blood Spear (150)", "Blood Bolt Barrage (300)", "Blood Beam (500)")
		var/choice = input(user, "Choose a greater blood rite...", "Greater Blood Rites") as null|anything in options
		if(!choice)
			to_chat(user, span_cultitalic("I decide against conducting a greater blood rite."))
			return
		switch(choice)
			if("Blood Spear (150)")
				if(uses < BLOOD_SPEAR_COST)
					to_chat(user, span_cultitalic("I need [BLOOD_SPEAR_COST] charges to perform this rite."))
				else
					uses -= BLOOD_SPEAR_COST
					var/turf/T = get_turf(user)
					qdel(src)
					var/datum/action/innate/cult/spear/S = new(user)
					var/obj/item/twohanded/cult_spear/rite = new(T)
					S.Grant(user, rite)
					rite.spear_act = S
					if(user.put_in_hands(rite))
						to_chat(user, span_cultitalic("A [rite.name] appears in my hand!"))
					else
						user.visible_message(span_warning("A [rite.name] appears at [user]'s feet!"), \
							 span_cultitalic("A [rite.name] materializes at my feet."))
			if("Blood Bolt Barrage (300)")
				if(uses < BLOOD_BARRAGE_COST)
					to_chat(user, span_cultitalic("I need [BLOOD_BARRAGE_COST] charges to perform this rite."))
				else
					var/obj/rite = new /obj/item/gun/ballistic/rifle/boltaction/enchanted/arcane_barrage/blood()
					uses -= BLOOD_BARRAGE_COST
					qdel(src)
					if(user.put_in_hands(rite))
						to_chat(user, span_cult("<b>My hands glow with power!</b>"))
					else
						to_chat(user, span_cultitalic("I need a free hand for this rite!"))
						qdel(rite)
			if("Blood Beam (500)")
				if(uses < BLOOD_BEAM_COST)
					to_chat(user, span_cultitalic("I need [BLOOD_BEAM_COST] charges to perform this rite."))
				else
					var/obj/rite = new /obj/item/blood_beam()
					uses -= BLOOD_BEAM_COST
					qdel(src)
					if(user.put_in_hands(rite))
						to_chat(user, span_cultlarge("<b>My hands glow with POWER OVERWHELMING!!!</b>"))
					else
						to_chat(user, span_cultitalic("I need a free hand for this rite!"))
						qdel(rite)

