if dir == "right" {
	x+=spd;
	
}
if dir == "left" {
	x-=spd;
	
}
if dir == "up" {
	y-=spd;
	
}
if dir == "down" {
	y+=spd;
	
}

depth = -y

if place_meeting(x, y, obj_player) and obj_player.knocking_back {
	instance_destroy()
}

