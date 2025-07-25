
/mob/living
	var/STASTR = 10
	var/STAMAG = 10
	var/STASKL = 10
	var/STACON = 10
	var/STAEND = 10
	var/STASPD = 10
	var/STAFTH = 10
	var/STALUC = 10
	//buffers, the 'true' amount of each stat
	var/BUFSTR = 0
	var/BUFMAG = 0
	var/BUFSKL = 0
	var/BUFCON = 0
	var/BUFEND = 0
	var/BUFSPE = 0
	var/BUFFTH = 0 //we'll find a use
	var/BUFLUC = 0
	var/statbuf = FALSE
	var/list/statindex = list()
	var/datum/patron/patron = /datum/patron/godless

/mob/living/proc/init_faith()
	set_patron(/datum/patron/godless)

/mob/living/proc/set_patron(datum/patron/new_patron)
	if(!new_patron)
		return TRUE
	if(ispath(new_patron))
		new_patron = GLOB.patronlist[new_patron]
	if(!istype(new_patron))
		return TRUE
	if(istype(patron))
		patron.on_loss(src)
	patron = new_patron
	new_patron.on_gain(src)
	return TRUE

/mob/living/proc/roll_stats()
	STASTR = 9
	STAMAG = 9
	STASKL = 9
	STACON = 9
	STAEND = 9
	STASPD = 9
	STALUC = 10
	STAFTH = 9
	for(var/S in MOBSTATS)
		if(prob(33))
			change_stat(S, 1)
			if(prob(33))
				change_stat(S, -1)
		else
			change_stat(S, -1)
			if(prob(33))
				change_stat(S, 1)
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(H.dna.species)
			// Species stats
			for(var/S in H.dna.species.specstats)
				change_stat(S, H.dna.species.specstats[S])
			if(gender == FEMALE)
				// Female species stats
				for(var/S in H.dna.species.specstats_f)
					change_stat(S, H.dna.species.specstats_f[S])
			else
				// Male species stats
				for(var/S in H.dna.species.specstats_m)
					change_stat(S, H.dna.species.specstats_m[S])
		switch(H.age)
			if(AGE_YOUTH)
				change_stat("strength", -2)
				change_stat("speed", 2)
				change_stat("endurance", -2)
				change_stat("constitution", -2)
				change_stat("mageability", 3)
				change_stat("faith", 2) //Gott favors his children
				change_stat("fortune", 3)

			if(AGE_MIDDLEAGED)
				change_stat("speed", -1)
				change_stat("endurance", 1)
			if(AGE_OLD)
				change_stat("strength", -1)
				change_stat("speed", -2)
				change_stat("skill", -1)
				change_stat("constitution", -2)
				change_stat("mageability", 3)
				change_stat("faith", 1)
				change_stat("fortune", 1)
		if(HAS_TRAIT(src, TRAIT_LEPROSY))
			change_stat("strength", -5)
			change_stat("speed", -5)
			change_stat("endurance", -2)
			change_stat("constitution", -2)
			change_stat("mageability", -5)
			change_stat("fortune", -5)
		if(HAS_TRAIT(src, TRAIT_PUNISHMENT_CURSE))
			change_stat("strength", -3)
			change_stat("speed", -3)
			change_stat("endurance", -3)
			change_stat("constitution", -3)
			change_stat("mageability", -3)
			change_stat("fortune", -3)
			H.voice_color = "c71d76"
			set_eye_color(H, "#c71d76", "#c71d76")

/mob/living/proc/change_stat(stat, amt, index)
	if(!stat)
		return
	if(amt == 0 && index)
		if(statindex[index])
			change_stat(statindex[index]["stat"], -1*statindex[index]["amt"])
			statindex[index] = null
			return
	if(!amt)
		return
	if(index)
		if(statindex[index])
			return //we cannot make a new index
		else
			statindex[index] = list("stat" = stat, "amt" = amt)
//			statindex[index]["stat"] = stat
//			statindex[index]["amt"] = amt
	var/newamt = 0
	switch(stat)
		if("strength")
			if(isseelie(src))
				STASTR = 1
				return
			newamt = STASTR + amt
			if(BUFSTR < 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR > 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			if(BUFSTR > 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR < 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			while(newamt < 1)
				newamt++
				BUFSTR--
			while(newamt > 20)
				newamt--
				BUFSTR++
			STASTR = newamt

		if("skill")
			newamt = STASKL + amt
			if(BUFSKL < 0)
				BUFSKL = BUFSKL + amt
				if(BUFSKL > 0)
					newamt = STASKL + BUFSKL
					BUFSKL = 0
			if(BUFSKL > 0)
				BUFSKL = BUFSKL + amt
				if(BUFSKL < 0)
					newamt = STASKL + BUFSKL
					BUFSKL = 0
			while(newamt < 1)
				newamt++
				BUFSKL--
			while(newamt > 20)
				newamt--
				BUFSKL++
			STASKL = newamt


		if("mageability")
			newamt = STAMAG + amt
			if(BUFMAG < 0)
				BUFMAG = BUFMAG + amt
				if(BUFMAG > 0)
					newamt = STAMAG + BUFMAG
					BUFMAG = 0
			if(BUFMAG > 0)
				BUFMAG = BUFMAG + amt
				if(BUFMAG < 0)
					newamt = STAMAG + BUFMAG
					BUFMAG = 0
			while(newamt < 1)
				newamt++
				BUFMAG--
			while(newamt > 20)
				newamt--
				BUFMAG++
			STAMAG = newamt

		if("constitution")
			newamt = STACON + amt
			if(BUFCON < 0)
				BUFCON = BUFCON + amt
				if(BUFCON > 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			if(BUFCON > 0)
				BUFCON = BUFCON + amt
				if(BUFCON < 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			while(newamt < 1)
				newamt++
				BUFCON--
			while(newamt > 20)
				newamt--
				BUFCON++
			STACON = newamt

		if("endurance")
			newamt = STAEND + amt
			if(BUFEND < 0)
				BUFEND = BUFEND + amt
				if(BUFEND > 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			if(BUFEND > 0)
				BUFEND = BUFEND + amt
				if(BUFEND < 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			while(newamt < 1)
				newamt++
				BUFEND--
			while(newamt > 20)
				newamt--
				BUFEND++
			STAEND = newamt

		if("speed")
			newamt = STASPD + amt
			if(BUFSPE < 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE > 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			if(BUFSPE > 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE < 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			while(newamt < 1)
				newamt++
				BUFSPE--
			while(newamt > 20)
				newamt--
				BUFSPE++
			STASPD = newamt
			see_override = initial(src.see_invisible) + (STASPD/5) // this is pretty bad but 20 SPEED will give you 4 see_invis (significant)
			update_sight() //Needed.
			update_fov_angles()

		if("faith")
			newamt = STAFTH + amt
			if(BUFFTH < 0)
				BUFFTH = BUFFTH + amt
				if(BUFFTH > 0)
					newamt = STAFTH + BUFFTH
					BUFFTH = 0
			if(BUFFTH > 0)
				BUFFTH = BUFFTH + amt
				if(BUFFTH < 0)
					newamt = STAFTH + BUFFTH
					BUFFTH = 0
			while(newamt < 1)
				newamt++
				BUFFTH--
			while(newamt > 20)
				newamt--
				BUFFTH++
			STAFTH = newamt
		if("fortune")
			newamt = STALUC + amt
			if(BUFLUC < 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC > 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			if(BUFLUC > 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC < 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			while(newamt < 1)
				newamt++
				BUFLUC--
			while(newamt > 20)
				newamt--
				BUFLUC++
			STALUC = newamt

/proc/generic_stat_comparison(userstat as num, targetstat as num)
	var/difference = userstat - targetstat
	if(difference > 1 || difference < -1)
		return difference * 10
	else
		return 0

/mob/living/proc/badluck(multi = 3)
	if(STALUC < 10)
		return prob((10 - STALUC) * multi)

/mob/living/proc/goodluck(multi = 3)
	if(STALUC > 10)
		return prob((STALUC - 10) * multi)
