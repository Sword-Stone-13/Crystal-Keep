
/datum/job/roguetown/priest
	title = "Priest"
	flag = PRIEST
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_CHURCH
	f_title = "Priestess"
	allowed_races = RACES_TOLERATED_UP
	allowed_patrons = ALL_DIVINE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "The Divine is all that matters in a world of the immoral. The Weeping God left his children to rule over us mortals and you will preach their wisdom to any who still heed their will. The faithless are growing in number, it is up to you to shepard them to a Gods-fearing future."
	whitelist_req = FALSE

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/templar, /obj/effect/proc_holder/spell/self/convertrole/monk)
	outfit = /datum/outfit/job/roguetown/priest

	display_order = JDO_PRIEST
	associated_squad = /datum/antagonist/squad/none
	give_bank_account = 115
	min_pq = 8
	max_pq = null

	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/priest
	allowed_patrons = list(/datum/patron/divine/astrata)

/datum/outfit/job/roguetown/priest/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	head = /obj/item/clothing/head/roguetown/priestmask
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	beltl = /obj/item/keyring/priest
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/active/nomag
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
		H.change_stat("faith", 5)

	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	H.verbs |= /mob/living/carbon/human/proc/coronate_lord
	H.verbs |= /mob/living/carbon/human/proc/churchexcommunicate
	H.verbs |= /mob/living/carbon/human/proc/churchannouncement
	H.verbs |= /mob/living/carbon/human/proc/churchhereticsbrand
//	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
//		H.underwear = "Femleotard"
//		H.underwear_color = CLOTHING_BLACK
//		H.update_body()

/mob/living/carbon/human/proc/coronate_lord()
	set name = "Coronate"
	set category = "Priest"
	if(!mind)
		return
	if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
		to_chat(src, span_warning("I need to do this in the chapel."))
		return FALSE
	for(var/mob/living/carbon/human/HU in get_step(src, src.dir))
		if(!HU.mind)
			continue
		if(HU.mind.assigned_role == "King")
			continue
		if(!HU.head)
			continue
		if(!istype(HU.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
			continue

		//Abdicate previous King
		for(var/mob/living/carbon/human/HL in GLOB.human_list)
			if(HL.mind)
				if(HL.mind.assigned_role == "King" || HL.mind.assigned_role == "Queen")
					HL.mind.assigned_role = "Towner" //So they don't get the innate traits of the lord
			//would be better to change their title directly, but that's not possible since the title comes from the job datum
			if(HL.job == "King")
				HL.job = "King Emeritus"
			if(HL.job == "Queen")
				HL.job = "Queen Dowager"
			SSjob.type_occupations[/datum/job/roguetown/lord].remove_spells(HL)

		//Coronate new Lord (or Lady)
		HU.mind.assigned_role = "King"
		HU.job = "King"
		SSjob.type_occupations[/datum/job/roguetown/lord].add_spells(HU)

		switch(HU.gender)
			if("male")
				SSticker.rulertype = "King"
			if("female")
				SSticker.rulertype = "Queen"
		SSticker.rulermob = HU
		var/dispjob = mind.assigned_role
		removeomen(OMEN_NOLORD)
		say("By the authority of the gods, I pronounce you [SSticker.rulertype] of the Crystal Keep!")
		priority_announce("[real_name] the [dispjob] has named [HU.real_name] the [SSticker.rulertype] of the Crystal Keep!", title = "Long Live [HU.real_name]!", sound = 'sound/misc/bell.ogg')
		TITLE_LORD = SSticker.rulertype

/mob/living/carbon/human/proc/churchexcommunicate()
	set name = "Excommunicate"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Excommunicate someone, pushing them the ten's grace and approval.", "Sinner Name") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
			to_chat(src, span_warning("I need to do this from the Church."))
			return FALSE
		if(inputty in GLOB.excommunicated_players)
			GLOB.excommunicated_players -= inputty
			priority_announce("[real_name] has forgiven [inputty]. Their patron hears their prayer once more!", title = "Hail the Ten!", sound = 'sound/misc/bell.ogg')
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.real_name == inputty)
					switch(H.patron.type)
						if(/datum/patron/inhumen/psydon, /datum/patron/inhumen/baotha, /datum/patron/inhumen/graggar, /datum/patron/inhumen/nyatthios, /datum/patron/zizo)
							H.remove_stress(/datum/stressevent/gazeuponme)
							H.remove_status_effect(/datum/status_effect/buff/gazeuponme)
						else
							H.remove_stress(/datum/stressevent/psycurse)
							H.remove_status_effect(/datum/status_effect/debuff/excomm)
					H.devotion.recommunicate()
			return
		var/found = FALSE
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.real_name == inputty)
				found = TRUE
				H.add_stress(/datum/stressevent/psycurse)
				H.devotion.excommunicate()
		if(!found)
			return FALSE

		GLOB.excommunicated_players += inputty
		priority_announce("[real_name] has excommunicated [inputty] from the Church!", title = "SHAME", sound = 'sound/misc/excomm.ogg')

/mob/living/carbon/human/proc/churchhereticsbrand()
	set name = "Brand Heretic"
	set category = "Priest"
	if(stat)
		return
	var/inputty = input("Brand someone as a foul heretic... (brand them again to remove it)", "Sinner Name") as text|null
	if(inputty)
		if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
			to_chat(src, span_warning("I need to do this from the Church."))
			return FALSE
		if(inputty in GLOB.heretical_players)
			GLOB.heretical_players -= inputty
			priority_announce("[real_name] has removed the Heretic's Brand from [inputty]. Once more walk in the light!", title = "Hail the Ten!", sound = 'sound/misc/bell.ogg')
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.real_name == inputty)
					H.remove_stress(/datum/stressevent/psycurse)
			return
		var/found = FALSE
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H == src)
				continue
			if(H.real_name == inputty)
				found = TRUE
				switch(H.patron.type)
					if(/datum/patron/inhumen/psydon, /datum/patron/inhumen/baotha, /datum/patron/inhumen/graggar, /datum/patron/inhumen/nyatthios, /datum/patron/zizo)
						H.add_stress(/datum/stressevent/gazeuponme)
						H.apply_status_effect(/datum/status_effect/buff/gazeuponme)
					else if(H.patron.type != /datum/patron/godless)
						H.add_stress(/datum/stressevent/psycurse)
						H.apply_status_effect(/datum/status_effect/debuff/excomm)
		if(!found)
			return FALSE
		GLOB.heretical_players += inputty
		priority_announce("[real_name] has placed a Heretic's Brand upon [inputty]!", title = "SHAME", sound = 'sound/misc/excomm.ogg')

/mob/living/carbon/human
	COOLDOWN_DECLARE(church_announcement)

/mob/living/carbon/human/proc/churchannouncement()
	set name = "Announcement"
	set category = "Priest"

	if(!COOLDOWN_FINISHED(src, church_announcement))
		to_chat(src, span_warning("I should wait..."))
		return

	if(stat)
		return FALSE

	var/inputty = input("Make an announcement", "ROGUETOWN") as text|null
	if(!inputty)
		return FALSE

	if(!istype(get_area(src), /area/rogue/indoors/town/church/chapel))
		to_chat(src, span_warning("I need to do this from the chapel."))
		return FALSE

	priority_announce("[inputty]", title = "The Priest Speaks", sound = 'sound/misc/bell.ogg')
	COOLDOWN_START(src, church_announcement, 30 SECONDS)

/obj/effect/proc_holder/spell/self/convertrole/templar
	name = "Recruit Templar"
	new_role = "Templar"
	overlay_state = "recruit_templar"
	recruitment_faction = "Templars"
	recruitment_message = "Serve the ten, %RECRUIT!"
	accept_message = "FOR THE TEN!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/monk
	name = "Recruit Acolyte"
	new_role = "Acolyte"
	overlay_state = "recruit_acolyte"
	recruitment_faction = "Church"
	recruitment_message = "Serve the ten, %RECRUIT!"
	accept_message = "FOR THE TEN!"
	refuse_message = "I refuse."
