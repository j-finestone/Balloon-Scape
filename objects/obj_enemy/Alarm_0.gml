///@description start to move
if (state != enemy_states.dead) {
	//while loop to make sure it doesnt keep moving in the same position it was moving in previusly

	var loop_count = 0
	do {
		 move_dir_x = 0
		 move_dir_y = 0
		switch(irandom_range(1, 4)) {
			case 1: move_dir_x = spd; break;
			case 2: move_dir_x = -spd; break;
			case 3: move_dir_y = spd; break;
			case 4: move_dir_y = -spd; break;		
			
			
		}
		//To make it so it wanders towards player
		var towards_player = true;
		if state == enemy_states.wandering_to_player {	
			//Detects if the move direction will be moving further away from the player
			towards_player = point_distance(obj_player.x,
			obj_player.y, x, y) > point_distance(obj_player.x,
			obj_player.y, x+move_dir_x, y+move_dir_y) 
		}
		
		loop_count++
	} until((!place_meeting(x+move_dir_x, y+move_dir_y, obj_player) && towards_player) or loop_count > 15)
	alarm[1] = random_range(1, max_movment_time)*room_speed
}

