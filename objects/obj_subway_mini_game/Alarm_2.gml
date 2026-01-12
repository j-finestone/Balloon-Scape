/// @description spawn clouds

var side = choose("left", "right");
if side = "right" {
	instance_create_depth(irandom_range(-32, 80), -100, 0, obj_cloud);
} else if side = "left" {
	instance_create_depth(irandom_range(256, 352), -100, 0, obj_cloud);
}
alarm[2] = 1*room_speed 
