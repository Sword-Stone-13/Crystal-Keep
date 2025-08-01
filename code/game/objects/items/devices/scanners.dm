
/*

CONTAINS:
T-RAY
HEALTH ANALYZER
GAS ANALYZER
SLIME SCANNER
NANITE SCANNER
GENE SCANNER

*/
/obj/item/t_scanner
	name = "\improper T-ray scanner"
	desc = ""
	custom_price = 10
	icon = 'icons/obj/device.dmi'
	icon_state = "t-ray0"
	var/on = FALSE
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	custom_materials = list(/datum/material/iron=150)

/obj/item/t_scanner/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] begins to emit terahertz-rays into [user.p_their()] brain with [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return TOXLOSS

/obj/item/t_scanner/proc/toggle_on()
	on = !on
	icon_state = copytext(icon_state, 1, length(icon_state))+"[on]"
	if(on)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)

/obj/item/t_scanner/attack_self(mob/user)
	toggle_on()

/obj/item/t_scanner/cyborg_unequip(mob/user)
	if(!on)
		return
	toggle_on()

/obj/item/t_scanner/process()
	if(!on)
		STOP_PROCESSING(SSobj, src)
		return null
	scan()

/obj/item/t_scanner/proc/scan()
	t_ray_scan(loc)

/proc/t_ray_scan(mob/viewer, flick_time = 8, distance = 3)
	if(!ismob(viewer) || !viewer.client)
		return
	var/list/t_ray_images = list()
	for(var/obj/O in orange(distance, viewer) )
		if(O.level != 1)
			continue

		if(O.invisibility == INVISIBILITY_MAXIMUM || HAS_TRAIT(O, TRAIT_T_RAY_VISIBLE))
			var/image/I = new(loc = get_turf(O))
			var/mutable_appearance/MA = new(O)
			MA.alpha = 128
			MA.dir = O.dir
			I.appearance = MA
			t_ray_images += I
	if(t_ray_images.len)
		flick_overlay(t_ray_images, list(viewer.client), flick_time)

/obj/item/healthanalyzer
	name = "health analyzer"
	icon = 'icons/obj/device.dmi'
	icon_state = "health"
	item_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	desc = ""
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 7
	custom_materials = list(/datum/material/iron=200)
	var/mode = 1
	var/scanmode = 0
	var/advanced = FALSE

/obj/item/healthanalyzer/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] begins to analyze [user.p_them()]self with [src]! The display shows that [user.p_theyre()] dead!"))
	return BRUTELOSS

/obj/item/healthanalyzer/attack_self(mob/user)
	if(!scanmode)
		to_chat(user, span_notice("I switch the health analyzer to scan chemical contents."))
		scanmode = 1
	else
		to_chat(user, span_notice("I switch the health analyzer to check physical health."))
		scanmode = 0

/obj/item/healthanalyzer/attack(mob/living/M, mob/living/carbon/human/user)
	flick("[icon_state]-scan", src)	//makes it so that it plays the scan animation upon scanning, including clumsy scanning

	// Clumsiness/brain damage check

	if ((HAS_TRAIT(user, TRAIT_CLUMSY) || HAS_TRAIT(user, TRAIT_DUMB)) && prob(50))
		user.visible_message(span_warning("[user] analyzes the floor's vitals!"), \
							span_notice("I stupidly try to analyze the floor's vitals!"))
		to_chat(user, span_info("Analyzing results for The floor:\n\tOverall status: <b>Healthy</b>"))
		to_chat(user, span_info("Key: <font color='blue'>Suffocation</font>/<font color='green'>Toxin</font>/<font color='#FF8000'>Burn</font>/<font color='red'>Brute</font>"))
		to_chat(user, span_info("\tDamage specifics: <font color='blue'>0</font>-<font color='green'>0</font>-<font color='#FF8000'>0</font>-<font color='red'>0</font>"))
		to_chat(user, span_info("Body temperature: ???"))
		return

	user.visible_message(span_notice("[user] analyzes [M]'s vitals."), \
						span_notice("I analyze [M]'s vitals."))

	if(scanmode == 0)
		healthscan(user, M, mode, advanced)
	else if(scanmode == 1)
		chemscan(user, M)

	add_fingerprint(user)


// Used by the PDA medical scanner too
/proc/healthscan(mob/user, mob/living/M, mode = 1, advanced = FALSE)
	if(isliving(user) && (user.incapacitated() || user.eye_blind))
		return
	//Damage specifics
	var/oxy_loss = M.getOxyLoss()
	var/tox_loss = M.getToxLoss()
	var/fire_loss = M.getFireLoss()
	var/brute_loss = M.getBruteLoss()
	var/mob_status = (M.stat == DEAD ? span_alert("<b>Deceased</b>") : "<b>[round(M.health/M.maxHealth,0.01)*100] % healthy</b>")

	if(HAS_TRAIT(M, TRAIT_FAKEDEATH) && !advanced)
		mob_status = span_alert("<b>Deceased</b>")
		oxy_loss = max(rand(1, 40), oxy_loss, (300 - (tox_loss + fire_loss + brute_loss))) // Random oxygen loss

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.undergoing_cardiac_arrest() && H.stat != DEAD)
			to_chat(user, span_alert("Subject suffering from heart attack: Apply defibrillation or other electric shock immediately!"))

	to_chat(user, span_info("Analyzing results for [M]:\n\tOverall status: [mob_status]"))

	// Damage descriptions
	if(brute_loss > 10)
		to_chat(user, "\t<span class='alert'>[brute_loss > 50 ? "Severe" : "Minor"] tissue damage detected.</span>")
	if(fire_loss > 10)
		to_chat(user, "\t<span class='alert'>[fire_loss > 50 ? "Severe" : "Minor"] burn damage detected.</span>")
	if(oxy_loss > 10)
		to_chat(user, "\t<span class='info'><span class='alert'>[oxy_loss > 50 ? "Severe" : "Minor"] oxygen deprivation detected.</span>")
	if(tox_loss > 10)
		to_chat(user, "\t<span class='alert'>[tox_loss > 50 ? "Severe" : "Minor"] amount of toxin damage detected.</span>")
	if (M.getCloneLoss())
		to_chat(user, "\t<span class='alert'>Subject appears to have [M.getCloneLoss() > 30 ? "Severe" : "Minor"] cellular damage.</span>")
		if(advanced)
			to_chat(user, "\t<span class='info'>Cellular Damage Level: [M.getCloneLoss()].</span>")
	if (!M.getorgan(/obj/item/organ/brain))
		to_chat(user, "\t<span class='alert'>Subject lacks a brain.</span>")
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		if(LAZYLEN(C.get_traumas()))
			var/list/trauma_text = list()
			for(var/datum/brain_trauma/B in C.get_traumas())
				var/trauma_desc = ""
				switch(B.resilience)
					if(TRAUMA_RESILIENCE_SURGERY)
						trauma_desc += "severe "
					if(TRAUMA_RESILIENCE_LOBOTOMY)
						trauma_desc += "deep-rooted "
					if(TRAUMA_RESILIENCE_MAGIC, TRAUMA_RESILIENCE_ABSOLUTE)
						trauma_desc += "permanent "
				trauma_desc += B.scan_desc
				trauma_text += trauma_desc
			to_chat(user, "\t<span class='alert'>Cerebral traumas detected: subject appears to be suffering from [english_list(trauma_text)].</span>")
		if(LAZYLEN(C.roundstart_quirks))
			to_chat(user, "\t<span class='info'>Subject has the following physiological traits: [C.get_trait_string()].</span>")
	if(advanced)
		to_chat(user, "\t<span class='info'>Brain Activity Level: [(200 - M.getOrganLoss(ORGAN_SLOT_BRAIN))/2]%.</span>")

	if (M.radiation)
		to_chat(user, "\t<span class='alert'>Subject is irradiated.</span>")
		if(advanced)
			to_chat(user, "\t<span class='info'>Radiation Level: [M.radiation]%.</span>")

	if(advanced && M.hallucinating())
		to_chat(user, "\t<span class='info'>Subject is hallucinating.</span>")

	//Eyes and ears
	if(advanced)
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			var/obj/item/organ/ears/ears = C.getorganslot(ORGAN_SLOT_EARS)
			to_chat(user, "\t<span class='info'><b>==EAR STATUS==</b></span>")
			if(istype(ears))
				var/healthy = TRUE
				if(HAS_TRAIT_FROM(C, TRAIT_DEAF, GENETIC_MUTATION))
					healthy = FALSE
					to_chat(user, "\t<span class='alert'>Subject is genetically deaf.</span>")
				else if(HAS_TRAIT(C, TRAIT_DEAF))
					healthy = FALSE
					to_chat(user, "\t<span class='alert'>Subject is deaf.</span>")
				else
					if(ears.damage)
						to_chat(user, "\t<span class='alert'>Subject has [ears.damage > ears.maxHealth ? "permanent ": "temporary "]hearing damage.</span>")
						healthy = FALSE
					if(ears.deaf)
						to_chat(user, "\t<span class='alert'>Subject is [ears.damage > ears.maxHealth ? "permanently ": "temporarily "] deaf.</span>")
						healthy = FALSE
				if(healthy)
					to_chat(user, "\t<span class='info'>Healthy.</span>")
			else
				to_chat(user, "\t<span class='alert'>Subject does not have ears.</span>")
			var/obj/item/organ/eyes/eyes = C.getorganslot(ORGAN_SLOT_EYES)
			to_chat(user, "\t<span class='info'><b>==EYE STATUS==</b></span>")
			if(istype(eyes))
				var/healthy = TRUE
				if(HAS_TRAIT(C, TRAIT_BLIND))
					to_chat(user, "\t<span class='alert'>Subject is blind.</span>")
					healthy = FALSE
				if(HAS_TRAIT(C, TRAIT_NEARSIGHT))
					to_chat(user, "\t<span class='alert'>Subject is nearsighted.</span>")
					healthy = FALSE
				if(eyes.damage > 30)
					to_chat(user, "\t<span class='alert'>Subject has severe eye damage.</span>")
					healthy = FALSE
				else if(eyes.damage > 20)
					to_chat(user, "\t<span class='alert'>Subject has significant eye damage.</span>")
					healthy = FALSE
				else if(eyes.damage)
					to_chat(user, "\t<span class='alert'>Subject has minor eye damage.</span>")
					healthy = FALSE
				if(healthy)
					to_chat(user, "\t<span class='info'>Healthy.</span>")
			else
				to_chat(user, "\t<span class='alert'>Subject does not have eyes.</span>")


	// Body part damage report
	if(iscarbon(M) && mode == 1)
		var/mob/living/carbon/C = M
		var/list/damaged = C.get_damaged_bodyparts(1,1)
		if(length(damaged)>0 || oxy_loss>0 || tox_loss>0 || fire_loss>0)
			var/list/dmgreport = list()
			dmgreport += "<table style='margin-left:3em'><tr><font face='Verdana'>\
							<td style='width:7em;'><font color='#0000CC'>Damage:</font></td>\
							<td style='width:5em;'><font color='red'><b>Brute</b></font></td>\
							<td style='width:4em;'><font color='orange'><b>Burn</b></font></td>\
							<td style='width:4em;'><font color='green'><b>Toxin</b></font></td>\
							<td style='width:8em;'><font color='purple'><b>Suffocation</b></font></td></tr>\

							<tr><td><font color='#0000CC'>Overall:</font></td>\
							<td><font color='red'>[CEILING(brute_loss,1)]</font></td>\
							<td><font color='orange'>[CEILING(fire_loss,1)]</font></td>\
							<td><font color='green'>[CEILING(tox_loss,1)]</font></td>\
							<td><font color='blue'>[CEILING(oxy_loss,1)]</font></td></tr>"

			for(var/o in damaged)
				var/obj/item/bodypart/org = o //head, left arm, right arm, etc.
				dmgreport += "<tr><td><font color='#0000CC'>[capitalize(org.name)]:</font></td>\
								<td><font color='red'>[(org.brute_dam > 0) ? "[CEILING(org.brute_dam,1)]" : "0"]</font></td>\
								<td><font color='orange'>[(org.burn_dam > 0) ? "[CEILING(org.burn_dam,1)]" : "0"]</font></td></tr>"
			dmgreport += "</font></table>"
			to_chat(user, dmgreport.Join())


	//Organ damages report
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/minor_damage
		var/major_damage
		var/max_damage
		var/report_organs = FALSE

		//Piece together the lists to be reported
		for(var/O in H.internal_organs)
			var/obj/item/organ/organ = O
			if(organ.organ_flags & ORGAN_FAILING)
				report_organs = TRUE	//if we report one organ, we report all organs, even if the lists are empty, just for consistency
				if(max_damage)
					max_damage += ", "	//prelude the organ if we've already reported an organ
					max_damage += organ.name	//this just slaps the organ name into the string of text
				else
					max_damage = "\t<span class='alert'>Non-Functional Organs: "	//our initial statement
					max_damage += organ.name
			else if(organ.damage > organ.high_threshold)
				report_organs = TRUE
				if(major_damage)
					major_damage += ", "
					major_damage += organ.name
				else
					major_damage = "\t<span class='info'>Severely Damaged Organs: </span>"
					major_damage += organ.name
			else if(organ.damage > organ.low_threshold)
				report_organs = TRUE
				if(minor_damage)
					minor_damage += ", "
					minor_damage += organ.name
				else
					minor_damage = "\t<span class='info'>Mildly Damaged Organs: </span>"
					minor_damage += organ.name

		if(report_organs)	//we either finish the list, or set it to be empty if no organs were reported in that category
			if(!max_damage)
				max_damage = "\t<span class='alert'>Non-Functional Organs: </span>"
			else
				max_damage += "</span>"
			if(!major_damage)
				major_damage = "\t<span class='info'>Severely Damaged Organs: </span>"
			else
				major_damage += "</span>"
			if(!minor_damage)
				minor_damage = "\t<span class='info'>Mildly Damaged Organs: </span>"
			else
				minor_damage += "</span>"
			to_chat(user, minor_damage)
			to_chat(user, major_damage)
			to_chat(user, max_damage)
		//Genetic damage
		if(advanced && H.has_dna())
			to_chat(user, "\t<span class='info'>Genetic Stability: [H.dna.stability]%.</span>")

	// Species and body temperature
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/species/S = H.dna.species
		var/mutant = FALSE
		to_chat(user, "<span class='info'>Species: [S.name][mutant ? "-derived mutant" : ""]</span>")
	to_chat(user, "<span class='info'>Body temperature: [round(M.bodytemperature-T0C,0.1)] &deg;C ([round(M.bodytemperature*1.8-459.67,0.1)] &deg;F)</span>")

	// Time of death
	if(M.tod && (M.stat == DEAD || ((HAS_TRAIT(M, TRAIT_FAKEDEATH)) && !advanced)))
		to_chat(user, span_info("Time of Death: [M.tod]"))
		var/tdelta = round(world.time - M.timeofdeath)
		if(tdelta < (DEFIB_TIME_LIMIT * 10))
			to_chat(user, span_alert("<b>Subject died [DisplayTimeText(tdelta)] ago, defibrillation may be possible!</b>"))

	for(var/thing in M.diseases)
		var/datum/disease/D = thing
		if(!(D.visibility_flags & HIDDEN_SCANNER))
			to_chat(user, span_alert("<b>Warning: [D.form] detected</b>\nName: [D.name].\nType: [D.spread_text].\nStage: [D.stage]/[D.max_stages].\nPossible Cure: [D.cure_text]"))

	// Blood Level
	if(M.has_dna())
		var/mob/living/carbon/C = M
		var/blood_id = C.get_blood_id()
		if(blood_id)
			if(ishuman(C))
				var/mob/living/carbon/human/H = C
				if(H.bleed_rate)
					to_chat(user, span_alert("<b>Subject is bleeding!</b>"))
			var/blood_percent =  round((C.blood_volume / BLOOD_VOLUME_NORMAL)*100)
			var/blood_type = C.dna.blood_type
			if(blood_id != /datum/reagent/blood)//special blood substance
				var/datum/reagent/R = GLOB.chemical_reagents_list[blood_id]
				if(R)
					blood_type = R.name
				else
					blood_type = blood_id
			if(C.blood_volume <= BLOOD_VOLUME_SAFE && C.blood_volume > BLOOD_VOLUME_OKAY)
				to_chat(user, span_alert("Blood level: LOW [blood_percent] %, [C.blood_volume] cl,</span> <span class='info'>type: [blood_type]"))
			else if(C.blood_volume <= BLOOD_VOLUME_OKAY)
				to_chat(user, span_alert("Blood level: <b>CRITICAL [blood_percent] %</b>, [C.blood_volume] cl,</span> <span class='info'>type: [blood_type]"))
			else
				to_chat(user, span_info("Blood level: [blood_percent] %, [C.blood_volume] cl, type: [blood_type]"))

		var/cyberimp_detect
		for(var/obj/item/organ/cyberimp/CI in C.internal_organs)
			if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
				cyberimp_detect += "[C.name] is modified with a [CI.name].<br>"
		if(cyberimp_detect)
			to_chat(user, span_notice("Detected cybernetic modifications:"))
			to_chat(user, span_notice("[cyberimp_detect]"))
	SEND_SIGNAL(M, COMSIG_NANITE_SCAN, user, FALSE)

/proc/chemscan(mob/living/user, mob/living/M)
	if(istype(M))
		if(M.reagents)
			if(M.reagents.reagent_list.len)
				to_chat(user, span_notice("Subject contains the following reagents:"))
				for(var/datum/reagent/R in M.reagents.reagent_list)
					to_chat(user, span_notice("[round(R.volume, 0.001)] units of [R.name][R.overdosed == 1 ? span_boldannounce(" OVERDOSING") : ""]."))
			else
				to_chat(user, span_notice("Subject contains no reagents."))
			if(M.reagents.addiction_list.len)
				to_chat(user, span_boldannounce("Subject is addicted to the following reagents:"))
				for(var/datum/reagent/R in M.reagents.addiction_list)
					to_chat(user, span_alert("[R.name]"))
			else
				to_chat(user, span_notice("Subject is not addicted to any reagents."))

/obj/item/healthanalyzer/verb/toggle_mode()
	set name = "Switch Verbosity"
	set hidden = 1

	if(usr.incapacitated())
		return

	mode = !mode
	switch (mode)
		if(1)
			to_chat(usr, "The scanner now shows specific limb damage.")
		if(0)
			to_chat(usr, "The scanner no longer shows limb damage.")

/obj/item/healthanalyzer/advanced
	name = "advanced health analyzer"
	icon_state = "health_adv"
	desc = ""
	advanced = TRUE

/obj/item/analyzer
	desc = ""
	name = "analyzer"
	custom_price = 10
	icon = 'icons/obj/device.dmi'
	icon_state = "analyzer"
	item_state = "analyzer"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	throwforce = 0
	throw_speed = 1
	throw_range = 7
	tool_behaviour = TOOL_ANALYZER
	custom_materials = list(/datum/material/iron=30, /datum/material/glass=20)
	grind_results = list(/datum/reagent/mercury = 5, /datum/reagent/iron = 5, /datum/reagent/silicon = 5)
	var/cooldown = FALSE
	var/cooldown_time = 250
	var/accuracy // 0 is the best accuracy.

/obj/item/analyzer/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click [src] to activate the barometer function.")

/obj/item/analyzer/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] begins to analyze [user.p_them()]self with [src]! The display shows that [user.p_theyre()] dead!"))
	return BRUTELOSS

/obj/item/analyzer/attack_self(mob/user)
	add_fingerprint(user)

	if (user.stat || user.eye_blind)
		return

	var/turf/location = user.loc
	if(!istype(location))
		return

	var/datum/gas_mixture/environment = location.return_air()

	var/pressure = environment.return_pressure()
	var/total_moles = environment.total_moles()

	to_chat(user, span_info("<B>Results:</B>"))
	if(abs(pressure - ONE_ATMOSPHERE) < 10)
		to_chat(user, span_info("Pressure: [round(pressure, 0.01)] kPa"))
	else
		to_chat(user, span_alert("Pressure: [round(pressure, 0.01)] kPa"))
	if(total_moles)
		var/list/env_gases = environment.gases

		environment.assert_gases(arglist(GLOB.hardcoded_gases))
		var/o2_concentration = env_gases[/datum/gas/oxygen][MOLES]/total_moles
		var/n2_concentration = env_gases[/datum/gas/nitrogen][MOLES]/total_moles
		var/co2_concentration = env_gases[/datum/gas/carbon_dioxide][MOLES]/total_moles
		var/plasma_concentration = env_gases[/datum/gas/plasma][MOLES]/total_moles

		if(abs(n2_concentration - N2STANDARD) < 20)
			to_chat(user, span_info("Nitrogen: [round(n2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/nitrogen][MOLES], 0.01)] mol)"))
		else
			to_chat(user, span_alert("Nitrogen: [round(n2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/nitrogen][MOLES], 0.01)] mol)"))

		if(abs(o2_concentration - O2STANDARD) < 2)
			to_chat(user, span_info("Oxygen: [round(o2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/oxygen][MOLES], 0.01)] mol)"))
		else
			to_chat(user, span_alert("Oxygen: [round(o2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/oxygen][MOLES], 0.01)] mol)"))

		if(co2_concentration > 0.01)
			to_chat(user, span_alert("CO2: [round(co2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/carbon_dioxide][MOLES], 0.01)] mol)"))
		else
			to_chat(user, span_info("CO2: [round(co2_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/carbon_dioxide][MOLES], 0.01)] mol)"))

		if(plasma_concentration > 0.005)
			to_chat(user, span_alert("Plasma: [round(plasma_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/plasma][MOLES], 0.01)] mol)"))
		else
			to_chat(user, span_info("Plasma: [round(plasma_concentration*100, 0.01)] % ([round(env_gases[/datum/gas/plasma][MOLES], 0.01)] mol)"))

		environment.garbage_collect()

		for(var/id in env_gases)
			if(id in GLOB.hardcoded_gases)
				continue
			var/gas_concentration = env_gases[id][MOLES]/total_moles
			to_chat(user, span_alert("[env_gases[id][GAS_META][META_GAS_NAME]]: [round(gas_concentration*100, 0.01)] % ([round(env_gases[id][MOLES], 0.01)] mol)"))
		to_chat(user, span_info("Temperature: [round(environment.temperature-T0C, 0.01)] &deg;C ([round(environment.temperature, 0.01)] K)"))

/obj/item/analyzer/AltClick(mob/user) //Barometer output for measuring when the next storm happens
	..()

	if(user.canUseTopic(src, BE_CLOSE))

		if(cooldown)
			to_chat(user, span_warning("[src]'s barometer function is preparing itself."))
			return

		var/turf/T = get_turf(user)
		if(!T)
			return

		playsound(src, 'sound/blank.ogg', 100)
		var/area/user_area = T.loc
		var/datum/weather/ongoing_weather = null

		if(!user_area.outdoors)
			to_chat(user, span_warning("[src]'s barometer function won't work indoors!"))
			return

		for(var/V in SSweather.curweathers)
			var/datum/weather/W = V
			if(W.barometer_predictable && (T.z in W.impacted_z_levels) && W.area_type == user_area.type && !(W.stage == END_STAGE))
				ongoing_weather = W
				break

		if(ongoing_weather)
			if((ongoing_weather.stage == MAIN_STAGE) || (ongoing_weather.stage == WIND_DOWN_STAGE))
				to_chat(user, span_warning("[src]'s barometer function can't trace anything while the storm is [ongoing_weather.stage == MAIN_STAGE ? "already here!" : "winding down."]"))
				return

			to_chat(user, span_notice("The next [ongoing_weather] will hit in [butchertime(ongoing_weather.next_hit_time - world.time)]."))
			if(ongoing_weather.aesthetic)
				to_chat(user, span_warning("[src]'s barometer function says that the next storm will breeze on by."))
		else
			var/next_hit = SSweather.next_hit_by_zlevel["[T.z]"]
			var/fixed = next_hit ? next_hit - world.time : -1
			if(fixed < 0)
				to_chat(user, span_warning("[src]'s barometer function was unable to trace any weather patterns."))
			else
				to_chat(user, span_warning("[src]'s barometer function says a storm will land in approximately [butchertime(fixed)]."))
		cooldown = TRUE
		addtimer(CALLBACK(src,TYPE_PROC_REF(/obj/item/analyzer, ping)), cooldown_time)

/obj/item/analyzer/proc/ping()
	if(isliving(loc))
		var/mob/living/L = loc
		to_chat(L, span_notice("[src]'s barometer function is ready!"))
	playsound(src, 'sound/blank.ogg', 100)
	cooldown = FALSE

/obj/item/analyzer/proc/butchertime(amount)
	if(!amount)
		return
	if(accuracy)
		var/inaccurate = round(accuracy*(1/3))
		if(prob(50))
			amount -= inaccurate
		if(prob(50))
			amount += inaccurate
	return DisplayTimeText(max(1,amount))

/proc/atmosanalyzer_scan(mob/user, atom/target, silent=FALSE)
	var/mixture = target.return_analyzable_air()
	if(!mixture)
		return FALSE

	var/icon = target
	if(!silent && isliving(user))
		user.visible_message(span_notice("[user] has used the analyzer on [icon2html(icon, viewers(user))] [target]."), span_notice("I use the analyzer on [icon2html(icon, user)] [target]."))
	to_chat(user, span_boldnotice("Results of analysis of [icon2html(icon, user)] [target]."))

	var/list/airs = islist(mixture) ? mixture : list(mixture)
	for(var/g in airs)
		if(airs.len > 1) //not a unary gas mixture
			to_chat(user, span_boldnotice("Node [airs.Find(g)]"))
		var/datum/gas_mixture/air_contents = g

		var/total_moles = air_contents.total_moles()
		var/pressure = air_contents.return_pressure()
		var/volume = air_contents.return_volume() //could just do mixture.volume... but safety, I guess?
		var/temperature = air_contents.temperature
		var/cached_scan_results = air_contents.analyzer_results

		if(total_moles > 0)
			to_chat(user, span_notice("Moles: [round(total_moles, 0.01)] mol"))
			to_chat(user, span_notice("Volume: [volume] L"))
			to_chat(user, span_notice("Pressure: [round(pressure,0.01)] kPa"))

			var/list/cached_gases = air_contents.gases
			for(var/id in cached_gases)
				var/gas_concentration = cached_gases[id][MOLES]/total_moles
				to_chat(user, span_notice("[cached_gases[id][GAS_META][META_GAS_NAME]]: [round(gas_concentration*100, 0.01)] % ([round(cached_gases[id][MOLES], 0.01)] mol)"))
			to_chat(user, span_notice("Temperature: [round(temperature - T0C,0.01)] &deg;C ([round(temperature, 0.01)] K)"))

		else
			if(airs.len > 1)
				to_chat(user, span_notice("This node is empty!"))
			else
				to_chat(user, span_notice("[target] is empty!"))

		if(cached_scan_results && cached_scan_results["fusion"]) //notify the user if a fusion reaction was detected
			var/instability = round(cached_scan_results["fusion"], 0.01)
			to_chat(user, span_boldnotice("Large amounts of free neutrons detected in the air indicate that a fusion reaction took place."))
			to_chat(user, span_notice("Instability of the last fusion reaction: [instability]."))
	return TRUE

//slime scanner

/obj/item/slime_scanner
	name = "slime scanner"
	desc = ""
	icon = 'icons/obj/device.dmi'
	icon_state = "adv_spectrometer"
	item_state = "analyzer"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	throwforce = 0
	throw_speed = 1
	throw_range = 7
	custom_materials = list(/datum/material/iron=30, /datum/material/glass=20)

/obj/item/slime_scanner/attack(mob/living/M, mob/living/user)
	if(user.stat || user.eye_blind)
		return
	if (!isslime(M))
		to_chat(user, span_warning("This device can only scan slimes!"))
		return
	var/mob/living/simple_animal/slime/T = M
	slime_scan(T, user)

/proc/slime_scan(mob/living/simple_animal/slime/T, mob/living/user)
	to_chat(user, "========================")
	to_chat(user, "<b>Slime scan results:</b>")
	to_chat(user, span_notice("[T.colour] [T.is_adult ? "adult" : "baby"] slime"))
	to_chat(user, "Nutrition: [T.nutrition]/[T.get_max_nutrition()]")
	if (T.nutrition < T.get_starve_nutrition())
		to_chat(user, span_warning("Warning: slime is starving!"))
	else if (T.nutrition < T.get_hunger_nutrition())
		to_chat(user, span_warning("Warning: slime is hungry"))
	to_chat(user, "Electric change strength: [T.powerlevel]")
	to_chat(user, "Health: [round(T.health/T.maxHealth,0.01)*100]%")
	if (T.slime_mutation[4] == T.colour)
		to_chat(user, "This slime does not evolve any further.")
	else
		if (T.slime_mutation[3] == T.slime_mutation[4])
			if (T.slime_mutation[2] == T.slime_mutation[1])
				to_chat(user, "Possible mutation: [T.slime_mutation[3]]")
				to_chat(user, "Genetic destability: [T.mutation_chance/2] % chance of mutation on splitting")
			else
				to_chat(user, "Possible mutations: [T.slime_mutation[1]], [T.slime_mutation[2]], [T.slime_mutation[3]] (x2)")
				to_chat(user, "Genetic destability: [T.mutation_chance] % chance of mutation on splitting")
		else
			to_chat(user, "Possible mutations: [T.slime_mutation[1]], [T.slime_mutation[2]], [T.slime_mutation[3]], [T.slime_mutation[4]]")
			to_chat(user, "Genetic destability: [T.mutation_chance] % chance of mutation on splitting")
	if (T.cores > 1)
		to_chat(user, "Multiple cores detected")
	to_chat(user, "Growth progress: [T.amount_grown]/[SLIME_EVOLUTION_THRESHOLD]")
	if(T.effectmod)
		to_chat(user, span_notice("Core mutation in progress: [T.effectmod]"))
		to_chat(user, span_notice("Progress in core mutation: [T.applied] / [SLIME_EXTRACT_CROSSING_REQUIRED]"))
	to_chat(user, "========================")


/obj/item/nanite_scanner
	name = "nanite scanner"
	icon = 'icons/obj/device.dmi'
	icon_state = "nanite_scanner"
	item_state = "nanite_remote"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	desc = ""
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 7
	custom_materials = list(/datum/material/iron=200)

/obj/item/nanite_scanner/attack(mob/living/M, mob/living/carbon/human/user)
	user.visible_message(span_notice("[user] analyzes [M]'s nanites."), \
						span_notice("I analyze [M]'s nanites."))

	add_fingerprint(user)

	var/response = SEND_SIGNAL(M, COMSIG_NANITE_SCAN, user, TRUE)
	if(!response)
		to_chat(user, span_info("No nanites detected in the subject."))

/obj/item/sequence_scanner
	name = "genetic sequence scanner"
	icon = 'icons/obj/device.dmi'
	icon_state = "gene"
	item_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	desc = ""
	flags_1 = CONDUCT_1
	item_flags = NOBLUDGEON
	slot_flags = ITEM_SLOT_BELT
	throwforce = 3
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 7
	custom_materials = list(/datum/material/iron=200)
	var/list/discovered = list() //hit a dna console to update the scanners database
	var/list/buffer
	var/ready = TRUE
	var/cooldown = 200

/obj/item/sequence_scanner/attack(mob/living/M, mob/living/carbon/human/user)
	add_fingerprint(user)
	if (!HAS_TRAIT(M, TRAIT_RADIMMUNE) && !HAS_TRAIT(M, TRAIT_BADDNA)) //no scanning if its a husk or DNA-less Species
		user.visible_message(span_notice("[user] analyzes [M]'s genetic sequence."), \
							span_notice("I analyze [M]'s genetic sequence."))
		gene_scan(M, user)

	else
		user.visible_message(span_notice("[user] failed to analyse [M]'s genetic sequence."), span_warning("[M] has no readable genetic sequence!"))

/obj/item/sequence_scanner/attack_self(mob/user)
	display_sequence(user)

/obj/item/sequence_scanner/attack_self_tk(mob/user)
	return

/obj/item/sequence_scanner/afterattack(obj/O, mob/user, proximity)
	. = ..()
	if(!istype(O) || !proximity)
		return

	if(istype(O, /obj/machinery/computer/scan_consolenew))
		var/obj/machinery/computer/scan_consolenew/C = O
		if(C.stored_research)
			to_chat(user, span_notice("[name] linked to central research database."))
			discovered = C.stored_research.discovered_mutations
		else
			to_chat(user,span_warning("No database to update from."))

/obj/item/sequence_scanner/proc/gene_scan(mob/living/carbon/C, mob/living/user)
	if(!iscarbon(C) || !C.has_dna())
		return
	buffer = C.dna.mutation_index
	to_chat(user, span_notice("Subject [C.name]'s DNA sequence has been saved to buffer."))
	if(LAZYLEN(buffer))
		for(var/A in buffer)
			to_chat(user, span_notice("[get_display_name(A)]"))


/obj/item/sequence_scanner/proc/display_sequence(mob/living/user)
	if(!LAZYLEN(buffer) || !ready)
		return
	var/list/options = list()
	for(var/A in buffer)
		options += get_display_name(A)

	var/answer = input(user, "Analyze Potential", "Sequence Analyzer")  as null|anything in sortList(options)
	if(answer && ready && user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		var/sequence
		for(var/A in buffer) //this physically hurts but i dont know what anything else short of an assoc list
			if(get_display_name(A) == answer)
				sequence = buffer[A]
				break

		if(sequence)
			var/display
			for(var/i in 0 to length(sequence) / DNA_MUTATION_BLOCKS-1)
				if(i)
					display += "-"
				display += copytext(sequence, 1 + i*DNA_MUTATION_BLOCKS, DNA_MUTATION_BLOCKS*(1+i) + 1)

			to_chat(user, "<span class='boldnotice'>[display]</span><br>")

		ready = FALSE
		icon_state = "[icon_state]_recharging"
		addtimer(CALLBACK(src, PROC_REF(recharge)), cooldown, TIMER_UNIQUE)

/obj/item/sequence_scanner/proc/recharge()
	icon_state = initial(icon_state)
	ready = TRUE

/obj/item/sequence_scanner/proc/get_display_name(mutation)
	var/datum/mutation/human/HM = GET_INITIALIZED_MUTATION(mutation)
	if(!HM)
		return "ERROR"
	if(mutation in discovered)
		return  "[HM.name] ([HM.alias])"
	else
		return HM.alias

/obj/item/scanner_wand
	name = "kiosk scanner wand"
	icon = 'icons/obj/device.dmi'
	icon_state = "scanner_wand"
	item_state = "healthanalyzer"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	desc = ""
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	var/selected_target = null

/obj/item/scanner_wand/attack(mob/living/M, mob/living/carbon/human/user)
	flick("[icon_state]_active", src)	//nice little visual flash when scanning someone else.

	if((HAS_TRAIT(user, TRAIT_CLUMSY) || HAS_TRAIT(user, TRAIT_DUMB)) && prob(25))
		user.visible_message(span_warning("[user] targets himself for scanning."), \
		to_chat(user, span_info("I try scanning [M], before realizing you're holding the scanner backwards. Whoops.")))
		selected_target = user
		return

	if(!ishuman(M))
		to_chat(user, span_info("I can only scan human-like, non-robotic beings."))
		selected_target = null
		return

	user.visible_message(span_notice("[user] targets [M] for scanning."), \
						span_notice("I target [M] vitals."))
	selected_target = M
	return

/obj/item/scanner_wand/attack_self(mob/user)
	to_chat(user, span_info("I clear the scanner's target."))
	selected_target = null

/obj/item/scanner_wand/proc/return_patient()
	var/returned_target = selected_target
	return returned_target
