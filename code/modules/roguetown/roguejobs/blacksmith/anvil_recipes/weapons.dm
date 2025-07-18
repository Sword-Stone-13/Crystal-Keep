/datum/anvil_recipe/weapons
	i_type = "Weapons"
/datum/anvil_recipe/ammo
	i_type = "Ammo"

/datum/anvil_recipe/weapons
	appro_skill = /datum/skill/craft/weaponsmithing  // inheritance yay !!
	craftdiff = 1
//CKEEP MOMENT
/datum/anvil_recipe/weapons/iron
	appro_skill = /datum/skill/craft/weaponsmithing
	craftdiff = 1

/datum/anvil_recipe/weapons/steel
	appro_skill = /datum/skill/craft/weaponsmithing 
	craftdiff = 1

/datum/anvil_recipe/weapons/bluesteel
	appro_skill = /datum/skill/craft/dwarfsmithing 
	craftdiff = 4

/datum/anvil_recipe/weapons/redsteel
	appro_skill = /datum/skill/craft/koboldsmithing 
	craftdiff = 4

/// IRON WEAPONS

/datum/anvil_recipe/weapons/iron/sword
	name = "Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron

/datum/anvil_recipe/weapons/iron/swordshort
	name = "Short sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/short

/datum/anvil_recipe/weapons/iron/messer
	name = "Messer"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/messer

/datum/anvil_recipe/weapons/iron/dagger
	name = "Dagger"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/idagger

/datum/anvil_recipe/weapons/iron/flail
	name = "Flail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/flail

/datum/anvil_recipe/weapons/iron/huntingknife
	name = "Hunting knife"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife

/datum/anvil_recipe/weapons/iron/axe
	name = "Axe (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/cudgel
	name = "Cudgel (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/cudgel
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/mace
	name = "Mace (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/spear
	name = "Spear (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/bardiche
	name = "Bardiche (+ iron) (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/axe
	name = "Axe (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut

/datum/anvil_recipe/weapons/iron/mace
	name = "Mace (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace

/datum/anvil_recipe/weapons/iron/warhammer
	name = "Warhammer (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/warhammer

/datum/anvil_recipe/weapons/iron/polemace
	name = "Warclub (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden

/// STEEL

/datum/anvil_recipe/weapons/steel/messer
	name = "Messer"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/iron/messer/steel

/datum/anvil_recipe/weapons/iron/dagger
	name = "Dagger"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel

/datum/anvil_recipe/weapons/steel/flail
	name = "Flail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/flail/sflail

/datum/anvil_recipe/weapons/steel/sword
	name = "Sword"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword

/datum/anvil_recipe/weapons/steel/swordshort
	name = "Arming Sword"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short

/datum/anvil_recipe/weapons/steel/saber
	name = "Sabre"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre

/datum/anvil_recipe/weapons/steel/rapier
	name = "Rapier"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/rapier

/datum/anvil_recipe/weapons/steel/cutlass
	name = "Cutlass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/cutlass

/datum/anvil_recipe/weapons/steel/katar
	name = "Katar"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/katar

/datum/anvil_recipe/weapons/steel/cleaver
	name = "Cleaver"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/cleaver

/datum/anvil_recipe/weapons/steel/combatknife
	name = "Combat Knife"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/cleaver/combat
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/bastardsword
	name = "Bastard Sword (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/battleaxe
	name = "Battle Axe (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/stoneaxe/battle
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/mace
	name = "Mace (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/warhammer
	name = "Warhammer (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/warhammer/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/langesmesser
	name = "Langesmesser (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/rider/messer
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/estoc
	name = "Estoc (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/estoc
	craftdiff = 4

/datum/anvil_recipe/weapons/steel/zweihander
	name = "Zweihander (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword/zwei
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/greatsword
	name = "Greatsword (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/lucerne
	name = "Lucerne (+ Steel) (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak/lucerne
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/billhook
	name = "Billhook (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/billhook

/datum/anvil_recipe/weapons/steel/axe
	name = "Axe (+1 Stick)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut/steel

/datum/anvil_recipe/weapons/steel/halberd
	name = "Halberd (+1 Steel) (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/eaglebeak
	name = "Eagle's Beak (+1 Steel) (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/grandmace
	name = "Grand Mace (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel

/datum/anvil_recipe/weapons/steel/execution
	name = "Execution Sword (+ 1 Steel, + 1 Iron)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/exe

/// SILVER 

/datum/anvil_recipe/weapons/silver/dagger
	name = "Dagger"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver

/datum/anvil_recipe/weapons/silver/elfsaber
	name = "Elvish Saber"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/silver)
	created_item = /obj/item/rogueweapon/sword/silver/sabre/elf
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/elfdagger
	name = "Elvish Dagger"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	craftdiff = 3

//GOLD

/datum/anvil_recipe/weapons/decsword
	name = "Decorated Sword (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 2

/datum/anvil_recipe/weapons/decsword
	name = "Decorated Sword (+1 Steel Sword)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 2

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated Sabre (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated Sabre (+1 Steel Sabre)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword/sabre)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated Rapier (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated Rapier (+1 Steel Rapier)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword/rapier)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/terminus
	name = "Terminus Est (+1 Gold Bar, +1 Steel, +1 Rontz)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/ingot/gold, /obj/item/ingot/steel, /obj/item/roguegem)	
	created_item = /obj/item/rogueweapon/sword/long/exe/cloth
	craftdiff = 3

// BRONZE

/datum/anvil_recipe/weapons/gladius
	name = "Gladius"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/rogueweapon/sword/gladius
	craftdiff = 2

/datum/anvil_recipe/weapons/bronze/spear
	name = "Bronze Spear (+1 Bronze, +1 Small Log)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/bronze
	craftdiff = 0


/// SHIELDS
/datum/anvil_recipe/weapons/steel/kiteshield
	name = "Heraldic Shield (+1 Steel +1 Hide)"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide/cured)
	created_item = /obj/item/rogueweapon/shield/tower/metal
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/towershield
	name = "Tower Shield (+1 Small Log)"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/shield/tower

/datum/anvil_recipe/weapons/steel/buckler
	name = "Buckler Shield"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/shield/buckler
	craftdiff = 3

//DWARVEN BLUESTEEL
/datum/anvil_recipe/weapons/bluesteel/axe
	name = "Kobold Splitter"
	req_bar = /obj/item/ingot/bluesteel
	additional_items = list(/obj/item/natural/hide/cured) //dwarves usually won't sully their weapons with non metal materials, usually
	created_item = /obj/item/rogueweapon/stoneaxe/battle/bluesteel/childsize


/datum/anvil_recipe/weapons/bluesteel/battleaxe
	name = "King's Arxe"
	req_bar = /obj/item/ingot/bluesteel
	additional_items = list(/obj/item/ingot/bluesteel, /obj/item/ingot/bluesteel)
	created_item = /obj/item/rogueweapon/stoneaxe/battle/bluesteel 
	craftdiff = 5

/datum/anvil_recipe/weapons/bluesteel/pick
	name = "Demon Piercer"
	req_bar = /obj/item/ingot/bluesteel
	additional_items = list(/obj/item/ingot/bluesteel)//TO DO: MAKE THIS ITEM THE TITULAR DWARF WEAPON
	created_item = /obj/item/rogueweapon/pick/bluesteel 
	craftdiff = 5

/datum/anvil_recipe/weapons/bluesteel/huntingknife
	name = "Stone Chipper"
	req_bar = /obj/item/ingot/bluesteel
	created_item = /obj/item/rogueweapon/huntingknife/cleaver/bluesteel

/datum/anvil_recipe/weapons/bluesteel/ammunition/bolts
	name = "Crossbow Bolts 3x"
	req_bar = /obj/item/ingot/bluesteel
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bolt/bluesteel, /obj/item/ammo_casing/caseless/rogue/bolt/bluesteel, /obj/item/ammo_casing/caseless/rogue/bolt/bluesteel)
	craftdiff = 3

//SHIELDS

/datum/anvil_recipe/weapons/bluesteel/towershield
	name = "Lava Blocker"
	req_bar = /obj/item/ingot/bluesteel
	additional_items = list(/obj/item/ingot/bluesteel)
	created_item = /obj/item/rogueweapon/shield/tower/bluesteel


//KOBOLD REDSTEEL
/datum/anvil_recipe/weapons/redsteel/shortsword
	name = "Long Claw"
	req_bar = /obj/item/ingot/redsteel
	created_item = /obj/item/rogueweapon/sword/short/redsteel

/datum/anvil_recipe/weapons/redsteel/halberd
	name = "Dragon Tooth"
	req_bar = /obj/item/ingot/redsteel
	additional_items = list(/obj/item/ingot/redsteel)
	created_item = /obj/item/rogueweapon/halberd/redsteel //TO DO: TITULAR KOBOLD SPEAR
	craftdiff = 5

/datum/anvil_recipe/weapons/redsteel/huntingknife
	name = "Wyrm Fangs"
	req_bar = /obj/item/ingot/redsteel
	created_item = list(/obj/item/rogueweapon/huntingknife/idagger/redsteel, /obj/item/rogueweapon/huntingknife/idagger/redsteel, /obj/item/rogueweapon/huntingknife/idagger/redsteel)

/datum/anvil_recipe/weapons/redsteel/ammunition/bolts
	name = "Crossbow Bolts 6x"
	req_bar = /obj/item/ingot/redsteel
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bolt/redsteel, /obj/item/ammo_casing/caseless/rogue/bolt/redsteel, /obj/item/ammo_casing/caseless/rogue/bolt/redsteel, /obj/item/ammo_casing/caseless/rogue/bolt/redsteel, /obj/item/ammo_casing/caseless/rogue/bolt/redsteel, /obj/item/ammo_casing/caseless/rogue/bolt/redsteel)
	craftdiff = 3


	//SHIELDS

/datum/anvil_recipe/weapons/redsteel/buckler
	name = "Arm Scale"
	req_bar = /obj/item/ingot/redsteel
	additional_items = list(/obj/item/ingot/redsteel)
	created_item = /obj/item/rogueweapon/shield/buckler/redsteel

///JADE KINGDOM

/datum/anvil_recipe/weapons/steel/katana
	name = "Katana"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/katana
	craftdiff = 3
	appro_skill = /datum/skill/craft/jadesmithing 

/datum/anvil_recipe/weapons/steel/naginata
	name = "naginata"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/glaive/naginata 
	craftdiff = 3
	appro_skill = /datum/skill/craft/jadesmithing 

///Crystal Keep///
//Some doofus decided to make ammunition crafting artificier only....HUH?
/datum/anvil_recipe/weapons/ammunition/bolts
	name = "Iron Crossbow Bolts 3x (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bolt, /obj/item/ammo_casing/caseless/rogue/bolt, /obj/item/ammo_casing/caseless/rogue/bolt)
	craftdiff = 2

/datum/anvil_recipe/weapons/ammunition/bolts
	name = "Steel Crossbow Bolts 3x (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bolt/steel, /obj/item/ammo_casing/caseless/rogue/bolt/steel, /obj/item/ammo_casing/caseless/rogue/bolt/steel)
	craftdiff = 2

/datum/anvil_recipe/weapons/ammunition/arrows
	name = "Iron Arrows 5x (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/arrow)
	craftdiff = 2

/datum/anvil_recipe/weapons/ammunition/arrows/steel
	name = "Steel Arrows 5x (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/arrow/steel, /obj/item/ammo_casing/caseless/rogue/arrow/steel, /obj/item/ammo_casing/caseless/rogue/arrow/steel, /obj/item/ammo_casing/caseless/rogue/arrow/steel, /obj/item/ammo_casing/caseless/rogue/arrow/steel)
	craftdiff = 2

/// Great Arrows///

/datum/anvil_recipe/weapons/ammunition/greatarrow
	name = "Iron Greatarrow (+1 Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/greatarrow)
	craftdiff = 4

/datum/anvil_recipe/weapons/ammunition/greatarrow/steel
	name = "Steel Greatarrow (+1 Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree)
	created_item = list(/obj/item/ammo_casing/caseless/rogue/greatarrow)
	craftdiff = 4
