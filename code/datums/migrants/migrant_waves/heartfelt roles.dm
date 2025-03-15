/datum/migrant_role/heartfelt/lord
	name = "Capitaine"
	greet_text = "We cannot stand by and watch this strip of defenceless land go unconquered. It is time to take to the duke's court and free his serfs. In the name of L'Empereur! For the republic!"
	outfit = /datum/outfit/job/roguetown/heartfelt/lord
	// allowed_patrons = ALL_REVOLUTIONARY_PATRONS
	allowed_sexes = list(MALE)
	allowed_races = list(\
		/datum/species/human/halfelf,\
		/datum/species/elf/dark,\
		/datum/species/elf/wood,\
	)

	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	

/datum/outfit/job/roguetown/heartfelt/lord/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/heartfelt
	armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/lord
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/rogueweapon/sword/long/marlin
	beltr = /obj/item/rogueweapon/huntingknife
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	backl = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	

/datum/migrant_role/heartfelt/hand
	name = "Sous-officier"
	greet_text = "En avant! Under our Capitaine we march! In the name of the republic!"
	outfit = /datum/outfit/job/roguetown/heartfelt/hand
	allowed_sexes = list(MALE)
	allowed_races = list(\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/demihuman,\
	/datum/species/human/northern,\
	)

	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/heartfelt/hand/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/hand
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	gloves =/obj/item/clothing/gloves/roguetown/angle
	beltl = /obj/item/rogueweapon/sword/sabre/dec
	beltr = /obj/item/rogueweapon/huntingknife
	backr = /obj/item/storage/backpack/rogue/satchel/heartfelt
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 3)
		H.change_stat("intelligence", 3)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)


/datum/migrant_role/heartfelt/knight
	name = "Line Infantry"
	greet_text = "You are a Knight of Heartfelt, once part of a brotherhood in service to your Lord. Now, alone and committed to safeguarding what remains of your court, you ride to the Peak, resolved to ensure their safe arrival."
	outfit = /datum/outfit/job/roguetown/heartfelt/knight
	allowed_races = list(\
		/datum/species/human/halfelf,\
		/datum/species/elf/dark,\
		/datum/species/elf/wood,\
		/datum/species/demihuman,\
		/datum/species/human/northern,\
	)
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/heartfelt/knight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	gloves = /obj/item/clothing/gloves/roguetown/plate
	pants = /obj/item/clothing/under/roguetown/platelegs
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	backr = /obj/item/ammo_holder/bullet
	beltl = /obj/item/flashlight/flare/torch/lantern
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/gun/ballistic/firearm/flintgonne

	backpack_contents = list(/obj/item/powderflask, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead)
	
	
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)


/datum/migrant_role/heartfelt/prior
	name = "Médecin-chef"
	greet_text = "The Prior of Heartfelt, you were destined for ascension within the Church, but fate intervened with the barony's downfall, delaying it indefinitely. Still guided by the blessings of Astrata, you journey to the Peak, determined to offer what aid and solace you can."
	outfit = /datum/outfit/job/roguetown/heartfelt/prior
	allowed_races = ALL_RACES_TYPES
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE

/datum/outfit/job/roguetown/heartfelt/prior/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/priest
	cloak = /obj/item/clothing/cloak/chasuble
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/needle/pestra = 1,
	)
	ADD_TRAIT(H, TRAIT_CHOSEN, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
