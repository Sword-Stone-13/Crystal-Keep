
/datum/intent/spear/thrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("thrusts")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1.5
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 30
	item_d_type = "stab"

/datum/intent/spear/bash
	name = "bash"
	blade_class = BCLASS_BLUNT
	icon_state = "inbash"
	attack_verb = list("bashes", "clubs", "strikes")
	penfactor = 10
	damfactor = 0.8
	item_d_type = "blunt"
	iparrybonus = 5
	idodgebonus = 15

/datum/intent/spear/cut
	name = "cut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	icon_state = "incut"
	damfactor = 0.8
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	reach = 2
	item_d_type = "slash"

/obj/item/rogueweapon/woodstaff
	force = 10
	force_wielded = 15
	possible_item_intents = list(SPEAR_BASH)
	gripped_intents = list(SPEAR_BASH,/datum/intent/mace/smash/wood)
	name = "wooden staff"
	desc = "Not so heavy, perfect for beggars, pilgrims and mages."
	icon_state = "woodstaff"
	icon = 'icons/roguetown/weapons/64.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	wdefense = 10
	bigboy = TRUE
	gripsprite = TRUE
	associated_skill = /datum/skill/combat/polearms
	wparrybonus = 10
	wparryspeed = 3
	wdodgebonus = 15
	metalizer_result = /obj/item/rogueweapon/spear/bronze

// Allows blind carbons to examine if they click on an object using a wooden staff
/obj/item/rogueweapon/woodstaff/pre_attack(atom/A, mob/living/user, params)
	if(HAS_TRAIT(user, TRAIT_BLIND) && !user.cmode) //if is not used by a blind mob in combat mode it won't examine
		var/list/exam = A.examine(user) //directly extracts the examine string without using the examinate proc
		if(A != user) // avoids the message of user poking themselves
			src.visible_message(span_notice("[user] pokes [A] with [user.p_their()] wooden staff"))
		if(exam)
			to_chat(user, exam.Join("\n"))//relays the examine string to the user
		return TRUE

/obj/item/rogueweapon/woodstaff/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/woodstaff/wise
	name = "wise staff"
	desc = "A staff for keeping the volfs at bay..."

/obj/item/rogueweapon/woodstaff/aries
	name = "staff of the shepherd"
	desc = "Your flock awaits your protection and guidance."
	force = 25
	force_wielded = 28
	icon_state = "aries"
	icon = 'icons/roguetown/weapons/32.dmi'
	pixel_y = 0
	pixel_x = 0
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = FALSE
	gripsprite = FALSE
	gripped_intents = null
	wparrybonus = 25
	wparryspeed = 5
	wdodgebonus = 30

/obj/item/rogueweapon/woodstaff/aries/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 2,"nx" = 8,"ny" = 2,"wx" = -4,"wy" = 2,"ex" = 1,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 300,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 100,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)


/obj/item/rogueweapon/spear
	force = 18
	force_wielded = 23
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for non-lethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, SPEAR_BASH)
	name = "spear"
	desc = "This iron spear is great to impale goblins."
	icon_state = "spear"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 8
	max_blade_int = 100
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5
	thrown_bclass = BCLASS_STAB
	throwforce = 25
	max_integrity = 100
	crit_bonus = 10
	can_crit_throw = TRUE

/obj/item/rogueweapon/spear/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/spear/billhook
	name = "billhook"
	desc = "A neat hook."
	icon_state = "billhook"
	force_wielded = 30
	smeltresult = /obj/item/ingot/steel
	max_blade_int = 130
	minstr = 8
	wdefense = 6
	throwforce = 15

/obj/item/rogueweapon/spear/improvisedbillhook
	force = 12
	force_wielded = 25
	name = "improvised billhook"
	desc = "Looks hastily made."
	icon_state = "billhook"
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 90
	wdefense = 4
	throwforce = 10

/obj/item/rogueweapon/spear/stone
	force = 15
	force_wielded = 18
	name = "stone spear"
	desc = "This handmade spear is simple, but does the job."
	icon_state = "stonespear"
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	minstr = 6
	max_blade_int = 50
	smeltresult = null
	associated_skill = /datum/skill/combat/polearms
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 4
	max_integrity = 50
	throwforce = 20

/obj/item/rogueweapon/halberd
	force = 15
	force_wielded = 30
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for less-lethal takedowns, only targets limbs.
	gripped_intents = list(SPEAR_THRUST, /datum/intent/spear/cut/halberd, /datum/intent/sword/chop, SPEAR_BASH)
	name = "halberd"
	desc = "An iron halberd, mostly used by town guards."
	icon_state = "halberd"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 9
	max_blade_int = 150
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5
	max_integrity = 100

/obj/item/rogueweapon/halberd/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/halberd/bardiche
	possible_item_intents = list(/datum/intent/spear/thrust/eaglebeak, SPEAR_BASH) //bash is for less-lethal takedowns, only targets limbs.
	gripped_intents = list(/datum/intent/spear/thrust/eaglebeak, /datum/intent/spear/cut/halberd, /datum/intent/axe/chop, SPEAR_BASH)
	name = "bardiche"
	desc = "A beautiful variant of the halberd."
	icon_state = "bardiche"
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 200

/datum/intent/spear/cut/halberd
	damfactor = 0.9
	swingdelay = 10

/obj/item/rogueweapon/eaglebeak
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/spear/thrust/eaglebeak, SPEAR_BASH) //bash is for less-lethal takedowns, only targets limbs.
	gripped_intents = list(/datum/intent/spear/thrust/eaglebeak, /datum/intent/mace/smash/eaglebeak, SPEAR_BASH)
	name = "eagle's beak"
	desc = "A heavy polearm with a hammer on its end, topped with a spike."
	icon_state = "eaglebeak"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 11
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5
	wparryspeed = -2

/obj/item/rogueweapon/eaglebeak/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 9,"sy" = -4,"nx" = -7,"ny" = 1,"wx" = -9,"wy" = 2,"ex" = 10,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 5,"sturn" = -190,"wturn" = -170,"eturn" = -10,"nflip" = 8,"sflip" = 8,"wflip" = 1,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/eaglebeak/lucerne
	name = "lucerne"
	desc = "A polehammer with a sharp pointy end."
	icon_state = "polehammer"
	force_wielded = 30
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 180

/datum/intent/spear/thrust/eaglebeak
	penfactor = 20
	damfactor = 0.9

/datum/intent/mace/smash/eaglebeak
	reach = 2
	swingdelay = 12
	clickcd = 14

/obj/item/rogueweapon/spear/bronze
	name = "Bronze Spear"
	desc = "A spear forged of bronze. Expensive but more durable than a regular iron one."
	icon_state = "bronzespear"
	max_blade_int = 200
	smeltresult = /obj/item/ingot/bronze
	force = 20
	force_wielded = 25
	gripsprite = FALSE //someone really should make a grip sprite
	max_integrity = 200

////Crystal Keep////


/obj/item/rogueweapon/glaive
	force = 12
	force_wielded = 30
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH)
	gripped_intents = list(SPEAR_THRUST, /datum/intent/spear/cut/glaive, /datum/intent/sword/chop, SPEAR_BASH)
	name = "glaive"
	desc = "A war spear with a bladed tip."
	icon_state = "bardiche"//standin, sort of fits though, goes hard, ngl
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	minstr = 7
	max_blade_int = 150
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 6
	max_integrity = 100

/obj/item/rogueweapon/glaive/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/datum/intent/spear/cut/glaive
	damfactor = 0.9
	iparrybonus = 5

///JADE KINGDOM////

/obj/item/rogueweapon/glaive/naginata
	force = 10
	force_wielded = 25
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH)
	gripped_intents = list(SPEAR_THRUST, /datum/intent/spear/cut/glaive, /datum/intent/sword/chop, SPEAR_BASH)
	name = "glaive"
	desc = "A war spear with a bladed tip."
	icon_state = "naginata"
	icon = 'icons/roguetown/weapons/32.dmi'
	minstr = 6

///ELFNUT///
/obj/item/rogueweapon/glaive/elfnut
	gripped_intents = list(SPEAR_THRUST, /datum/intent/spear/cut/glaive, /datum/intent/sword/chop, SPEAR_BASH)
	force = 12
	force_wielded = 30
	name = "glaive"
	desc = "A war spear with a bladed tip."
	icon_state = "elfnutspear"
	wdefense = 7
	max_integrity = 200


/obj/item/rogueweapon/glaive/elfnut/silverwood
	gripped_intents = list(/datum/intent/spear/thrust/eaglebeak, /datum/intent/spear/cut/glaive, /datum/intent/axe/chop/battle, SPEAR_BASH)
	force = 18
	force_wielded = 35
	name = "glaive"
	desc = "A war spear with a bladed tip."
	icon_state = "elfnutspearsilver"
	wdefense = 8
	max_integrity = 200

///REDSTEEL///

/obj/item/rogueweapon/halberd/redsteel
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/spear/thrust/redsteel, SPEAR_BASH) //bash is for less-lethal takedowns, only targets limbs.
	gripped_intents = list(/datum/intent/spear/thrust/redsteel, /datum/intent/spear/cut/halberd, /datum/intent/sword/chop, SPEAR_BASH)
	name = "redsteel halberd"
	desc = "A redsteel halberd with a glint of gem at the tip. Not as common."
	icon_state = "redsteelhal"
	icon = 'icons/roguetown/weapons/64.dmi'
	minstr = 6
	max_blade_int = 200
	anvilrepair = /datum/skill/craft/koboldsmithing
	smeltresult = /obj/item/ingot/steel
	max_integrity = 200
	
/datum/intent/spear/thrust/redsteel
	penfactor = 50

/obj/item/rogueweapon/glaive/redsteel
	force = 12
	force_wielded = 28
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH)
	gripped_intents = list(SPEAR_THRUST, /datum/intent/spear/cut/glaive, /datum/intent/sword/chop, SPEAR_BASH)
	name = "redsteel glaive"
	desc = "A war spear with a sharp gem tip."
	icon_state = "redsteelspear"
	icon = 'icons/roguetown/weapons/32.dmi'
	minstr = 4
