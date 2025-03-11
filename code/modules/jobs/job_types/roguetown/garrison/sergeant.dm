/datum/job/roguetown/sergeant
	title = "Sergeant"
	flag = SERGEANT
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_TYPES
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You are the most experienced of the Crown's Soldiery, leading the men-at-arms in maintaining order and attending to threats and crimes below the court's attention."
	display_order = JDO_SERGEANT
	whitelist_req = TRUE
	round_contrib_points = 3
	

	outfit = /datum/outfit/job/roguetown/sergeant

	give_bank_account = 50
	min_pq = 6
	max_pq = null
	cmode_music = 'sound/music/combat_guard2.ogg'



/datum/job/roguetown/sergeant/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "sergeant jupon ([index])"

/datum/outfit/job/roguetown/sergeant/pre_equip(mob/living/carbon/human/H)
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/keyring/guardcastle
	beltr = /obj/item/rogueweapon/mace/cudgel
	r_hand = /obj/item/rogueweapon/spear/billhook
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backr = /obj/item/storage/backpack/rogue/satchel/black
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale	
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	id = /obj/item/scomstone/garrison
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE) // We are basically identical to a regular MAA, except having better athletics to help us manage our order usage better
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		H.change_stat("strength", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/movemovemove)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/takeaim)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/onfeet)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/hold)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/focustarget)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/guard) // We'll just use Watchmen as sorta conscripts yeag?
		H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/proc/haltyell, /mob/living/carbon/human/mind/proc/setorders)

/obj/effect/proc_holder/spell/invoked/order
	name = ""
	range = 1
	associated_skill = /datum/skill/misc/athletics
	devotion_cost = 0
	chargedrain = 1
	chargetime = 15
	releasedrain = 80 // This is quite costy. Shouldn't be able to really spam them right off the cuff, combined with having to type out an order. Should prevent VERY occupied officers from ALSO ordering
	charge_max = 2 MINUTES
	miracle = FALSE
	sound = 'sound/magic/inspire_02.ogg'


/obj/effect/proc_holder/spell/invoked/order/movemovemove
	name = "Move! Move! Move!"
	overlay_state = "movemovemove"

/obj/effect/proc_holder/spell/invoked/order/movemovemove/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.movemovemovetext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(HAS_TRAIT(user, TRAIT_GUARDSMAN))
			if(!HAS_TRAIT(target, TRAIT_GUARDSMAN))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Guard Captain")
			if(!HAS_TRAIT(target, TRAIT_KNIGHTSMAN))
				to_chat(user, span_alert("I cannot order one not of my noble ranks!"))
				return		
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/movemovemove)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/buff/order/movemovemove/nextmove_modifier()
	return 0.85

/datum/status_effect/buff/order/movemovemove
	id = "movemovemove"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/movemovemove
	effectedstats = list("speed" = 5)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/movemovemove
	name = "Move! Move! Move!"
	desc = "My officer has ordered me to move quickly!"
	icon_state = "buff"

/datum/status_effect/buff/order/movemovemove/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to move!"))

/obj/effect/proc_holder/spell/invoked/order/takeaim
	name = "Take aim!"
	overlay_state = "takeaim"

/datum/status_effect/buff/order/takeaim
	id = "takeaim"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/takeaim
	effectedstats = list("perception" = 5)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/takeaim
	name = "Take aim!"
	desc = "My officer has ordered me to take aim!"
	icon_state = "buff"

/datum/status_effect/buff/order/takeaim/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to take aim!"))

/obj/effect/proc_holder/spell/invoked/order/takeaim/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.takeaimtext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(HAS_TRAIT(user, TRAIT_GUARDSMAN)) // If we are MAA, we need to order MAA. If we are GC, we need to order RG.
			if(!HAS_TRAIT(target, TRAIT_GUARDSMAN))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Guard Captain")
			if(!HAS_TRAIT(target, TRAIT_KNIGHTSMAN))
				to_chat(user, span_alert("I cannot order one not of my noble ranks!"))
				return
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/takeaim)
		return TRUE
	revert_cast()
	return FALSE



/obj/effect/proc_holder/spell/invoked/order/onfeet
	name = "On your feet!"
	overlay_state = "onfeet"

/obj/effect/proc_holder/spell/invoked/order/onfeet/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.onfeettext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(HAS_TRAIT(user, TRAIT_GUARDSMAN))
			if(!HAS_TRAIT(target, TRAIT_GUARDSMAN))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Guard Captain")
			if(!HAS_TRAIT(target, TRAIT_KNIGHTSMAN))
				to_chat(user, span_alert("I cannot order one not of my noble ranks!"))
				return
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/onfeet)
		if(!(target.mobility_flags & MOBILITY_STAND))
			target.SetUnconscious(0)
			target.SetSleeping(0)
			target.SetParalyzed(0)
			target.SetImmobilized(0)
			target.SetStun(0)
			target.SetKnockdown(0)
			target.set_resting(FALSE)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/buff/order/onfeet
	id = "onfeet"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/onfeet
	duration = 30 SECONDS

/atom/movable/screen/alert/status_effect/buff/order/onfeet
	name = "On your feet!"
	desc = "My officer has ordered me to my feet!"
	icon_state = "buff"

/datum/status_effect/buff/order/onfeet/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to my feet!"))
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/order/onfeet/on_remove()
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	. = ..()


/obj/effect/proc_holder/spell/invoked/order/hold
	name = "Hold!"
	overlay_state = "hold"


/obj/effect/proc_holder/spell/invoked/order/hold/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.holdtext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(HAS_TRAIT(user, TRAIT_GUARDSMAN)) // If we are MAA, we need to order MAA. If we are GC, we need to order RG.
			if(!HAS_TRAIT(target, TRAIT_GUARDSMAN))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Guard Captain")
			if(!HAS_TRAIT(target, TRAIT_KNIGHTSMAN))
				to_chat(user, span_alert("I cannot order one not of my noble ranks!"))
				return
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/hold)
		return TRUE
	revert_cast()
	return FALSE


/datum/status_effect/buff/order/hold
	id = "hold"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/takeaim
	effectedstats = list("endurance" = 2, "constitution" = 2)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/hold
	name = "Hold!"
	desc = "My officer has ordered me to hold!"
	icon_state = "buff"

/datum/status_effect/buff/order/hold/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to hold!"))

#define TARGET_FILTER "target_marked"

/obj/effect/proc_holder/spell/invoked/order/focustarget
	name = "Focus target!"
	overlay_state = "focustarget"


/obj/effect/proc_holder/spell/invoked/order/focustarget/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.focustargettext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(target == user)
			to_chat(user, span_alert("I cannot order myself to be killed!"))
			return
		if(HAS_TRAIT(target, TRAIT_CRITICAL_WEAKNESS))
			to_chat(user, span_alert("They are already vulnerable!"))
			return	
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/debuff/order/focustarget)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/debuff/order/focustarget
	id = "focustarget"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/order/focustarget
	effectedstats = list("fortune" = -2)
	duration = 1 MINUTES
	var/outline_colour = "#69050a"

/atom/movable/screen/alert/status_effect/debuff/order/focustarget
	name = "Targetted"
	desc = "A officer has marked me for death!"
	icon_state = "targetted"

/datum/status_effect/debuff/order/focustarget/on_apply()
	. = ..()
	var/filter = owner.get_filter(TARGET_FILTER)
	to_chat(owner, span_alert("I have been marked for death by a officer!"))
	ADD_TRAIT(owner, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	if (!filter)
		owner.add_filter(TARGET_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	return TRUE

/datum/status_effect/debuff/order/focustarget/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	owner.remove_filter(TARGET_FILTER)


/obj/effect/proc_holder/spell/invoked/order/focustarget
	name = "Focus target!"
	overlay_state = "focustarget"


#undef TARGET_FILTER


/mob/living/carbon/human/mind/proc/setorders()
	set name = "Rehearse Orders"
	set category = "Voice of Command"
	mind.movemovemovetext = input("Send a message.", "Move! Move! Move!") as text|null
	if(!mind.movemovemovetext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.holdtext = input("Send a message.", "Hold!") as text|null
	if(!mind.holdtext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.takeaimtext = input("Send a message.", "Take aim!") as text|null
	if(!mind.takeaimtext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.onfeettext = input("Send a message.", "On your feet!") as text|null
	if(!mind.onfeettext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.focustargettext = input("Send a message.", "Focus Target!") as text|null
	if(!mind.focustargettext)
		to_chat(src, "I must rehearse something for this order...")
		return
