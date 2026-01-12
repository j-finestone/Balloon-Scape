/// @description Animation

if anim_location % 2 == 0{
	anim_location += 1;
} else {
	anim_location -= 1;
}
image_index = anim_location;
alarm[0] = anim_speed;
