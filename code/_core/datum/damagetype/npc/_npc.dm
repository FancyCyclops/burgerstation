/damagetype/npc/
	name = "NPC"
	desc = "Damage from NPCs."

	skill_xp_per_damage = list()

	draw_blood = TRUE

/damagetype/npc/get_attack_message_sound(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object)
	return span("warning","You hear bone hitting flesh.")