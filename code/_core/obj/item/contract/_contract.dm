/obj/item/contract
	name = "contract: error"
	icon = 'icons/obj/item/contract.dmi'
	icon_state = "unfilled"

	desc = "They said not to deal with the devil. Now look what you've done."
	desc_extended = "A spooky contract listing one or more conditions the contract holder should complete. Despite being made out of papyrus, it appears to be very strong."

	var/atom/type_to_check
	var/amount_current = 0
	var/amount_max = 0
	var/obj/item/reward
	var/objective_text = "objectives completed"

	drop_sound = 'sound/items/drop/paper.ogg'

	value = 0

/obj/item/contract/Destroy()
	QDEL_NULL(reward)
	. = ..()

/obj/item/contract/update_sprite()
	. = ..()
	if(!amount_max)
		icon_state = "torn"
	else if(amount_current >= amount_max)
		icon_state = "filled"
	else
		icon_state = "unfilled"

/obj/item/contract/Generate()
	. = ..()
	if(!reward)
		CRASH_SAFE("Warning: Tried generating [src.get_debug_name()], but it had a null reward!")
		qdel(src)
	else
		reward = new reward
		INITIALIZE(reward)
		GENERATE(reward)
		FINALIZE(reward)
		amount_current = 0

/obj/item/contract/proc/on_kill(var/mob/living/attacker,var/list/data=list())

	var/mob/living/victim = data[1]
	if(istype(victim,type_to_check))
		amount_current++
		update_sprite()

	return TRUE

/obj/item/contract/Finalize()
	. = ..()
	update_value()

/obj/item/contract/get_value()
	return CEILING(reward.get_value()*0.25,1)

/obj/item/contract/get_examine_details_list(var/mob/examiner)
	. = ..()
	. += div("notice","Reward on completion: [reward.name](x[reward.item_count_current]).")
	. += div("notice","[amount_current] out of [amount_max] [objective_text].")
	. += div("notice bold","Contract progress is only counted if this object is slotted in the top right contract slot.")

/obj/item/contract/save_item_data(var/save_inventory = TRUE)
	. = ..()
	SAVEATOM("reward")
	SAVEVAR("amount_current")

/obj/item/contract/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADATOM("reward")
	LOADVAR("amount_current")

/obj/item/contract/post_move(var/atom/old_loc)

	. = ..()

	if(!.)
		return .

	if(istype(loc,/obj/hud/inventory/organs/groin/pocket/contract))
		var/obj/hud/inventory/organs/groin/pocket/contract/I = loc
		if(is_advanced(I.owner))
			HOOK_ADD("on_kill","on_kill_\ref[src]",I.owner,src,.proc/on_kill)

	if(istype(old_loc,/obj/hud/inventory/organs/groin/pocket/contract))
		var/obj/hud/inventory/organs/groin/pocket/contract/I = old_loc
		if(is_advanced(I.owner))
			HOOK_REMOVE("on_kill","on_kill_\ref[src]",I.owner)


/obj/item/contract/proc/turn_in(var/mob/living/advanced/player/P)
	P.to_chat(span("notice","You are awared \the [reward.name] for completing the contract."))
	drop_item(get_turf(P))
	P.put_in_hands(reward)
	reward = null //Just in case.
	amount_current = 0 //Just in case.
	qdel(src)
	return TRUE






