/obj/item
	var/unequip_delay_self = 1
	var/allow_self_unequip = TRUE
	var/thrown_bclass = BCLASS_BLUNT // Determines wound type when thrown (e.g., BCLASS_BLUNT, BCLASS_STAB, BCLASS_CUT)
	var/crit_bonus = 0 // Bonus to critical hit chance when thrown (percentage)
	var/can_crit_throw = FALSE

/obj/item/allow_attack_hand_drop(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/C = user

		if(!(src in C.held_items) && !allow_self_unequip)
			to_chat(C, span_warning("I need help taking this off!"))
			return FALSE

		if(!(src in C.held_items) && unequip_delay_self)
			if(unequip_delay_self >= 10)
				C.visible_message(span_smallnotice("[C] starts taking off [src]..."), span_smallnotice("I start taking off [src]..."))
			if(edelay_type)
				if(move_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return TRUE
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE
			else
				if(do_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return TRUE
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE

	return ..()

/obj/item/MouseDrop(atom/over)
	if(!(loc == usr))
		return ..()

	if(ishuman(usr))
		var/mob/living/carbon/human/C = usr

		if(!(src in C.held_items) && !allow_self_unequip)
			to_chat(C, span_warning("I need help taking this off!"))
			return FALSE

		if(!(src in C.held_items) && unequip_delay_self)
			if(unequip_delay_self >= 10)
				C.visible_message(span_smallnotice("[C] starts taking off [src]..."), span_smallnotice("I start taking off [src]..."))
			if(edelay_type)
				if(move_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return ..()
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE
			else
				if(do_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return ..()
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE

	return ..()

/obj/item/clothing/MouseDrop(atom/over)
	if(!(loc == usr))
		return ..()

	if(ishuman(usr))
		var/mob/living/carbon/human/C = usr

		if(!(src in C.held_items) && !allow_self_unequip)
			to_chat(C, span_warning("I need help taking this off!"))
			return FALSE

		if(!(src in C.held_items) && unequip_delay_self)
			if(unequip_delay_self >= 10)
				C.visible_message(span_smallnotice("[C] starts taking off [src]..."), span_smallnotice("I start taking off [src]..."))
			if(edelay_type)
				if(move_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return ..()
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE
			else
				if(do_after(C, minone(unequip_delay_self-C.STASPD), target = C))
					return ..()
				else
					to_chat(C, span_warning("I'm struggling to take it off."))
					return FALSE

	return ..()
