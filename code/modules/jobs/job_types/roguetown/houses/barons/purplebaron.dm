/datum/job/roguetown/purplebaron
	title = "House Caesar Baron"
	f_title = "House Caesar Baroness"
	flag = HOUSE_BARON_PURPLE
	department_flag = HOUSE_CAESAR
	tutorial = "You lead the young House Caesar. What you lack in credence you make up for in daring shades of purple... Doesn't really make you more competent, but it does look nice. Failure is not an option, House Caesar."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	display_order = JDO_HOUSE_BARON_PURPLE
	selection_color = JCOLOR_CAESAR
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	min_pq = 0
	max_pq = null
	wanderer_examine = FALSE
	always_show_on_latechoices = TRUE
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	associated_squad = /datum/antagonist/squad/caesar/leader

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/caesar)
	outfit = /datum/outfit/job/roguetown/purplebaron

	give_bank_account = 50
	cmode_music = 'sound/music/combat_guard.ogg'


/datum/outfit/job/roguetown/purplebaron/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/headband/caesar
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/half/house/caesar
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/house/caesar
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	neck =/obj/item/clothing/neck/roguetown/gorget
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	shoes = /obj/item/clothing/shoes/roguetown/armor
	beltl = /obj/item/key/caesar
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	belt = /obj/item/storage/belt/rogue/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
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
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) 
		H.change_stat("skill", 3)
		H.change_stat("constitution", 1)
		H.change_stat("fortune", 2)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/caesar
	name = "Draft Recruit"
	new_role = "caesar recruit"
	overlay_state = "recruit_bog"
	recruitment_faction = "Caesar Soldier"
	recruitment_message = "Join the house of Caesar, %RECRUIT!"
	accept_message = "FOR HOUSE CAESAR!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/caesar/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
	. = ..()
	if(!.)
		return
	recruit.verbs |= /mob/proc/haltyell

