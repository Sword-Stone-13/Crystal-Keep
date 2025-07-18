/obj/item/reagent_containers/glass/bottle/waterskin
	name = "waterskin"
	desc = "A leather waterskin."
	icon_state = "waterskin"
	amount_per_transfer_from_this = 6
	possible_transfer_amounts = list(3,6,9)
	volume = 64
	dropshrink = 0.5
	sellprice = 5
	closed = FALSE
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	obj_flags = CAN_BE_HIT
	reagent_flags = OPENCONTAINER
	w_class =  WEIGHT_CLASS_SMALL
	drinksounds = list('sound/items/drink_bottle (1).ogg','sound/items/drink_bottle (2).ogg')
	fillsounds = list('sound/items/fillcup.ogg')
	poursounds = list('sound/items/fillbottle.ogg')
	sewrepair = TRUE

///Crystal Keepu///
/obj/item/reagent_containers/glass/bottle/gourd
	name = "Gourd"
	desc = "The beautiful shape of a woman, and a drink at the same time."
	icon_state = "clear_bottle1"
	volume = 50
	reagent_flags = OPENCONTAINER
	dropshrink = 0.5
	sellprice = 100 //good investment, honestly. 

/obj/item/reagent_containers/glass/bottle/gourd/booze
	name = "Labeled Gourd"
	desc = "This Gourd is dark and has a label on it for some reason."
	icon_state = "clear_bottle1"
	list_reagents = list(/datum/reagent/consumable/ethanol/cognac = 100)
	sellprice = 200 ///High demand lmao
