//Barons of the other three houses
//white
/datum/migrant_role/whitehouse/cardinal
	name = "Cardinal"
	greet_text = "You are a cardinal sent down to visit one of the lower priests in the lowly part of the kingdom. As of late, the inhumen have been scouring have been scouring around the land, and lately, this is the busiest church for their presence."
	outfit = /datum/outfit/job/roguetown/whitehouse/cardinal
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	associated_squad = /datum/antagonist/squad/white/leader

/datum/outfit/job/roguetown/whitehouse/cardinal
	allowed_patrons = list(/datum/patron/divine/astrata)

/datum/outfit/job/roguetown/whitehouse/cardinal/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	cloak = /obj/item/clothing/cloak/half/house
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("faith", 8)
		H.change_stat("speed", -1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/migrant_role/whitehouse/knight
	name = "Paladin"
	greet_text = "You vowed long ago to protect the church, and her people. Your blade for the Gods."
	allowed_sexes = list(MALE)
	outfit = /datum/outfit/job/roguetown/whitehouse/knight
	allowed_races = RACES_SHUNNED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/white/knight


/datum/outfit/job/roguetown/whitehouse/knight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/white
	gloves = /obj/item/clothing/gloves/roguetown/plate/white
	pants = /obj/item/clothing/under/roguetown/platelegs/white
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/white
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/white
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/white
	if(prob(50))
		r_hand = /obj/item/rogueweapon/estoc
	else
		r_hand = /obj/item/rogueweapon/greatsword
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("skill", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("fortune", 1)
		H.change_stat("faith", 2)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

/datum/migrant_role/whitehouse/witch
	name = "White Mage"
	greet_text = "You are an exceptional magewoman. You were taken from your magi parenthood to serve the church. As such, you have both inborn talents you were trained for, as well as miracles at your disposal."
	allowed_sexes = list(FEMALE)
	outfit = /datum/outfit/job/roguetown/whitehouse/mage
	allowed_races = RACES_SHUNNED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/white/mage

/datum/outfit/job/roguetown/whitehouse/mage
	allowed_patrons = list(/datum/patron/divine/astrata)

/datum/outfit/job/roguetown/whitehouse/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/wizhat/house
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/black_cloak/house/white
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/housewhite
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	gloves = /obj/item/clothing/gloves/roguetown/leather/house/white
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather/house
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/flashlight/flare/torch/lantern
	id = /obj/item/clothing/ring/gold
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/slimepotion/lovepotion,/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
	ADD_TRAIT(H, TRAIT_SEEPRICES, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -2)
		H.change_stat("faith", 3)
		H.change_stat("mageability", 5)
		H.mind.adjust_spellpoints(5)
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.grant_spells_priest(H)
		H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
		var/list/spells = list(/obj/effect/proc_holder/spell/invoked/learnspell, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation, /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater)
		for(var/S in spells)
			H.mind.AddSpell(new S)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)

			H.change_stat("speed", -1)
			H.change_stat("mageability", 1)
			H.change_stat("skill", 1)
			H.change_stat("faith", 1)

//black

/datum/migrant_role/blackhouse/duke
	name = "Royal"
	greet_text = "You received a letter from someone near the king. They claim to be the king's confedant and close friend, they even had their own seal on it. Word is they're the king's 'hand' and that prompted you to pay a visit."
	outfit = /datum/outfit/job/roguetown/blackhouse/duke
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_EORA_APPROVED
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/black/leader

/datum/outfit/job/roguetown/blackhouse/duke/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/lordcloak
	armor = /obj/item/clothing/suit/roguetown/armor/blacksteel/cuirass
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/rogueweapon/sword/long/marlin
	beltr = /obj/item/rogueweapon/huntingknife
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("skill", 5)
		H.change_stat("constitution", 2)
		H.change_stat("fortune", 5)

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/migrant_role/blackhouse/knight
	name = "Black Knight"
	greet_text = "You are one of the kings knights sent off to survey his land, and land bestowed onto you. You've come back to visit."
	outfit = /datum/outfit/job/roguetown/blackhouse/knight
	allowed_races = RACES_EORA_APPROVED
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/black/knight


/datum/outfit/job/roguetown/blackhouse/knight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/black
	gloves = /obj/item/clothing/gloves/roguetown/plate/black
	pants = /obj/item/clothing/under/roguetown/blacksteel/platelegs
	cloak = /obj/item/clothing/cloak/tabard/houseblack
	neck = /obj/item/clothing/neck/roguetown/bervor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/black
	armor = /obj/item/clothing/suit/roguetown/armor/blacksteel/platechest
	shoes = /obj/item/clothing/shoes/roguetown/boots/blacksteel/plateboots
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/estoc
	else
		r_hand = /obj/item/rogueweapon/greatsword
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 5)
		H.change_stat("skill", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
		H.change_stat("fortune", -2) //lol
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

/datum/migrant_role/blackhouse/witch
	name = "Black Witch"
	greet_text = "You are the witch of one of the local duchy. Your spell craft is... uncontested, a fact you hold very proudly."
	outfit = /datum/outfit/job/roguetown/blackhouse/mage
	allowed_races = RACES_TOLERATED_UP
	allowed_sexes = list(FEMALE)
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/black/mage

/datum/outfit/job/roguetown/blackhouse/mage
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/blackhouse/mage/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/cape/house
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/houseblack
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	shoes = /obj/item/clothing/shoes/roguetown/sandals/house
	wrists = /obj/item/clothing/wrists/roguetown/bracers/cloth/black
	belt = /obj/item/storage/belt/rogue/leather/black/loose
	beltl = /obj/item/flashlight/flare/torch/lantern
	id = /obj/item/clothing/ring/gold
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/slimepotion/lovepotion,/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/reagent_containers/glass/bottle/rogue/healthpot)
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
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("mageability", 5)
		H.mind.adjust_spellpoints(8)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat("speed", -1)
			H.change_stat("mageability", 1)
			H.change_stat("skill", 1)
			if(ishumannorthern(H))
				belt = /obj/item/storage/belt/rogue/leather/plaquegold
				cloak = null
				head = /obj/item/clothing/head/roguetown/wizhat
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
				H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
		var/list/spells = list(/obj/effect/proc_holder/spell/invoked/learnspell, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation, /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater)
		for(var/S in spells)
			H.mind.AddSpell(new S)

//Green

/datum/migrant_role/greenhouse/guildofficer
	name = "Guild Officer"
	greet_text = "You come from Walnut Woods, more specifically, the adventurer's guild. Rather, the largest organized effort to create an organization for the dissemination of mercenaries and travel guides to the surrounding lands. Essentially, you are tasked with reviewing the hospitality of Crystal Keep."
	outfit = /datum/outfit/job/roguetown/greenhouse/duke
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/green/leader

/datum/outfit/job/roguetown/greenhouse/duke/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/bardhat
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/bog
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	shoes = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	pants = /obj/item/clothing/under/roguetown/trou/leather/masterwork
	cloak = /obj/item/clothing/cloak/cape/elvish
	armor = /obj/item/clothing/suit/roguetown/armor/blacksteel/cuirass
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/rogueweapon/sword/long/marlin
	beltr = /obj/item/rogueweapon/huntingknife
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("skill", 5)
		H.change_stat("constitution", 2)
		H.change_stat("fortune", 5)

	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/migrant_role/greenhouse/knight
	name = "Hedge Knight"
	greet_text = "You are a hedge knight, a trained warrior who has been knighted by a Walnut Woodsian court. Only, instead of land, you have been given responsibility. It could be retaining for a Guild officer, it could also be teaching Walnut Woodsian hospitality to its surrounding lands. Something that will make you very... unpopular."
	outfit = /datum/outfit/job/roguetown/greenhouse/knight
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE)
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/green/knight


/datum/outfit/job/roguetown/greenhouse/knight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/echarus
	gloves = /obj/item/clothing/gloves/roguetown/plate/echarus 
	pants = /obj/item/clothing/under/roguetown/platelegs/echarus
	neck = /obj/item/clothing/neck/roguetown/bervor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/housegreen
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/echarus
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/echarus
	gloves = /obj/item/clothing/gloves/roguetown/plate/echarus
	id = /obj/item/clothing/ring/invader/blue
	beltr = /obj/item/rogueweapon/sword/elfnut/silvernut
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/guildgreen
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/estoc
	else
		r_hand = /obj/item/rogueweapon/greatsword
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("skill", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 3)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

/datum/migrant_role/greenhouse/witch
	name = "Guild Mage"
	greet_text = "You are a shining exemplar scholar at the Walnut Woods Mage Academy, granted a position as one of their guild's primary mages."
	outfit = /datum/outfit/job/roguetown/greenhouse/mage
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	associated_squad = /datum/antagonist/squad/green/mage

/datum/outfit/job/roguetown/greenhouse/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/echarus
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/black_cloak/house/
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	pants = /obj/item/clothing/under/roguetown/jeans/guild
	shoes = /obj/item/clothing/shoes/roguetown/armor/shalal
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/house
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/housegreen
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/flashlight/flare/torch/lantern
	id = /obj/item/clothing/ring/gold
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/slimepotion/lovepotion,/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/reagent_containers/glass/bottle/rogue/healthpot, /obj/item/clothing/mask/rogue/facemask/leather/heavy)
	ADD_TRAIT(H, TRAIT_SEEPRICES, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -1)
		H.change_stat("mageability", 5)
		H.mind.adjust_spellpoints(6)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat("speed", -1)
			H.change_stat("mageability", 1)
			H.change_stat("skill", 1)
			if(ishumannorthern(H))
				belt = /obj/item/storage/belt/rogue/leather/plaquegold
				cloak = null
				head = /obj/item/clothing/head/roguetown/wizhat
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard
				H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
		var/list/spells = list(/obj/effect/proc_holder/spell/invoked/learnspell, /obj/effect/proc_holder/spell/targeted/touch/prestidigitation, /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater)
		for(var/S in spells)
			H.mind.AddSpell(new S)



///fighters
//house heart
/datum/migrant_role/whitehouse/warrior
	name = "Church Militia"
	greet_text = "You are part of the militia of the Ten's church. Money, piety, reputation; even freedom and a warm meal. Whatever had you drafted into the militia is promised to you. For the ten!"
	outfit = /datum/outfit/job/roguetown/whitehouse/warrior
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	grant_lit_torch = TRUE
	show_wanderer_examine = TRUE
	associated_squad = /datum/antagonist/squad/white


/datum/outfit/job/roguetown/whitehouse/warrior/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	shoes = /obj/item/clothing/shoes/roguetown/armor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	shirt =/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/heater
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/rogueweapon/sword/iron
	r_hand = /obj/item/rogueweapon/spear
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)



//black house
/datum/migrant_role/blackhouse/warrior
	name = "Conscripted Militia"
	greet_text = "You serve your local lord. Crystal Keep, a strange little hobble nestled behind a series of caves bottlenecking them from the rest of the kingdom is where the king resides. Your eyes might actually gaze upon the royal vestige, a privilege granted to you for your service. FOR THE KING!"
	outfit = /datum/outfit/job/roguetown/blackhouse/warrior
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	grant_lit_torch = TRUE
	show_wanderer_examine = TRUE
	associated_squad = /datum/antagonist/squad/black


/datum/outfit/job/roguetown/blackhouse/warrior/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 1) 
	H.change_stat("constitution", 1)
	H.change_stat("skill", 1)
	shoes = /obj/item/clothing/shoes/roguetown/armor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/coif
	shirt =/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	head = /obj/item/clothing/head/roguetown/helmet/skullcap
	backl = /obj/item/ammo_holder/quiver/arrows
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	beltl = /obj/item/rogueweapon/huntingknife
	beltr = /obj/item/rogueweapon/sword/iron
	r_hand = /obj/item/rogueweapon/spear

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

//green
/datum/migrant_role/greenhouse/warrior
	name = "Guild Adventurer"
	advclass_cat_rolls = list(CTAG_ADVENTURER = 5) //for now we see if this works otherwise we just have them roll as normal.
	associated_squad = /datum/antagonist/squad/green
