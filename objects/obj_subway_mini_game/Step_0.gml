//Walking up to end the game
if alarm[1] <= 100 && !start_state {
obj_subway_player.y -= 2;
	
	
}

if keyboard_check_pressed(global.key_interact) and start_state {
	//Spawn obstical
	alarm[0] = 100

	//End game
	alarm[1] = 30*room_speed
	
	
	start_state = false;
}

if global.debug_mode == true && keyboard_check_pressed(ord("Z")) {alarm[1] = 10}
