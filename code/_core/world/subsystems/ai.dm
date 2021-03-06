SUBSYSTEM_DEF(ai)
	name = "AI Subsystem"
	desc = "Controls the AI of mobs."
	tick_rate = DECISECONDS_TO_TICKS(AI_TICK) //Needs to be fast to handle mob movement.
	priority = SS_ORDER_PRELOAD
	cpu_usage_max = 85
	tick_usage_max = 85

	var/list/active_ai_by_z = list()
	var/list/inactive_ai_by_z = list()

	var/list/path_stuck_ai = list()

	use_time_dialation = FALSE

/subsystem/ai/unclog(var/mob/caller)

	for(var/z in active_ai_by_z)
		for(var/k in active_ai_by_z[z])
			var/ai/AI = k
			if(AI.owner)
				qdel(AI.owner)
			else
				qdel(AI)
	broadcast_to_clients(span("danger","Deleted all non-boss mobs and AIs."))

	return ..()

/subsystem/ai/on_life()

	for(var/z in active_ai_by_z)
		for(var/k in active_ai_by_z[z])
			var/ai/AI = k
			CHECK_TICK(tick_usage_max,FPS_SERVER)
			if(AI.qdeleting)
				log_error("WARNING: AI of type [AI.type] was dqeleting!")
				active_ai_by_z[z] -= k
				continue
			if(!AI.owner)
				log_error("WARING! AI of type [AI.type] didn't have an owner!")
				qdel(AI)
				continue
			var/should_life = AI.should_life()
			if(should_life == null || (should_life && AI.on_life(tick_rate) == null))
				log_error("WARING! AI of type [AI.type] in [AI.owner.get_debug_name()] likely hit a runtime and was deleted, along with its owner.")
				qdel(AI.owner)

	return TRUE