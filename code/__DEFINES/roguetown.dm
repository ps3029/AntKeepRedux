//used in various places
#define ALL_RACES_TYPES list(\
	/datum/species/skeleton,\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/anthromorph,\
	/datum/species/anthromorphsmall,\
	/datum/species/demihuman,\
)

#define RACES_RESPECTED list(\
	/datum/species/human/northern,\
	/datum/species/elf/wood,\
	/datum/species/human/halfelf,\
)

#define RACES_TOLERATED list(\
	/datum/species/elf/dark,\
	/datum/species/lizardfolk,\
	/datum/species/anthromorph,\
	/datum/species/demihuman\
)

#define RACES_SHUNNED list(\
	/datum/species/anthromorphsmall,\
)

// #define RACES_DESPISED

#define RACES_ALL_KINDS list(RACES_DESPISED, RACES_SHUNNED, RACES_TOLERATED, RACES_RESPECTED)

#define RACES_SHUNNED_UP list(RACES_SHUNNED, RACES_TOLERATED, RACES_RESPECTED)

#define RACES_TOLERATED_UP list(RACES_TOLERATED, RACES_RESPECTED)

#define NOBLE_RACES_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/anthromorph,\
	/datum/species/anthromorphsmall,\
	/datum/species/demihuman,\
)

#define CLOTHED_RACES_TYPES list(\
	/datum/species/skeleton,\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/anthromorph,\
	/datum/species/anthromorphsmall,\
	/datum/species/demihuman,\
)

// Non-dwarf non-kobold non-goblin mostly
#define NON_DWARVEN_RACE_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/anthromorph,\
	/datum/species/demihuman,\
)

// Non-elf non-dwarf non-kobold non-goblin mostly
#define HUMANLIKE_RACE_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/anthromorph,\
	/datum/species/demihuman\
)

#define ALL_PATRONS list(ALL_DIVINE_PATRONS_EXTENDED, ALL_INHUMEN_PATRONS)

#define ALL_DIVINE_PATRONS list(\
	/datum/patron/sects_psydonistismianism/psydon,\
	/datum/patron/sects_psydonistismianism/psydon_east,\
	/datum/patron/sects_psydonistismianism/conciliarism,\
	/datum/patron/sects_psydonistismianism/sovereign,\
	/datum/patron/sects_psydonistismianism/sectarian\
)

#define ALL_DIVINE_PATRONS_EXTENDED list(\
	/datum/patron/sects_psydonistismianism/psydon,\
	/datum/patron/sects_psydonistismianism/psydon_east,\
	/datum/patron/sects_psydonistismianism/conciliarism,\
	/datum/patron/sects_psydonistismianism/sovereign,\
	/datum/patron/sects_psydonistismianism/sectarian,\
	/datum/patron/psydon_heresy/iconolatrists,\
	/datum/patron/psydon_heresy/fredonian,\
	/datum/patron/psydon_heresy/pietas,\
	/datum/patron/psydon_heresy/simonism\
)

#define ALL_INHUMEN_PATRONS list(\
	/datum/patron/heathenry/zizo,\
	/datum/patron/heathenry/atheist,\
	/datum/patron/heathenry/pagans\
)

#define ALL_REVOLUTIONARY_PATRONS list(\
	/datum/patron/heathenry/atheist,\
	/datum/patron/sects_psydonistismianism/sovereign,\
	/datum/patron/psydon_heresy/fredonian,\
	/datum/patron/psydon_heresy/simonism,\
	/datum/patron/sects_psydonistismianism/conciliarism,\
)


#define TEN_CURSES list(\
	/datum/curse/psydon,\
	/datum/curse/psydon_east,\
	/datum/curse/sectarian,\
	/datum/curse/sovereign,\
	/datum/curse/conciliarism,\
	/datum/curse/pietas,\
	/datum/curse/simonism,\
	/datum/curse/fredonian\
)


#define PLATEHIT "plate"
#define CHAINHIT "chain"
#define SOFTHIT "soft"
#define SOFTUNDERHIT "softunder" // This is just for the soft underarmors like gambesons and arming jackets so they can be worn with light armors that use the same sound like studded leather

/proc/get_armor_sound(blocksound, blade_dulling)
	switch(blocksound)
		if(PLATEHIT)
			if(blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/plate_slashed (1).ogg','sound/combat/hits/armor/plate_slashed (2).ogg','sound/combat/hits/armor/plate_slashed (3).ogg','sound/combat/hits/armor/plate_slashed (4).ogg')
			if(blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_BITE)
				return pick('sound/combat/hits/armor/plate_stabbed (1).ogg','sound/combat/hits/armor/plate_stabbed (2).ogg','sound/combat/hits/armor/plate_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/plate_blunt (1).ogg','sound/combat/hits/armor/plate_blunt (2).ogg','sound/combat/hits/armor/plate_blunt (3).ogg')
		if(CHAINHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/chain_slashed (1).ogg','sound/combat/hits/armor/chain_slashed (2).ogg','sound/combat/hits/armor/chain_slashed (3).ogg','sound/combat/hits/armor/chain_slashed (4).ogg')
			else
				return pick('sound/combat/hits/armor/chain_blunt (1).ogg','sound/combat/hits/armor/chain_blunt (2).ogg','sound/combat/hits/armor/chain_blunt (3).ogg')
		if(SOFTHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/light_stabbed (1).ogg','sound/combat/hits/armor/light_stabbed (2).ogg','sound/combat/hits/armor/light_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/light_blunt (1).ogg','sound/combat/hits/armor/light_blunt (2).ogg','sound/combat/hits/armor/light_blunt (3).ogg')
		if(SOFTUNDERHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/light_stabbed (1).ogg','sound/combat/hits/armor/light_stabbed (2).ogg','sound/combat/hits/armor/light_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/light_blunt (1).ogg','sound/combat/hits/armor/light_blunt (2).ogg','sound/combat/hits/armor/light_blunt (3).ogg')

GLOBAL_LIST_INIT(lockhashes, list())
GLOBAL_LIST_INIT(lockids, list())
GLOBAL_LIST_EMPTY(credits_icons)
GLOBAL_LIST_EMPTY(confessors)

//preference stuff
#define FAMILY_NONE 1
#define FAMILY_PARTIAL 2
#define FAMILY_FULL 3

GLOBAL_LIST_EMPTY(sunlights)
GLOBAL_LIST_EMPTY(head_bounties)
GLOBAL_LIST_EMPTY(job_respawn_delays)
GLOBAL_LIST_EMPTY(round_join_times)

//stress levels
#define STRESS_MAX 30
#define STRESS_INSANE 7
#define STRESS_VBAD 5
#define STRESS_BAD 3
#define STRESS_NEUTRAL 2
#define STRESS_GOOD 1
#define STRESS_VGOOD 0

/*
	Formerly bitflags, now we are strings
	Currently used for classes
*/

#define CTAG_ALLCLASS		"CAT_ALLCLASS"		// jus a define for allclass to not deal with actively typing strings
#define CTAG_DISABLED 		"CAT_DISABLED" 		// Disabled, aka don't make it fuckin APPEAR
#define CTAG_PILGRIM 		"CAT_PILGRIM"  		// Pilgrim classes
#define CTAG_ADVENTURER 	"CAT_ADVENTURER"  	// Adventurer classes
#define CTAG_TOWNER 		"CAT_TOWNER"  		// Villager class - Villagers can use it
#define CTAG_ANTAG 			"CAT_ANTAG"  		// Antag class - results in an antag
#define CTAG_BANDIT			"CAT_BANDIT"		// Bandit class - Tied to the bandit antag really
#define CTAG_CHALLENGE 		"CAT_CHALLENGE"  	// Challenge class - Meant to be free for everyone
#define CTAG_VAGABOND		"CAT_VAGABOND"		// Vagabond class - start with nothing and work your way up
#define CTAG_INQUISITION	"CAT_INQUISITION"	// For Orthodoxist subclasses
#define CTAG_PURITAN		"CAT_PURITAN"		// For Inquisitor subclasses
#define CTAG_COURTAGENT		"CAT_COURTAGENT"	//Court agent classes
#define CTAG_WRETCH			"CAT_WRETCH"		// Wretch classes untethered from adventurer

#define CTAG_WATCH			"CAT_WATCH"			// Watch class - Handles Town Watch class selector
#define CTAG_MENATARMS		"CAT_MENATARMS"		// Men-at-Arms class - Handles Men-at-Arms class selector
#define CTAG_ROYALGUARD		"CAT_ROYALGUARD"	// Royal Guard class - Handles Royal Guard class selector
#define CTAG_MERCENARY		"CAT_MERCENARY"		// Mercenary class - Handles Mercenary class selector
#define CTAG_HAND			"CAT_HAND"			// Hand class - Handles Hand class selector
#define CTAG_TEMPLAR		"CAT_TEMPLAR"		// Templar class - Handles Templar class selector
#define CTAG_HEIR			"CAT_HEIR"			// Prince(cess) class - Handles Heir class selector
#define CTAG_SQUIRE			"CAT_SQUIRE"		// Squire class - Handles Squire class selector
#define CTAG_VETERAN		"CAT_VETERAN"		// Veteran class - Handles Veteran class selector
#define CTAG_MARSHAL		"CAT_MARSHAL"		// Marshal class
#define CTAG_SENESCHAL		"CAT_SENESCHAL"		// Seneschal's aesthetic choices. 
#define CTAG_SERVANT		"CAT_SERVANT"		// Servant's aesthetic choices.
#define CTAG_CAPTAIN		"CAT_CAPTAIN"		// Handles Captain class selector
#define CTAG_WAPPRENTICE	"CTAG_WAPPRENTICE"	// Mage Apprentice Classes - Handles Mage Apprentices class selector 

/*
	Defines for the triumph buy datum categories
*/
#define TRIUMPH_CAT_ROUND_EFX "ROUND-EFX"
#define TRIUMPH_CAT_CHARACTER "CHARACTER"
#define TRIUMPH_CAT_MISC "MISC!"
#define TRIUMPH_CAT_ACTIVE_DATUMS "ACTIVE"
