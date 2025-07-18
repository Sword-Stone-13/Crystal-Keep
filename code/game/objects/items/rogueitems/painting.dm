
/obj/item/rogue/painting
	name = "painting"
	icon_state = "painting"
	desc = ""
	w_class = WEIGHT_CLASS_NORMAL
	static_price = TRUE
	sellprice = 20
	icon = 'icons/roguetown/items/misc.dmi'
	var/deployed_structure = /obj/structure/fluff/walldeco/painting

/obj/item/rogue/painting/attack_turf(turf/T, mob/living/user)
	if(isclosedturf(T))
		if(get_dir(T,user) in GLOB.cardinals)
			to_chat(user, span_warning("I place [src] on the wall."))
			var/obj/structure/S = new deployed_structure(user.loc)
			switch(get_dir(T,user))
				if(NORTH)
					S.pixel_y = -32
				if(SOUTH)
					S.pixel_y = 32
				if(WEST)
					S.pixel_x = 32
				if(EAST)
					S.pixel_x = -32
			qdel(src)
			return
	..()

/obj/structure/fluff/walldeco/painting
	name = "painting"
	desc = "The artist is unknown. The subject is unknown. Maybe a memorial to a corpse that was trampled on the trail to this reality."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "painting_deployed"
	anchored = TRUE
	density = FALSE
	max_integrity = 0
	layer = ABOVE_MOB_LAYER
	var/stolen_painting = /obj/item/rogue/painting

/obj/structure/fluff/walldeco/painting/attack_hand(mob/user)
	if(do_after(user, 30, target = user))
		var/obj/item/I = new stolen_painting(user.loc)
		user.put_in_hands(I)
		qdel(src)
		return
	..()

/obj/structure/fluff/walldeco/painting/queen
	desc = "It's Queen Samantha I of Rockhill. Her late husband would be so proud of what she has accomplished in his realm."
	icon_state = "queenpainting_deployed"
	stolen_painting = /obj/item/rogue/painting/queen

/obj/item/rogue/painting/queen
	icon_state = "queenpainting"
	desc = "It's Queen Samantha I of Rockhill. Her late husband would be so proud of what she has accomplished in his realm. These mass-reproduced paintings are unfortunately devalued."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/queen

/obj/item/rogue/painting/seraphina
	icon_state = "seraphinapainting"
	desc = "It's holy priest Seraphina, first of her name, blessed be her name."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/seraphina

/obj/structure/fluff/walldeco/painting/seraphina
	desc = "It's holy priest Seraphina, first of her name, blessed be her name."
	icon_state = "seraphinapainting_deployed"
	stolen_painting = /obj/item/rogue/painting/seraphina

//Crystal KEEPUS 

/obj/structure/fluff/walldeco/painting/house
	desc = "You shouldn't be seeing this."
	icon = 'icons/roguetown/items/houseitems/misc.dmi'
	icon_state = "paintgreen1_deployed"
	stolen_painting = /obj/item/rogue/painting/house

/obj/item/rogue/painting/house
	icon = 'icons/roguetown/items/houseitems/misc.dmi'
	icon_state = "paintgreen1"
	desc = "You shouldn't be seeing this"
	dropshrink = 0.5
	sellprice = 500
	deployed_structure = /obj/structure/fluff/walldeco/painting/house

//green house

/obj/structure/fluff/walldeco/painting/house/green
	desc = "Jean the folk hero, only a legend, ofcourse. An elf could never be heroic."
	icon_state = "paintgreen1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/green

/obj/item/rogue/painting/house/green
	icon_state = "paintgreen1"
	desc = "Jean the folk hero, only a legend, ofcourse. An elf could never be heroic."
	dropshrink = 0.5
	sellprice = 250
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/green

/obj/structure/fluff/walldeco/painting/house/green/alt
	desc = "A portrait of a feral feline bandit, standing in the forest... waiting."
	icon_state = "paintgreen2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/green/alt

/obj/item/rogue/painting/house/green/alt
	icon_state = "paintgreen2"
	desc = "A portrait of a feral feline bandit, standing in the forest... waiting."
	dropshrink = 0.5
	sellprice = 500
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/green/alt

//red house

/obj/structure/fluff/walldeco/painting/house/red
	desc = "A portrait of an elf with... absurd blessings."
	icon_state = "paintred1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/red

/obj/item/rogue/painting/house/red
	icon_state = "paintred1"
	desc = "A portrait of an elf with... absurd blessings."
	dropshrink = 0.5
	sellprice = 1000 //desperate for the og patreon exclusive
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/red

/obj/structure/fluff/walldeco/painting/house/red/alt
	desc = "A kobold stands triumphant over a pile of gold with a flowing red mane."
	icon_state = "paintred2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/red/alt

/obj/item/rogue/painting/house/red/alt
	icon_state = "paintred2"
	desc = "A kobold stands triumphant over a pile of gold with a flowing red mane."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/red/alt

//yellow house

/obj/structure/fluff/walldeco/painting/house/yellow
	desc = "A portrait of a figure with a large crown. The witches of the House Bravado seem obsessed with this figure."
	icon_state = "paintyellow1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/yellow

/obj/item/rogue/painting/house/yellow
	icon_state = "paintyellow1"
	desc = "A portrait of a figure with a large crown. The witches of the House Bravado seem obsessed with this figure."
	dropshrink = 0.5
	sellprice = 600
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/yellow

/obj/structure/fluff/walldeco/painting/house/yellow/alt
	desc = "A powerful lizard man, with a long neck and sharp teeth."
	icon_state = "paintyellow2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/yellow/alt

/obj/item/rogue/painting/house/yellow/alt
	icon_state = "paintyellow2"
	desc = "A powerful lizard man, with a long neck and sharp teeth."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/yellow/alt

//purple house

/obj/structure/fluff/walldeco/painting/house/purple
	desc = "A broad aasimar stands with charred wings and a form fitting tunic. Behind him stands a femminine form encased in fire."
	icon_state = "paintpurple1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/purple

/obj/item/rogue/painting/house/purple
	icon_state = "paintpurple1"
	desc = "A broad aasimar stands with charred wings and a form fitting tunic. Behind him stands a femminine form encased in fire."
	dropshrink = 0.5
	sellprice = 100
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/purple

/obj/structure/fluff/walldeco/painting/house/purple/alt
	desc = "A savage wild man, unknown to time, with a purple band around his head."
	icon_state = "paintpurple2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/purple/alt

/obj/item/rogue/painting/house/purple/alt
	icon_state = "paintpurple2"
	desc = "A savage wild man, unknown to time, with a purple band around his head."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/purple/alt

//blue house

/obj/structure/fluff/walldeco/painting/house/blue
	desc = "King Tibursio, with a crown of gold. The second most valuable thing between his ears."
	icon_state = "paintblue1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/blue

/obj/item/rogue/painting/house/blue
	icon_state = "paintblue1"
	desc = "King Tibursio, with a crown of gold. The second most valuable thing between his ears."
	dropshrink = 0.5
	sellprice = 500
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/blue

/obj/structure/fluff/walldeco/painting/house/blue/alt
	desc = "Chief Choteduff the Grand Dwarf. Credited for inventing the beardmaille."
	icon_state = "paintblue2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/blue/alt

/obj/item/rogue/painting/house/blue/alt
	icon_state = "paintblue2"
	desc = "Chief Choteduff the Grand Dwarf. Credited for inventing the beardmaille."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/blue/alt

//white house

/obj/structure/fluff/walldeco/painting/house/white
	desc = "Here stands the god Psydon. An original."
	icon_state = "paintwhite1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/white

/obj/item/rogue/painting/house/white
	icon_state = "paintwhite1"
	desc = "Here stands the god Psydon. An original."
	dropshrink = 0.5
	sellprice = 2000
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/white

/obj/structure/fluff/walldeco/painting/house/white/alt
	desc = "A portrait of a man with a crown of thorns. The elves claim it's their god, but no one really knows for sure. Despite his crown, he doesn't look vengeful."
	icon_state = "paintwhite2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/white/alt

/obj/item/rogue/painting/house/white/alt
	icon_state = "paintwhite2"
	desc = "A portrait of a man with a crown of thorns. The elves claim it's their god, but no one really knows for sure. Despite his crown, he doesn't look vengeful."
	dropshrink = 0.5
	sellprice = 150
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/white/alt

//black house

/obj/structure/fluff/walldeco/painting/house/black
	desc = "Two loving figures huddled by a campfire. They look vaguely human yet completely wild."
	icon_state = "paintblack1_deployed"
	stolen_painting = /obj/item/rogue/painting/house/black

/obj/item/rogue/painting/house/black
	icon_state = "paintblack1"
	desc = "Two loving figures huddled by a campfire. They look vaguely human yet completely wild."
	dropshrink = 0.5
	sellprice = 500
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/black

/obj/structure/fluff/walldeco/painting/house/black/alt
	desc = "A portrait of a kobold like creacher covered in fur. He looks dignant."
	icon_state = "paintblack2_deployed"
	stolen_painting = /obj/item/rogue/painting/house/black/alt

/obj/item/rogue/painting/house/black/alt
	icon_state = "paintblack2"
	desc = "A portrait of a kobold like creacher covered in fur. He looks dignant."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/house/black/alt
