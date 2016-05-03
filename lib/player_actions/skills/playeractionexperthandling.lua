PlayerAction.ExpertHandling = {}
PlayerAction.ExpertHandling.Priority = 1
function PlayerAction.ExpertHandling.Function(t, dt, player_manager, accuracy_bonus, max_stacks, max_time)
	local co = coroutine.running()
	local current_time = 0
	local current_stacks = 0
	local function on_hit()
		current_stacks = current_stacks + 1
		if current_stacks <= max_stacks then
			player_manager:mul_to_accuracy_multiplier(accuracy_bonus)
		end
	end
	on_hit()
	player_manager:register_message(Message.OnEnemyShot, co, on_hit)
	while max_time >= current_time do
		current_time = current_time + dt
		if player_manager:get_equipped_weapon_category() ~= "pistol" then
			break
		end
		coroutine.yield(co)
	end
	player_manager:reset_acuracy_multiplier()
	player_manager:unregister_message(Message.OnEnemyShot, co)
end