/// @description Spawn obstical

var obsical_x = random_range(160, 224)

//Make it so objects are more likley to spawn on the sides
//This is done by regenorating the locatione once if it is set to spawn in the middle
if (obsical_x > 174 && obsical_x < 210) {
	var obsical_x = random_range(160, 224)
}


instance_create_depth(obsical_x, -48, 0, obj_obstacal);

if alarm[1] <= 200 {
	
	//alarm[0] = random_range(.4*room_speed, 1.5*room_speed);
} else {
	
	alarm[0] = random_range(.2*room_speed, .8*room_speed);
}

