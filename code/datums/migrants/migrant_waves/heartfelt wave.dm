/datum/migrant_wave/heartfelt
	name = "Burgundise Vanguard"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/heartfelt
	weight = 50
	downgrade_wave = /datum/migrant_wave/heartfelt_down_one
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/prior = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of Heartfelt. Stay close and watch out for each other, for all of your sakes!"

/datum/migrant_wave/heartfelt_down_one
	name = "Burgundise Vanguard"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/heartfelt_down_two
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of Heartfelt. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/heartfelt_down_two
	name = "Burgundise Vanguard"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/heartfelt_down_three
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of Heartfelt. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."


/datum/migrant_wave/heartfelt_down_three
	name = "Burgundise Vanguard"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/hand = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, united in a final effort to restore the former glory and promise of Heartfelt. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."
