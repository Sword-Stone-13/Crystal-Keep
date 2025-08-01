/datum/advclass/mage
	name = "Mage"
	tutorial = "Mages are usually grown-up apprentices of wizards. They are seeking adventure, using their arcyne knowledge to aid or ward off other adventurers."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/mage
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 6

/datum/outfit/job/roguetown/adventurer/mage
	allowed_patrons = list(/datum/patron/divine/noc, /datum/patron/zizo)

/datum/outfit/job/roguetown/adventurer/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/rogueweapon/woodstaff
	if(prob(25))
		mask = /obj/item/clothing/mask/rogue/facemask
	if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/lightning
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/firebolt
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/frostbite
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/crystalpeep
	if(H.mind)
		to_chat(H, span_warning("Magic is often times refered to as an art. At times it is treated as a primordial beast, chaos incarnate. To more learned men it is a precise science, to be studied and examined. In the end, magic is all three of the above. It is Art, Chaos, and Science: a blessing, a curse, and progress. It all depends on who calls upon it, and for what purpose."))
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, pick(0,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(0,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		if(H.age == AGE_OLD)
			head = /obj/item/clothing/head/roguetown/wizhat/gen
			armor = /obj/item/clothing/suit/roguetown/shirt/robe
			H.change_stat("mageability", 4)
			H.change_stat("strength", -2)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
		H.mind.adjust_spellpoints(7)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", -1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/learnspell)
		H.mind.AddSpell(new  /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
