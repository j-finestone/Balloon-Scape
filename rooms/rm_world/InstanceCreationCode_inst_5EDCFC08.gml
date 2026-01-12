if ds_list_find_index(obj_game.map_marker_id, inst_43909A09) == -1 {
	//Snow
	message[0] = "Would you like to know the location of one of the hot air ballons for 5 rubies? [choice]"

	choice_type[0] = 3;

	message[1] = "Ok. I've marked it on your map for you in red."
} else {
	message[0] = "I already gave you a hint."
	
}

if has_item("Shurikens") instance_destroy();
