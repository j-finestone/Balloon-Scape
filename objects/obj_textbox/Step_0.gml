//character pausing
if pause_text = false {
		switch(string_char_at(text_rapped, characters)) {
		case ".": pause_text = true alarm[0] = 40; break;
		case ",": pause_text = true alarm[0] = 20; break;
		case "...": pause_text = true alarm[0] = 100; break;
		case "!": pause_text = true alarm[0] = 5; break;
	}
	
	//progres message
	if message_length >= characters && pause_text == false {
		characters += message_speed	
		if (!audio_is_playing(snd_text_scroll)) {
			audio_play_sound(snd_text_scroll,10,false)
		}
	}
	message_draw = string_copy(text_rapped, 0, characters)
	
	//text scrubing
	if keyboard_check(global.key_text_scrub) then characters+=5;
	clamp(characters, 0, message_length+1);
	
	//Move to next message.
	if keyboard_check_pressed(global.key_interact) && message_length <= characters {
		message_current++;	
		if message_current < message_end {
			message_draw = "";
			characters = 0;
			text_rapped = string_rap(message[message_current], line_max_width, "\n", false)
			message_length = string_length(text_rapped)		
		}
		else {
			global.paused = false;
			instance_destroy();
		}
	}
	//choice
	try {
		if string_pos("[choice]", message[message_current]) != 0 {
			
			if message_length <= characters && !instance_exists(obj_choice) {
				var choice_box = instance_create_depth(x, y, 0, obj_choice)
				
				choice_box.choice_type[message_current] = choice_type[message_current]
			}
		} 
	} catch (filler) { filler = "Hi"; }
}
