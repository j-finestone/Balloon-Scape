if (place_meeting(x,y, obj_player)) && (!instance_exists(obj_textbox)) && (keyboard_check_pressed(global.key_interact) && !instance_exists(obj_room_changer)) && (!instance_exists(obj_choice)) {

		var box = instance_create_depth(x, y, depth, obj_textbox) {
			
			//loops through every argument and adds it to the textboxs
			for (var i = 0; i < array_length(message); ++i) {
				box.message[i] = message[i]
				try {
					box.choice_type[i] = choice_type[i]
				} catch(Filler) {
					Filler=1
					
					box.choice_type[i] = 0;
				};
		
			}	

			box.message_end = array_length_1d(message)
			box.text_rapped = string_rap(message[0], box.line_max_width, 0, false)
			box.message_length = string_length(box.text_rapped)

		}
}
