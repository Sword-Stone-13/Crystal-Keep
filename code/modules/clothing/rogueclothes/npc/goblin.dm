/obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin//I have to find a way to make these equipable, I don't know why it's not working
	name = "goblin mail"
	icon_state = "plate_armor_item"
	item_state = "plate_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/goblin
	name = "goblin armor"
	icon_state = "leather_armor_item"
	item_state = "leather_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	name = "goblin loincloth"
	icon_state = "cloth_armor"
	item_state = "cloth_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	armor = null
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/leather/goblin
	name = "goblin helmet"
	icon_state = "leather_helm_item"
	item_state = "leather_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/goblin
	name = "goblin helmet"
	icon_state = "plate_helm_item"
	item_state = "plate_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 0
	smeltresult = /obj/item/ingot/iron
