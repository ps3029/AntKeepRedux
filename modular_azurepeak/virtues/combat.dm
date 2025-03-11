/datum/virtue/combat/magical_potential
	name = "Arcyne Potential"
	desc = "I grasped the basics of arcyne magic at an early age, and have been able to prestidigitate for as long as I can remember. Combat-oriented classes get a weaker version of this virtue."
	added_skills = list(/datum/skill/magic/arcane = 1)

/datum/virtue/combat/magical_potential/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) // we can do this because apply_to is always called first
		recipient.mind?.adjust_spellpoints(-4) // Limits skill gain through for non-initial arcynes
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	else
		if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT))
			recipient.mind?.adjust_spellpoints(1) // 1 extra spellpoint if you're already arcane
		else
			recipient.mind?.adjust_spellpoints(2) // This lessons the -6 that applies to martial classes by default (currently only pontifex at time of change).
			to_chat(recipient, span_notice("My virtue lessens the limitations of my magical reach."))

/datum/virtue/combat/devotee
	name = "Devotee"
	desc = "Though not officially of the Church, my relationship with my chosen Patron is strong enough to grant me the most minor of their blessings. I've also kept a psycross of my deity. Combat-oriented classes get a weaker version of this virtue."
	added_skills = list(/datum/skill/magic/holy = 1)

/datum/virtue/combat/devotee/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind)
		return
	if (!recipient.devotion)
		// only give non-devotionists orison... and t0 for some reason (this is probably a bad idea)
		var/datum/devotion/new_faith = new /datum/devotion(recipient, recipient.patron)
		var/datum/patron/our_patron = new_faith.patron
		new_faith.max_devotion = CLERIC_REQ_1 - 20
		new_faith.max_progression = CLERIC_REQ_1 - 20
		recipient.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
		recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/orison)
		if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT) && !HAS_TRAIT(recipient, TRAIT_CRITICAL_RESISTANCE))
			recipient.mind?.AddSpell(new our_patron.t0)
	else
		// for devotionists, bump up their maximum 1 tier and give them a TINY amount of passive devo gain
		var/datum/devotion/our_faith = recipient.devotion
		our_faith.passive_devotion_gain += 0.15
		switch (our_faith.max_devotion)
			if (CLERIC_REQ_0)
				our_faith.max_devotion = CLERIC_REQ_1
			if (CLERIC_REQ_1)
				our_faith.max_devotion = CLERIC_REQ_2
			if (CLERIC_REQ_2)
				our_faith.max_devotion = CLERIC_REQ_3
			if (CLERIC_REQ_3)
				our_faith.max_devotion = CLERIC_REQ_4
		switch (our_faith.max_progression)
			if (CLERIC_REQ_0)
				our_faith.max_progression = CLERIC_REQ_1
			if (CLERIC_REQ_1)
				our_faith.max_progression = CLERIC_REQ_2
			if (CLERIC_REQ_2)
				our_faith.max_progression = CLERIC_REQ_3
			if (CLERIC_REQ_3)
				our_faith.max_progression = CLERIC_REQ_4
			if (CLERIC_REQ_4)
				our_faith.passive_devotion_gain += 1

/datum/virtue/combat/duelist
	name = "Duelist Apprentice"
	desc = "I have trained under a duelist of considerable skill, and always have my trusty rapier close at hand. (+1 to Swords and Knives, Up to Journeyman, Minimum Apprentice. Stashed rapier.)"
	added_stashed_items = list("Rapier" = /obj/item/rogueweapon/sword/rapier)

/datum/virtue/combat/duelist/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/swords) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/swords, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/knives) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else	
		added_skills = list(list(/datum/skill/combat/knives, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/executioner
	name = "Executioner Apprentice"
	desc = "I have trained under a skilled executioner, and always have my trusty exeuctioner's axe close at hand. (+1 to Axes and Whips/Flails, Up to Journeyman, Minimum Apprentice. Stashed battleaxe.)"
	added_stashed_items = list("Battleaxe" = /obj/item/rogueweapon/stoneaxe/battle)

/datum/virtue/combat/executioner/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/whipsflails) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/whipsflails, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/axes) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/axes, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/militia
	name = "Militiaman Apprentice"
	desc = "I have trained under a skilled militiaman, and always have my trusty billhook close at hand. (+1 to Maces and Polearms, Up to Journeyman, Minimum Apprentice. Stashed billhook.)"
	added_stashed_items = list("Billhook" = /obj/item/rogueweapon/spear/billhook)

/datum/virtue/combat/militia/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/polearms) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/polearms, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/maces) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/maces, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/brawler
	name = "Brawler Apprentice"
	desc = "I have trained under a skilled brawler, and have some experience fighting with my fists. (+1 to Unarmed and Wrestling, Up to Journeyman, Minimum Apprentice. Stashed katar.)"
	added_stashed_items = list("Katar" = /obj/item/rogueweapon/katar)
	
/datum/virtue/combat/brawler/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/unarmed) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/unarmed, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/wrestling) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/wrestling, 1, 3))
		handle_skills(recipient)


/datum/virtue/combat/bowman
	name = "Toxophilite"
	desc = "I have studied underneath a bowman of considerable skill, and always have my trusty bow and a quiver of arrows close at hand. (+1 to Bows, Up to Legendary, Minimum Apprentice)"
	added_stashed_items = list("Recurve Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
								"Quiver (Arrows)" = /obj/item/quiver/arrows
	)

/datum/virtue/combat/bowman/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/bows) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/bows, 1, 6))
		handle_skills(recipient)
/*/datum/virtue/combat/tavern_brawler
	name = "Tavern Brawler"
	desc = "I've never met a problem my fists couldn't solve."
	added_traits = list(TRAIT_CIVILIZEDBARBARIAN)*/

/datum/virtue/combat/guarded
	name = "Guarded"
	desc = "I have long kept my true capabilities and vices a secret. Sometimes being deceptively weak can save one's lyfe. Such a virtue allows me to avoid and perform feints easier. My skills cannot be assessed, and I keep my Inhumen faith hidden even from the most keen eyes."
	added_traits = list(TRAIT_DECEIVING_MEEKNESS)

/*/datum/virtue/combat/impervious
	name = "Impervious"
	desc = "I've spent years shoring up my weakspots, and have become difficult to wound with critical blows."
	added_traits = list(TRAIT_CRITICAL_RESISTANCE)*/

/datum/virtue/combat/rotcured
	name = "Rotcured"
	desc = "I was once afflicted with the accursed rot, and was cured. It has left me changed: my limbs are weaker, but I feel no pain and have no need to breathe..."
	// below is functionally equivalent to dying and being resurrected via astrata T4 - yep, this is what it gives you.
	added_traits = list(TRAIT_EASYDISMEMBER, TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE, TRAIT_ZOMBIE_IMMUNE, TRAIT_ROTMAN)

/datum/virtue/combat/rotcured/apply_to_human(mob/living/carbon/human/recipient)
	recipient.update_body() // applies the rot skin tone stuff

/datum/virtue/combat/dualwielder
	name = "Dual Wielder"
	desc = "Whether it was by the Naledi scholars, Etruscan privateers or even the Kazengan senseis. I've been graced with the knowledge of how to wield two weapons at once, making my offense more formidable, at the expense of my defense. When I wield two identical type weapons, I roll attacks twice, but so does the enemy against me. I've also learned to become ambidextrous, ignoring any off-hand penalties."
	added_traits = list(TRAIT_DUALWIELDER)

/datum/virtue/combat/sharp
	name = "Sentinel of Wits"
	desc = "Whether it's by having an annoying sibling that kept prodding me with a stick, or years of study and observation, I've become adept at both parrying and dodging stronger opponents, by learning their moves and studying them. My own attacks however, still rely on true training of my weapons. \n I convert INT into dodge and parry chance, every 2 INT points above 10 adding 10% additional chance. Does not count artificial buffs to INT from potions or substances."
	added_traits = list(TRAIT_SENTINELOFWITS)
