image_angle += 20

switch (dir) {
    case "left":
        x-=spd
        break;
    case "right":
        x+=spd
        break;
    case "up":
        y-=spd
        break;
    case "down":
        y+=spd
        break;
    default:
        instance_destroy();
        break;
}

if place_meeting(x, y, obj_enemy) {
	colliding_with_enemy = true
	colliding_enemy_id = instance_place(x, y, obj_enemy);
	
} else {
	colliding_with_enemy = false
	colliding_enemy_id = pointer_null
	
}
