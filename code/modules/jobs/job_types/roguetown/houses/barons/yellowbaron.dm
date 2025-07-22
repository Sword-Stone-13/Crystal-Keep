/datum/job/roguetown/yellowbaron
	title = "House Bravado Baron"
	f_title = "House Bravado Baroness"
	flag = HOUSE_BARON_YELLOW
	department_flag = HOUSE_BRAVADO
	tutorial = "You... really don't remember what happened. No one does. House Bravado, the once grand, was plunged in by hunts. But no matter, that was in the past. Rise and bring back Bravado."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	display_order = JDO_HOUSE_BARON_YELLOW
	selection_color = JCOLOR_BRAVADO
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	min_pq = 0
	max_pq = null
	wanderer_examine = FALSE
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	associated_squad = /datum/antagonist/squad/bravado/leader

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/bravado)
	outfit = /datum/outfit/job/roguetown/yellowbaron

	give_bank_account = 49
	cmode_music = 'sound/music/combat_guard.ogg'


/datum/outfit/job/roguetown/yellowbaron/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/strawhat/baron 
	beltr = /obj/item/reagent_containers/powder/moondust
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/special
	cloak = /obj/item/clothing/cloak/half/bravado
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	armor = /obj/item/clothing/suit/roguetown/shirt/rags
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	pants = /obj/item/clothing/under/roguetown/brayette
	shoes = /obj/item/clothing/shoes/roguetown/armor/shalal
	r_hand = /obj/item/rogueweapon/woodstaff/wise
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(3,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(3,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	if(H.age == AGE_MIDDLEAGED)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) 
		H.change_stat("endurance", 3)
		H.change_stat("constitution", 1)
		H.change_stat("fortune", -1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_ANTISCRYING, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/bravado
	name = "Draft Recruit"
	new_role = "Bravado Warrior"
	overlay_state = "recruit_bog"
	recruitment_faction = "Bravado Warrior"
	recruitment_message = "Are you yellow, %RECRUIT?"
	accept_message = "Yes!"
	refuse_message = "No."

/obj/effect/proc_holder/spell/self/convertrole/bravado/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
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
