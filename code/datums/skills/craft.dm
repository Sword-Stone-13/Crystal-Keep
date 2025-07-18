/datum/skill/craft
	abstract_type = /datum/skill/craft
	name = "Craft"
	desc = ""
	dream_cost_base = 4          // Learning to craft should be more difficult than learning to fight, this is to incentivize craftsmen necessity. Ergo, make village roles less... useless
	dream_cost_per_level = 2
	dream_legendary_extra_cost = 1

/datum/skill/craft/crafting
	name = "Crafting"
	desc = ""
	dreams = list(
		"...you feel grass under you feet as you peer onto a meadow, you prepare a campfire and a tent and drift off into deeper slumber.."
	)

/datum/skill/craft/blacksmithing
	name = "Blacksmithing"

/datum/skill/craft/weaponsmithing
	name = "Weapon Smithing"

/datum/skill/craft/armorsmithing
	name = "Armor Smithing"

/datum/skill/craft/carpentry
	name = "Carpentry"

/datum/skill/craft/masonry
	name = "Masonry"

/datum/skill/craft/cooking
	name = "Cooking"

/datum/skill/craft/engineering
	name = "Engineering"

/datum/skill/craft/hunting
	name = "Hunting"
	desc = ""
	dreams = list(
		"...you feel the forest's embrace as you drift into dreams, visions of stalking prey and the thrill of the hunt filling your mind.."
	)

//CKEEP SKILLS

///Originally was gonna make a pair of weapon and armor smithing skills, but thought that'd be too tough to achieve a round. 
//So, instead, it's just general smithing, for now...
/datum/skill/craft/dwarfsmithing
	name = "Dwarvish Smithing"

/datum/skill/craft/koboldsmithing 
	name = "Kobold Smithing"
/* SOON
/datum/skill/craft/aweaving ///future items in plan///
	name = "Aasimar Weaving"
*/
/datum/skill/craft/jadesmithing
	name = "Jade Kingdom Smithing"


/datum/skill/craft/engravement
	name = "Engravement"
	desc = "The art of carving intricate designs and patterns into various materials."
	dreams = list(
		"...you feel the steady rhythm of your hammer and chisel as you carefully carve intricate patterns into metal and stone, each stroke bringing your vision to life..."
	)

