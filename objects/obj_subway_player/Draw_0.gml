draw_self()

//draw the invincibility frame flash
if invincibile {

	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, invincibility_opacity);
	gpu_set_fog(false,c_white,0,0);

	invincibility_opacity+=.1
	
	if invincibility_opacity > 1 then invincibility_opacity = 0

	
} else {
	invincibility_opacity = 0
}
