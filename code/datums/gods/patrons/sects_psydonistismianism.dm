/datum/patron/sects_psydonistismianism
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/sects_psydonistismianism/psydon
	name = "Church of the Psydon Patriarchate"
	domain = "Rules and statute. Order. Theology. Law."
	desc = "I believe the central church is the holiest and most legitimate religious authority in the peninsular. I trust the Patriarchate and its bishops, and above all - Psydon, the best and greatest."
	worshippers = "Peasants, Serfs, Scientists, Philosophers, Traditional Feudal Lords."
	mob_traits = list(TRAIT_SPIRITUAL)

	confess_lines = list(
		"HALLOWED BE THE ALL-FATHER!",
		"THE PATRIARCH BE MY GUIDE!",
		"LET PSYDON'S BISHOPS COMMAND ME!",
	)

/datum/patron/sects_psydonistismianism/psydon_east
	name = "Northern Patriarchate"
	domain = "Rites and ceremonies. War. Religious and Military Pageantry."
	desc = "The Western Patriarch's authority dies with his crumbling city! Let the Zimicjugites command the bishoprics from their holy capital Bystruvoda!"
	worshippers = "Military officers, Peasant soldiery, patriotic Zimicjugites."
	//mob_traits = list(TRAIT_NOCSNEAK, TRAIT_NIGHT_OWL)

	confess_lines = list(
		"BYSTRUVODA STANDS!",
		"NO FORCE OF EVIL SHALL OVERTHROW THE TSAR!",
		"THE POWER OF PSYDON FLOWS THROUGH THE IVORY THRONE!",
	)

/datum/patron/sects_psydonistismianism/conciliarism
	name = "Conciliarism"
	domain = "Compromise. Grace. Magnanimy. Revanchists."
	desc = "I recognise neither the authority of the central church nor the Northern Patriarchate until they can set aside their differences. The Schism has gone too far. This is meaningless fratricide! If the will of Psydon is to triumph, it is through religious conciliation."
	worshippers = "Monastics, Acolytes, Wisemen, Crusaders and Templars."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)

	confess_lines = list(
		"LET US MARCH EAST AND DESTROY THE HEATHENS TOGETHER!",
		"END THE PETTY FRATRICIDE AND SHOW THE WORLD THE GLORY OF PSYDON!",
		"BROTHERS..! WHY MUST WE FIGHT!?",
	)

/datum/patron/sects_psydonistismianism/sovereign
	name = "Ecclesiastical Sovereign"
	domain = "Republicanism, Restraint of appeals, Absolutism."
	desc = "Nobody rules my kingdom but me! Praise Psydon, but to hell with his self-appointed pretenders. No more lands for the Church!"
	worshippers = "Absolutist monarchs, Tyrants, Republicans, Mercenaries, Guild-leaders and Freemen."
	mob_traits = list (TRAIT_ABYSSOR_SWIM)
	
	confess_lines = list(
		"A KING OUGHT TO RULE HIS KINGDOM, NOT A CARDINAL!",
		"WHAT DO THE RED-ROBED ALE-QUAFFERS KNOW ABOUT RUNNING A COUNTRY!?",
		"PSYDON'S POWER STAYS WITH HIM!",
	)

/datum/patron/sects_psydonistismianism/sectarian
	name = "Sectarian"
	domain = "Highly varies."
	desc = "The Patriarchate is a long way from home. So long without religious orders, our regional churches have no choice but to take the initiative ourselves.\
	The Sectarian churches are a broad name for all those followers of lost churches in faroff lands. Islands of Psydonism surrounded by heathens. Many of their beliefs border on heresy, such as those that mention The Ten or Psydon's sons.\
	But the central Patriarchate has allowed reconquered sectarians local autonomy, knowing their very survival must be some sort of miracle itself."
	worshippers = "Varies highly."

	confess_lines = list(
		"PSYDON, GIVE ME STRENGTH",
		"THROUGH STRIFE, GRACE!",
		"PSYDON COMETH!",
	)
