/// @description change state
if (state != enemy_states.dead) {
	var dx = obj_player.x -x;
	var dy = obj_player.y - y;
	var distance_from_player = sqrt(dx*dx + dy*dy);

	//choosing which state to be in
	if distance_from_player > provoking_distance {	
		if wanders {
			state = enemy_states.wandering
			//wander to player
			if wanders_to_player and choose(true, false) {
				state = enemy_states.wandering_to_player
			}
		}
	
	} else if chases {
			state = enemy_states.chasing
			//cancle wander
			move_dir_x = 0;
			move_dir_y = 0;
		
		} else if wanders {
			state = enemy_states.wandering_to_player;
			if wanders_to_player and choose(true, false) {
				state = enemy_states.wandering_to_player
			}
	}

	alarm[3] = 3 * room_speed
	
}

