/mob/living/carbon/human/species/skeleton/
	race = /datum/species/skeleton
	
/datum/species/skeleton
	name = "Skeleton"
	id = "skeleton_playable"
	desc = "<b>Skeleton</b><br>\
	Nearly one of the countless, ravenous undead, you were instead gifted the fate of being one of the countless undead that doesn't feel hunger. You may try to lead a facsimile of an ordinary life, or you may embrace the ghoulish nature of your existence. No matter your option, the memories of who you once were fade a little more every day. <br>\
	(+1 Endurance, +1 Intelligence)"

	skin_tone_wording = "Ancestry"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR, NO_ORGAN_FEATURES, NOBLOOD)
	inherent_traits = list(TRAIT_EASYDISMEMBER, TRAIT_NOHUNGER, TRAIT_LIMBATTACHMENT, TRAIT_NOPAIN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE)
	default_features = list(MANDATORY_FEATURE_LIST)
	use_skintones = 1
	max_age = 2000
	meat = /obj/item/natural/bundle/bone/full
	nojumpsuit = 1
	possible_ages = ALL_AGES_LIST
	disliked_food = NONE
	liked_food = NONE
	
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/msk.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/msk.dmi'
	//dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	//dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/skeleton
	soundpack_f = /datum/voicepack/skeleton
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)
	race_bonus = list(STAT_INTELLIGENCE = 1, STAT_ENDURANCE = 1)
	enflamed_icon = "widefire"

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
		/datum/body_marking/nose,
	)

/datum/species/skeleton/check_roundstart_eligible()
	return TRUE


