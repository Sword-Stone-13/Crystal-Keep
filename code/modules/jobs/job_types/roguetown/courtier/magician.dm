/datum/job/roguetown/magician
	title = "Court Magos"
	flag = WIZARD
	department_flag = COURTIERS
	selection_color = JCOLOR_COURTIER
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	spells = list(/obj/effect/proc_holder/spell/invoked/learnspell, /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	display_order = JDO_MAGICIAN
	tutorial = "Your creed is one dedicated to the conquering of the arcane arts and the constant thrill of knowledge. \
		You owe your life to the Lord, for it was his coin that allowed you to continue your studies in these dark times. \
		In return, you have proven time and time again as justicar and trusted advisor to their reign."
	outfit = /datum/outfit/job/roguetown/magician
	whitelist_req = TRUE
	associated_squad = /datum/antagonist/squad/none

	give_bank_account = 47
	min_pq = 2
	max_pq = null

/datum/outfit/job/roguetown/magician
	allowed_patrons = list(/datum/patron/divine/noc, /datum/patron/zizo)

/datum/outfit/job/roguetown/magician/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/black_cloak
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltr = /obj/item/keyring/mage
	id = /obj/item/clothing/ring/gold
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/slimepotion/lovepotion,/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/reagent_containers/glass/bottle/rogue/healthpot, /obj/item/rogueweapon/huntingknife/idagger/silver/arcyne)
	ADD_TRAIT(H, TRAIT_SEEPRICES, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("mageability", 4)
		H.change_stat("skill", 4)
		H.change_stat("faith", 3)

		H.mind.adjust_spellpoints(10)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat("speed", -1)
			H.change_stat("mageability", 1)
			H.change_stat("skill", 1)
			H.change_stat("faith", 3) //old age tends to do this, you know
			belt = /obj/item/storage/belt/rogue/leather/plaquegold
			cloak = null
			head = /obj/item/clothing/head/roguetown/wizhat
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard

		if(H.gender == MALE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
