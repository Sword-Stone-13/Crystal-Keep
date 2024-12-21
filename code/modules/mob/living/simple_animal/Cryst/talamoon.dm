/mob/living/simple_animal/hostile/retaliate/rogue/saiga/talamoon//newbie coder attempt, please clap

	name = "Talamoon"
	desc = ""
	icon = 'icons/roguetown/mob/monster/talamoon.dmi'
	icon_state = "talamoon"
	hud_type = /datum/hud/human
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	emote_see = list("looks around.", "sniffs the ground.")
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 3
	move_to_delay = 8
	animal_species = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/talamoon
	butcher_results = list()
	possible_mmb_intents = list(INTENT_JUMP, INTENT_KICK,)
	base_intents = list(INTENT_HELP, /datum/intent/simple/bite/, /datum/intent/simple/bigbite)
	health = 350
	maxHealth = 350
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak,/obj/item/reagent_containers/food/snacks/fat )
	footstep_type = FOOTSTEP_MOB_SHOE
	pooptype = null
	faction = list("neutral")
	attack_verb_continuous = "slashes"
	attack_verb_simple = "claw"
	melee_damage_lower = 10
	melee_damage_upper = 25
	STASPD = 12
	STACON = 13
	STASTR = 15
	STASKL = 12
	pixel_x = -8
	attack_sound = list('sound/vo/mobs/saiga/attack (1).ogg','sound/vo/mobs/saiga/attack (2).ogg')
	can_buckle = TRUE
	buckle_lying = 0
	can_saddle = FALSE
	defprob = 50
	defdrain = 5
	milkies = FALSE
	possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	candodge = TRUE
	canparry = TRUE


