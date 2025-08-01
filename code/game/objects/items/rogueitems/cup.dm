/obj/item/reagent_containers/glass/cup
	name = "metal cup"
	desc = "A sturdy cup, often used by warriors, bogwatch and other sturdy men."
	icon_state = "iron"
	icon = 'icons/roguetown/items/cooking.dmi'
	force = 5
	throwforce = 10
	reagent_flags = OPENCONTAINER
	amount_per_transfer_from_this = 6
	possible_transfer_amounts = list(6)
	dropshrink = 0.8
	w_class = WEIGHT_CLASS_SMALL
	volume = 24
	obj_flags = CAN_BE_HIT
	sellprice = 1
	drinksounds = list('sound/items/drink_cup (1).ogg','sound/items/drink_cup (2).ogg','sound/items/drink_cup (3).ogg','sound/items/drink_cup (4).ogg','sound/items/drink_cup (5).ogg')
	fillsounds = list('sound/items/fillcup.ogg')
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/reagent_containers/glass/cup/update_icon(dont_fill=FALSE)
	testing("cupupdate")

	cut_overlays()

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('modular/Neu_Food/icons/cooking.dmi', "[icon_state]filling")

		filling.color = mix_color_from_reagents(reagents.reagent_list)
		filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
		add_overlay(filling)

/obj/item/reagent_containers/glass/cup/wooden
	name = "wooden cup"
	desc = "This cup whispers tales of drunken battles and feasts."
	resistance_flags = FLAMMABLE
	icon_state = "wooden"
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	anvilrepair = null
	sellprice = 0
	metalizer_result = /obj/item/reagent_containers/glass/cup

/obj/item/reagent_containers/glass/cup/steel
	name = "goblet"
	desc = "A steel goblet, its surface adorned with intricate carvings."
	icon_state = "steel"
	sellprice = 10

/obj/item/reagent_containers/glass/cup/silver
	name = "silver goblet"
	desc = "A silver goblet, its surface adorned with intricate carvings and runes."
	icon_state = "silver"
	sellprice = 30
	var/last_used = 0

/obj/item/reagent_containers/glass/cup/silver/Initialize(mapload, vol)
	var/datum/magic_item/mundane/silver/effect = new
	AddComponent(/datum/component/magic_item, effect)
	.=..()

/obj/item/reagent_containers/glass/cup/golden
	name = "golden goblet"
	desc = "Adorned with gemstones, this goblet radiates opulence and grandeur."
	icon_state = "golden"
	sellprice = 50


/obj/item/reagent_containers/glass/cup/skull
	name = "skull goblet"
	desc = "The hollow eye sockets tell you of forgotten, dark rituals."
	icon_state = "skull"

/obj/item/reagent_containers/glass/bowl
	name = "bowl"
	desc = "It is the empty space that makes the bowl useful."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "bowl"
	force = 5
	throwforce = 10
	reagent_flags = OPENCONTAINER
	amount_per_transfer_from_this = 6
	possible_transfer_amounts = list(6)
	dropshrink = 0.8
	w_class = WEIGHT_CLASS_SMALL
	volume = 24
	obj_flags = CAN_BE_HIT
	sellprice = 1
	drinksounds = list('sound/items/drink_cup (1).ogg','sound/items/drink_cup (2).ogg','sound/items/drink_cup (3).ogg','sound/items/drink_cup (4).ogg','sound/items/drink_cup (5).ogg')
	fillsounds = list('sound/items/fillcup.ogg')
	metalizer_result = /obj/item/roguecoin/copper

/obj/item/reagent_containers/glass/bowl/on_reagent_change(changetype)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bowl/update_icon()
	cut_overlays()
	if(reagents && reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance(icon, "fullbowl")
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(filling)
	else
		icon_state = "bowl"
