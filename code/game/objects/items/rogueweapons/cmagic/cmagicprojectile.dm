/obj/projectile/magic/firebolt
	name = "bolt of fire"
	icon_state = "pulse0"
	damage_type = BURN
	damage = 10
	nodamage = FALSE
	armor_penetration = 0
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2
	temperature = 350



/obj/projectile/magic/frostbite
	name = "frostbite"
	icon_state = "energy"
	damage = 6
	stamina = 10
	damage_multiplier = 1.5
	damage_type = BURN
	nodamage = FALSE
	armor_penetration = 0
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2
	temperature = 50


/obj/projectile/magic/lightning
	name = "lightning"
	icon_state = "energy"
	damage = 5
	stamina = 10
	damage_multiplier = 2
	damage_type = BURN
	nodamage = FALSE
	armor_penetration = 0
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2

/obj/projectile/magic/crystalpeep
	name = "Crystal Needle"
	icon_state = "energy"
	damage = 5
	damage_multiplier = 2
	damage_type = BRUTE
	nodamage = FALSE
	armor_penetration = 20
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 0.8

/obj/projectile/magic/divine_flame
	name = "Divine Flame"
	icon_state = "pulse0"
	damage = 15
	damage_type = BURN
	nodamage = FALSE
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 1.5
	temperature = 450

/obj/projectile/magic/crystalspear
	name = "Crystal Spear"
	icon_state = "energy"
	damage = 20
	damage_multiplier = 2
	damage_type = BRUTE
	nodamage = FALSE
	armor_penetration = 30
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 1.0
