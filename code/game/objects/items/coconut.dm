/obj/item/twohanded/coconut_husk
	name = "empty coconut husk"
	desc = "A hollowed out coconut husk. Makes a satisfying sound."
	icon = 'icons/misc/language.dmi'

	icon_state = "slime" // TODO: this needs a sprite
	color  = "#654321" //brown - only as a placeholder

	force = 1
	w_class = WEIGHT_CLASS_SMALL
	var/next_clop = 0
	var/list/movement_sounds = list(
		'sound/foley/saddlemount.ogg', 
		'sound/foley/saddledismount.ogg'
	) // TODO: replace with a sound effect
	handle_movement = TRUE

/obj/item/twohanded/coconut_husk/attack_self(mob/user)
	. = ..()
	if(world.time >= next_clop + 2)
		movement_sound()
		next_clop = world.time + 5
		return

/obj/item/twohanded/coconut_husk/proc/movement_sound()
	if(!LAZYLEN(movement_sounds))
		return FALSE
	playsound(src, pick(movement_sounds), 50, TRUE)
	return TRUE


/obj/item/twohanded/coconut_husk/equipped(mob/user, slot)
	. = ..()
	if(wielded && slot == SLOT_HANDS)
		movement_sound()

/obj/item/twohanded/coconut_husk/step_action()
	. = ..()
	if(wielded)
		movement_sound()
