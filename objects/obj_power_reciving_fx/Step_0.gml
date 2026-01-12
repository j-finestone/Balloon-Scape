if !global.paused {
	try {
	player_x = floor(obj_player.x+8)
	player_y = floor(obj_player.y)
	
	y = player_y
	} catch(i) {i = 0;}
}


//It's in a loop so that it doesn't go past the player
if global.start_power_recieving_cutscene && alarm[0] == -1 {
	repeat(5) {
		
		if x = 0 || x = room_width audio_play_sound(snd_fx_blast_appear, 0, 0);
		
		if image_xscale == -1 {
			x++
			
		} else {
			x--
		}
		
		
		if x == player_x {
			sprite_index = spr_blast_destroy;
			if image_xscale != -1 {
				audio_play_sound(snd_fx_blast_impact, 0, 0);
			}
			
			alarm[0] = 10;
		}
	}
}



