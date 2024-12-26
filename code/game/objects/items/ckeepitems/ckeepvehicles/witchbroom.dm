/obj/vehicle/ridden/scooter/skateboard/witchbroom
	name = "enchanted broomstick"
	desc = "It soars through the air with supernatural grace. Its worn wooden handle hints at countless journeys."	
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "broom"
	density = FALSE
	arms_required = 1
	fall_off_if_missing_arms = TRUE
	board_item_type = /obj/item/melee/skateboard/witchbroom
	board_icon = "broom"


/obj/item/melee/skateboard/witchbroom
	name = "enchanted broomstick"
	desc = "A flying broomstick, favored by practitioners of the arcane for swift travel. Beware of wooden splinters."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"
	board_item_type = /obj/vehicle/ridden/scooter/skateboard/witchbroom

/obj/vehicle/ridden/scooter/skateboard/witchbroom/generate_actions()
	initialize_controller_action_type(/datum/action/vehicle/ridden/scooter/witchbroom/broom_boost, VEHICLE_CONTROL_DRIVE)

/datum/action/vehicle/ridden/scooter/witchbroom/broom_boost
	name = "Arcane Boost"
	desc = "Channel magical energy to perform a supernatural leap through the air."
	button_icon_state = "broom_boost"
	///Cooldown to next boost
	var/next_ollie

/datum/action/vehicle/ridden/scooter/witchbroom/broom_boost/Trigger()
	if(world.time > next_ollie)
		var/obj/vehicle/ridden/scooter/skateboard/witchbroom/V = vehicle_target
		if (V.grinding)
			return
		var/mob/living/L = owner
		var/turf/landing_turf = get_step(V.loc, V.dir)
		L.rogstam_add(-V.instability*2)
		if(L.getrogstamloss() >= 100)
			playsound(src, 'sound/magic/timestop.ogg', 20, TRUE)
			V.unbuckle_mob(L)
			L.throw_at(landing_turf, 2, 2)
			shake_camera(L, 15, 1)
			L.apply_stun_effect(8)
			V.visible_message(span_danger("[L] loses control of the magical energies and plummets!"))
		else
			playsound(V, 'sound/magic/magic_nulled.ogg', 50, TRUE)
			passtable_on(L, VEHICLE_TRAIT)
			V.pass_flags |= PASSTABLE
			L.Move(landing_turf, vehicle_target.dir)
			passtable_off(L, VEHICLE_TRAIT)
			V.pass_flags &= ~PASSTABLE
		if(locate(/obj/structure/table) in V.loc.contents)
			V.grinding = TRUE
			addtimer(CALLBACK(V, TYPE_PROC_REF(/obj/vehicle/ridden/scooter/skateboard/witchbroom, grind)), 2)
		next_ollie = world.time + 5

