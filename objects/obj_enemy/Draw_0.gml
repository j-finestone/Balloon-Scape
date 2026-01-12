if (state != enemy_states.dead) {
	draw_self();
	
	//to make it blue if its inside the sheild
	if place_meeting(x, y, obj_shield) {
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_blue, .5);
	}
	
	//draw the invincibility frame flash
	if invincibile and sprite_index != spr_enemy_destroyed {
		gpu_set_fog(true, c_red, 0, 0);
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, invincibility_opacity);
		gpu_set_fog(false,c_white,0,0);
		//so the flash opacity gets weaker at the end
		if (alarm[2] > 10) {
			invincibility_opacity += .2
		} else {
			invincibility_opacity += .2
		}
	} else {
		invincibility_opacity = 0
	}
}