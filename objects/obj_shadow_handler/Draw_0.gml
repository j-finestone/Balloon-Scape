if instance_exists(obj_player) {
	gpu_set_fog(true, c_black, 0, 1);
	with(all) {
		try {
			if 
			//sprites that I want to have shadows
			object_get_parent(object_index) == obj_backround_element ||
			object_get_parent(object_index) == obj_backround_element_collision ||
			object_get_parent(object_index) == obj_enemy ||
			object_index == obj_player ||
			object_index == obj_money ||
			object_index == obj_projectile {
				try {
					//check if object has special variable to disable shadows
					var uses_shadow = true;
					try { 
						uses_shadow = object_index.shadow
						} catch(filler){}
						
					if uses_shadow {
						//shadow variables
						var origin_ofset_x = sprite_width/2
						var origin_ofset_y = sprite_height-sprite_get_yoffset(sprite_index)
						var dvx = 16
						var dvy = 2
						var opasity = .4
						//scew
						var sx = sprite_width/dvx
						var sy = sprite_height/dvy
						draw_sprite_pos(sprite_index, image_index, 
							//1
							x-(sprite_width/2)-sx + origin_ofset_x,
							y-sy + origin_ofset_y, 
							//2
							x+(sprite_width/2)-sx + origin_ofset_x, 
							y-sy + origin_ofset_y, 
							//3
							x+(sprite_width/2) + origin_ofset_x, 
							y + origin_ofset_y, 
							//4
							x-(sprite_width/2) + origin_ofset_x, 
							y+ origin_ofset_y, 
							opasity);
					}
				}
			}
		} catch(filler) {}
		
	}		
	gpu_set_fog(false,c_white,0,0);
	x = obj_player.x
	y = obj_player.y
}