/datum/advclass/mercenary/skeleton
	name = "Undead Mercenary"
	tutorial = "Even in death, you still serve! You retain fragments of your former life, but your memory withers with every waking moment.\
	You may have lived for eons, you may be freshly revived. However old you are, your connection to your former master has been severed, and you have been cursed to wander the plane of the living in this decrepit, decaying body."
	allowed_races = /datum/species/skeleton
	category_tags = list(CTAG_MERCENARY)
	outfit = /datum/outfit/job/roguetown/skeleton
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_weird.ogg'

/datum/outfit/job/roguetown/mercenary/skeleton/pre_equip(mob/living/carbon/human/H)
	..()

	H.adjust_blindness(-3)
	var/classes = list("Gunner","Spearman", "Standard Bearer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Gunner")
			H.set_blindness(0)
			to_chat(H, span_warning("Ackackackack!"))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE) // builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 3, TRUE) //Hearthstone change.
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 3) 
			H.change_stat("speed", 2)
			r_hand = /obj/item/gun/ballistic/firearm/arquebus
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			backr = /obj/item/ammo_holder/bullet
			backl = /obj/item/storage/backpack/rogue/satchel/
			shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
			head = /obj/item/clothing/head/roguetown/grenzelhofthat
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/powderflask, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead)

		if("Spearman")
			H.set_blindness(0)
			to_chat(H, span_warning("Ackackackack!"))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE) //Hearthstone change.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("perception", 1)
			r_hand = /obj/item/rogueweapon/spear/billhook
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			backl = /obj/item/storage/backpack/rogue/satchel/
			backpack_contents = list(/obj/item/roguekey/mercenary)

		if("Standard Bearer")
			H.set_blindness(0)
			to_chat(H, span_warning("Ackackackack!"))
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE) //Hearthstone change.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("perception", 1)
			r_hand = /obj/item/signal_horn/
			l_hand = /obj/item/rogueweapon/spear/banner/
			backl = /obj/item/storage/backpack/rogue/satchel/
			head = /obj/item/clothing/head/roguetown/helmet/bascinet
			armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
			backpack_contents = list(/obj/item/roguekey/mercenary)

			armor = /obj/item/clothing/suit/roguetown/armor/chainmail
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			head = /obj/item/clothing/head/roguetown/helmet/kettle
			pants = /obj/item/clothing/under/
