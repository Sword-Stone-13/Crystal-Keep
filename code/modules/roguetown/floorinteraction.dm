//Dirt decals were not targetable directly as of writing this. If they ever are, best move this to /obj/effect/decal/cleanable/coom/
/turf/open/floor/onbite(mob/user)	
	if(isliving(user))		
		var/mob/living/L = user		
		if(L.stat != CONSCIOUS)
			return		
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			if(!C.lying)
				return	
			if(C.is_mouth_covered())
				return
		return
	..()
