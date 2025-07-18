

/obj/item/clothing/ring
	name = "ring"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ring/silver
	name = "silver ring"
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ringP  /////////////////////// cast focus ring for acolytes and shit.
	parent_type = /obj/item/clothing/neck/roguetown/psicross
	name = "psi ring"
	desc = "a blessed psi ring, for the religious type"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = "castring"
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ring/gold
	name = "gold ring"
	icon_state = "ring_g"
	sellprice = 45

/obj/item/clothing/ring/lantern
	parent_type = /obj/item/flashlight/flare/torch/lantern // Inherits parents properties from lantern
	name = "alchemist ring"
	icon_state = "lanternR"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	desc = "flick of the thumb portable flame"
	light_range = 4 // standard torch range
	on = FALSE
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_HIP
	force = 5
	on_damage = 5
	produce_heat = 1500
	heat = 1000
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	fuel = 9999 
	sellprice = 30

/obj/item/clothing/ring/lantern/MiddleClick(mob/living/user, params)
	if (!on)
		on = TRUE
		to_chat(user, "<span class='notice'>With a flick of the thumb, you strike a flame.</span>")
	..()

/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "Unfortunately, like most magic rings, it must be used sparingly. (Right-click me to activate)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, span_warning("Nothing happens."))
			return
	user.visible_message(span_warning("[user] twists the [src]!"))
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, PROC_REF(demagicify)), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message(span_warning("The ring settles down."))
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "ring of null magic"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 10 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()

//gold rings
/obj/item/clothing/ring/emerald
	name = "gemerald ring"
	icon_state = "g_ring_emerald"
	sellprice = 195

/obj/item/clothing/ring/ruby
	name = "rontz ring"
	icon_state = "g_ring_ruby"
	sellprice = 255

/obj/item/clothing/ring/topaz
	name = "toper ring"
	icon_state = "g_ring_topaz"
	sellprice = 180

/obj/item/clothing/ring/quartz
	name = "blortz ring"
	icon_state = "g_ring_quartz"
	sellprice = 245

/obj/item/clothing/ring/sapphire
	name = "saffira ring"
	icon_state = "g_ring_sapphire"
	sellprice = 200

/obj/item/clothing/ring/diamond
	name = "dorpel ring"
	icon_state = "g_ring_diamond"
	sellprice = 270

//silver rings
/obj/item/clothing/ring/emeralds
	name = "gemerald ring"
	icon_state = "s_ring_emerald"
	sellprice = 155

/obj/item/clothing/ring/rubys
	name = "rontz ring"
	icon_state = "s_ring_ruby"
	sellprice = 215

/obj/item/clothing/ring/topazs
	name = "toper ring"
	icon_state = "s_ring_topaz"
	sellprice = 140

/obj/item/clothing/ring/quartzs
	name = "blortz ring"
	icon_state = "s_ring_quartz"
	sellprice = 205

/obj/item/clothing/ring/sapphires
	name = "saffira ring"
	icon_state = "s_ring_sapphire"
	sellprice = 160

/obj/item/clothing/ring/diamonds
	name = "dorpel ring"
	icon_state = "s_ring_diamond"
	sellprice = 230

/obj/item/clothing/ring/dragon_ring
	name = "dragon ring"
	icon_state = "dragonring"
	sellprice = 666
	var/active_item

/obj/item/clothing/ring/dragon_ring/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("Here be dragons"))
		user.change_stat("strength", 2)
		user.change_stat("constitution", 2)
		user.change_stat("endurance", 2)
		return

/obj/item/clothing/ring/dragon_ring/dropped(mob/living/user)
	if(active_item)
		to_chat(user, span_notice("Gone is thy hoard"))
		user.change_stat("strength", -2)
		user.change_stat("constitution", -2)
		user.change_stat("endurance", -2)
		active_item = FALSE
		return


//CRYSTAL KEEP///
/obj/item/clothing/ring/powerbracelet //shamelss copy paste, teehee.
	icon_state = "golden bracers"
	sellprice = 500
	var/active_item

/obj/item/clothing/ring/dragon_ring/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("you feel powerful!"))
		user.change_stat("strength", 5)
		return

/obj/item/clothing/ring/dragon_ring/dropped(mob/living/user)
	if(active_item)
		to_chat(user, span_notice("Gone is thy strength"))
		user.change_stat("strength", -5)
		active_item = FALSE
		return

//grief mechanics, but... legal.

/obj/item/clothing/ring/invader
	name = "phantasmic ring"
	desc = ""
	icon_state = "g_house_white_ring"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	sellprice = 200
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	unequip_delay_self = 20 // 2-second delay to unequip
	var/effect_enabled = FALSE // Tracks tint/glow state
	var/tint_color = "#D3D3D3" // Light gray (ghostly)
	light_color = "#D3D3D3" // Matching glow
	var/light_intensity = 2 // Subtle glow (range/intensity 2)

	equipped(mob/living/user, slot)
		..()
		if(slot == SLOT_RING && !effect_enabled)
			effect_enabled = TRUE
			apply_effects(user)

	dropped(mob/living/user)
		..()
		if(effect_enabled && ismob(user))
			remove_effects(user)

	proc/apply_effects(mob/living/user)
		if(!user)
			return
		user.color = tint_color
		user.set_light(light_intensity, light_intensity, light_color)
		user.visible_message(span_notice("[user] begins to glow faintly gray!"))

	proc/remove_effects(mob/living/user)
		if(!user)
			return
		// Only remove effects if no other invader ring is equipped
		var/obj/item/clothing/ring/invader/other_ring = locate() in user.get_equipped_items()
		if(!other_ring || other_ring == src)
			user.color = initial(user.color)
			user.set_light(0)
		effect_enabled = FALSE

/obj/item/clothing/ring/invader/red
	name = "ominous ring"
	desc = "You feel a murderous aura from this ring"
	icon_state = "g_house_red_ring"
	tint_color = "#FF6666" // Invader red
	light_color = "#FF6666"

	apply_effects(mob/living/user)
		if(!user)
			return
		user.color = tint_color
		user.set_light(light_intensity, light_intensity, light_color)
		user.visible_message(span_notice("[user] begins to glow faintly red!"))

	remove_effects(mob/living/user)
		if(!user)
			return
		var/obj/item/clothing/ring/invader/other_ring = locate() in user.get_equipped_items()
		if(!other_ring || other_ring == src)
			user.color = initial(user.color)
			user.set_light(0)
		effect_enabled = FALSE

/obj/item/clothing/ring/invader/blue
	name = "ominous ring"
	desc = "This ring makes you feel... hopeful"
	icon_state = "g_house_blue_ring"
	tint_color = "#6666FF" // Invader blue
	light_color = "#6666FF"

	apply_effects(mob/living/user)
		if(!user)
			return
		user.color = tint_color
		user.set_light(light_intensity, light_intensity, light_color)
		user.visible_message(span_notice("[user] begins to glow faintly blue!"))

	remove_effects(mob/living/user)
		if(!user)
			return
		var/obj/item/clothing/ring/invader/other_ring = locate() in user.get_equipped_items()
		if(!other_ring || other_ring == src)
			user.color = initial(user.color)
			user.set_light(0)
		effect_enabled = FALSE

/obj/item/clothing/ring/invader/purple
	name = "ominous ring"
	desc = ""
	icon_state = "g_house_purple_ring"
	tint_color = "#CC66CC" // Invader purple
	light_color = "#CC66CC"

	apply_effects(mob/living/user)
		if(!user)
			return
		user.color = tint_color
		user.set_light(light_intensity, light_intensity, light_color)
		user.visible_message(span_notice("[user] begins to glow faintly purple!"))

	remove_effects(mob/living/user)
		if(!user)
			return
		var/obj/item/clothing/ring/invader/other_ring = locate() in user.get_equipped_items()
		if(!other_ring || other_ring == src)
			user.color = initial(user.color)
			user.set_light(0)
		effect_enabled = FALSE

/obj/item/clothing/ring/invader/yellow
	name = "ominous ring"
	desc = "it's glorious"
	icon_state = "g_house_yellow_ring"
	tint_color = "#FFFF66" // Invader yellow
	light_color = "#FFFF66"

	apply_effects(mob/living/user)
		if(!user)
			return
		user.color = tint_color
		user.set_light(light_intensity, light_intensity, light_color)
		user.visible_message(span_notice("[user] begins to glow faintly yellow!"))

	remove_effects(mob/living/user)
		if(!user)
			return
		var/obj/item/clothing/ring/invader/other_ring = locate() in user.get_equipped_items()
		if(!other_ring || other_ring == src)
			user.color = initial(user.color)
			user.set_light(0)
		effect_enabled = FALSE




///


/obj/item/clothing/ring/one_ring
	name = "gold ring"
	desc = "A golden ring with Zizo's symbol etched into it"
	icon_state = "onering"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sellprice = 1000 // High value for rarity
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	var/effect_enabled = FALSE // Tracks invisibility/stress drain
	var/stress_drain_timer = null // Timer for stress and rogfat drain
	var/rogfat_rate = 10 // rogfat per second
	var/rogstam_rate = -10 // rogstam drain per second
	var/killed_by_ring = FALSE // Tracks if ring caused death for blood loss
	var/stress_cycle = 0 // Tracks seconds to trigger stress events every 3 seconds
	var/list/stress_events = list(
		/datum/stressevent/Zizotec,
		/datum/stressevent/demonview,
		/datum/stressevent/pain,
		//datum/stressevent/ring_doom_visions,
		//datum/stressevent/ring_betrayal
	) // List of ring stress events

	equipped(mob/living/user, slot)
		..()
		if(slot == SLOT_RING && !effect_enabled)
			effect_enabled = TRUE
			apply_effects(user)

	dropped(mob/living/user)
		..()
		if(effect_enabled && ismob(user))
			remove_effects(user)

	proc/apply_effects(mob/living/user)
		if(!user)
			return
		user.alpha = 0 // Make invisible
		user.visible_message(span_warning("[user] vanishes from sight!"))
		stress_cycle = 0 // Reset stress cycle
		// Start stress and rogfat drain timer
		stress_drain_timer = addtimer(CALLBACK(src, PROC_REF(drain_stats), user), 10, TIMER_LOOP | TIMER_STOPPABLE) // 1 second = 10 ticks

	proc/remove_effects(mob/living/user)
		if(!user)
			return
		user.alpha = 255 // Restore visibility
		user.visible_message(span_notice("[user] reappears!"))
		// Reset heart attack state and remove ring stress events
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.heart_attacking = FALSE
			for(var/event in stress_events)
				H.remove_stress(event)
		// Stop drain
		if(stress_drain_timer)
			deltimer(stress_drain_timer)
			stress_drain_timer = null
		effect_enabled = FALSE
		killed_by_ring = FALSE // Reset flag on unequip
		stress_cycle = 0 // Reset stress cycle

	proc/drain_stats(mob/living/user)
		if(!user || !effect_enabled)
			return
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			// Increment stress cycle (1 second per tick)
			stress_cycle++
			// Add stress event every 3 seconds (3 ticks)
			if(stress_cycle % 5 == 0)
				var/event_index = round(stress_cycle / 5) % length(stress_events) + 1
				var/event_type = stress_events[event_index]
				H.add_stress(event_type)
			// Drain rogfat and rogstam
			killed_by_ring = TRUE // Mark as ring-caused
			H.rogfat_add(rogfat_rate, null, TRUE)
			H.rogstam_add(rogstam_rate)
			H.last_fatigued = world.time + 30 // Delay regeneration
			// Check if heart attack should trigger
			if(H.rogfat >= H.maxrogfat && H.rogstam <= 0 && H.get_stress_amount() >= 30 && !H.heart_attacking)
				H.heart_attack()
			// Fallback if heart attack blocked
			if(!H.heart_attacking && H.health <= 0 && H.stat != DEAD)
				if(H.can_heartattack())
					H.heart_attack()
					H.adjustOxyLoss(150)
					H.visible_message(span_userdanger("[H]'s heart seizes under the ring’s malevolent power!"))
				else
					H.adjustOxyLoss(150)
					H.adjustBruteLoss(50)
					H.emote("breathgasp", forced = TRUE)
					H.visible_message(span_userdanger("[H]'s chest convulses under the ring’s malevolent power!"))
					if(H.stat != DEAD)
						H.death()
			killed_by_ring = FALSE 
			if(H.health <= 0 && H.stat == DEAD)
				H.death() 

/*
/obj/item/clothing/earring //lets see how this goes
	name = "ring"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

*/
