/mob/living/carbon/human/species/halforc
	race = /datum/species/halforc

/datum/species/halforc
	name = "Half Orc"
	id = "halforc"
	desc = "<b>Half Orcs</b><br>\
	With the Ironmask clan on a centuries-long warpath to consolidate all orcs within their banner, \
	crushed orc tribes have lost their menfolk and war-widows have been scattered to the hinterlands. \
	Between human civilization and orc savagery, orc-women opting for exile over dishonor have become \
	more common visitors to fur trading posts and prospecting camps, eventually leading to half-orcs \
	being born in these rough places otherwise devoid of a fairer sex. Your mother-clan is in thrall \
	to the Ironmask, true orcs would kill you as a mongrel dog and your father’s people cannot decide \
	between mere distrust and disgust. Yet somehow your wandering feet came to Crystal Keep, where \
	half-orcs ply muscle and their hardiness in the rough underbelly or outer reaches of society, wherever they're welcome."

	skin_tone_wording = "Clan"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft_muscular.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	use_m = TRUE
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,1), OFFSET_GLOVES_F = list(0,1), OFFSET_WRISTS_F = list(0,1), OFFSET_HANDS_F = list(0,1), \
		OFFSET_CLOAK_F = list(0,1), OFFSET_FACEMASK_F = list(0,1), OFFSET_HEAD_F = list(0,1), \
		OFFSET_FACE_F = list(0,1), OFFSET_BELT_F = list(0,1), OFFSET_BACK_F = list(0,1), \
		OFFSET_NECK_F = list(0,1), OFFSET_MOUTH_F = list(0,1), OFFSET_PANTS_F = list(0,1), \
		OFFSET_SHIRT_F = list(0,1), OFFSET_ARMOR_F = list(0,1), OFFSET_UNDIES_F = list(0,1))
	specstats =  list(
		"strength" = 2,
		"skill" = 0,
		"mageability" = -3,
		"constitution" = 2,
		"endurance" = 2,
		"speed" = -2,
		"faith" = -2,
	)
	specstats_f = list(
		"skill" = 1,
		"speed" = -1,
		"faith" = 2,
	)
	specstats_m = null
	specstats_f = null
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/halforc,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/halforc,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis,
		ORGAN_SLOT_BREASTS = /obj/item/organ/breasts,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)
	stress_examine = TRUE
	stress_desc = span_red("A damn orc!")
	languages = list(
		/datum/language/common,
		/datum/language/orcish
	)

	alignment_weights = HALFORC_WEIGHTS

/datum/species/halforc/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	var/mob/living/carbon/human/H = C
	if(H.age == AGE_YOUTH)
		offset_features = list(
			OFFSET_ID = list(0,-1), OFFSET_GLOVES = list(0,-1), OFFSET_WRISTS = list(0,-1),\
			OFFSET_CLOAK = list(0,-1), OFFSET_FACEMASK = list(0,-1), OFFSET_HEAD = list(0,-1), \
			OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,-1), OFFSET_BACK = list(0,-1), \
			OFFSET_NECK = list(0,-1), OFFSET_MOUTH = list(0,-1), OFFSET_PANTS = list(0,-1), \
			OFFSET_SHIRT = list(0,-1), OFFSET_ARMOR = list(0,-1), OFFSET_HANDS = list(0,-1), OFFSET_UNDIES = list(0,-1), \
			OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,-1), OFFSET_WRISTS_F = list(0,-1), OFFSET_HANDS_F = list(0,-2), \
			OFFSET_CLOAK_F = list(0,-1), OFFSET_FACEMASK_F = list(0,-2), OFFSET_HEAD_F = list(0,-2), \
			OFFSET_FACE_F = list(0,-2), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-2), \
			OFFSET_NECK_F = list(0,-2), OFFSET_MOUTH_F = list(0,-2), OFFSET_PANTS_F = list(0,-1), \
			OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1))
		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mem.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/fs.dmi'
		hairyness = null
//		soundpack_m = new /datum/voicepack/male/young()
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()

/datum/species/halforc/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak Orcish with ,o before my speech.</span>")

/datum/species/halforc/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/halforc/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/halforc/get_skin_list()
	return list(
		"Shellcrest" = SKIN_COLOR_SHELLCREST,
		"Bloodaxe" = SKIN_COLOR_BLOOD_AXE,
		"Splitjaw" = SKIN_COLOR_GROONN,
		"Blackhammer" = SKIN_COLOR_BLACK_HAMMER,
		"Skullseeker" = SKIN_COLOR_SKULL_SEEKER
	)

/datum/species/halforc/get_hairc_list()
	return sortList(list(
		"Minotaur" = "58433b",
		"Volf" = "48322a",
		"Maneater" = "458745",
		"Mud" = "201616",
	))

/datum/species/halforc/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/halforcm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/halforcf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/halforcm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/halforcf.txt") )
	return randname

/datum/species/halforc/random_surname()
	return

//Groups of Accents for each race set by associated 'skin_tone', see 'get_skin_list' above
// "full" group in JSON lists
/datum/species/halforc/get_accent(mob/living/carbon/human/H)
	return strings("middlespeak.json", "full")

// "start" group in JSON lists
/datum/species/halforc/get_accent_start(mob/living/carbon/human/H)
	return strings("middlespeak.json", "start")

// "end" group in JSON lists
/datum/species/halforc/get_accent_end(mob/living/carbon/human/H)
	return strings("middlespeak.json", "end")

// "syllable" group in JSON lists
/datum/species/halforc/get_accent_any(mob/living/carbon/human/H)
	return strings("middlespeak.json", "syllable")
