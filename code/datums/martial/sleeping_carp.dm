#define WRIST_WRENCH_COMBO "DD"
#define BACK_KICK_COMBO "HG"
#define STOMACH_KNEE_COMBO "GH"
#define HEAD_KICK_COMBO "DHH"
#define ELBOW_DROP_COMBO "HDHDH"

/datum/martial_art/the_sleeping_carp
	name = "The Sleeping Carp"
	id = MARTIALART_SLEEPINGCARP
	allow_temp_override = FALSE
	help_verb = /mob/living/carbon/human/proc/sleeping_carp_help
	smashes_tables = TRUE
	var/old_grab_state = null

/datum/martial_art/the_sleeping_carp/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(findtext(streak,WRIST_WRENCH_COMBO))
		streak = ""
		wristWrench(A,D)
		return TRUE
	if(findtext(streak,BACK_KICK_COMBO))
		streak = ""
		backKick(A,D)
		return TRUE
	if(findtext(streak,STOMACH_KNEE_COMBO))
		streak = ""
		kneeStomach(A,D)
		return TRUE
	if(findtext(streak,HEAD_KICK_COMBO))
		streak = ""
		headKick(A,D)
		return TRUE
	if(findtext(streak,ELBOW_DROP_COMBO))
		streak = ""
		elbowDrop(A,D)
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/proc/wristWrench(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!D.stat && !D.IsStun() && !D.IsParalyzed())
		log_combat(A, D, "wrist wrenched (Sleeping Carp)")
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.visible_message(span_danger("[A] grabs [D]'s wrist and wrenches it sideways!"), \
						span_danger("My wrist is grabbed by [A] while simultaneously wrenched it to the side!"), span_hear("I hear aggressive shuffling!"), null, A)
		to_chat(A, span_danger("I grab [D]'s wrist and wrench it sideways!"))
		playsound(get_turf(A), 'sound/blank.ogg', 50, TRUE, -1)
		D.emote("scream")
		D.dropItemToGround(D.get_active_held_item())
		D.apply_damage(5, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		D.Stun(60)
		return TRUE

	return FALSE

/datum/martial_art/the_sleeping_carp/proc/backKick(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!D.stat && !D.IsParalyzed())
		if(A.dir != D.dir)
			log_combat(A, D, "missed a back-kick (Sleeping Carp) on")
			D.visible_message(span_warning("[A] tries to kick [D] in the back, but misses!"), \
							span_danger("I avoid a kick in the back by [A]!"), span_hear("I hear a swoosh!"), null, A)
			to_chat(A, span_warning("My kick to [D]'s back misses!"))
			return TRUE
		log_combat(A, D, "back-kicked (Sleeping Carp)")
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.visible_message(span_warning("[A] kicks [D] in the back!"), \
						span_danger("You're kicked in the back by [A]!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("I kick [D] in the back!"))
		step_to(D,get_step(D,D.dir),1)
		D.Paralyze(80)
		playsound(get_turf(D), 'sound/blank.ogg', 50, TRUE, -1)
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/proc/kneeStomach(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!D.stat && !D.IsParalyzed())
		log_combat(A, D, "stomach kneed (Sleeping Carp)")
		A.do_attack_animation(D, ATTACK_EFFECT_KICK)
		D.visible_message(span_danger("[A] knees [D] in the stomach!"), \
						span_danger("My stomach is kneed by [A], making you gag!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("I knee [D] in the stomach, making [D.p_them()] gag!"))
		D.losebreath += 3
		D.Stun(40)
		playsound(get_turf(D), 'sound/blank.ogg', 50, TRUE, -1)
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/proc/headKick(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!D.stat && !D.IsParalyzed())
		log_combat(A, D, "head kicked (Sleeping Carp)")
		A.do_attack_animation(D, ATTACK_EFFECT_KICK)
		D.visible_message(span_warning("[A] kicks [D] in the head!"), \
						span_danger("My jaw is kicked by [A]!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("I kick [D] in the jaw!"))
		D.apply_damage(20, A.dna.species.attack_type, BODY_ZONE_HEAD)
		D.drop_all_held_items()
		playsound(get_turf(D), 'sound/blank.ogg', 50, TRUE, -1)
		D.Stun(80)
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/proc/elbowDrop(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!(D.mobility_flags & MOBILITY_STAND))
		log_combat(A, D, "elbow dropped (Sleeping Carp)")
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.visible_message(span_danger("[A] elbow drops [D]!"), \
						span_danger("You're piledrived by [A] with [A.p_their()] elbow!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("I piledrive [D] with my elbow!"))
		if(D.stat)
			D.death() //FINISH HIM!
		D.apply_damage(50, A.dna.species.attack_type, BODY_ZONE_CHEST)
		playsound(get_turf(D), 'sound/blank.ogg', 75, TRUE, -1)
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(A.used_intent.type == INTENT_GRAB && A!=D) // A!=D prevents grabbing yourself
		add_to_streak("G",D)
		if(check_streak(A,D)) //if a combo is made no grab upgrade is done
			return TRUE
		old_grab_state = A.grab_state
		D.grabbedby(A, 1)
		if(old_grab_state == GRAB_PASSIVE)
			D.drop_all_held_items()
			A.setGrabState(GRAB_AGGRESSIVE) //Instant agressive grab if on grab intent
			log_combat(A, D, "grabbed", addition="aggressively")
			D.visible_message(span_warning("[A] violently grabs [D]!"), \
							span_danger("You're violently grabbed by [A]!"), span_hear("I hear aggressive shuffling!"), null, A)
			to_chat(A, span_danger("I violently grab [D]!"))
		return TRUE
	return FALSE

/datum/martial_art/the_sleeping_carp/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("H",D)
	if(check_streak(A,D))
		return TRUE
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	var/atk_verb = pick("kick", "chop", "hit", "slam")
	D.visible_message(span_danger("[A] [atk_verb]s [D]!"), \
					span_danger("[A] [atk_verb]s you!"), null, null, A)
	to_chat(A, span_danger("I [atk_verb] [D]!"))
	D.apply_damage(rand(10,15), BRUTE)
	playsound(get_turf(D), 'sound/blank.ogg', 25, TRUE, -1)
	if(prob(D.getBruteLoss()) && (D.mobility_flags & MOBILITY_STAND))
		D.visible_message(span_warning("[D] stumbles and falls!"), span_danger("The blow sends you to the ground!"))
		D.Paralyze(80)
	log_combat(A, D, "[atk_verb] (Sleeping Carp)")
	return TRUE


/datum/martial_art/the_sleeping_carp/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("D",D)
	if(check_streak(A,D))
		return TRUE
	return ..()

/datum/martial_art/the_sleeping_carp/on_projectile_hit(mob/living/carbon/human/A, obj/projectile/P, def_zone)
	. = ..()
	if(A.incapacitated(FALSE, TRUE)) //NO STUN
		return BULLET_ACT_HIT
	if(!(A.mobility_flags & MOBILITY_USE)) //NO UNABLE TO USE
		return BULLET_ACT_HIT
	if(A.dna && A.dna.check_mutation(HULK)) //NO HULK
		return BULLET_ACT_HIT
	if(!isturf(A.loc)) //NO MOTHERFLIPPIN MECHS!
		return BULLET_ACT_HIT
	A.visible_message(span_danger("[A] deflects the projectile; [A.p_they()] can't be hit with ranged weapons!"), span_danger("I deflect the projectile!"))
	playsound(src, pick('sound/blank.ogg'), 75, TRUE)
	P.firer = A
	P.setAngle(rand(0, 360))//SHING
	return BULLET_ACT_FORCE_PIERCE

/datum/martial_art/the_sleeping_carp/teach(mob/living/carbon/human/H, make_temporary = FALSE)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(H, TRAIT_NOGUNS, SLEEPING_CARP_TRAIT)

/datum/martial_art/the_sleeping_carp/on_remove(mob/living/carbon/human/H)
	. = ..()
	REMOVE_TRAIT(H, TRAIT_NOGUNS, SLEEPING_CARP_TRAIT)


/mob/living/carbon/human/proc/sleeping_carp_help()
	set name = "Recall Teachings"
	set desc = ""
	set category = "Sleeping Carp"

	to_chat(usr, "<b><i>I retreat inward and recall the teachings of the Sleeping Carp...</i></b>")

	to_chat(usr, "<span class='notice'>Wrist Wrench</span>: Disarm Disarm. Forces opponent to drop item in hand.")
	to_chat(usr, "<span class='notice'>Back Kick</span>: Harm Grab. Opponent must be facing away. Knocks down.")
	to_chat(usr, "<span class='notice'>Stomach Knee</span>: Grab Harm. Knocks the wind out of opponent and stuns.")
	to_chat(usr, "<span class='notice'>Head Kick</span>: Disarm Harm Harm. Decent damage, forces opponent to drop item in hand.")
	to_chat(usr, "<span class='notice'>Elbow Drop</span>: Harm Disarm Harm Disarm Harm. Opponent must be on the ground. Deals huge damage, instantly kills anyone in critical condition.")

/obj/item/twohanded/bostaff
	name = "bo staff"
	desc = ""
	force = 10
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	force_unwielded = 10
	force_wielded = 24
	throwforce = 20
	throw_speed = 2
	attack_verb = list("smashed", "slammed", "whacked", "thwacked")
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "bostaff0"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	block_chance = 50

/obj/item/twohanded/bostaff/update_icon_state()
	icon_state = "bostaff[wielded]"

/obj/item/twohanded/bostaff/attack(mob/target, mob/living/user)
	add_fingerprint(user)
	if((HAS_TRAIT(user, TRAIT_CLUMSY)) && prob(50))
		to_chat(user, span_warning("I club myself over the head with [src]."))
		user.Paralyze(60)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2*force, BRUTE, BODY_ZONE_HEAD)
		else
			user.take_bodypart_damage(2*force)
		return
	if(iscyborg(target))
		return ..()
	if(!isliving(target))
		return ..()
	var/mob/living/carbon/C = target
	if(C.stat)
		to_chat(user, span_warning("It would be dishonorable to attack a foe while they cannot retaliate."))
		return
	if(user.used_intent.type == INTENT_DISARM)
		if(!wielded)
			return ..()
		if(!ishuman(target))
			return ..()
		var/mob/living/carbon/human/H = target
		var/list/fluffmessages = list("club", "smack", "broadside", "beat", "slam")
		H.visible_message(span_warning("[user] [pick(fluffmessages)]s [H] with [src]!"), \
						span_danger("[user] [pick(fluffmessages)]s you with [src]!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, user)
		to_chat(user, span_danger("I [pick(fluffmessages)] [H] with [src]!"))
		playsound(get_turf(user), 'sound/blank.ogg', 75, TRUE, -1)
		if(prob(10))
			H.visible_message(span_warning("[H] collapses!"), \
							span_danger("My legs give out!"))
			H.Paralyze(80)
		if(H.staminaloss && !H.IsSleeping())
			var/total_health = (H.health - H.staminaloss)
			if(total_health <= HEALTH_THRESHOLD_CRIT && !H.stat)
				H.visible_message(span_warning("[user] delivers a heavy hit to [H]'s head, knocking [H.p_them()] out cold!"), \
								span_danger("You're knocked unconscious by [user]!"), span_hear("I hear a sickening sound of flesh hitting flesh!"), null, user)
				to_chat(user, span_danger("I deliver a heavy hit to [H]'s head, knocking [H.p_them()] out cold!"))
				H.SetSleeping(600)
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15, 150)
	else
		return ..()

/obj/item/twohanded/bostaff/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(wielded)
		return ..()
	return FALSE
