
/obj/effect/landmark/mapGenerator/rogue/mountain
	mapGeneratorType = /datum/mapGenerator/mtn
	endTurfX = 177//255
	endTurfY = 126//255
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/mtn
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/mtn)

/datum/mapGeneratorModule/mtn
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/roguerock=5,/obj/item/natural/stone = 18,/obj/item/natural/rock = 10, /obj/item/reagent_containers/food/snacks/grown/plumphelmet = 4, /obj/item/reagent_containers/food/snacks/grown/trippy = 1, /obj/item/reagent_containers/food/snacks/grown/amanita = 1)
	allowed_areas = list(/area/rogue/outdoors/mountains,/area/rogue/outdoors/mountains/deception)
