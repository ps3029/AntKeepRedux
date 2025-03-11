/obj/item/ritechalk
	name = "Ritual Chalk"
	icon_state = "chalk"
	desc = "Simple white chalk. A useful tool for rites."
	icon = 'icons/roguetown/misc/rituals.dmi'
	w_class = WEIGHT_CLASS_TINY
	experimental_inhand = FALSE

/obj/item/ritechalk/attack_self(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know what I'm doing with this..."))
		return

	var/ritechoices = list()
	switch (user.patron?.type)
		if(/datum/patron/heathenry/zizo)
			ritechoices+="Rune of ZIZO" 
		if(/datum/patron/psydon_heresy/iconolatrists)
			ritechoices+="Rune of the Living Saints"
		if(/datum/patron/sects_psydonistismianism/psydon)
			ritechoices+="Rune of Psydon"
		if(/datum/patron/sects_psydonistismianism/psydon_east)
			ritechoices+="Rune of The Tsar"
		if(/datum/patron/sects_psydonistismianism/conciliarism)
			ritechoices+="Rune of Compassion"
		if(/datum/patron/sects_psydonistismianism/sovereign)
			ritechoices+="Rune of Autonomy"
		if(/datum/patron/sects_psydonistismianism/sectarian)
			ritechoices+="Rune of Emancipation"
		if(/datum/patron/psydon_heresy/fredonian)
			ritechoices+="Rune of Self-Determination"
		if(/datum/patron/heathenry/atheist)
			ritechoices+="Rune of Anarchy"
		if(/datum/patron/psydon_heresy/pietas)
			ritechoices+="Rune of War"
		if(/datum/patron/heathenry/pagans)
			ritechoices+="Rune of Mystique"

	var/runeselection = input(user, "Which rune shall I inscribe?", src) as null|anything in ritechoices
	var/turf/step_turf = get_step(get_turf(user), user.dir)
	switch(runeselection)
		if("Rune of ZIZO")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her maleficence..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/zizo(step_turf)
		if("Rune of the Living Saints")
			to_chat(user, span_cultsmall("I begin inscribing the rune of Their radiance"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/noc(step_turf)
		if("Rune of Psydon")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His Benevolence"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/dendor(step_turf)
		if("Rune of The Tsar")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His grace"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/malum(step_turf)
		if("Rune of Autonomy")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Our sovereignity."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/xylix(step_turf)
		if("Rune of Compassion")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His pain"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/necra(step_turf)
		if("Rune of Autonomy")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Our sovereignity"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/pestra(step_turf)
		if("Rune of Emancipation")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Our struggle"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/eora(step_turf)
		if("Rune of War")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His Power.."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/ravox(step_turf)
		if("Rune of Mystique")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Our march"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/abyssor(step_turf)
