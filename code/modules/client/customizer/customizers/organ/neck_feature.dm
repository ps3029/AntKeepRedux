/datum/customizer/organ/neck_feature
	abstract_type = /datum/customizer/organ/neck_feature
	name = "Neck"

/datum/customizer_choice/organ/neck_feature
	abstract_type = /datum/customizer_choice/organ/neck_feature
	name = "Neck"
	organ_type = /obj/item/organ/neck_feature
	organ_slot = ORGAN_SLOT_NECK_FEATURE

/datum/customizer/organ/neck_feature/moth_fluff
	name = "Moth Fluff"
	allows_disabling = TRUE
	default_disabled = FALSE
	customizer_choices = list(/datum/customizer_choice/organ/neck_feature/moth_fluff)

/datum/customizer_choice/organ/neck_feature/moth_fluff
	name = "Moth Fluff"
	organ_type = /obj/item/organ/neck_feature/moth_fluff
	sprite_accessories = list(
		/datum/sprite_accessory/neck_feature/moth_fluff/reddish,
		/datum/sprite_accessory/neck_feature/moth_fluff/royal,
		/datum/sprite_accessory/neck_feature/moth_fluff/gothic,
		/datum/sprite_accessory/neck_feature/moth_fluff/whitefly,
		/datum/sprite_accessory/neck_feature/moth_fluff/punished,
		/datum/sprite_accessory/neck_feature/moth_fluff/deathhead,
		/datum/sprite_accessory/neck_feature/moth_fluff/oakworm,
		/datum/sprite_accessory/neck_feature/moth_fluff/witchwing,
		)

/datum/customizer/organ/neck_feature/anthro
	name = "Fluff"
	allows_disabling = TRUE
	default_disabled = TRUE
	customizer_choices = list(
		/datum/customizer_choice/organ/neck_feature/anthro_fluff,
		)

/datum/customizer_choice/organ/neck_feature/anthro_fluff
	name = "Fluff"
	organ_type = /obj/item/organ/neck_feature/anthro_fluff
	sprite_accessories = list(
		/datum/sprite_accessory/neck_feature/mammal_fluff/fluff,
		/datum/sprite_accessory/neck_feature/mammal_fluff/fluff_front,
		/datum/sprite_accessory/neck_feature/mammal_fluff/fluff_dual,
		/datum/sprite_accessory/neck_feature/mammal_fluff/fluff_dual_front,
		/datum/sprite_accessory/neck_feature/mammal_fluff/insect_m,
		/datum/sprite_accessory/neck_feature/mammal_fluff/insect_f,
		)
