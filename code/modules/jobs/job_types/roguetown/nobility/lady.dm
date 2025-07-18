/datum/job/roguetown/lady
	title = "Queen Consort"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(FEMALE)
	allowed_races = RACES_ALL_KINDS//this is gonna be... funny.
	tutorial = "Who knows why the king chose you for his queen. Perhaps it's political, perhaps it's genuine desire and love... Or he declared you his bride in one night of drunken stupor. Regardless, you're the king's consort and daggers at your throat are to be expected."

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/servant)
	outfit = /datum/outfit/job/roguetown/lady

	display_order = JDO_LADY
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/none


/datum/job/roguetown/exlady //just used to change the ladys title
	title = "Queen Mother"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LADY
	give_bank_account = TRUE

/datum/job/roguetown/lady/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(GLOB.lordsurname && H)
		give_lord_surname(H, preserve_original = TRUE)

/datum/outfit/job/roguetown/lady/pre_equip(mob/living/carbon/human/H)
	. = ..()
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
	beltl = /obj/item/keyring/royal
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	if(isdwarf(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress
	else
		armor = /obj/item/clothing/suit/roguetown/armor/armordress
	head = /obj/item/clothing/head/roguetown/hennin
//		SSticker.rulermob = H

	id = /obj/item/clothing/ring/silver
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/white
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.change_stat("mageability", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 2)
		H.change_stat("skill", 2)
		H.change_stat("fortune", 5)
		H.change_stat("faith", 2)
	if(isdwarfmountain(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(iswoodelf(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(ishumannorthern(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/servant
	name = "Recruit Servant"
	new_role = "Servant"
	overlay_state = "recruit_servant"
	recruitment_faction = "Servants"
	recruitment_message = "Serve the crown, %RECRUIT!"
	accept_message = "FOR THE CROWN!"
	refuse_message = "I refuse."
	charge_max = 100
