/datum/migrant_role/jadekingdom/emperor
	name = "Lord of the jade kingdom"
	greet_text = "You are the Lord of Jade Kingdom, ruler of a once-prosperous barony now in ruin. Guided by your Magos, you journey to Rockhill, seeking aid to restore your domain to its former glory, or perhaps claim a new throne."
	outfit = /datum/outfit/job/roguetown/jadekingdom/emperor
	allowed_sexes = list(MALE)
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/jadekingdom/emperor/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/jadekingdom
	armor = /obj/item/clothing/suit/roguetown/armor/jadekingdom/emperor
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/rogueweapon/sword/long/marlin
	beltr = /obj/item/rogueweapon/huntingknife
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	if(H.mind)
		H.virginity = TRUE
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("skill", 5)
		H.change_stat("fortune", 5)

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/migrant_role/jadekingdom/empress
	name = "Lady of jadekingdom"
	greet_text = "You are the Lady of jadekingdom, once a respected noblewoman now struggling to survive in a desolate landscape. With your home in ruins, you look to Rockhill, hoping to find new purpose or refuge amidst the chaos."
	outfit = /datum/outfit/job/roguetown/jadekingdom/empress
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/jadekingdom/empress/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/hennin
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	cloak = /obj/item/clothing/cloak/jadekingdom
	if(isdwarf(H))
		armor = /obj/item/clothing/suit/roguetown/shirt/dress
	else
		armor = /obj/item/clothing/suit/roguetown/armor/armordress
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	id = /obj/item/clothing/ring/silver
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.change_stat("mageability", 3)
		H.change_stat("faith", 4)
		H.change_stat("skill", 3)
		H.change_stat("fortune", 5)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/migrant_role/jadekingdom/shogun
	name = "Hand of jadekingdom"
	greet_text = "You are the Hand of jadekingdom, burdened by the perception of failure in protecting your Lord's domain. Despite doubts from others, your loyalty remains steadfast as you journey to Rockhill, determined to fulfill your duties."
	outfit = /datum/outfit/job/roguetown/jadekingdom/shogun
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/jadekingdom/shogun/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/jadekingdom/shogun
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	gloves =/obj/item/clothing/gloves/roguetown/angle
	beltl = /obj/item/rogueweapon/sword/sabre/dec
	beltr = /obj/item/rogueweapon/huntingknife
	backr = /obj/item/storage/backpack/rogue/satchel/jadekingdom
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("skill", 3)
		H.change_stat("mageability", 2)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/migrant_role/jadekingdom/hatamoto
	name = "hatamoto of jadekingdom"
	greet_text = "You are a hatamoto of jadekingdom, once part of a brotherhood in service to your Lord. Now, alone and committed to safeguarding what remains of your court, you ride to the Crystal Keep, resolved to ensure their safe arrival."
	outfit = /datum/outfit/job/roguetown/jadekingdom/hatamoto
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/jadekingdom/hatamoto/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	gloves = /obj/item/clothing/gloves/roguetown/plate //to be samurai armor (medium) soon
	pants = /obj/item/clothing/under/roguetown/platelegs
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	neck = /obj/item/clothing/neck/roguetown/bervor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/blacksteel/cuirass
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/silver/sabre/elf
	else
		r_hand = /obj/item/rogueweapon/sword/sabre
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE) //sumo
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("skill", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/migrant_role/jadekingdom/hatamoto/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/knight/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight tabard ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Hatamoto"
		if(H.gender == FEMALE)
			honorary = "Hatamoto"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

/datum/migrant_role/jadekingdom/onmyoji
	name = "Onmyoki of jadekingdom"
	greet_text = "You are the Magos of jadekingdom, renowned for your arcane knowledge yet unable to foresee the tragedy that befell your home. Drawn by a guiding star to the Crystal Keep, you seek answers and perhaps a new purpose in the wake of destruction."
	outfit = /datum/outfit/job/roguetown/jadekingdom/onmyoji
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/jadekingdom/onmyoji
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/jadekingdom/onmyoji/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/talkstone
	cloak = /obj/item/clothing/cloak/black_cloak
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
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

/datum/migrant_role/jadekingdom/guji
	name = "guji of jadekingdom"
	greet_text = "The Prior of jadekingdom, you were destined for ascension within the Church, but fate intervened with the barony's downfall, delaying it indefinitely. Still guided by the blessings of Astrata, you journey to Rockhill, determined to offer what aid and solace you can."
	outfit = /datum/outfit/job/roguetown/jadekingdom/guji
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE


/datum/outfit/job/roguetown/jadekingdom/guji
	allowed_patrons = list(/datum/patron/divine/astrata)

/datum/outfit/job/roguetown/jadekingdom/guji/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	cloak = /obj/item/clothing/cloak/chasuble
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
