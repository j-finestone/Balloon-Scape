#region //collision
//takes in an array as tile index. sees if object is gitting it but
//will cause problems if the sprites your trying to colide with is smaller then the tile set
function tile_meeting(xx, yy, tilemap) {
	var xp, yp, meeting;

	//save our current position
	xp = x;
	yp = y;

	//move to the position where we wanna check for a tile collision
	x = xx;
	y = yy;

	//check for collision on all four corners of the collision mask
	meeting =		pixle_is_collision(tilemap, bbox_right, bbox_top)
					||
					pixle_is_collision(tilemap, bbox_right, bbox_bottom)
					||
					pixle_is_collision(tilemap, bbox_left, bbox_top)
					||
					pixle_is_collision(tilemap, bbox_left, bbox_bottom)

	//Move back to the original position
	x = xp;
	y = yp;
	
	//make collision not a thing in the item collection room
	if room == rm_item_collect then meeting = false;
	
	//Return wether or not there was a collision
	return(meeting);
}

//like tilemap_get_at_pixel() but only returns true if the object has collision
function pixle_is_collision(tilemap, xx, yy) {
	//the id's of what shouldnt be collision
	var non_collion_tiles = [
	1, 4, 5, 6, 7, 8, 9, 10, 16, 17, 18, 33, 34, 49, 50, 65, 66, 145, 146, 
	81, 82, 85, 86, 97, 98, 101, 102, 113, 114, 129, 130, 13, 14,
	//snow path and mud tiles
	23, 24, 25, 26, 39, 40, 41, 42, 55, 56, 57, 58, 71, 72, 73, 74, 
	87, 88, 89, 90, 103, 104, 105, 106, 119, 120, 121, 122, 
	//Snow
	11, 12, 27, 28, 43, 44, 59, 60, 75, 76, 91, 92, 107, 108, 123, 124,
	//Dock
	148, 149, 150, 164, 165, 166,
	//Lava tiles
	 3, 141, 142, 157,
	//White ending tiles 
	 195, 196, 200
	];
	
	/* Acivate for the ablity to walk on walls
	//tiles that don't let you cross the top of them
	var top_blocked_tiles = [22, 53, 54];
	//tiles that don't let you cross the left of them
	var left_blocked_tiles = [21, 53];
	//tiles that don't let you cross the right of them
	var right_blocked_tiles = [37, 54];
	
	non_collion_tiles = combine_arrays(non_collion_tiles, top_blocked_tiles)
	non_collion_tiles = combine_arrays(non_collion_tiles, left_blocked_tiles)
	non_collion_tiles = combine_arrays(non_collion_tiles, right_blocked_tiles)
	*/
	
	//add water tiles to non collision only if the player can swim
	if global.can_swim && object_index==obj_player{
		//water tiles
		var water_tiles = [0, 2, 191, 19, 20, 35, 36, 51, 52, 67, 68, 83, 84, 99, 100, 115, 116]
	//Lava tiles
	//29, 30, 45, 46, 61, 62, 77, 78, 93, 94, 109, 110, 25, 25, 31]
	
		non_collion_tiles = combine_arrays(non_collion_tiles, water_tiles)
	}
	
	var tile = tilemap_get_at_pixel(global.tilemap, xx, yy)
	
	
	#region //for tiles that are only partly colidable
	/*
	var relitive_tile_x = abs(xx - (ceil(xx/16)*16))
	var relitive_tile_y = abs(yy - (ceil(yy/16)*16))
	
	var value = false
	for (var i = 0; i < array_length_1d(left_blocked_tiles); ++i) {
		if relitive_tile_x >= 13 && relitive_tile_x <= 16  {
			if tile == left_blocked_tiles[i]
				value = true
		}
	}
	
	for (var i = 0; i < array_length_1d(right_blocked_tiles); ++i) {
		if relitive_tile_x >= 0 && relitive_tile_x <= 4  {
			if tile == right_blocked_tiles[i]
				value = true
		}
	}
	
	for (var i = 0; i < array_length_1d(top_blocked_tiles); ++i) {
		if relitive_tile_y >= 13 && relitive_tile_y <= 16  {
			if tile == top_blocked_tiles[i]
				value = true
		}
	} 
	if value return value;
	*/
	#endregion
	
	//checking if tile is non-collision
	for (var i = 0; i < array_length_1d(non_collion_tiles); ++i) {
		if tile == non_collion_tiles[i] {
			return false;
			break;
		}	
	}
	
	return true;
}

#endregion

#region //water
function tile_meeting_water(xx, yy, tilemap) {
	//from some video
	var xp, yp, meeting;

	//save our current position
	xp = x;
	yp = y;

	//move to the position where we wanna check for a tile collision
	x = xx;
	y = yy;

	//check for collision on all four corners of the collision mask
	meeting =		pixle_is_water(tilemap, bbox_right, bbox_top)
					||
					pixle_is_water(tilemap, bbox_right, bbox_bottom)
					||
					pixle_is_water(tilemap, bbox_left, bbox_top)
					||
					pixle_is_water(tilemap, bbox_left, bbox_bottom)

	//Move back to the original position
	x = xp;
	y = yp;

	return(meeting);
}
function pixle_is_water(tilemap, xx, yy) {
	
	var touching_water = false
	//water tiles indexes
	var water_tiles = [0, 191, 19, 20, 35, 36, 51, 52, 67, 68, 83, 84, 99, 100, 115, 116]
	
	//Lava tiles
	//29, 30, 45, 46, 61, 62, 77, 78, 93, 94, 109, 110, 25, 25, 31]
	
	var tile = tilemap_get_at_pixel(global.tilemap, xx, yy)
	
	for (var i = 0; i < array_length_1d(water_tiles); ++i) {
		
		if tile == water_tiles[i] {
			touching_water = true
		}
	}

	return touching_water;
}
	
	
#endregion
