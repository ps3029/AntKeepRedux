/datum/job/roguetown/knavewench // The most aggressively rude name yet.
	title = "Tapster"
	f_title = "Tapster"
	flag = KNAVEWENCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_races = ALL_RACES_TYPES
	tutorial = "You have a simple role at the Officer's Reprieve; please. You wait tables and help guests, clean the rooms, grow and brew more drink, and assist in the kitchens as need be. Bring a smile to the masses--and those cheapsake townsfolk and adventures might just give you an extra coin...assuming you've not already pilfered their pouch while they're in a drunken stupor off your latest brew."

	outfit = /datum/outfit/job/roguetown/knavewench
	display_order = JDO_KNAVEWENCH
	give_bank_account = 10
	min_pq = -10
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/knavewench/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
		if(H.age == AGE_MIDDLEAGED)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/roguekey/tavern
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/apron/waist
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		pants = /obj/item/clothing/under/roguetown/tights/black
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", 1) //5 points (weighted)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)
