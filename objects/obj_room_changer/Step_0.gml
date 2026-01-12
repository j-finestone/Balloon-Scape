//fade in
if fade_mode = 0 {
	alpha += fade_speed
	
	if alpha >= 1+fade_speed {
		fade_mode = 1
		
		room_goto(target_room)
		obj_player.x = xx
		obj_player.y = yy
	}
}
//fade out
if fade_mode = 1 {
	alpha -= fade_speed

	if alpha <= 0 {
		global.gs = game_state.nm
		instance_destroy();
	}
}

