/datum/job/roguetown/redbaron
	title = "House Alrich Baron"
	f_title = "House Alrich Baroness"
	flag = HOUSE_BARON_RED
	department_flag = HOUSE_ALRICH
	tutorial = "House Alrich, one of the younger two houses. You were found on a promise, a hope for an orderly and magnificent kingdom. Rise, House Alrich. For the founding lady's...assets."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	display_order = JDO_HOUSE_BARON_RED
	selection_color = JCOLOR_ALRICH
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	min_pq = 0
	max_pq = null
	wanderer_examine = FALSE
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	associated_squad = /datum/antagonist/squad/alrich/leader

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/alrich)
	outfit = /datum/outfit/job/roguetown/redbaron

	give_bank_account = 48
	cmode_music = 'sound/music/combat_guard.ogg'


/datum/outfit/job/roguetown/redbaron/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/bardhat
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/half/house/alrich
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/house/alrich
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	neck =/obj/item/clothing/neck/roguetown/gorget
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	beltl = /obj/item/key/alrich
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	belt = /obj/item/storage/belt/rogue/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		if(H.age == AGE_MIDDLEAGED)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) 
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) 
		H.change_stat("skill", 3)
		H.change_stat("constitution", 1)
		H.change_stat("fortune", 2)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/alrich
	name = "Draft Recruit"
	new_role = "Alrich Warrior"
	overlay_state = "recruit_bog"
	recruitment_faction = "Alrich Warrior"
	recruitment_message = "Join the house of Alrich, %RECRUIT!"
	accept_message = "FOR HOUSE ALRICH!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/alrich/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
	. = ..()
	if(!.)
		return FALSE
	if(!recruit.mind)
		return FALSE
	// Properly assign the job
	var/datum/job/new_job = SSjob.GetJob(new_role)
	if(new_job)
		SSjob.AssignRole(recruit, new_job, TRUE) // Assign the job properly
		// Manually apply the associated squad
		if(new_job.associated_squad)
			recruit.mind.add_antag_datum(new_job.associated_squad)
	else
		log_game("DEBUG: Failed to find job [new_role] for [recruit].")
	recruit.verbs |= /mob/proc/haltyell
	return TRUE
