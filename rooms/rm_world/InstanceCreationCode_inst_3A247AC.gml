if ds_list_find_index(obj_game.map_marker_id, inst_7F913B3) == -1 {
	//Hint 2 (Ocean)
	message[0] = "Would you like to know the location of one of the hot air ballons? [choice]"

	choice_type[0] = 5;

	message[1] = "Ok. I've marked it on your map for you in red."
} else {
	message[0] = "I already gave you a hint."
	
}
if global.player_max_health >= 6 instance_destroy();
