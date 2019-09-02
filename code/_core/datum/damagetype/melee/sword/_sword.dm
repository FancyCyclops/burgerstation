/damagetype/sword/
	name = "sword"
	desc = "Live and die by it."

	impact_sounds = list(
		'sounds/weapons/blade/hit_light.ogg',
	)
	miss_sounds = list(
		'sounds/weapons/fists/punchmiss.ogg'
	)

	draw_blood = TRUE

/damagetype/sword/sabre
	name = "sabre"
	id = "sword_sabre"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLADE = 20
	)

	//The damage conversion table of the weapon. Useful for when you want blade attacks to deal holy damage or something.
	attack_damage_conversion = list(
		BLADE = BRUTE
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = 10
	)


	attribute_stats = list(
		ATTRIBUTE_STRENGTH = CLASS_D,
		ATTRIBUTE_DEXTERITY = CLASS_C,
		ATTRIBUTE_AGILITY = CLASS_C
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = BLADE,
		ATTRIBUTE_DEXTERITY = BLADE,
		ATTRIBUTE_AGILITY = BLADE
	)

	skill_stats = list(
		SKILL_MELEE = CLASS_S
	)

	skill_damage = list(
		SKILL_MELEE = BLADE
	)

	skill_xp_per_damage = list(
		SKILL_MELEE = 1
	)
