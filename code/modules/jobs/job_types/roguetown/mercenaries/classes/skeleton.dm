/datum/advclass/mercenary/skeleton
	name = "Undead Mercenary"
	tutorial = "Even in death, you still serve! You retain fragments of your former life, but your memory withers with every waking moment.\
	You may have lived for eons, you may be freshly revived. However old you are, your connection to your former master has been severed, and you have been cursed to wander the plane of the living in this decrepit, decaying body."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = /datum/species/skeleton
	outfit = /datum/outfit/job/roguetown/skeleton
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_weird.ogg'

/datum/outfit/job/roguetown/mercenary/skeleton/pre_equip(mob/living/carbon/human/H)
	..()

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
		l_hand = /obj/item/rogueweapon/spear/banner/
		backl = /obj/item/storage/backpack/rogue/satchel/
		head = /obj/item/clothing/head/roguetown/helmet/kettle
		armor = /obj/item/clothing/suit/roguetown/armor/cuirass/INITIAL_ROUND_TIMER
		wrists = /obj/item/clothing/wrists/roguetown/bracers
		belt = /obj/item/storage/belt/rogue/leather
		shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		pants = /obj/item/clothing/under/roguetown/chainlegs
		backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/signal_horn/)
