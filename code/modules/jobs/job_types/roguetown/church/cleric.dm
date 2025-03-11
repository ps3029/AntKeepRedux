//shield
/datum/advclass/cleric
	name = "Cleric"
	tutorial = "Disciples of the divine - clerics are blessed with the power of miracles from the gods themselves."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_TYPES
	traits_applied = list(TRAIT_OUTLANDER)
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Monk", "Paladin", "Missionary", "Cantor")

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_DIVINE_PATRONS


/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Monk","Paladin","Cantor","Missionary")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Monk")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a wandering acolyte, versed in both miracles and martial arts. You forego the heavy armor paladins wear in favor of a more nimble approach to combat, utilizing your fists."))
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			gloves = /obj/item/clothing/gloves/roguetown/chain
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			switch(H.patron?.type)
				if(/datum/patron/sects_psydonistismianism/psydon)
					cloak = /obj/item/clothing/cloak/psydontabard
					head = /obj/item/clothing/head/roguetown/roguehood/psydon
				else
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
					head = /obj/item/clothing/head/roguetown/roguehood
			H.cmode_music = 'sound/music/combat_holy.ogg'
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.change_stat("perception", -1)
			H.change_stat("intelligence", -1)

		if("Paladin")
			to_chat(H, span_warning("A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade."))
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/tower
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/chain
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.cmode_music = 'sound/music/combat_holy.ogg'
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			switch(H.patron?.type)
				if(/datum/patron/sects_psydonistismianism/psydon)
					cloak = /obj/item/clothing/cloak/psydontabard
				else
					cloak = /obj/item/clothing/cloak/cape/crusader
					head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
			H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			var/weapons = list("Bastard Sword","Mace","Flail")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Bastard Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltr = /obj/item/rogueweapon/sword/long
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Flail")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltr = /obj/item/rogueweapon/flail
			H.set_blindness(0)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)

		if("Cantor")
			H.set_blindness(0)
			to_chat(H, span_warning("You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness."))
			head = /obj/item/clothing/head/roguetown/bardhat
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/special
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_templar(H)
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_bard.ogg'
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
			switch(H.patron?.type)
				if(/datum/patron/sects_psydonistismianism/psydon)
					cloak = /obj/item/clothing/cloak/templar/psydon
				else
					cloak = /obj/item/clothing/cloak/cape/crusader
			var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
			var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Harp")
					backr = /obj/item/rogue/instrument/harp
				if("Lute")
					backr = /obj/item/rogue/instrument/lute
				if("Accordion")
					backr = /obj/item/rogue/instrument/accord
				if("Guitar")
					backr = /obj/item/rogue/instrument/guitar
				if("Hurdy-Gurdy")
					backr = /obj/item/rogue/instrument/hurdygurdy
				if("Viola")
					backr = /obj/item/rogue/instrument/viola
				if("Vocal Talisman")
					backr = /obj/item/rogue/instrument/vocals

		if("Missionary")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith."))
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			backr = /obj/item/rogueweapon/woodstaff
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.cmode_music = 'sound/music/combat_holy.ogg'
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)
			switch(H.patron?.type)
				if(/datum/patron/sects_psydonistismianism/psydon)
					cloak = /obj/item/clothing/cloak/psydontabard
					head = /obj/item/clothing/head/roguetown/roguehood/psydon
				else
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
					head = /obj/item/clothing/head/roguetown/roguehood
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells(H)
			START_PROCESSING(SSobj, C)

	switch(H.patron?.type)
		if(/datum/patron/sects_psydonistismianism/psydon)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/heathenry/zizo)
			H.cmode_music = 'sound/music/combat_cult.ogg'
			neck = /obj/item/roguekey/inhumen
		if(/datum/patron/sects_psydonistismianism/sectarian) // Random pricross for seccos
			var/list/psicross_options = list(
			/obj/item/clothing/neck/roguetown/psicross,
			/obj/item/clothing/neck/roguetown/psicross/astrata,
			/obj/item/clothing/neck/roguetown/psicross/noc,
			/obj/item/clothing/neck/roguetown/psicross/abyssor,
			/obj/item/clothing/neck/roguetown/psicross/dendor,
			/obj/item/clothing/neck/roguetown/psicross/necra,
			/obj/item/clothing/neck/roguetown/psicross/pestra,
			/obj/item/clothing/neck/roguetown/psicross/ravox,
			/obj/item/clothing/neck/roguetown/psicross/malum,
			/obj/item/clothing/neck/roguetown/psicross/eora
			)
			neck = pick(psicross_options)

	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
