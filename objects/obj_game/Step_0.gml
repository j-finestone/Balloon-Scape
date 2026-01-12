#region //Define keyboard layout
if keyboard_mode == "Defult" {
//Keys defult
global.key_right = vk_right;
global.key_down = vk_down;
global.key_left = vk_left;
global.key_up = vk_up;
global.key_interact = ord("Z");
global.key_text_scrub = ord("X");
global.key_attack = ord("Z");
global.key_shield = vk_shift; //Make it so the discription of the shield says to press shift
global.key_blast = ord("C");
global.key_shuriken = ord("X");
global.key_recover = vk_space;
global.key_pause = vk_enter;
}
if keyboard_mode == "WASD" {
//Keys W A S D
global.key_right = ord("D");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_up = ord("W");
global.key_attack = ord("P");
global.key_interact = ord("P");
global.key_text_scrub = ord("O");
global.key_attack = ord("P");
global.key_shield = 219; //The keycode for [
global.key_blast = ord("I");
global.key_shuriken = ord("O")
global.key_recover = vk_space;
global.key_pause = vk_enter;
}
#endregion


if !global.paused {
	#region Updating if you have certain items into variables.
	//Update if you have the blast power
	if has_item("Blast power") {
		global.can_blast = ds_map_find_value(obj_items.inventory[find_item("Blast power")], "equiped");

	} else { global.can_blast = false };
	
	if has_item("Shurikens") {
		global.has_shurikens = ds_map_find_value(obj_items.inventory[find_item("Shurikens")], "equiped");

	} else { global.has_shurikens = false };
	
	if has_item("Floaty") {
		global.can_swim = ds_map_find_value(obj_items.inventory[find_item("Floaty")], "equiped");

	} else { global.can_swim = false };
	
	if has_item("Shield") {
		global.shield_unlocked = ds_map_find_value(obj_items.inventory[find_item("Shield")], "equiped");

	} else { global.shield_unlocked = false };
	
	#endregion
	
	
	global.tilemap = layer_tilemap_get_id("Tiles_1")
	
	#region //Dying
	var died_in_subway_game = false;
	if instance_exists(obj_subway_mini_game) {
		if obj_subway_mini_game._health <= 0 {
			died_in_subway_game = true;
		}
	}
	
	if health = 0 || died_in_subway_game {
		global.paused = true;
		previously_dead = false
		dying = true;
	}
	
	#endregion
	
	
	//checks if the heart meter was just filled up
	if global.heart_meter >= global.heart_meter_max && 
	    heart_meter_previous < global.heart_meter_max {
	
		audio_play_sound(snd_heart_meter_reaches_full, 0, false)
	
	
	}

	#region //pop-in pop-out

	//destroys all far away enemies and adds them to a list

	pop_out_distance = camera_get_view_width(view)*2
	
	//how far away the object has to be to pop in (so you dont see objects poping-in on the screen)
	var pop_in_min_distance = obj_camera.view_width/1.5+32
	
	with(all) {
		if object_get_parent(object_index) == obj_enemy
		//I added backround elements here a while after, so even though the variables say enemy, backround elements are included
		or object_get_parent(object_index) == obj_backround_element_collision
		or object_get_parent(object_index) == obj_backround_element {
			
			if distance_to_object(obj_player)>obj_game.pop_out_distance {
			//stores the information about the enemy for when we want to place it back
			values[0] = xstart
			values[1] = ystart
			values[2] = object_index
		
			ds_list_add(obj_game.deleted_enemy_list, values)
			instance_destroy()
			}
		}
	}
	//place enemies that are close to the camera back in
	if (!paused_last) {
		if obj_player.x != obj_player.xprevious || obj_player.y != obj_player.yprevious {
			for (var i = 0; i < ds_list_size(deleted_enemy_list); ++i) {
				var enemy_x = ds_list_find_value(deleted_enemy_list, i)[0]
				var enemy_y = ds_list_find_value(deleted_enemy_list, i)[1]
				var enemy_object = ds_list_find_value(deleted_enemy_list, i)[2]
	


				var distance_from_player = point_distance(enemy_x, enemy_y, obj_player.x, obj_player.y)
				
				if distance_from_player > pop_in_min_distance {
				   if distance_from_player < obj_game.pop_out_distance {
						instance_create_depth(enemy_x, enemy_y, -y, enemy_object)
		
						ds_list_delete(deleted_enemy_list, i)
						i--
				   }
				}
			}
		}
	}

	#endregion
}

#region //Music
try {
	if !global.paused {
		audio_resume_sound(backround_song);
		audio_sound_gain(backround_song, .4, 0)	
	
		if backround_song == snd_cloud_city_backround audio_sound_gain(backround_song, .9, 0)	
	}
	if global.paused {
		audio_sound_gain(backround_song, .2, 0)
	
		if backround_song == snd_cloud_city_backround audio_sound_gain(backround_song, .4, 0)	
	}

	if room != rm_world {
		audio_pause_sound(snd_overworld_backround)
	
	}
	if room != rm_sumbway_surfers and room != rm_item_collect {
		audio_pause_sound(snd_cloud_city_backround);
	
	}

	//decide which song is the one that should be played
	if room == rm_world {
		backround_song = snd_overworld_backround;
	}
	if room == rm_sumbway_surfers or room == rm_item_collect {
		backround_song = snd_cloud_city_backround
	
	}
} catch(i) {}
//Make music stop when dying
if dying {
	audio_pause_sound(snd_overworld_backround);
	audio_pause_sound(snd_cloud_city_backround);
}


#endregion	

#region //pausing
if keyboard_check_pressed(global.key_pause) && !instance_exists(obj_textbox) && (room != rm_game_end_cutscene) && !dying{
	//On pause event
	if !global.paused {
		instance_create_depth(x, y, depth-1, obj_inventory)	
		audio_play_sound(snd_open_inventory, 0, 0);
	}
	global.paused = !global.paused;
	
}


//adds all activated instances to a list and pauses them
//im not juat deactivating and reactivating all instances so i have the power
//to deactivate instances, and not have pausing effecting it

//when game has just been paused
if global.paused && !paused_last {
	with(all) {
		if object_index != obj_debug &&
		   object_index != obj_game &&
		   object_index != obj_textbox &&
		   object_index != obj_choice &&
		   object_index != obj_inventory &&
		   object_index != obj_items &&
		   object_index != obj_camera &&
		   object_index != obj_power_reciving_fx &&
		   object_index != obj_fx_explotion {
			ds_list_add(obj_game.paused_instances, id)
			instance_deactivate_object(id)
	   }
	}	
	pause_sprite = sprite_create_from_surface(application_surface,
	0, 0, obj_camera.view_width*2, obj_camera.view_height*2, false, true, 0, 0);
}
//when game has just been unpaused
if !global.paused && paused_last {
	//activate all instances in the list
	var list_len = ds_list_size(paused_instances)
	for (var i = 0; i < list_len; i++) {
		instance_activate_object(ds_list_find_value(paused_instances, i));
	}
	ds_list_clear(paused_instances);
	sprite_delete(pause_sprite);
}

paused_last = global.paused
#endregion
