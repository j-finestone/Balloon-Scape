if !obj_subway_mini_game.start_state {
	if keyboard_check(global.key_left) x-=2;
	if keyboard_check(global.key_right) x+=2;
	
}

//Getting hit
if !invincibile {
	if place_meeting(x, y, obj_obstacal) {
		invincibile = true;
		obj_subway_mini_game._health--;
		alarm[0] = 1*room_speed;
		audio_play_sound(snd_take_damage, 0, false)
	}
}

