/datum/job/roguetown/hand
	title = "Hand"
	flag = HAND
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/hand
	display_order = JDO_HAND
	tutorial = "You owe everything to your liege. Once, you were a royal's best friend, now you're highly esteemed and respected throughout the land. You have been a confidant to the Noble-Family for so long that you are a vault of intrigue, something you exploit with potent conviction. Let no man ever forget whose ear you whisper into. You've killed more men with those lips than any blademaster could ever claim to."
	whitelist_req = TRUE
	give_bank_account = 44
	min_pq = 3
	max_pq = null
	associated_squad = /datum/antagonist/squad/none


/*
/datum/job/roguetown/hand/special_job_check(mob/dead/new_player/player)
	if(!player)
		return
	if(!player.ckey)
		return
	for(var/mob/dead/new_player/king in GLOB.player_list)
		if(king.mind.assigned_role == "King")
			if(king.brohand == player.ckey)
				return TRUE
*/

/datum/outfit/job/roguetown/hand/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/handcoat
	shoes = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/keyring/hand
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("skill", 3)
		H.change_stat("speed", 1)
	if(isnuppy(H))//I noticed someone added a seelie snowflake block, and I decided to do the same for everyone else. This may change, for now, enjoy it. This is practically... the highest a non Eora loved species could get.
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/push_spell)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/roustame)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
	if(isdwarfmountain(H))
		H.change_stat("strength", 2)
		H.change_stat("skill", 1)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(iswoodelf(H))
		H.change_stat("skill", 2)
		H.change_stat("speed", 1)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(ishumannorthern(H))
		H.change_stat("endurance", 2)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	if(ishalfelf(H))
		H.change_stat("endurance", 1)
		H.change_stat("skill", 1)
		H.change_stat("fortune", 1)
	if(isdarkelf(H))
		H.change_stat("speed", 1)
		H.change_stat("endurance", 2)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	if(istiefling(H))
		H.change_stat("speed", 1)
		H.change_stat("fortune", 1)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	if(iskobold(H))
		H.change_stat("strength", 5)
		H.change_stat("speed", -1)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	if(ismoth(H))
		H.change_stat("speed", 3)
		H.change_stat("strength", -5)
		H.change_stat("mageability", -2)
		H.change_stat("fortune", -1)
		H.change_stat("faith", -5)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	if(ishalforc(H))
		H.change_stat("speed", 2)
		H.change_stat("strength", -1)
		H.change_stat("constitution", 1)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
