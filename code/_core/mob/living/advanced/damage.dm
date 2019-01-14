/mob/living/advanced/get_object_to_damage(var/atom/attacker,var/atom/victim,params)

	if(!params)
		params = list("icon-y" = rand(16,32))


	var/y_attack = text2num(params["icon-y"])

	if(y_attack >= 24 && src.labeled_organs["head"])
		return src.labeled_organs["head"]

	if(y_attack >= 12)
		if(prob(50) && src.labeled_organs[BODY_TORSO])
			return src.labeled_organs[BODY_TORSO]
		else if(prob(50) && src.labeled_organs[BODY_ARM_LEFT])
			return src.labeled_organs[BODY_ARM_LEFT]
		else if(src.labeled_organs[BODY_ARM_RIGHT])
			return src.labeled_organs[BODY_ARM_RIGHT]

	if(y_attack >= 9)
		if(prob(50) && src.labeled_organs[BODY_GROIN])
			return src.labeled_organs[BODY_GROIN]
		else if(prob(50) && src.labeled_organs[BODY_HAND_LEFT])
			return src.labeled_organs[BODY_HAND_LEFT]
		else if(src.labeled_organs[BODY_HAND_LEFT])
			return src.labeled_organs[BODY_HAND_LEFT]

	if(y_attack >= 4)
		if(prob(50) && src.labeled_organs[BODY_LEG_LEFT])
			return src.labeled_organs[BODY_LEG_LEFT]
		else if (src.labeled_organs[BODY_LEG_RIGHT])
			return src.labeled_organs[BODY_LEG_RIGHT]

	if(prob(50) && src.labeled_organs[BODY_FOOT_LEFT])
		return src.labeled_organs[BODY_FOOT_LEFT]
	else if (src.labeled_organs[BODY_FOOT_RIGHT])
		return src.labeled_organs[BODY_FOOT_RIGHT]

	return victim

/mob/living/advanced/perform_parry(var/atom/attacker,var/atom/weapon,var/atom/target,var/damagetype/DT, allow_parry_counter)

	var/atom/right_hand = get_right_hand()
	var/atom/left_hand = get_left_hand()

	var/atom/object_to_parry = right_hand ? right_hand : left_hand
	if(!object_to_parry)
		return FALSE

	if(allow_parry_counter && is_obj(object_to_parry))
		var/obj/O = object_to_parry

		var/pixel_x_offset = prob(50) ? -8 : 8
		var/pixel_y_offset = prob(50) ? -8 : 8

		animate(src, pixel_x = src.pixel_x + pixel_x_offset, pixel_y = src.pixel_y + pixel_y_offset, time = ATTACK_ANIMATION_LENGTH * 0.5, flags = ANIMATION_LINEAR_TRANSFORM)
		animate(pixel_x = src.pixel_x - pixel_x_offset, pixel_y = src.pixel_y - pixel_y_offset, time = ATTACK_ANIMATION_LENGTH, flags = ANIMATION_LINEAR_TRANSFORM)

		move_delay += ATTACK_ANIMATION_LENGTH

		//DT.do_miss_sound(attacker,src,weapon,target)
		DT.do_attack_animation(attacker,src,weapon,target)
		DT.display_miss_message(attacker,src,weapon,target,"parried")

		if(!O.click_on_object(src,attacker))
			return FALSE

		return TRUE
	else
		DT.display_miss_message(attacker,src,weapon,target,"parried")
		if(allow_parry_counter)
			object_to_parry.attack(src,attacker)
		return

