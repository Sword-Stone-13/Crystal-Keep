/obj/item/pinpointer/nuke
	var/mode = TRACK_NUKE_DISK

/obj/item/pinpointer/nuke/examine(mob/user)
	. = ..()
	var/msg = "Its tracking indicator reads "
	switch(mode)
		if(TRACK_NUKE_DISK)
			msg += "\"nuclear_disk\"."
		if(TRACK_MALF_AI)
			msg += "\"01000001 01001001\"."
		if(TRACK_INFILTRATOR)
			msg += "\"vasvygengbefuvc\"."
		else
			msg = "Its tracking indicator is blank."
	. += msg
	for(var/obj/machinery/nuclearbomb/bomb in GLOB.machines)
		if(bomb.timing)
			. += "Extreme danger. Arming signal detected. Time remaining: [bomb.get_time_left()]."

/obj/item/pinpointer/nuke/process()
	..()
	if(active) // If shit's going down
		for(var/obj/machinery/nuclearbomb/bomb in GLOB.nuke_list)
			if(bomb.timing)
				if(!alert)
					alert = TRUE
					playsound(src, 'sound/blank.ogg', 50, FALSE)
					if(isliving(loc))
						var/mob/living/L = loc
						to_chat(L, span_danger("My [name] vibrates and lets out a tinny alarm. Uh oh."))

/obj/item/pinpointer/nuke/scan_for_target()
	target = null
	switch(mode)
		if(TRACK_NUKE_DISK)
			var/obj/item/disk/nuclear/N = locate() in GLOB.poi_list
			target = N
		if(TRACK_MALF_AI)
			for(var/V in GLOB.ai_list)
				var/mob/living/silicon/ai/A = V
				if(A.nuking)
					target = A
			for(var/V in GLOB.apcs_list)
				var/obj/machinery/power/apc/A = V
				if(A.malfhack && A.occupier)
					target = A
		if(TRACK_INFILTRATOR)
			target = SSshuttle.getShuttle("syndicate")
	..()

/obj/item/pinpointer/nuke/proc/switch_mode_to(new_mode)
	if(isliving(loc))
		var/mob/living/L = loc
		to_chat(L, span_danger("My [name] beeps as it reconfigures it's tracking algorithms."))
		playsound(L, 'sound/blank.ogg', 50, TRUE)
	mode = new_mode
	scan_for_target()

/obj/item/pinpointer/nuke/syndicate // Syndicate pinpointers automatically point towards the infiltrator once the nuke is active.
	name = "syndicate pinpointer"
	desc = ""
	icon_state = "pinpointer_syndicate"
