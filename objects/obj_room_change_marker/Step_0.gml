if place_meeting(x, y, obj_player)
	&& !instance_exists(obj_room_changer) {
		
	var room_changer = instance_create_depth(x, y, depth, obj_room_changer)
	
	room_changer.target_room = target_room
	room_changer.xx = xx
	room_changer.yy = yy
	
}