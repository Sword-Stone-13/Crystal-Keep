/datum/advclass/stormmage
	name = "stormmage"
	tutorial = "Nothing puts a thorn in the side of the unfaithful than a proper master of the storm. Divine or nature given, a sorcerer like this brings the thunder."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/kobold,
		/datum/species/aasimar,
		/datum/species/dwarf/mountain,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/stormmage
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 25
	maximum_possible_slots = 1
/datum/outfit/job/roguetown/adventurer/stormmage


/datum/outfit/job/roguetown/adventurer/stormmage/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/gun/magic/spellbook/lightning
	beltl = /obj/item/rogueweapon/huntingknife
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	
	r_hand = /obj/item/rogueweapon/woodstaff
	if(prob(25))
		mask = /obj/item/clothing/mask/rogue/facemask
	if(prob(25))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/angle
	if(prob(50))
		beltl = /obj/item/gun/magic/spellbook/shock
	else if(prob(50))
		beltl = /obj/item/gun/magic/spellbook/thoron
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, pick(2,3,3), TRUE)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 2)
		H.change_stat("faith", 5)
		H.change_stat("speed", 3)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/item/melee/touch_attack/prestidigitation)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/featherfall)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/lightninglure5e)
