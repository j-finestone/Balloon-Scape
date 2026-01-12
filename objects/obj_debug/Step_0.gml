if global.debug_mode {
	if instance_exists(obj_player) {
		if keyboard_check(ord("D")) obj_player.x += debug_speed
		if keyboard_check(ord("A")) obj_player.x -= debug_speed
		if keyboard_check(ord("W")) obj_player.y -= debug_speed
		if keyboard_check(ord("S")) obj_player.y += debug_speed
	}

	if keyboard_check_pressed(ord("R")) game_restart();
	
	
	if keyboard_check_pressed(vk_shift) global.heart_meter++
	
	if keyboard_check_pressed(vk_control) global.money+=5;

	if keyboard_check_pressed(vk_alt) {
		 give_player(obj_items.item_floaty);
		 give_player(obj_items.item_key);
		 give_player(obj_items.item_shield);
		 give_player(obj_items.item_blast_power);
		 give_player(obj_items.item_shurikens);
		 give_player(obj_items.item_long_staff);
	}


	if keyboard_check_pressed(vk_enter) ds_map_replace(obj_items.item_key, "amount", ds_map_find_value(obj_items.item_key, "amount")+1);
	if keyboard_check_pressed(ord("P")) global.debug_mode = false;
}
if instance_exists(obj_player) {
	x = obj_player.x
	y = obj_player.y
}
