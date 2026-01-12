if ds_list_find_index(obj_game.map_marker_id, inst_2D9A2C73) == -1 {
	//Hint 2 (desert)
	message[0] = "Would you like to know the location of one of the hot air ballons? [choice]"

	choice_type[0] = 4;

	message[1] = "Ok. I've marked it on your map for you in red."
} else {
	message[0] = "I already gave you a hint."
	
}
if has_item("Floaty") {
	instance_create_depth(x, y, depth, obj_present)
	
	instance_destroy();
}
