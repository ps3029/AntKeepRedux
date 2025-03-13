/datum/advclass/skeleton
	name = "Undead"
	tutorial = "Even in death, you still serve! You retain fragments of your former life, but your memory withers with every waking moment.\
	You may have lived for eons, you may be freshly revived. However old you are, your connection to your former master has been severed, and you have been cursed to wander the plane of the living in this decrepit, decaying body."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = /datum/species/skeleton
	outfit = /datum/outfit/job/roguetown/skeleton
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_weird.ogg'

/datum/outfit/job/roguetown/bandit/skeleton/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Skeleton Gunner","Skeleton Pikeman", "Skeleton Standard Bearer")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Skeleton Gunner")
			H.set_blindness(0)
			to_chat(H, span_warning("A trained gunner from the Grenzer's untamed frontier, you would be expected to have cut your teeth in guerilla warfare. There once was a time where nothing lay between you and the southern heathens but an arquebus and a cartridge bag. But as the fighting comes to a close, it's time to take those marksmanship skills somewhere they're needed more."))
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
			beltl = /obj/item/ammo_holder/bullet
			backl = /obj/item/storage/backpack/rogue/satchel/
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/powderflask, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead, /obj/item/ammo_casing/caseless/lead)

		if("Skeleton Pikeman")
			H.set_blindness(0)
			to_chat(H, span_warning("A professional pikebearer. You once fought in close order with your polearm-wielding brethren, but a particularly disastrous push-of-the-pike decimated your ranks. It's time to rally your scattered breathren and form a new order in the image of your old company."))
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
			back = /obj/item/storage/bag
			backpack_contents = list(/obj/item/roguekey/mercenary)

		if("Skeleton Standard Bearer")
			H.set_blindness(0)
			to_chat(H, span_warning("Ack ack ack!"))
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
			r_hand = /obj/item/rogueweapon/spear/banner
			l_hand = /obj/item/signal_horn
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			back = /obj/item/storage/bag
			backpack_contents = list(/obj/item/roguekey/mercenary)

	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/flashlight/flare/torch
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	pants = /obj/item/clothing/under/roguetown/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/grenzelgloves
