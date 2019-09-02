/damagetype/npc/bear
	name = "Bear claw"
	id = "bear_claw"
	desc = "The claw of a bear"
	attack_verbs = list("slash","maul")
	weapon_name = "claw"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLADE = 20,
		BLUNT = 10,
		PIERCE = 10
	)

	//The damage conversion table of the weapon. Useful for when you want blade attacks to deal holy damage or something.
	attack_damage_conversion = list(
		BLADE = BRUTE,
		BLUNT = BRUTE,
		PIERCE = BRUTE
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = 25,
		BLUNT = 25,
		PIERCE = 50,
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = CLASS_A,
		ATTRIBUTE_DEXTERITY = CLASS_D
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = BLADE,
		ATTRIBUTE_DEXTERITY = PIERCE
	)

	skill_stats = list(
		SKILL_MELEE = CLASS_E,
		SKILL_UNARMED = CLASS_C
	)

	skill_damage = list(
		SKILL_MELEE = BLADE,
		SKILL_UNARMED = PIERCE
	)

	skill_xp_per_damage = list()