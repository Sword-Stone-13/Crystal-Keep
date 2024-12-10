/mob/living/horse/form/talamoon
	name = "Talamoon"
	icon = 'icons/roguetown/mob/monster/werewolf.dmi'
	icon_state = "wwolf_m"
	gender = NEUTER
	base_intents = list(/datum/intent/unarmed/help, /datum/intent/simple/bite/, /datum/intent/unarmed/grab, /datum/intent/simple/wereclaw)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 10,
						/obj/item/natural/hide = 10)
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 350
	STASTR = 15
	STAEND = 14
	STASPD = 16
//	obj_damage = 30
//	environment_smash = ENVIRONMENT_SMASH_WALLS
//	attack_sound = BLADEWOOSH_LARGE
//	speak_emote = list("growls")
	defdrain = 20
	canparry = TRUE
