GLOBAL_LIST_EMPTY(sacrificed) //a mixed list of minds and mobs
GLOBAL_LIST(rune_types2)//added a 2 until I can get rid of old cult code, it was conflicting with the new teleport runes
GLOBAL_LIST_EMPTY(teleport_runes2)//added a 2 until I can get rid of old cult code, it was conflicting with the new teleport runes
GLOBAL_LIST_EMPTY(wall_runes)

/*

This file contains runes.
Runes are used by the cult to cause many different effects and are paramount to their success.
They are drawn with a ritual dagger in blood, and are distinguishable to cultists and normal crew by examining.
Fake runes can be drawn in crayon to fool people.
Runes can either be invoked by one's self or with many different cultists. Each rune has a specific incantation that the cultists will say when invoking it.


*/

/obj/effect/rune
	name = "rune"
	var/cultist_name = "basic rune"
	desc = ""
	var/cultist_desc = "" //This is shown to cultists who examine the rune in order to determine its true purpose.
	anchored = TRUE
	icon = 'icons/obj/rune.dmi'
	icon_state = "1"
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = SIGIL_LAYER
	color = RUNE_COLOR_RED

	var/invocation = "Aiy ele-mayo!" //This is said by cultists when the rune is invoked.
	var/req_cultists = 1 //The amount of cultists required around the rune to invoke it. If only 1, any cultist can invoke it.
	var/req_cultists_text //if we have a description override for required cultists to invoke
	var/rune_in_use = FALSE // Used for some runes, this is for when you want a rune to not be usable when in use.

	var/scribe_delay = 40 //how long the rune takes to create
	var/scribe_damage = 0.1 //how much damage you take doing it
	var/invoke_damage = 0 //how much damage invokers take when invoking it
	var/construct_invoke = TRUE //if constructs can invoke it

	var/req_keyword = 0 //If the rune requires a keyword - go figure amirite
	var/keyword //The actual keyword for the rune

/obj/effect/rune/Initialize(mapload, set_keyword)
	. = ..()
	if(set_keyword)
		keyword = set_keyword
	var/image/I = image(icon = 'icons/effects/blood.dmi', icon_state = null, loc = src)
	I.override = TRUE
	add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/silicons, "cult_runes", I)

/obj/effect/rune/examine(mob/user)
	. = ..()
	if(iscultist(user) || user.stat == DEAD) //If they're a cultist or a ghost, tell them the effects
		. += "<b>Name:</b> [cultist_name]\n"+\
		"<b>Effects:</b> [capitalize(cultist_desc)]\n"+\
		"<b>Required Acolytes:</b> [req_cultists_text ? "[req_cultists_text]":"[req_cultists]"]"
		if(req_keyword && keyword)
			. += "<b>Keyword:</b> [keyword]"

/obj/effect/rune/attackby(obj/I, mob/user, params)
	if(istype(I, /obj/item/melee/cultblade/dagger) && iscultist(user))
		SEND_SOUND(user,'sound/blank.ogg')
		if(do_after(user, 15, target = src))
			to_chat(user, span_notice("I carefully erase the [lowertext(cultist_name)] rune."))
			qdel(src)
	else if(istype(I, /obj/item/nullrod))
		user.say("BEGONE FOUL MAGIKS!!", forced = "nullrod")
		to_chat(user, span_danger("I disrupt the magic of [src] with [I]."))
		qdel(src)

/obj/effect/rune/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!iscultist(user))
		to_chat(user, span_warning("I aren't able to understand the words of [src]."))
		return
	var/list/invokers = can_invoke(user)
	if(invokers.len >= req_cultists)
		invoke(invokers)
	else
		to_chat(user, span_danger("I need [req_cultists - invokers.len] more adjacent cultists to use this rune in such a manner."))
		fail_invoke()

/obj/effect/rune/attack_animal(mob/living/simple_animal/M)
	if(istype(M, /mob/living/simple_animal/shade) || istype(M, /mob/living/simple_animal/hostile/construct))
		if(istype(M, /mob/living/simple_animal/hostile/construct/wraith/angelic) || istype(M, /mob/living/simple_animal/hostile/construct/armored/angelic) || istype(M, /mob/living/simple_animal/hostile/construct/builder/angelic))
			to_chat(M, span_warning("I purge the rune!"))
			qdel(src)
		else if(construct_invoke || !iscultist(M)) //if you're not a cult construct we want the normal fail message
			attack_hand(M)
		else
			to_chat(M, span_warning("I are unable to invoke the rune!"))

/obj/effect/rune/proc/conceal() //for talisman of revealing/hiding
	visible_message(span_danger("[src] fades away."))
	invisibility = INVISIBILITY_OBSERVER
	alpha = 100 //To help ghosts distinguish hidden runes

/obj/effect/rune/proc/reveal() //for talisman of revealing/hiding
	invisibility = 0
	visible_message(span_danger("[src] suddenly appears!"))
	alpha = initial(alpha)

/*

There are a few different procs each rune runs through when a cultist activates it.
can_invoke() is called when a cultist activates the rune with an empty hand. If there are multiple cultists, this rune determines if the required amount is nearby.
invoke() is the rune's actual effects.
fail_invoke() is called when the rune fails, via not enough people around or otherwise. Typically this just has a generic 'fizzle' effect.
structure_check() searches for nearby cultist structures required for the invocation. Proper structures are pylons, forges, archives, and altars.

*/

/obj/effect/rune/proc/can_invoke(mob/living/user=null)
	//This proc determines if the rune can be invoked at the time. If there are multiple required cultists, it will find all nearby cultists.
	var/list/invokers = list() //people eligible to invoke the rune
	if(user)
		invokers += user
	if(req_cultists > 1 || istype(src, /obj/effect/rune/convert))
		var/list/things_in_range = range(1, src)
		for(var/mob/living/L in things_in_range)
			if(iscultist(L))
				if(L == user)
					continue
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					if((HAS_TRAIT(H, TRAIT_MUTE)) || H.silent)
						continue
				if(L.stat)
					continue
				invokers += L
	return invokers

/obj/effect/rune/proc/invoke(list/invokers)
	//This proc contains the effects of the rune as well as things that happen afterwards. If you want it to spawn an object and then delete itself, have both here.
	for(var/M in invokers)
		if(isliving(M))
			var/mob/living/L = M
			if(invocation)
				L.say(invocation, language = /datum/language/common, ignore_spam = TRUE, forced = "cult invocation")
			if(invoke_damage)
				L.apply_damage(invoke_damage, BRUTE)
				to_chat(L, span_cultitalic("[src] saps my strength!"))
		else if(istype(M, /obj/item/toy/plush/narplush))
			var/obj/item/toy/plush/narplush/P = M
			P.visible_message(span_cultitalic("[P] squeaks loudly!"))
	do_invoke_glow()

/obj/effect/rune/proc/do_invoke_glow()
	set waitfor = FALSE
	animate(src, transform = matrix()*2, alpha = 0, time = 5, flags = ANIMATION_END_NOW) //fade out
	sleep(5)
	animate(src, transform = matrix(), alpha = 255, time = 0, flags = ANIMATION_END_NOW)

/obj/effect/rune/proc/fail_invoke()
	//This proc contains the effects of a rune if it is not invoked correctly, through either invalid wording or not enough cultists. By default, it's just a basic fizzle.
	visible_message(span_warning("The markings pulse with a small flash of red light, then fall dark."))
	var/oldcolor = color
	color = rgb(255, 0, 0)
	animate(src, color = oldcolor, time = 5)
	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_atom_colour)), 5)

//Malformed Rune: This forms if a rune is not drawn correctly. Invoking it does nothing but hurt the user.
/obj/effect/rune/malformed
	cultist_name = "malformed rune"
	cultist_desc = ""
	invocation = "Ra'sha yoka!"
	invoke_damage = 30

/obj/effect/rune/malformed/Initialize(mapload, set_keyword)
	. = ..()
	icon_state = "[rand(1,7)]"
	color = rgb(rand(0,255), rand(0,255), rand(0,255))

/obj/effect/rune/malformed/invoke(list/invokers)
	..()
	qdel(src)

//Rite of Offering: Converts or sacrifices a target.
/obj/effect/rune/convert
	cultist_name = "Offer"
	cultist_desc = ""
	req_cultists_text = "2 for conversion, 3 for living sacrifices and sacrifice targets."
	invocation = "Mah'weyh pleggh at e'ntrath!"
	icon_state = "3"
	color = RUNE_COLOR_OFFER
	req_cultists = 1
	rune_in_use = FALSE

/obj/effect/rune/convert/do_invoke_glow()
	return

/obj/effect/rune/convert/invoke(list/invokers)
	if(rune_in_use)
		return
	var/list/myriad_targets = list()
	var/turf/T = get_turf(src)
	for(var/mob/living/M in T)
		if(!iscultist(M))
			myriad_targets |= M
	if(!myriad_targets.len)
		fail_invoke()
		log_game("Offer rune failed - no eligible targets")
		return
	rune_in_use = TRUE
	visible_message(span_warning("[src] pulses blood red!"))
	var/oldcolor = color
	color = RUNE_COLOR_DARKRED
	var/mob/living/L = pick(myriad_targets)

	var/mob/living/F = invokers[1]
	var/datum/antagonist/cult/C = F.mind.has_antag_datum(/datum/antagonist/cult,TRUE)
	var/datum/team/cult/Cult_team = C.cult_team
	var/is_convertable = is_convertable_to_cult(L,C.cult_team)
	if(L.stat != DEAD && is_convertable)
		invocation = "Mah'weyh pleggh at e'ntrath!"
		..()
		if(is_convertable)
			do_convert(L, invokers)
	else
		invocation = "Barhah hra zar'garis!"
		..()
		do_sacrifice(L, invokers)
	animate(src, color = oldcolor, time = 5)
	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_atom_colour)), 5)
	Cult_team.check_size() // Triggers the eye glow or aura effects if the cult has grown large enough relative to the crew
	rune_in_use = FALSE

/obj/effect/rune/convert/proc/do_convert(mob/living/convertee, list/invokers)
	if(invokers.len < 2)
		for(var/M in invokers)
			to_chat(M, span_warning("I need at least two invokers to convert [convertee]!"))
		log_game("Offer rune failed - tried conversion with one invoker")
		return 0
	if(convertee.anti_magic_check(TRUE, TRUE, FALSE, 0)) //Not chargecost because it can be spammed
		for(var/M in invokers)
			to_chat(M, span_warning("Something is shielding [convertee]'s mind!"))
		log_game("Offer rune failed - convertee had anti-magic")
		return 0
	var/brutedamage = convertee.getBruteLoss()
	var/burndamage = convertee.getFireLoss()
	if(brutedamage || burndamage)
		convertee.adjustBruteLoss(-(brutedamage * 0.75))
		convertee.adjustFireLoss(-(burndamage * 0.75))
	convertee.visible_message("<span class='warning'>[convertee] writhes in pain \
	[brutedamage || burndamage ? "even as [convertee.p_their()] wounds heal and close" : "as the markings below [convertee.p_them()] glow a bloody red"]!</span>", \
 	span_cultlarge("<i>AAAAAAAAAAAAAA-</i>"))
	SSticker.mode.add_cultist(convertee.mind, 1)
	new /obj/item/melee/cultblade/dagger(get_turf(src))
	convertee.mind.special_role = ROLE_CULTIST
	to_chat(convertee, "<span class='cult italic'><b>My blood pulses. Your head throbs. The world goes red. All at once you are aware of a horrible, horrible, truth. The veil of reality has been ripped away \
	and something evil takes root.</b></span>")
	to_chat(convertee, "<span class='cult italic'><b>Assist my new compatriots in their dark dealings. Your goal is theirs, and theirs is yours. You serve the Geometer above all else. Bring it back.\
	</b></span>")
	if(ishuman(convertee))
		var/mob/living/carbon/human/H = convertee
		H.uncuff()
		H.stuttering = 0
		H.cultslurring = 0
	return 1

/obj/effect/rune/convert/proc/do_sacrifice(mob/living/sacrificial, list/invokers)
	var/mob/living/first_invoker = invokers[1]
	if(!first_invoker)
		return FALSE
	var/datum/antagonist/cult/C = first_invoker.mind.has_antag_datum(/datum/antagonist/cult,TRUE)
	if(!C)
		return


	var/big_sac = FALSE
	if((((ishuman(sacrificial) || iscyborg(sacrificial)) && sacrificial.stat != DEAD) || C.cult_team.is_sacrifice_target(sacrificial.mind)) && invokers.len < 3)
		for(var/M in invokers)
			to_chat(M, span_cultitalic("[sacrificial] is too greatly linked to the world! You need three acolytes!"))
		log_game("Offer rune failed - not enough acolytes and target is living or sac target")
		return FALSE
	if(sacrificial.mind)
		GLOB.sacrificed += sacrificial.mind
		for(var/datum/objective/sacrifice/sac_objective in C.cult_team.objectives)
			if(sac_objective.target == sacrificial.mind)
				sac_objective.sacced = TRUE
				sac_objective.update_explanation_text()
				big_sac = TRUE
	else
		GLOB.sacrificed += sacrificial

	new /obj/effect/temp_visual/cult/sac(get_turf(src))
	for(var/M in invokers)
		if(big_sac)
			to_chat(M, span_cultlarge("\"Yes! This is the one I desire! You have done well.\""))
		else
			if(ishuman(sacrificial) || iscyborg(sacrificial))
				to_chat(M, span_cultlarge("\"I accept this sacrifice.\""))
			else
				to_chat(M, span_cultlarge("\"I accept this meager sacrifice.\""))

	var/obj/item/soulstone/stone = new /obj/item/soulstone(get_turf(src))
	if(sacrificial.mind && !sacrificial.suiciding)
		stone.invisibility = INVISIBILITY_MAXIMUM //so it's not picked up during transfer_soul()
		stone.transfer_soul("FORCE", sacrificial, usr)
		stone.invisibility = 0

	if(sacrificial)
		if(iscyborg(sacrificial))
			playsound(sacrificial, 'sound/blank.ogg', 100, TRUE)
			sacrificial.dust() //To prevent the MMI from remaining
		else
			playsound(sacrificial, 'sound/blank.ogg', 100, TRUE)
			sacrificial.gib()
	return TRUE



/obj/effect/rune/empower
	cultist_name = "Empower"
	cultist_desc = ""
	invocation = "H'drak v'loso, mir'kanas verbot!"
	icon_state = "3"
	color = RUNE_COLOR_TALISMAN
	construct_invoke = FALSE

/obj/effect/rune/empower/invoke(list/invokers)
	. = ..()
	var/mob/living/user = invokers[1] //the first invoker is always the user
	for(var/datum/action/innate/cult/blood_magic/BM in user.actions)
		BM.Activate()

/obj/effect/rune/teleport
	cultist_name = "Teleport"
	cultist_desc = ""
	invocation = "Sas'so c'arta forbici!"
	icon_state = "2"
	color = RUNE_COLOR_TELEPORT
	req_keyword = TRUE
	light_power = 4
	var/obj/effect/temp_visual/cult/portal/inner_portal //The portal "hint" for off-station teleportations
	var/obj/effect/temp_visual/cult/rune_spawn/rune2/outer_portal
	var/listkey


/obj/effect/rune/teleport/Initialize(mapload, set_keyword)
	. = ..()
	var/area/A = get_area(src)
	var/locname = initial(A.name)
	listkey = set_keyword ? "[set_keyword] [locname]":"[locname]"
	GLOB.teleport_runes2 += src

/obj/effect/rune/teleport/Destroy()
	GLOB.teleport_runes2 -= src
	return ..()

/obj/effect/rune/teleport/invoke(list/invokers)
	var/mob/living/user = invokers[1] //the first invoker is always the user
	var/list/potential_runes = list()
	var/list/teleportnames = list()
	for(var/R in GLOB.teleport_runes2)
		var/obj/effect/rune/teleport/T = R
		if(T != src && !is_away_level(T.z))
			potential_runes[avoid_assoc_duplicate_keys(T.listkey, teleportnames)] = T

	if(!potential_runes.len)
		to_chat(user, span_warning("There are no valid runes to teleport to!"))
		log_game("Teleport rune failed - no other teleport runes")
		fail_invoke()
		return

	var/turf/T = get_turf(src)
	if(is_away_level(T.z))
		to_chat(user, span_cultitalic("I are not in the right dimension!"))
		log_game("Teleport rune failed - user in away mission")
		fail_invoke()
		return

	var/input_rune_key = input(user, "Choose a rune to teleport to.", "Rune to Teleport to") as null|anything in potential_runes //we know what key they picked
	var/obj/effect/rune/teleport/actual_selected_rune = potential_runes[input_rune_key] //what rune does that key correspond to?
	if(!Adjacent(user) || !src || QDELETED(src) || user.incapacitated() || !actual_selected_rune)
		fail_invoke()
		return

	var/turf/target = get_turf(actual_selected_rune)
	if(is_blocked_turf(target, TRUE))
		to_chat(user, span_warning("The target rune is blocked. Attempting to teleport to it would be massively unwise."))
		fail_invoke()
		return
	var/movedsomething = FALSE
	var/moveuserlater = FALSE
	var/movesuccess = FALSE
	for(var/atom/movable/A in T)
		if(istype(A, /obj/effect/dummy/phased_mob))
			continue
		if(ismob(A))
			if(!isliving(A)) //Let's not teleport ghosts and AI eyes.
				continue
			if(ishuman(A))
				new /obj/effect/temp_visual/dir_setting/cult/phase/out(T, A.dir)
				new /obj/effect/temp_visual/dir_setting/cult/phase(target, A.dir)
		if(A == user)
			moveuserlater = TRUE
			movedsomething = TRUE
			continue
		if(!A.anchored)
			movedsomething = TRUE
			if(do_teleport(A, target, forceMove = TRUE, channel = TELEPORT_CHANNEL_CULT))
				movesuccess = TRUE
	if(movedsomething)
		..()
		if(moveuserlater)
			if(do_teleport(user, target, channel = TELEPORT_CHANNEL_CULT))
				movesuccess = TRUE
		if(movesuccess)
			visible_message(span_warning("There is a sharp crack of inrushing air, and everything above the rune disappears!"), null, "<i>I hear a sharp crack.</i>")
			to_chat(user, span_cult("You[moveuserlater ? "r vision blurs, and you suddenly appear somewhere else":" send everything above the rune away"]."))
		else
			to_chat(user, span_cult("You[moveuserlater ? "r vision blurs briefly, but nothing happens":" try send everything above the rune away, but the teleportation fails"]."))
		if(is_mining_level(z) && !is_mining_level(target.z)) //No effect if you stay on lavaland
			actual_selected_rune.handle_portal("lava")
		else
			var/area/A = get_area(T)
			if(A.map_name == "Space")
				actual_selected_rune.handle_portal("space", T)
		if(movesuccess)
			target.visible_message(span_warning("There is a boom of outrushing air as something appears above the rune!"), null, "<i>I hear a boom.</i>")
	else
		fail_invoke()

/obj/effect/rune/teleport/proc/handle_portal(portal_type, turf/origin)
	var/turf/T = get_turf(src)
	close_portal() // To avoid stacking descriptions/animations
	playsound(T, pick('sound/blank.ogg'), 100, TRUE, 14)
	inner_portal = new /obj/effect/temp_visual/cult/portal(T)
	if(portal_type == "space")
		light_color = color
		desc += "<br><b>A tear in reality reveals a black void interspersed with dots of light... something recently teleported here from space.<br><u>The void feels like it's trying to pull you to the [dir2text(get_dir(T, origin))]!</u></b>"
	else
		inner_portal.icon_state = "lava"
		light_color = LIGHT_COLOR_FIRE
		desc += "<br><b>A tear in reality reveals a coursing river of lava... something recently teleported here from the Lavaland Mines!</b>"
	outer_portal = new(T, 600, color)
	light_range = 4
	update_light()
	addtimer(CALLBACK(src, PROC_REF(close_portal)), 600, TIMER_UNIQUE)

/obj/effect/rune/teleport/proc/close_portal()
	qdel(inner_portal)
	qdel(outer_portal)
	desc = initial(desc)
	light_range = 0
	update_light()

//Ritual of Dimensional Rending: Calls forth the avatar of Nar'Sie upon the station.
/obj/effect/rune/narsie
	cultist_name = "Nar'Sie"
	cultist_desc = ""
	invocation = "TOK-LYR RQA-NAP G'OLT-ULOFT!!"
	req_cultists = 9
	icon = 'icons/effects/96x96.dmi'
	color = RUNE_COLOR_DARKRED
	icon_state = "rune_large"
	pixel_x = -32 //So the big ol' 96x96 sprite shows up right
	pixel_y = -32
	scribe_delay = 500 //how long the rune takes to create
	scribe_damage = 40.1 //how much damage you take doing it
	var/used = FALSE

/obj/effect/rune/narsie/Initialize(mapload, set_keyword)
	. = ..()
	GLOB.poi_list |= src

/obj/effect/rune/narsie/Destroy()
	GLOB.poi_list -= src
	. = ..()

/obj/effect/rune/narsie/conceal() //can't hide this, and you wouldn't want to
	return

/obj/effect/rune/narsie/invoke(list/invokers)
	if(used)
		return
	if(!is_station_level(z))
		return
	var/mob/living/user = invokers[1]
	var/datum/antagonist/cult/user_antag = user.mind.has_antag_datum(/datum/antagonist/cult,TRUE)
	var/datum/objective/eldergod/summon_objective = locate() in user_antag.cult_team.objectives
	var/area/place = get_area(src)
	if(!(place in summon_objective.summon_spots))
		to_chat(user, span_cultlarge("The Geometer can only be summoned where the veil is weak - in [english_list(summon_objective.summon_spots)]!"))
		return
	if(locate(/obj/singularity/narsie) in GLOB.poi_list)
		for(var/M in invokers)
			to_chat(M, span_warning("Nar'Sie is already on this plane!"))
		log_game("Nar'Sie rune failed - already summoned")
		return
	//BEGIN THE SUMMONING
	used = TRUE
	..()
	sound_to_playing_players('sound/blank.ogg')
	var/turf/T = get_turf(src)
	sleep(40)
	if(src)
		color = RUNE_COLOR_RED
	new /obj/singularity/narsie/large/cult(T) //Causes Nar'Sie to spawn even if the rune has been removed

/obj/effect/rune/narsie/attackby(obj/I, mob/user, params)	//Since the narsie rune takes a long time to make, add logging to removal.
	if((istype(I, /obj/item/melee/cultblade/dagger) && iscultist(user)))
		user.visible_message(span_warning("[user.name] begins erasing [src]..."), span_notice("I begin erasing [src]..."))
		if(do_after(user, 50, target = src))	//Prevents accidental erasures.
			log_game("Summon Narsie rune erased by [key_name(user)] with [I.name]")
			message_admins("[ADMIN_LOOKUPFLW(user)] erased a Narsie rune with [I.name]")
			..()
	else
		if(istype(I, /obj/item/nullrod))	//Begone foul magiks. You cannot hinder me.
			log_game("Summon Narsie rune erased by [key_name(user)] using a null rod")
			message_admins("[ADMIN_LOOKUPFLW(user)] erased a Narsie rune with a null rod")
			..()

//Rite of Resurrection: Requires a dead or inactive cultist. When reviving the dead, you can only perform one revival for every sacrifice my cult has carried out.
/obj/effect/rune/raise_dead
	cultist_name = "Revive"
	cultist_desc = ""
	invocation = "Pasnar val'keriam usinar. Savrae ines amutan. Yam'toth remium il'tarat!" //Depends on the name of the user - see below
	icon_state = "1"
	color = RUNE_COLOR_MEDIUMRED
	var/static/revives_used = -SOULS_TO_REVIVE // Cultists get one "free" revive

/obj/effect/rune/raise_dead/examine(mob/user)
	. = ..()
	if(iscultist(user) || user.stat == DEAD)
		var/revive_number = LAZYLEN(GLOB.sacrificed) - revives_used
		. += "<b>Revives Remaining:</b> [revive_number]"

/obj/effect/rune/raise_dead/invoke(list/invokers)
	var/turf/T = get_turf(src)
	var/mob/living/mob_to_revive
	var/list/potential_revive_mobs = list()
	var/mob/living/user = invokers[1]
	if(rune_in_use)
		return
	rune_in_use = TRUE
	for(var/mob/living/M in T.contents)
		if(iscultist(M) && (M.stat == DEAD || !M.client || M.client.is_afk()))
			potential_revive_mobs |= M
	if(!potential_revive_mobs.len)
		to_chat(user, span_cultitalic("There are no dead cultists on the rune!"))
		log_game("Raise Dead rune failed - no cultists to revive")
		fail_invoke()
		return
	if(potential_revive_mobs.len > 1)
		mob_to_revive = input(user, "Choose a cultist to revive.", "Cultist to Revive") as null|anything in potential_revive_mobs
	else
		mob_to_revive = potential_revive_mobs[1]
	if(QDELETED(src) || !validness_checks(mob_to_revive, user))
		fail_invoke()
		return
	if(user.name == "Herbert West")
		invocation = "To life, to life, I bring them!"
	else
		invocation = initial(invocation)
	..()
	if(mob_to_revive.stat == DEAD)
		var/diff = LAZYLEN(GLOB.sacrificed) - revives_used - SOULS_TO_REVIVE
		if(diff < 0)
			to_chat(user, span_warning("My cult must carry out [abs(diff)] more sacrifice\s before it can revive another cultist!"))
			fail_invoke()
			return
		revives_used += SOULS_TO_REVIVE
		mob_to_revive.revive(full_heal = TRUE, admin_revive = TRUE) //This does remove traits and such, but the rune might actually see some use because of it!
		mob_to_revive.grab_ghost()
	if(!mob_to_revive.client || mob_to_revive.client.is_afk())
		set waitfor = FALSE
		var/list/mob/dead/observer/candidates = pollCandidatesForMob("Do you want to play as a [mob_to_revive.name], an inactive blood cultist?", ROLE_CULTIST, null, ROLE_CULTIST, 50, mob_to_revive)
		if(LAZYLEN(candidates))
			var/mob/dead/observer/C = pick(candidates)
			to_chat(mob_to_revive.mind, "Your physical form has been taken over by another soul due to my inactivity! Ahelp if you wish to regain my form.")
			message_admins("[key_name_admin(C)] has taken control of ([key_name_admin(mob_to_revive)]) to replace an AFK player.")
			mob_to_revive.ghostize(0)
			mob_to_revive.key = C.key
		else
			fail_invoke()
			return
	SEND_SOUND(mob_to_revive, 'sound/blank.ogg')
	to_chat(mob_to_revive, span_cultlarge("\"PASNAR SAVRAE YAM'TOTH. Arise.\""))
	mob_to_revive.visible_message(span_warning("[mob_to_revive] draws in a huge breath, red light shining from [mob_to_revive.p_their()] eyes."), \
								  span_cultlarge("I awaken suddenly from the void. You're alive!"))
	rune_in_use = FALSE

/obj/effect/rune/raise_dead/proc/validness_checks(mob/living/target_mob, mob/living/user)
	var/turf/T = get_turf(src)
	if(QDELETED(user))
		return FALSE
	if(!Adjacent(user) || user.incapacitated())
		return FALSE
	if(QDELETED(target_mob))
		return FALSE
	if(!(target_mob in T.contents))
		to_chat(user, span_cultitalic("The cultist to revive has been moved!"))
		log_game("Raise Dead rune failed - revival target moved")
		return FALSE
	return TRUE

/obj/effect/rune/raise_dead/fail_invoke()
	..()
	rune_in_use = FALSE
	for(var/mob/living/M in range(1,src))
		if(iscultist(M) && M.stat == DEAD)
			M.visible_message(span_warning("[M] twitches."))

//Rite of the Corporeal Shield: When invoked, becomes solid and cannot be passed. Invoke again to undo.
/obj/effect/rune/wall
	cultist_name = "Barrier"
	cultist_desc = ""
	invocation = "Khari'd! Eske'te tannin!"
	icon_state = "4"
	color = RUNE_COLOR_DARKRED
	CanAtmosPass = ATMOS_PASS_DENSITY
	var/datum/timedevent/density_timer
	var/recharging = FALSE

/obj/effect/rune/wall/Initialize(mapload, set_keyword)
	. = ..()
	GLOB.wall_runes += src

/obj/effect/rune/wall/examine(mob/user)
	. = ..()
	if(density && iscultist(user))
		if(density_timer)
			. += span_cultitalic("The air above this rune has hardened into a barrier that will last [DisplayTimeText(density_timer.timeToRun - world.time)].")

/obj/effect/rune/wall/Destroy()
	GLOB.wall_runes -= src
	return ..()

/obj/effect/rune/wall/BlockSuperconductivity()
	return density

/obj/effect/rune/wall/invoke(list/invokers)
	if(recharging)
		return
	var/mob/living/user = invokers[1]
	..()
	density = !density
	update_state()
	if(density)
		spread_density()
	var/carbon_user = iscarbon(user)
	user.visible_message(span_warning("[user] [carbon_user ? "places [user.p_their()] hands on":"stares intently at"] [src], and [density ? "the air above it begins to shimmer" : "the shimmer above it fades"]."), \
						 span_cultitalic("I channel [carbon_user ? "your life ":""]energy into [src], [density ? "temporarily preventing" : "allowing"] passage above it."))
	if(carbon_user)
		var/mob/living/carbon/C = user
		C.apply_damage(2, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))

/obj/effect/rune/wall/proc/spread_density()
	for(var/R in GLOB.wall_runes)
		var/obj/effect/rune/wall/W = R
		if(W.z == z && get_dist(src, W) <= 2 && !W.density && !W.recharging)
			W.density = TRUE
			W.update_state()
			W.spread_density()
	density_timer = addtimer(CALLBACK(src, PROC_REF(lose_density)), 3000, TIMER_STOPPABLE)

/obj/effect/rune/wall/proc/lose_density()
	if(density)
		recharging = TRUE
		density = FALSE
		update_state()
		var/oldcolor = color
		add_atom_colour("#696969", FIXED_COLOUR_PRIORITY)
		animate(src, color = oldcolor, time = 50, easing = EASE_IN)
		addtimer(CALLBACK(src, PROC_REF(recharge)), 50)

/obj/effect/rune/wall/proc/recharge()
	recharging = FALSE
	add_atom_colour(RUNE_COLOR_MEDIUMRED, FIXED_COLOUR_PRIORITY)

/obj/effect/rune/wall/proc/update_state()
	deltimer(density_timer)
	air_update_turf(1)
	if(density)
		var/mutable_appearance/shimmer = mutable_appearance('icons/effects/effects.dmi', "barriershimmer", ABOVE_MOB_LAYER)
		shimmer.appearance_flags |= RESET_COLOR
		shimmer.alpha = 60
		shimmer.color = "#701414"
		add_overlay(shimmer)
		add_atom_colour(RUNE_COLOR_RED, FIXED_COLOUR_PRIORITY)
	else
		cut_overlays()
		add_atom_colour(RUNE_COLOR_MEDIUMRED, FIXED_COLOUR_PRIORITY)

//Rite of Joined Souls: Summons a single cultist.
/obj/effect/rune/summon
	cultist_name = "Summon Cultist"
	cultist_desc = ""
	invocation = "N'ath reth sh'yro eth d'rekkathnor!"
	req_cultists = 2
	invoke_damage = 10
	icon_state = "3"
	color = RUNE_COLOR_SUMMON

/obj/effect/rune/summon/invoke(list/invokers)
	var/mob/living/user = invokers[1]
	var/list/cultists = list()
	for(var/datum/mind/M in SSticker.mode.cult)
		if(!(M.current in invokers) && M.current && M.current.stat != DEAD)
			cultists |= M.current
	var/mob/living/cultist_to_summon = input(user, "Who do you wish to call to [src]?", "Followers of the Geometer") as null|anything in cultists
	if(!Adjacent(user) || !src || QDELETED(src) || user.incapacitated())
		return
	if(!cultist_to_summon)
		to_chat(user, span_cultitalic("I require a summoning target!"))
		fail_invoke()
		log_game("Summon Cultist rune failed - no target")
		return
	if(cultist_to_summon.stat == DEAD)
		to_chat(user, span_cultitalic("[cultist_to_summon] has died!"))
		fail_invoke()
		log_game("Summon Cultist rune failed - target died")
		return
	if(cultist_to_summon.pulledby || cultist_to_summon.buckled)
		to_chat(user, span_cultitalic("[cultist_to_summon] is being held in place!"))
		fail_invoke()
		log_game("Summon Cultist rune failed - target restrained")
		return
	if(!iscultist(cultist_to_summon))
		to_chat(user, span_cultitalic("[cultist_to_summon] is not a follower of the Geometer!"))
		fail_invoke()
		log_game("Summon Cultist rune failed - target was deconverted")
		return
	if(is_away_level(cultist_to_summon.z))
		to_chat(user, span_cultitalic("[cultist_to_summon] is not in our dimension!"))
		fail_invoke()
		log_game("Summon Cultist rune failed - target in away mission")
		return
	cultist_to_summon.visible_message(span_warning("[cultist_to_summon] suddenly disappears in a flash of red light!"), \
									  span_cultitalic("<b>Overwhelming vertigo consumes you as you are hurled through the air!</b>"))
	..()
	visible_message(span_warning("A foggy shape materializes atop [src] and solidifes into [cultist_to_summon]!"))
	cultist_to_summon.forceMove(get_turf(src))
	qdel(src)

//Rite of Boiling Blood: Deals extremely high amounts of damage to non-cultists nearby
/obj/effect/rune/blood_boil
	cultist_name = "Boil Blood"
	cultist_desc = ""
	invocation = "Dedo ol'btoh!"
	icon_state = "4"
	color = RUNE_COLOR_BURNTORANGE
	light_color = LIGHT_COLOR_LAVA
	req_cultists = 3
	invoke_damage = 10
	construct_invoke = FALSE
	var/tick_damage = 25
	rune_in_use = FALSE

/obj/effect/rune/blood_boil/do_invoke_glow()
	return

/obj/effect/rune/blood_boil/invoke(list/invokers)
	if(rune_in_use)
		return
	..()
	rune_in_use = TRUE
	var/turf/T = get_turf(src)
	visible_message(span_warning("[src] turns a bright, glowing orange!"))
	color = "#FC9B54"
	set_light(6, 1, color)
	for(var/mob/living/L in viewers(T))
		if(!iscultist(L) && L.blood_volume)
			var/atom/I = L.anti_magic_check(chargecost = 0)
			if(I)
				if(isitem(I))
					to_chat(L, span_danger("[I] suddenly burns hotly before returning to normal!"))
				continue
			to_chat(L, span_cultlarge("My blood boils in my veins!"))
	animate(src, color = "#FCB56D", time = 4)
	sleep(4)
	if(QDELETED(src))
		return
	do_area_burn(T, 0.5)
	animate(src, color = "#FFDF80", time = 5)
	sleep(5)
	if(QDELETED(src))
		return
	do_area_burn(T, 1)
	animate(src, color = "#FFFDF4", time = 6)
	sleep(6)
	if(QDELETED(src))
		return
	do_area_burn(T, 1.5)
	new /obj/effect/hotspot(T)
	qdel(src)

/obj/effect/rune/blood_boil/proc/do_area_burn(turf/T, multiplier)
	set_light(6, 1, color)
	for(var/mob/living/L in viewers(T))
		if(!iscultist(L) && L.blood_volume)
			if(L.anti_magic_check(chargecost = 0))
				continue
			L.take_overall_damage(tick_damage*multiplier, tick_damage*multiplier)

//Rite of Spectral Manifestation: Summons a ghost on top of the rune as a cultist human with no items. User must stand on the rune at all times, and takes damage for each summoned ghost.
/obj/effect/rune/manifest
	cultist_name = "Spirit Realm"
	cultist_desc = ""
	invocation = "Gal'h'rfikk harfrandid mud'gib!" //how the fuck do you pronounce this
	icon_state = "7"
	invoke_damage = 10
	construct_invoke = FALSE
	color = RUNE_COLOR_DARKRED
	var/mob/living/affecting = null
	var/ghost_limit = 3
	var/ghosts = 0

/obj/effect/rune/manifest/Initialize()
	. = ..()


/obj/effect/rune/manifest/can_invoke(mob/living/user)
	if(!(user in get_turf(src)))
		to_chat(user, span_cultitalic("I must be standing on [src]!"))
		fail_invoke()
		log_game("Manifest rune failed - user not standing on rune")
		return list()
	if(user.has_status_effect(STATUS_EFFECT_SUMMONEDGHOST))
		to_chat(user, span_cultitalic("Ghosts can't summon more ghosts!"))
		fail_invoke()
		log_game("Manifest rune failed - user is a ghost")
		return list()
	return ..()

/obj/effect/rune/manifest/invoke(list/invokers)
	. = ..()
	var/mob/living/user = invokers[1]
	var/turf/T = get_turf(src)
	var/choice = alert(user,"You tear open a connection to the spirit realm...",,"Summon a Cult Ghost","Ascend as a Dark Spirit","Cancel")
	if(choice == "Summon a Cult Ghost")
		var/area/A = get_area(T)
		if(A.map_name == "Space" || is_mining_level(T.z))
			to_chat(user, span_cultitalic("<b>The veil is not weak enough here to manifest spirits, you must be on station!</b>"))
			return
		if(ghosts >= ghost_limit)
			to_chat(user, span_cultitalic("I are sustaining too many ghosts to summon more!"))
			fail_invoke()
			log_game("Manifest rune failed - too many summoned ghosts")
			return list()
		notify_ghosts("Manifest rune invoked in [get_area(src)].", 'sound/blank.ogg', source = src, header = "Manifest rune")
		var/list/ghosts_on_rune = list()
		for(var/mob/dead/observer/O in T)
			if(O.client && !QDELETED(src) && !QDELETED(O))
				ghosts_on_rune += O
		if(!ghosts_on_rune.len)
			to_chat(user, span_cultitalic("There are no spirits near [src]!"))
			fail_invoke()
			log_game("Manifest rune failed - no nearby ghosts")
			return list()
		var/mob/dead/observer/ghost_to_spawn = pick(ghosts_on_rune)
		var/mob/living/carbon/human/cult_ghost/new_human = new(T)
		new_human.real_name = ghost_to_spawn.real_name
		new_human.alpha = 150 //Makes them translucent
		new_human.equipOutfit(/datum/outfit/ghost_cultist) //give them armor
		new_human.apply_status_effect(STATUS_EFFECT_SUMMONEDGHOST) //ghosts can't summon more ghosts
		new_human.see_invisible = SEE_INVISIBLE_OBSERVER
		ghosts++
		playsound(src, 'sound/blank.ogg', 50, TRUE)
		visible_message(span_warning("A cloud of red mist forms above [src], and from within steps... a [new_human.gender == FEMALE ? "wo":""]man."))
		to_chat(user, span_cultitalic("My blood begins flowing into [src]. You must remain in place and conscious to maintain the forms of those summoned. This will hurt you slowly but surely..."))
		var/obj/structure/emergency_shield/invoker/N = new(T)
		new_human.key = ghost_to_spawn.key
		SSticker.mode.add_cultist(new_human.mind, 0)
		to_chat(new_human, span_cultitalic("<b>I are a servant of the Geometer. You have been made semi-corporeal by the cult of Nar'Sie, and you are to serve them at all costs.</b>"))

		while(!QDELETED(src) && !QDELETED(user) && !QDELETED(new_human) && (user in T))
			if(user.stat || new_human.InCritical())
				break
			user.apply_damage(0.1, BRUTE)
			sleep(1)

		qdel(N)
		ghosts--
		if(new_human)
			new_human.visible_message(span_warning("[new_human] suddenly dissolves into bones and ashes."), \
									  span_cultlarge("My link to the world fades. Your form breaks apart."))
			for(var/obj/I in new_human)
				new_human.dropItemToGround(I, TRUE)
			new_human.dust()
	else if(choice == "Ascend as a Dark Spirit")
		affecting = user
		affecting.add_atom_colour(RUNE_COLOR_DARKRED, ADMIN_COLOUR_PRIORITY)
		affecting.visible_message(span_warning("[affecting] freezes statue-still, glowing an unearthly red."), \
						 span_cult("I see what lies beyond. All is revealed. In this form you find that my voice booms louder and you can mark targets for the entire cult"))
		var/mob/dead/observer/G = affecting.ghostize(1)
		var/datum/action/innate/cult/comm/spirit/CM = new
		var/datum/action/innate/cult/ghostmark/GM = new
		G.name = "Dark Spirit of [G.name]"
		G.color = "red"
		CM.Grant(G)
		GM.Grant(G)
		while(!QDELETED(affecting))
			if(!(affecting in T))
				user.visible_message(span_warning("A spectral tendril wraps around [affecting] and pulls [affecting.p_them()] back to the rune!"))
				Beam(affecting, icon_state="drainbeam", time=2)
				affecting.forceMove(get_turf(src)) //NO ESCAPE :^)
			if(affecting.key)
				affecting.visible_message(span_warning("[affecting] slowly relaxes, the glow around [affecting.p_them()] dimming."), \
									 span_danger("I are re-united with my physical form. [src] releases its hold over you."))
				affecting.Paralyze(40)
				break
			if(affecting.health <= 10)
				to_chat(G, span_cultitalic("My body can no longer sustain the connection!"))
				break
			sleep(5)
		CM.Remove(G)
		GM.Remove(G)
		affecting.remove_atom_colour(ADMIN_COLOUR_PRIORITY, RUNE_COLOR_DARKRED)
		affecting.grab_ghost()
		affecting = null
		rune_in_use = FALSE

/mob/living/carbon/human/cult_ghost/spill_organs(no_brain, no_organs, no_bodyparts) //cult ghosts never drop a brain
	no_brain = TRUE
	. = ..()

/mob/living/carbon/human/cult_ghost/getorganszone(zone, subzones = 0)
	. = ..()
	for(var/obj/item/organ/brain/B in .) //they're not that smart, really
		. -= B


/obj/effect/rune/apocalypse
	cultist_name = "Apocalypse"
	cultist_desc = ""
	invocation = "Ta'gh fara'qha fel d'amar det!"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "apoc"
	pixel_x = -32
	pixel_y = -32
	color = RUNE_COLOR_DARKRED
	req_cultists = 3
	scribe_delay = 100

/obj/effect/rune/apocalypse/invoke(list/invokers)
	if(rune_in_use)
		return
	. = ..()
	var/area/place = get_area(src)
	var/mob/living/user = invokers[1]
	var/datum/antagonist/cult/user_antag = user.mind.has_antag_datum(/datum/antagonist/cult,TRUE)
	var/datum/objective/eldergod/summon_objective = locate() in user_antag.cult_team.objectives
	if(summon_objective.summon_spots.len <= 1)
		to_chat(user, span_cultlarge("Only one ritual site remains - it must be reserved for the final summoning!"))
		return
	if(!(place in summon_objective.summon_spots))
		to_chat(user, span_cultlarge("The Apocalypse rune will remove a ritual site, where Nar'Sie can be summoned, it can only be scribed in [english_list(summon_objective.summon_spots)]!"))
		return
	summon_objective.summon_spots -= place
	rune_in_use = TRUE
	var/turf/T = get_turf(src)
	new /obj/effect/temp_visual/dir_setting/curse/grasp_portal/fading(T)
	var/intensity = 0
	for(var/mob/living/M in GLOB.player_list)
		if(iscultist(M))
			intensity++
	intensity = max(60, 360 - (360*(intensity/GLOB.player_list.len + 0.3)**2)) //significantly lower intensity for "winning" cults
	var/duration = intensity*10
	playsound(T, 'sound/blank.ogg', 100, TRUE)
	visible_message(span_warning("A colossal shockwave of energy bursts from the rune, disintegrating it in the process!"))
	for(var/mob/living/L in range(src, 3))
		L.Paralyze(30)
	empulse(T, 0.42*(intensity), 1)
	var/list/images = list()
	var/zmatch = T.z
	var/datum/atom_hud/AH = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	for(var/mob/living/M in GLOB.alive_mob_list)
		if(M.z != zmatch)
			continue
		if(ishuman(M))
			if(!iscultist(M))
				AH.remove_hud_from(M)
				addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(hudFix), M), duration)
			var/image/A = image('icons/mob/mob.dmi',M,"cultist", ABOVE_MOB_LAYER)
			A.override = 1
			add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/noncult, "human_apoc", A, NONE)
			addtimer(CALLBACK(M,TYPE_PROC_REF(/atom, remove_alt_appearance),"human_apoc",TRUE), duration)
			images += A
			SEND_SOUND(M, pick(sound('sound/blank.ogg')))
		else
			var/construct = pick("floater","artificer","behemoth")
			var/image/B = image('icons/mob/mob.dmi',M,construct, ABOVE_MOB_LAYER)
			B.override = 1
			add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/noncult, "mob_apoc", B, NONE)
			addtimer(CALLBACK(M,TYPE_PROC_REF(/atom, remove_alt_appearance),"mob_apoc",TRUE), duration)
			images += B
		if(!iscultist(M))
			if(M.client)
				var/image/C = image('icons/effects/cult_effects.dmi',M,"bloodsparkles", ABOVE_MOB_LAYER)
				add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/cult, "cult_apoc", C, NONE)
				addtimer(CALLBACK(M,TYPE_PROC_REF(/atom, remove_alt_appearance),"cult_apoc",TRUE), duration)
				images += C
		else
			to_chat(M, span_cultlarge("An Apocalypse Rune was invoked in the [place.name], it is no longer available as a summoning site!"))
			SEND_SOUND(M, 'sound/blank.ogg')
	image_handler(images, duration)
	if(intensity>=285) // Based on the prior formula, this means the cult makes up <15% of current players
		var/outcome = rand(1,100)
		switch(outcome)
			if(1 to 10)
				var/datum/round_event_control/disease_outbreak/D = new()
				var/datum/round_event_control/mice_migration/M = new()
				D.runEvent()
				M.runEvent()
			if(11 to 20)
				var/datum/round_event_control/radiation_storm/RS = new()
				RS.runEvent()
			if(21 to 30)
				var/datum/round_event_control/brand_intelligence/BI = new()
				BI.runEvent()
			if(31 to 40)
				var/datum/round_event_control/immovable_rod/R = new()
				R.runEvent()
				R.runEvent()
				R.runEvent()
			if(41 to 50)
				var/datum/round_event_control/meteor_wave/MW = new()
				MW.runEvent()
			if(51 to 60)
				var/datum/round_event_control/spider_infestation/SI = new()
				SI.runEvent()
			if(61 to 70)
				var/datum/round_event_control/anomaly/anomaly_flux/AF
				var/datum/round_event_control/anomaly/anomaly_grav/AG
				var/datum/round_event_control/anomaly/anomaly_pyro/AP
				var/datum/round_event_control/anomaly/anomaly_vortex/AV
				AF.runEvent()
				AG.runEvent()
				AP.runEvent()
				AV.runEvent()
			if(71 to 80)
				var/datum/round_event_control/spacevine/SV = new()
				var/datum/round_event_control/grey_tide/GT = new()
				SV.runEvent()
				GT.runEvent()
			if(81 to 100)
				var/datum/round_event_control/portal_storm_narsie/N = new()
				N.runEvent()
	qdel(src)

/obj/effect/rune/apocalypse/proc/image_handler(list/images, duration)
	var/end = world.time + duration
	set waitfor = 0
	while(end>world.time)
		for(var/image/I in images)
			I.override = FALSE
			animate(I, alpha = 0, time = 25, flags = ANIMATION_PARALLEL)
		sleep(35)
		for(var/image/I in images)
			animate(I, alpha = 255, time = 25, flags = ANIMATION_PARALLEL)
		sleep(25)
		for(var/image/I in images)
			if(I.icon_state != "bloodsparkles")
				I.override = TRUE
		sleep(190)



/proc/hudFix(mob/living/carbon/human/target)
	if(!target || !target.client)
		return
	var/obj/O = target.get_item_by_slot(SLOT_GLASSES)
	if(istype(O, /obj/item/clothing/glasses/hud/security))
		var/datum/atom_hud/AH = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
		AH.add_hud_to(target)

