/obj/effect/proc_holder/spell/targeted/crystalmorph
	name = "Shapechange"
	desc = ""
	clothes_req = FALSE
	human_req = FALSE
	charge_max = 200
	releasedrain = 200
	cooldown_min = 50
	range = -1
	include_user = TRUE
	invocation = "RAC'WA NO!"
	invocation_type = "shout"
	action_icon_state = "shapeshift"
	var/revert_on_death = TRUE
	var/die_with_shapeshifted_form = TRUE
	var/convert_damage = TRUE //If you want to convert the caster's health to the shift, and vice versa.
	var/convert_damage_type = BRUTE //Since simplemobs don't have advanced damagetypes, what to convert damage back into.
	var/shapeshift_type
	var/list/possible_shapes = list(/mob/living/simple_animal/mouse)

/obj/effect/proc_holder/spell/targeted/crystalmorph/cast(list/targets,mob/user = usr)
	if(src in user.mob_spell_list)
		user.mob_spell_list.Remove(src)
		user.mind.AddSpell(src)
	if(user.buckled)
		user.buckled.unbuckle_mob(src,force=TRUE)
	for(var/mob/living/M in targets)
		if(!shapeshift_type)
			var/list/animal_list = list()
			for(var/path in possible_shapes)
				var/mob/living/simple_animal/A = path
				animal_list[initial(A.name)] = path
			var/new_shapeshift_type = input(M, "Choose Your Animal Form!", "It's Morphing Time!", null) as null|anything in sortList(animal_list)
			if(shapeshift_type)
				return
			shapeshift_type = new_shapeshift_type
			if(!shapeshift_type) //If you aren't gonna decide I am!
				shapeshift_type = pick(animal_list)
			shapeshift_type = animal_list[shapeshift_type]
		
		var/obj/crystalmorph_holder/S = locate() in M
		if(S)
			Restore(M)
		else
			if(shapeshift_type == /mob/living/simple_animal/hostile/retaliate/gaseousform)
				spawn(100)
					Restore(M)
			Shapeshift(M)

/obj/effect/proc_holder/spell/targeted/crystalmorph/proc/Shapeshift(mob/living/caster)
	var/obj/crystalmorph_holder/H = locate() in caster
	if(H)
		to_chat(caster, span_warning("You're already shapeshifted!"))
		return

	var/mob/living/shape = new shapeshift_type(caster.loc)
	H = new(shape,src,caster)

	clothes_req = FALSE
	human_req = FALSE
	req_items = list()

/obj/effect/proc_holder/spell/targeted/crystalmorph/proc/Restore(mob/living/shape)
	var/obj/crystalmorph_holder/H = locate() in shape
	if(!H)
		return

	H.restore()

	clothes_req = initial(clothes_req)
	human_req = initial(human_req)

/obj/crystalmorph_holder
	name = "Shapeshift holder"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ON_FIRE | UNACIDABLE | ACID_PROOF
	var/mob/living/stored
	var/mob/living/shape
	var/restoring = FALSE
	var/datum/soullink/crystalmorph/slink
	var/obj/effect/proc_holder/spell/targeted/crystalmorph/source

/obj/crystalmorph_holder/Initialize(mapload,obj/effect/proc_holder/spell/targeted/crystalmorph/source,mob/living/caster)
	. = ..()
	src.source = source
	shape = loc
	if(!istype(shape))
		CRASH("shapeshift holder created outside mob/living")
	stored = caster
	if(stored.mind)
		stored.mind.transfer_to(shape)
	stored.forceMove(src)
	stored.notransform = TRUE
	if(source.convert_damage)
		var/damage_percent = (stored.maxHealth - stored.health)/stored.maxHealth;
		var/damapply = damage_percent * shape.maxHealth;

		shape.apply_damage(damapply, source.convert_damage_type, forced = TRUE);

	slink = soullink(/datum/soullink/crystalmorph, stored , shape)
	slink.source = src

/obj/crystalmorph_holder/Destroy()
	if(!restoring)
		restore()
	stored = null
	shape = null
	. = ..()

/obj/crystalmorph_holder/Moved()
	. = ..()
	if(!restoring || QDELETED(src))
		restore()

/obj/crystalmorph_holder/handle_atom_del(atom/A)
	if(A == stored && !restoring)
		restore()

/obj/crystalmorph_holder/Exited(atom/movable/AM)
	if(AM == stored && !restoring)
		restore()

/obj/crystalmorph_holder/proc/casterDeath()
	//Something kills the stored caster through direct damage.
	if(source.revert_on_death)
		restore(death=TRUE)
	else
		shape.death()

/obj/crystalmorph_holder/proc/shapeDeath()
	//Shape dies.
	if(source.die_with_shapeshifted_form)
		if(source.revert_on_death)
			restore(death=TRUE)
	else
		restore()

/obj/crystalmorph_holder/proc/restore(death=FALSE)
	restoring = TRUE
	qdel(slink)
	stored.forceMove(get_turf(src))
	stored.notransform = FALSE
	if(shape.mind)
		shape.mind.transfer_to(stored)
	if(death)
		stored.death()
	else if(source.convert_damage)
		stored.revive(full_heal = FALSE, admin_revive = FALSE)

		var/damage_percent = (shape.maxHealth - shape.health)/shape.maxHealth;
		var/damapply = stored.maxHealth * damage_percent

		stored.apply_damage(damapply, source.convert_damage_type, forced = TRUE)
		//fuck you, now you cant be immortal.
		source.charge_counter = 0
		source.start_recharge()
		if(source.action)
			source.action.UpdateButtonIcon()
	qdel(shape)
	qdel(src)

/datum/soullink/crystalmorph
	var/obj/crystalmorph_holder/source

/datum/soullink/crystalmorph/ownerDies(gibbed, mob/living/owner)
	if(source)
		source.casterDeath(gibbed)

/datum/soullink/crystalmorph/sharerDies(gibbed, mob/living/sharer)
	if(source)
		source.shapeDeath(gibbed)

/obj/effect/proc_holder/spell/targeted/crystalmorph/lunarbeast
	name = "transform"
	desc = ""
	clothes_req = FALSE
	human_req = FALSE
	charge_max = 200
	cooldown_min = 50
	range = -1
	include_user = TRUE
	invocation = "RAAAAH!"
	invocation_type = "shout"
	action_icon_state = "shapeshift"
	req_items = list(/obj/item/lagomorphstone)
	chargetime = 5
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/talamoon


/obj/effect/proc_holder/spell/targeted/crystalmorph/dragon //for later just in case
	name = "Dragon Form"
	desc = ""
	invocation = "RAAAAAAAAWR!"
