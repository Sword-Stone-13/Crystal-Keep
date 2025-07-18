/mob/living/carbon/human/species/elf/wood
	race = /datum/species/elf/wood

/datum/species/elf/wood
	name = "Elf"
	id = "elfw"
	desc = "<b>Elf</b><br>\
	Elves are a generic term for tall, pointy-eared \
	folk closely resembling humen. They usually live longer than humen, up to thrice the length. \
	Scattered among small and large tribes, they usually maintain a healthy distance from one another, since most claim Dendor as their god, larger civilizations often irk them. \
	Humen often look down upon most elves , as the two races have been rivals in various conflicts and territorial disputes. \
	Only recently has a large tribe has posed a challenge to Humen, \
	Walnutians of the Walnut Woods, creating a treaty with the Crystal Keep Royal Courts that commits an uneasy allyship in exchange for peace among the land. \
	As such, a myriad of other tribes of elves have arrived to Crystal Keep in curiousity. Marking one of the few peaceful interactions between the two folk."

	skin_tone_wording = "Tribal Identity"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/met.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	use_f = TRUE
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(
		OFFSET_ID = list(0,2), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,2), OFFSET_FACEMASK = list(0,2), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,2), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,2), OFFSET_PANTS = list(0,2), \
		OFFSET_SHIRT = list(0,2), OFFSET_ARMOR = list(0,2), OFFSET_HANDS = list(0,2), OFFSET_UNDIES = list(0,0), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0), \
	)
	specstats = list(
		"strength" = 0,
		"skill" = 2,
		"mageability" = 2,
		"constitution" = -1,
		"endurance" = 0,
		"speed" = 2,
		"faith" = 2,
		"fortune" = 0
	)
	specstats_f = list(
		"strength" = -2,
		"mageability" = 1,
		"speed" = 1,
	)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/elfw,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis,
		ORGAN_SLOT_BREASTS = /obj/item/organ/breasts,
	)
	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)
	languages = list(
		/datum/language/common,
		/datum/language/elvish
	)
	body_markings = list()

/datum/species/elf/wood/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/species/elf/wood/H = C
	if(H.skin_tone == SKIN_COLOR_WALNUT_WOODS)
		H.grant_language(/datum/language/beachbum)
		to_chat(H, span_info("I can speak deep elf with ,l before my speech."))


	if(H.age == AGE_YOUTH)
		offset_features = list(
			OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,-2), OFFSET_WRISTS = list(0,-1),
			OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,-1),
			OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,-1), OFFSET_BACK = list(0,0),
			OFFSET_NECK = list(0,-1), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,0),
			OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,0), OFFSET_UNDIES = list(0,-2),
			OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,-1), OFFSET_WRISTS_F = list(0,-1), OFFSET_HANDS_F = list(0,-2),
			OFFSET_CLOAK_F = list(0,-1), OFFSET_FACEMASK_F = list(0,-2), OFFSET_HEAD_F = list(0,-2),
			OFFSET_FACE_F = list(0,-2), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-2),
			OFFSET_NECK_F = list(0,-2), OFFSET_MOUTH_F = list(0,-2), OFFSET_PANTS_F = list(0,-1),
			OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1)
		)
		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mem.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/fs.dmi'
		hairyness = null
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()
	ADD_TRAIT(C, TRAIT_LEAF_WALKER, TRAIT_GENERIC)

	alignment_weights = WOODELF_WEIGHTS
/datum/species/elf/wood/get_span_language(datum/language/message_language)
	if(!message_language)
		return
//	if(message_language.type == /datum/language/elvish)
//		return list(SPAN_SELF)
//	if(message_language.type == /datum/language/common)
//		return list(SPAN_SELF)
	return message_language.spans

/datum/species/elf/wood/get_skin_list()
	return list(
		"Dandelion Creek" = SKIN_COLOR_DANDELION_CREEK,
		"Roseveil" = SKIN_COLOR_ROSEVEIL,
		"Azuregrove" = SKIN_COLOR_AZUREGROVE,
		"Arborshome" = SKIN_COLOR_ARBORSHOME,
		"Almondvalle" = SKIN_COLOR_ALMONDVALLE,
		"Walnut Woods" = SKIN_COLOR_WALNUT_WOODS,
		"Timberborn" = SKIN_COLOR_TIMBERBORN,
	)

/datum/species/elf/wood/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"white - snow" = "dee9ed",
	"white - ice" = "f4f4f4",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"green - grass" = "2a482c",
	"green - swamp" = "3b482a",
	"green - leaf" = "2f3c2e",
	"green - moss" = "3b3c2a"

	))

/datum/species/elf/wood/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfwm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfwf.txt") )
	return randname

/datum/species/elf/wood/random_surname()
	return " [pick(world.file2list("strings/rt/names/elf/elfwlast.txt"))]"

//Groups of Accents for each race set by associated 'skin_tone', see 'get_skin_list' above
// "full" group in JSON lists
/datum/species/elf/wood/get_accent(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_WALNUT_WOODS) //Psydon's little elves
						return strings("walnut_woods_replacement.json", "full")
				else////cute speech impediment elves
						return strings("Elvish.json", "full")
		return null

// "start" group in JSON lists
/datum/species/elf/wood/get_accent_start(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_WALNUT_WOODS) //neighboring elves
						return strings("walnut_woods_replacement.json", "start")
				else // All Other Elves
						return strings("Elvish.json", "start")
		return null

// "end" group in JSON lists
/datum/species/elf/wood/get_accent_end(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_WALNUT_WOODS) //neighboring
						return strings("walnut_woods_replacement.json", "end")
				else // All Other Elves
						return strings("Elvish.json", "end")
		return null

// "syllable" group in JSON lists
/datum/species/elf/wood/get_accent_any(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_WALNUT_WOODS) //neighboring
						return strings("walnut_woods_replacement.json", "syllable")
				else // All Other Elves
						return strings("Elvish.json", "syllable")
		return null
