////ENVOYS
//House Heart
/datum/migrant_wave/whitehouse
	name = "Church Visit"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_down_one
	roles = list(
		/datum/migrant_role/whitehouse/cardinal = 1,
		/datum/migrant_role/whitehouse/knight = 1,
		/datum/migrant_role/whitehouse/witch = 1
	)
	greet_text = "A church from one of the further towns has sent an envoy to the Crystal Keep to review the state of either the church, people, or both."

/datum/migrant_wave/whitehouse_down_one
	name = "Church Visit"
	shared_wave_type = /datum/migrant_wave/whitehouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_down_two
	roles = list(
		/datum/migrant_role/whitehouse/cardinal = 1,
		/datum/migrant_role/whitehouse/knight = 1
	)
	greet_text = "A church from one of the further towns has sent an envoy to the Crystal Keep to review the state of either the church, people, or both."

/datum/migrant_wave/whitehouse_down_two
	name = "Church Visit"
	shared_wave_type = /datum/migrant_wave/whitehouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/whitehouse/cardinal = 1
	)
	greet_text = "A church from one of the further towns has sent an envoy to the Crystal Keep to review the state of either the church, people, or both."

///House Hand///

/datum/migrant_wave/blackhouse
	name = "Royal Visit"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_down_one
	roles = list(
		/datum/migrant_role/blackhouse/duke = 1,
		/datum/migrant_role/blackhouse/knight = 1,
		/datum/migrant_role/blackhouse/witch = 1
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king."

/datum/migrant_wave/blackhouse_down_one
	name = "Royal Visit"
	shared_wave_type = /datum/migrant_wave/blackhouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_down_two
	roles = list(
		/datum/migrant_role/blackhouse/duke = 1,
		/datum/migrant_role/blackhouse/knight = 1
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king."

/datum/migrant_wave/blackhouse_down_two
	name = "Royal Visit"
	shared_wave_type = /datum/migrant_wave/blackhouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/blackhouse/duke = 1,
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king. Their retainer was somehow lost on the way."

//House Echarus 

/datum/migrant_wave/greenhouse
	name = "Guild Visit"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_down_one
	roles = list(
		/datum/migrant_role/greenhouse/guildofficer = 1,
		/datum/migrant_role/greenhouse/knight = 1,
		/datum/migrant_role/greenhouse/witch = 1
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king."

/datum/migrant_wave/greenhouse_down_one
	name = "Guild Visit"
	shared_wave_type = /datum/migrant_wave/greenhouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_down_two
	roles = list(
		/datum/migrant_role/greenhouse/guildofficer = 1,
		/datum/migrant_role/greenhouse/knight = 1
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king."

/datum/migrant_wave/greenhouse_down_two
	name = "Guild Visit"
	shared_wave_type = /datum/migrant_wave/greenhouse
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/greenhouse/guildofficer = 1,
	)
	greet_text = "One of the King's siblings, a duke or duchess, has come to visit the king."


////REINFORCEMENTS////
//White house
/datum/migrant_wave/whitehouse_reinforcements
	name = "Church Reinforcements"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_reinforcements_down_one
	roles = list(
		/datum/migrant_role/whitehouse/knight = 3,
		/datum/migrant_role/whitehouse/warrior = 6
	)
	greet_text = "The foreign church has sent reinforcements to Crystal Keep!"

/datum/migrant_wave/whitehouse_reinforcements_down_one
	name = "Church Reinforcements"
	shared_wave_type = /datum/migrant_wave/whitehouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_reinforcements_down_two
	roles = list(
		/datum/migrant_role/whitehouse/knight = 3,
		/datum/migrant_role/whitehouse/warrior = 4
	)
	greet_text = "The foreign church has sent reinforcements to Crystal Keep!"

/datum/migrant_wave/whitehouse_reinforcements_down_two
	name = "Church Reinforcements"
	shared_wave_type = /datum/migrant_wave/whitehouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_reinforcements_down_three
	roles = list(
		/datum/migrant_role/whitehouse/knight = 2,
		/datum/migrant_role/whitehouse/warrior = 4
	)
	greet_text = "The foreign church has sent reinforcements to Crystal Keep!"


/datum/migrant_wave/whitehouse_reinforcements_down_three
	name = "Church Reinforcements"
	shared_wave_type = /datum/migrant_wave/whitehouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/whitehouse_reinforcements_down_four
	roles = list(
		/datum/migrant_role/whitehouse/knight = 1,
		/datum/migrant_role/whitehouse/warrior = 2
	)
	greet_text = "The foreign church has sent reinforcements to Crystal Keep!"

/datum/migrant_wave/whitehouse_reinforcements_down_four
	name = "Church Reinforcements"
	shared_wave_type = /datum/migrant_wave/whitehouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/whitehouse/knight = 1
	)
	greet_text = "The foreign church has sent a knight to Crystal Keep!"

//black house 


/datum/migrant_wave/blackhouse_reinforcements
	name = "Court Reinforcements"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_reinforcements_down_one
	roles = list(
		/datum/migrant_role/blackhouse/knight = 3,
		/datum/migrant_role/blackhouse/warrior = 6
	)
	greet_text = "The hand has sent for reinforcements from a nearby fortress!"

/datum/migrant_wave/blackhouse_reinforcements_down_one
	name = "Court Reinforcements"
	shared_wave_type = /datum/migrant_wave/blackhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_reinforcements_down_two
	roles = list(
		/datum/migrant_role/blackhouse/knight = 3,
		/datum/migrant_role/blackhouse/warrior = 4
	)
	greet_text = "The hand has sent for reinforcements from a nearby fortress!"

/datum/migrant_wave/blackhouse_reinforcements_down_two
	name = "Court Reinforcements"
	shared_wave_type = /datum/migrant_wave/blackhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_reinforcements_down_three
	roles = list(
		/datum/migrant_role/blackhouse/knight = 2,
		/datum/migrant_role/blackhouse/warrior = 4
	)
	greet_text = "The hand has sent for reinforcements from a nearby fortress!"


/datum/migrant_wave/blackhouse_reinforcements_down_three
	name = "Court Reinforcements"
	shared_wave_type = /datum/migrant_wave/blackhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/blackhouse_reinforcements_down_four
	roles = list(
		/datum/migrant_role/blackhouse/knight = 1,
		/datum/migrant_role/blackhouse/warrior = 2
	)
	greet_text = "The hand has sent for reinforcements from a nearby fortress!"

/datum/migrant_wave/blackhouse_reinforcements_down_four
	name = "Court Reinforcements"
	shared_wave_type = /datum/migrant_wave/blackhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/blackhouse/knight = 1
	)
	greet_text = "The hand's letter was intercepted, but a lone knight has come to help!"



//green house 


/datum/migrant_wave/greenhouse_reinforcements
	name = "Guild Reinforcements"
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_reinforcements_down_one
	roles = list(
		/datum/migrant_role/greenhouse/knight = 3,
		/datum/migrant_role/greenhouse/warrior = 6
	)
	greet_text = "The guild has sent reinforcements to assist the envoy and travellers!"

/datum/migrant_wave/greenhouse_reinforcements_down_one
	name = "Guild Reinforcements"
	shared_wave_type = /datum/migrant_wave/greenhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_reinforcements_down_two
	roles = list(
		/datum/migrant_role/greenhouse/knight = 3,
		/datum/migrant_role/greenhouse/warrior = 4
	)
	greet_text = "The guild has sent reinforcements to assist the envoy and travellers!"

/datum/migrant_wave/greenhouse_reinforcements_down_two
	name = "Guild Reinforcements"
	shared_wave_type = /datum/migrant_wave/greenhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_reinforcements_down_three
	roles = list(
		/datum/migrant_role/greenhouse/knight = 2,
		/datum/migrant_role/greenhouse/warrior = 4
	)
	greet_text = "The guild has sent reinforcements to assist the envoy and travellers!"


/datum/migrant_wave/greenhouse_reinforcements_down_three
	name = "Guild Reinforcements"
	shared_wave_type = /datum/migrant_wave/greenhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/greenhouse_reinforcements_down_four
	roles = list(
		/datum/migrant_role/greenhouse/knight = 1,
		/datum/migrant_role/greenhouse/warrior = 2
	)
	greet_text = "The guild has sent reinforcements to assist the envoy and travellers!"

/datum/migrant_wave/greenhouse_reinforcements_down_four
	name = "Guild Reinforcements"
	shared_wave_type = /datum/migrant_wave/greenhouse_reinforcements
	max_spawns = 1
	weight = 60
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/greenhouse/knight = 1
	)
	greet_text = "A single knight has come across the call for help from Crystal Keep."

