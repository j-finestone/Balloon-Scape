if exploding && screen_alpha < 1 {
	repeat(explosion_intencity) {
		instance_create_depth(random(room_width), random_range(225, room_height), 100, obj_endgame_explosion)
	
	}
	if irandom(5) == 1 audio_play_sound(snd_fx_explotion, 0, 0)
	
}

if !audio_is_playing(snd_wind) && !show_text {
	audio_play_sound(snd_wind, 0, 0)
	
}
