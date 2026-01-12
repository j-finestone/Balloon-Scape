///@description Shoot projectile

var _id = instance_create_depth(x, y, depth, projectile_object);

if sprite_index == spr_right then _id.dir = "right";
if sprite_index == spr_left then _id.dir = "left";
if sprite_index == spr_up then _id.dir = "up";
if sprite_index == spr_down then _id.dir = "down";

_id.spd = projectile_speed;

alarm[4] = random_range(1, projecile_max_frequency)*room_speed

