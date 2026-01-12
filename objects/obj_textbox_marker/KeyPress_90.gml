if (place_meeting(x,y, obj_player)) && (!instance_exists(obj_textbox)) && (keyboard_check(ord("Z"))) {
	var box = instance_create_depth(x,y,depth,obj_textbox);
	for(var i = 0; i < array_length_1d(message); i++) {
		box.message[i] = message[i]
	}
	box.message_end = array_length_1d(message)-1
	box.text_rapped = string_rap("* " + message[0],315,28,false)
	box.message_length = string_length(box.text_rapped)
	global.first_text_triggered = true;
}
	
