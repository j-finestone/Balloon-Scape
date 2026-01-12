if instance_number(obj_power_reciving_fx) <= 2 {
	
	//create and explotion FX mabye with a a small dellay and sound effect
	instance_create_depth(player_x, player_y, 0, obj_fx_explotion);
}

instance_destroy();
