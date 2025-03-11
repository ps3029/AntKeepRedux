/datum/advclass/mercenary/steppesman
	name = "Bogatyr"
	tutorial = "You come from the land of the Zimicjugites, the land of salt-wedge estuaries and vast steppes. Of bogatyrs, cossacks and glazniki. Scorned knight-errants and serfs escape the tyranny of their landlords, with secret police and bounty hunters hot on their tails. Perhaps a spear-milita or defector in search of greener pastures. Or an opportunistic glazniki willing to lease your skills of tracking to the highest bidder."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/mercenary/steppesman
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'sound/music/combat_steppe.ogg'



/datum/outfit/job/roguetown/mercenary/steppesman/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Steppesman","Glazniki")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Steppesman")
			H.set_blindness(0)
			to_chat(H, span_warning("Bogatyrs, cossacks and escaped serfs. Newly freedmen of all sorts who fled to the Duchy of Kasan to escape the tyranny of the Zimicjugites. Most commonly lowborn, but the occasional scorned noble of the robe or military defector is not unheard of."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2 , TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE) // builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE)
			H.change_stat("perception", 2)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)

			r_hand = /obj/item/rogueweapon/spear
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor


		if("Glazniki")
			H.set_blindness(0)
			to_chat(H, span_warning("Depending on you ask, the Glazniki are considered foreign agitators, spies, secret policemen or bounty hunters. You come - willingly or not - from the land of the Zimicjugites to carry out some or all of these duties.\
			If you didn't come alone and of your own accord, it's likely you were contracted by some Zimicjugite landlord to track down escaped serfs and see that they face justice."))

			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2 , TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE) // builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE) //builders
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE)
			H.change_stat("perception", 2)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)
			ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)

			
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			r_hand = /obj/item/rogueweapon/sword/sabre




	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	head = /obj/item/clothing/head/roguetown/papakha
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/rogueweapon/huntingknife
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	backr = /obj/item/storage/backpack/rogue/satchel

	backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/storage/belt/rogue/pouch/coins/poor)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)			//No medium armor, use light armors.
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)	//Since Desert Rider gets medium armor and dodge expert, and you don't, here. Stronk now.
