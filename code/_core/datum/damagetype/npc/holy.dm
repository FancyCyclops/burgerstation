/damagetype/npc/holy_warrior
	name = "Holy Warrior Damage"
	desc = "The touch of a holy warrior."
	id = "holy_warrior"
	attack_verbs = list("smite","punish","strike")
	weapon_name = "right foot"


	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		HEAT = 20,
		HOLY = 20
	)

	//The damage conversion table of the weapon. Useful for when you want blade attacks to deal holy damage or something.
	attack_damage_conversion = list(
		HEAT = BURN,
		HOLY = BURN
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		HEAT = 25,
		HOLY = -25
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = CLASS_C,
		ATTRIBUTE_DEXTERITY = CLASS_C
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = HEAT,
		ATTRIBUTE_DEXTERITY = HEAT
	)

	skill_stats = list(
		SKILL_UNARMED = CLASS_D,
		SKILL_PRAYER = CLASS_B
	)

	skill_damage = list(
		SKILL_UNARMED = HEAT,
		SKILL_PRAYER = HOLY
	)

	skill_xp_per_damage = list()