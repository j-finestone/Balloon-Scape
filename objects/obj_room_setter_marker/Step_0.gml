try {
	//It's in a randomizer just to make it so it doesn't waste time doing this every this every frame
	if irandom(100) {
		if (power_to_unlock == powers_to_recive.blast && has_item("Blast power")) || 
		   (power_to_unlock == powers_to_recive.shuriken && has_item("Shurikens")) ||
		   (power_to_unlock == powers_to_recive.swim && has_item("Floaty")) ||
	       (power_to_unlock == powers_to_recive.hearts && global.player_max_health >= 6) {
		      
				var ballon = instance_place(x, y, obj_cloud_city_entrance)
				var text_box_marker = instance_place(x, y, obj_textbox_marker)
	
				instance_destroy(ballon);
				instance_destroy(text_box_marker);
				instance_destroy();
		
		}
	}
} catch(p) {p = 0};
