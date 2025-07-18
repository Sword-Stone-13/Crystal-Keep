/obj/item/ammo_casing/caseless/rogue/bolt
	name = "bolt"
	desc = "A durable iron bolt that will pierce a skull easily."
	projectile_type = /obj/projectile/bullet/reusable/bolt
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	caliber = "regbolt"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt"
	dropshrink = 0.6
	max_integrity = 10
	force = 10
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/caseless/rogue/bolt/poison
	name = "poisoned bolt"
	desc = "A durable iron bolt that will pierce a skull easily. This one is coated in a clear liquid."
	projectile_type = /obj/projectile/bullet/reusable/bolt/poison
	icon_state = "arrow_poison"

/obj/item/ammo_casing/caseless/rogue/bolt/poison/steel
	name = "poisoned steel bolt"
	desc = "A durable steel bolt coated in a clear liquid."
	projectile_type = /obj/projectile/bullet/reusable/bolt/poison/steel
	icon_state = "arrow_poison"

/obj/projectile/bullet/reusable/bolt
	name = "bolt"
	damage = 35
	damage_type = BRUTE
	armor_penetration = 35
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt
	range = 25
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.25

/obj/projectile/bullet/reusable/bolt/poison
	name = "poisoned bolt"
	icon_state = "bolt_poison"
	spread = 8
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	poisontype = /datum/reagent/berrypoison
	poisonfeel = "burning"
	poisonamount = 2 

/* //commenting out old code in case something breaks
/obj/projectile/bullet/reusable/bolt/poison/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 7) //not gonna kill anyone, but they will be quite quiet
*/
/obj/item/ammo_casing/caseless/rogue/arrow
	name = "arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow"
	force = 7
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 20
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/caseless/rogue/arrow/iron
	name = "iron arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/arrow/iron
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow"
	force = 7
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 20

/obj/projectile/bullet/reusable/arrow
	name = "arrow"
	damage = 35
	damage_type = BRUTE
	armor_penetration = 10
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.5

/obj/projectile/bullet/reusable/arrow/iron
	name = "iron arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron
	spread = 5

/obj/projectile/bullet/reusable/arrow/stone
	name = "stone arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/stone
	spread = 10

/obj/item/ammo_casing/caseless/rogue/arrow/stone
	name = "stone arrow"
	desc = "A wooden shaft with a jagged rock on the end."
	icon_state = "stonearrow"
	max_integrity = 5
	projectile_type = /obj/projectile/bullet/reusable/arrow/stone

/obj/item/ammo_casing/caseless/rogue/arrow/poison
	name = "poisoned arrow"
	desc = "A wooden shaft with a pointy iron end. This one is stained green with floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison
	icon_state = "arrow_poison"
	max_integrity = 20 // same as normal arrow; usually breaks on impact with a mob anyway

/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
	name = "poisoned stone arrow"
	desc = "A wooden shaft with a jagged rock on the end. This one is stained green with floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/stone
	icon_state = "stonearrow_poison"

/obj/projectile/bullet/reusable/arrow/poison
	name = "poison arrow"
	damage = 35
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron
	range = 15
	spread = 8
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	poisontype = /datum/reagent/berrypoison //Support for future variations of poison for arrow-crafting
	poisonfeel = "burning" //Ditto
	poisonamount = 2 // here's how the math works. 2 divided by .1 (ticks) times 3 (toxin per tick). 2 poison amount is 60 toxin. 1 is 30, 3 is 90, so on. 100 is lethal in full dose.

/obj/projectile/bullet/reusable/arrow/poison/stone
	name = "stone arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/stone

/obj/projectile/bullet/reusable/arrow/poison/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(istype(target, /mob/living/simple_animal)) //On-hit for carbon mobs has been moved to projectile act in living_defense.dm, to ensure poison is not applied if armor prevents damage.
		var/mob/living/simple_animal/M = target
		M.show_message(span_danger("You feel an intense burning sensation spreading swiftly from the puncture!")) //In case a player is in control of the mob.
		addtimer(CALLBACK(M, TYPE_PROC_REF(/mob/living, adjustToxLoss), 100), 10 SECONDS)
		addtimer(CALLBACK(M, TYPE_PROC_REF(/atom, visible_message), span_danger("[M] appears greatly weakened by the poison!")), 10 SECONDS)

/*
/obj/item/ammo_casing/caseless/rogue/bullet
	name = "iron sphere"
	desc = "A small iron ball, perfectly round. Deadly when projected at very high velocity."
	projectile_type = /obj/projectile/bullet/reusable/bullet
	caliber = "small_sphere"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0
	w_class = WEIGHT_CLASS_TINY
	smeltresult = /obj/item/rogueore/iron

/obj/projectile/bullet/reusable/bullet
	name = "iron sphere"
	damage = 40
	armor_penetration = 50
	speed = 0.6
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	range = 30
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
*/


/obj/item/ammo_casing/caseless/rogue/arrow/poison/steel
	name = "poisoned steel arrow"
	desc = "A durable steel arrow stained green with floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/steel
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_poison" 
	force = 7
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 40 
	w_class = WEIGHT_CLASS_SMALL


/obj/item/ammo_casing/caseless/rogue/arrow/poison/steel/hollowpoint
	name = "poisoned hollowpoint steel arrow"
	desc = "A hollowpoint steel arrow with a cup-like tip, filled with potent floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/steel/hollowpoint
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrowhollow_poison" 
	force = 2 
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 30
	w_class = WEIGHT_CLASS_SMALL

// Poisoned Steel Arrow Projectiles
/obj/projectile/bullet/reusable/arrow/poison/steel
	name = "poisoned steel arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/poison/steel 
	damage = 40 
	armor_penetration = 20
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	range = 20
	spread = 8
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.5
	poisontype = /datum/reagent/berrypoison
	poisonfeel = "burning"
	poisonamount = 2

/obj/projectile/bullet/reusable/arrow/poison/steel/hollowpoint
	name = "poisoned hollowpoint steel arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/poison/steel/hollowpoint 
	damage = 20
	armor_penetration = 100
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	range = 10 
	speed = 1
	spread = 8 
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	poisontype = /datum/reagent/berrypoison
	poisonfeel = "burning"
	poisonamount = 3 // Delivers 90 toxin damage, matches casing and higher crafting cost

// Poisoned Steel Bolt Projectile
/obj/projectile/bullet/reusable/bolt/poison/steel
	name = "poisoned steel bolt"
	icon_state = "bolt_poison"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/poison/steel
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	poisontype = /datum/reagent/berrypoison
	poisonfeel = "burning"
	poisonamount = 2 
	damage = 30 
	armor_penetration = 25
	range = 20
	speed = 0.25
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"

// === END ADDITIONS ===

///Crystal Keep///

/obj/item/ammo_casing/caseless/rogue/arrow/padded
	name = "padded arrow"
	desc = "A wooden shaft with a padded sack at the end."
	projectile_type = /obj/projectile/bullet/reusable/arrow/padded
	caliber = "arrow"
	icon_state = "arrow_padded"
	force = 0
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	max_integrity = 20

/obj/projectile/bullet/reusable/arrow/padded
	name = "padded arrow"
	damage = 0
	knockdown = 100
	stun = 20
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_pad_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/padded
	hitsound = 'sound/blank.ogg'
	embedchance = 0
	woundclass = BCLASS_BLUNT


////Crystal Keep////

////AASIMAR RIGHTEOUSNESS////
/obj/item/ammo_casing/caseless/rogue/greatarrow
	name = "great arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/greatarrow
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo64.dmi'
	icon_state = "greatarrowiron"
	force = 10
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 30
	w_class = WEIGHT_CLASS_SMALL
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/projectile/bullet/reusable/greatarrow
	name = "great arrow"
	damage = 50 //if we gotta nerf it, start here, should be obscene though
	damage_type = BRUTE
	armor_penetration = 50
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "greatarrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 20
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.6
	knockdown = 100
	stun = 20

/obj/item/ammo_casing/caseless/rogue/greatarrow/steel
	name = "great steel arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/greatarrow/steel
	caliber = "arrow"
	icon_state = "greatarrowsteel"
	force = 15
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 50


/obj/projectile/bullet/reusable/greatarrow/steel
	name = "great steel arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron
	spread = 5
	speed = 0.5
	knockdown = 100
	stun = 20

///more arrow types///

/obj/item/ammo_casing/caseless/rogue/arrow/steel
	name = "steel arrow"
	desc = "A more durable arrow."
	projectile_type = /obj/projectile/bullet/reusable/arrow/steel
	caliber = "arrow"
	icon_state = "arrow"
	force = 7
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 40

/obj/projectile/bullet/reusable/arrow/steel
	name = "steel arrow"
	damage = 40
	armor_penetration = 20
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 20

/obj/item/ammo_casing/caseless/rogue/arrow/steel/hollowpoint
	name = "hollowpoint steel arrow"
	desc = "A strange arrow with a unique cup-like tip."
	projectile_type = /obj/projectile/bullet/reusable/arrow/steel/hollowpoint
	caliber = "arrow"
	icon_state = "arrowhollow"
	force = 2
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 30

/obj/projectile/bullet/reusable/arrow/steel/hollowpoint
	name = "hollowpoint steel arrow"
	damage = 20
	armor_penetration = 100 //we game
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 10
	speed = 1

///bolts///

/obj/item/ammo_casing/caseless/rogue/bolt/steel
	name = "steel bolt"
	desc = "A more durable bolt."
	projectile_type = /obj/projectile/bullet/reusable/bolt/steel
	caliber = "arrow"
	icon_state = "arrow"
	force = 7
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 25

/obj/projectile/bullet/reusable/bolt/steel
	name = "steel arrow"
	damage = 30
	armor_penetration = 25
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/steel
	range = 20

/obj/item/ammo_casing/caseless/rogue/bolt

///Bluesteel and Redsteel///

/obj/item/ammo_casing/caseless/rogue/bolt/bluesteel
	name = "bolt"
	desc = "A thick bolt with a blue mushroom shaped tip."
	projectile_type = /obj/projectile/bullet/reusable/bolt/bluesteel
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	caliber = "bolt_bluesteel"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt"
	dropshrink = 0.6
	max_integrity = 30
	force = 12
	w_class = WEIGHT_CLASS_SMALL


/obj/projectile/bullet/reusable/bolt/bluesteel
	name = "bluesteel bolt"
	damage = 40
	armor_penetration = 10
	icon_state = "bolt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/bluesteel
	speed = 0.5

/obj/item/ammo_casing/caseless/rogue/bolt/redsteel
	name = "bolt"
	desc = "A fragile looking scarlet spike."
	projectile_type = /obj/projectile/bullet/reusable/bolt/redsteel
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	caliber = "bolt_redsteel"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt"
	dropshrink = 0.6
	max_integrity = 10
	force = 12
	w_class = WEIGHT_CLASS_SMALL


/obj/projectile/bullet/reusable/bolt/redsteel
	name = "redsteel bolt"
	damage = 25
	armor_penetration = 60
	icon_state = "bolt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/redsteel
	speed = 0.2 //should be fast
