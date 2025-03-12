/datum/job/roguetown/guardsman
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE)
	allowed_races = RACES_RESPECTED
	allowed_patrons = ALL_DIVINE_PATRONS_EXTENDED
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "A local yokel belonging to the town levy. Usually an unpaid old cobber doing his duty for the crown when work and pay is short. Your job is to maintain order within the town using whatever methods you see fit, but be sure not to invoke the Duke's ire! When duty calls, his authority may extend to the keep and the rural outskirts and boroughs."
	display_order = JDO_TOWNGUARD
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/guardsman
	give_bank_account = 16
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_guard.ogg'


/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/outfit/job/roguetown/guardsman
	name = "Watchman"
	/// Whether or not we are a bowman
	var/is_bowman = FALSE

/datum/outfit/job/roguetown/guardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	pants = /obj/item/clothing/under/roguetown/trou
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/storage/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	backr = /obj/item/storage/backpack/rogue/satchel
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1, /obj/item/signal_horn = 1)
	if(is_bowman)
		backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
		beltr = /obj/item/quiver/arrows //replaces mace
		pants = /obj/item/clothing/under/roguetown/brayette //replaces chausses
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	else
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
		backl = null
	if(H.mind)
		assign_skills(H)
	H.verbs |= /mob/proc/haltyell

/datum/outfit/job/roguetown/guardsman/proc/assign_skills(mob/living/carbon/human/guard)
	guard.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	guard.change_stat("strength", 2)
	guard.change_stat("constitution", 1)
	guard.change_stat("endurance", 1)
	guard.change_stat("speed", 1)
	r_hand = /obj/item/rogueweapon/mace/goden

/datum/outfit/job/roguetown/guardsman/bowman
	name = "Watchman Archer"
	is_bowman = TRUE

/datum/outfit/job/roguetown/guardsman/bowman/assign_skills(mob/living/carbon/human/guard)
	guard.mind.adjust_skillrank(/datum/skill/combat/bows, 5, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	guard.change_stat("perception", 3)
	guard.change_stat("constitution", 1)
	guard.change_stat("speed", 2)

