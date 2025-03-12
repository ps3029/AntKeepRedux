/datum/advclass/mercenary/grenzelhoft
	name = "Grenzer"
	tutorial = "A levée en masse soldier from the eastern diarchy. There once was a time where you fought for your life and the continuation of your kingdom against the southern heathens.\
	Now as the threat has withered and the empire can no longer sustain its massive conscript army, it's time for you to venture forth into that very frontier in search of greener pastures. There's nothing for you to go home back to anymore."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/mercenary/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Frontiersman","Landsturm")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Frontiersman")
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
			//H.mind.adjust_skillrank_up_to(/datum/skill/combat/firearms, 4, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 3) 
			H.change_stat("speed", 2)
			r_hand = /obj/item/gun/ballistic/firearm/arquebus
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			neck = /obj/item/ammo_holder/bullet
			backl = /obj/item/storage/backpack/rogue/satchel/
			backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/powderflask, /obj/item/ammo_casing/caseless/rogue/bullet, /obj/item/ammo_casing/caseless/rogue/bullet, /obj/item/ammo_casing/caseless/rogue/bullet)
			
			

		if("Landsturm")
			H.set_blindness(0)
			to_chat(H, span_warning("A professional pikebearer. You once fought in close order with your polearm-wielding brethren, but a particularly disastrous push-of-pike saw decimated your ranks. It's time to rally your scattered breathren and form a new order in the image of your old company."))
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

	

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
