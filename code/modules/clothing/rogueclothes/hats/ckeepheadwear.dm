///CKEEP///


///BLUESTEEL/// 

/obj/item/clothing/head/roguetown/helmet/heavy/bluesteel
	name = "Djormond"
	desc = "A helmet with a menacing visage."
	icon_state = "bluesteel_helm"
	item_state = "bluesteel_helm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/bluesteel
	max_integrity = 550
	anvilrepair = /datum/skill/craft/dwarfsmithing


/obj/item/clothing/neck/roguetown/chaincoif/bluesteel
	name = "chain coif"
	icon_state = "bluesteel_coif"
	item_state = "bluesteel_coif"
	desc = "Beard armor, to keep those locks safe."
	flags_inv = HIDEHAIR|HIDEFACE
	armor = list("blunt" = 30, "slash" = 70, "stab" = 45, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 300
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	adjustable = CANT_CADJUST
	toggle_icon_state = FALSE
	anvilrepair = /datum/skill/craft/dwarfsmithing

/obj/item/clothing/neck/roguetown/chaincoif/bluesteel/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

///REDSTEEL///

/obj/item/clothing/head/roguetown/helmet/heavy/redsteel
	name = "Mawtla"
	desc = "A helmet with a menacing visage."
	icon_state = "redsteel_helm"
	item_state = "redsteel_helm"
	detail_tag = "_detail"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/redsteel
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST)
	block2add = FOV_RIGHT|FOV_LEFT
	max_integrity = 450
	anvilrepair = /datum/skill/craft/koboldsmithing
	detail_tag = "_detail"
	colorkobold = TRUE
	var/picked = FALSE

/obj/item/clothing/head/roguetown/helmet/heavy/redsteel/attack_right()
	..()
	if(!picked)
		var/list/colors = list(
		"Black"="#121810",
		"Blue"="#395480",
		"Green"="#1c9922",
		"Red"="#f02d2d",
		"White"="#d2dce4",
		"Brass"="#c9983d",
		"Bronze"="#8a5e21",
		"Copper"="#b87333",
		"Gold"="#fab638",
		"Silver"="#cfe6e4")

		var/mob/living/carbon/human/L = loc
		var/choice = input(L, "Choose a color.", "Kobold Mane") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		update_icon()
		for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
			testing("clothes to color are [V]")
			if(V.colorkobold)
				V.detail_color = playerchoice
				V.update_icon()
		L.regenerate_icons()

/obj/item/clothing/head/roguetown/helmet/heavy/redsteel/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


/obj/item/clothing/neck/roguetown/bervor/redsteel
	name = "kobold bevor"
	desc = "An adjustable red ring of steel that goes around the neck. Surprisingly light"
	icon_state = "redsteel_bervor"
	item_state = "redsteel_bervor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	anvilrepair = /datum/skill/craft/koboldsmithing
	max_integrity = 400


///ELFNUT///
/obj/item/clothing/head/roguetown/helmet/heavy/elfnut
	name = "Elfnut helmet"
	desc = "A full helm with ear holes and a slick red sheen."
	icon_state = "elfnut_helm"
	item_state = "elfnut_helm"
	emote_environment = 3
	flags_inv = HIDEFACE|HIDEHAIR
	armor_class = ARMOR_CLASS_MEDIUM
	smeltresult = /obj/item/ingot/iron
	max_integrity = 450

/obj/item/clothing/head/roguetown/helmet/heavy/elfnut/silverwood
	name = "Elfknight helmet"
	desc = "A beautiful full helm that never tarnishes."
	icon_state = "elfnut_silver"
	item_state = "elfnut_silver"
	smeltresult = /obj/item/ingot/silver
	max_integrity = 500
	block2add = FOV_DEFAULT

///JADEKINGDOM///


/obj/item/clothing/head/roguetown/helmet/heavy/jadish
	name = "Jade Warrior Helmet"
	desc = "A helmet with a stern visage."
	icon_state = "jade_helmet"
	item_state = "jade_helmet"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300

/obj/item/clothing/head/roguetown/helmet/heavy/jadish/nyandit
	name = "Rogue Warrior Helmet"
	desc = "A helmet with a nyenacing visage."
	icon_state = "nyandit_helmet"
	item_state = "nyandit_helmet"

/obj/item/clothing/head/roguetown/helmet/heavy/jadish/kitsune
	name = "Warrior Helmet"
	desc = "A helmet with a sly visage."
	icon_state = "kitsune_helmet"
	item_state = "kitsune_helmet"

/obj/item/clothing/head/roguetown/helmet/heavy/jadish/neko
	name = "Mercenary Warrior Helmet"
	desc = "A helmet with a coy visage."
	icon_state = "neko_helmet"
	item_state = "neko_helmet"


///The houses///

/obj/item/clothing/head/roguetown/helmet/heavy/alrich
	name = "alrich Crest Helm"
	desc = ""
	icon_state = "house_red_helm"
	item_state = "house_red_helm"

/obj/item/clothing/head/roguetown/helmet/heavy/bravado
	name = "Bravado Crest Helm"
	desc = ""
	icon_state = "house_yellow_helm"
	item_state = "house_yellow_helm"

/obj/item/clothing/head/roguetown/helmet/heavy/caesar
	name = "Caesar Crest Helm"
	desc = ""
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi' 
	icon_state = "house_purple_helm"
	item_state = "house_purple_helm"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/heavy/knight/deleon
	desc = "A sigil of House Deleon is on the side"

/obj/item/clothing/head/roguetown/helmet/heavy/echarus
	name = "Echarus Crest Helm"
	desc = ""
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi' 
	icon_state = "house_green_helm"
	item_state = "house_green_helm"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/black
	name = "Black House Crest Helm"
	desc = ""
	icon_state = "house_black_helm"
	item_state = "house_black_helm"

/obj/item/clothing/head/roguetown/helmet/heavy/white
	name = "White House Crest Helm"
	desc = ""
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi' 
	icon_state = "house_white_helm"
	item_state = "house_white_helm"
	worn_x_dimension = 64
	worn_y_dimension = 64

///Witches


/obj/item/clothing/head/roguetown/wizhat/house//white
	name = "big White Hat"
	desc = ""
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi' 
	icon_state = "house_white_witch_hat"
	item_state = "house_white_witch_hat"

/obj/item/clothing/head/roguetown/wizhat/house/red
	name = "flaring Hat"
	desc = ""
	icon_state = "house_red_witch_hat"//check if I need to use a mob overlay icon here
	item_state = "house_red_witch_hat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' 
	worn_x_dimension = 32
	worn_y_dimension = 32

/obj/item/clothing/head/roguetown/wizhat/house/yellow//may need to adjust x-y thing for this one
	name = "Obscene Tower of Bandages"
	desc = ""
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head_big.dmi' 
	icon_state = "house_yellow_witch_hat"
	item_state = "house_yellow_witch_hat"
	body_parts_covered = FULL_HEAD
	worn_x_dimension = 96
	worn_y_dimension = 96
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/roguetown/wizhat/house/purple
	name = "Purple Mage Hat"
	desc = ""
	icon_state = "house_purple_witch_hat"
	item_state = "house_purple_witch_hat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' 
	worn_x_dimension = 32
	worn_y_dimension = 32

/obj/item/clothing/head/roguetown/wizhat/house/blue
	name = "Ornate Mage Hat"
	desc = ""
	icon_state = "house_blue_witch_hat"
	item_state = "house_blue_witch_hat"

//this is just a hood
/obj/item/clothing/head/roguetown/wizhat/house/black
	name = "Black Hood"
	desc = ""
	icon_state = "house_black_witch_hood"
	item_state = "house_black_witch_hood"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' 
	worn_x_dimension = 32
	worn_y_dimension = 32


/obj/item/clothing/head/roguetown/wizhat/house/green
	name = "Magic Channeling Horn"
	desc = "May Work"
	icon_state = "house_green_witch_hat"
	item_state = "house_green_witch_hat"
	var/active_item
/obj/item/clothing/head/roguetown/wizhat/house/green/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("The Horn Slightly Twitches"))
		user.change_stat("mageability", 1)
		return

/obj/item/clothing/head/roguetown/wizhat/house/green/dropped(mob/living/user)
	if(active_item)
		to_chat(user, span_notice("You feel... less magical"))
		user.change_stat("mageability", -1)
		active_item = FALSE
		return


