//Drawing screen shots when pausing
#region Pausing 
if global.paused and variable_instance_exists(id, "pause_sprite") {
	draw_sprite_ext(pause_sprite, 0, 0, 0, .5, .5, 0, c_white, 1)	
}


#endregion


if room != rm_sumbway_surfers {
	#region //health
	//draw hearts
	for (var i = 1; i <= global.player_max_health; ++i) {
	    draw_sprite(spr_heart, !(health >= i), 
		((8 * i) + i ) + 16, 4)
	}

	//clamp health and heart meter
	health = clamp(health, 0, global.player_max_health);
	global.heart_meter = clamp(global.heart_meter, 0, global.heart_meter_max);

	//Can't recover sound effect
	if global.heart_meter < global.heart_meter_max/2 && !global.paused {
		if keyboard_check_pressed(global.key_recover) {

			audio_play_sound(snd_cant_heal, 0, 0);
		}
	}
	
	//health bar shake when full
	var shake_x = 0;
	var shake_y = 0;
	if global.heart_meter >= global.heart_meter_max/2 {
		//so the shake only happens when the meter is at full
		if meter_dispayed+.1 >= global.heart_meter_max/2 {
			shake_x = random_range(-1, 1)
			shake_y = random_range(-1, 1)
		}
	
		//recover
		if keyboard_check_pressed(global.key_recover) && !global.paused {
			if global.player_max_health != health {
				audio_play_sound(snd_recover, 0, false);
				global.heart_meter -= global.heart_meter_max/2;
				health++;
			} else {
				audio_play_sound(snd_cant_heal_old, 0, 0);
			}
		}
	}


	//define location
	var bar_x = 4;
	var bar_y = 4;
	//make heal
	meter_dispayed = lerp(meter_dispayed, global.heart_meter, .1)
	//meeter sprite
	draw_sprite(spr_heart_meater, (meter_dispayed+.1 >= global.heart_meter_max/2), bar_x+shake_x, bar_y+shake_y);
	//actual meeter
	draw_healthbar(bar_x+shake_x+4, bar_y+shake_y+4, bar_x+shake_x+11, bar_y+shake_y+28, (meter_dispayed/global.heart_meter_max) * 100, c_gray, c_blue, c_white, 3, true, false)
	//line on bar
	draw_set_color(c_orange)
	draw_line(bar_x+shake_x+3, bar_y+shake_y+17, bar_x+shake_x+11.5, bar_y+shake_y+ 17)
	//money
	draw_sprite(spr_money, 0, obj_camera.view_width - 48, 5)

	heart_meter_previous = global.heart_meter;
	#endregion

	//money text
	draw_set_font(fnt_money);
	draw_set_color(c_white);
	draw_text(obj_camera.view_width -32, 5, global.money);
	
	
	#region //Map
	try {
		if (!global.paused && room = rm_world) {
			var size_change = 50;
			var screen_middle_x = obj_camera.view_width/2
	
			draw_set_color(c_grey)
			draw_set_alpha(.5)
	
			//Draw box
			draw_rectangle(screen_middle_x-(room_width/size_change/2), 2,
							screen_middle_x+(room_width/size_change/2), room_height/size_change, false)
			//Draw outline
			draw_set_alpha(.8)
			draw_set_color(c_black)
			draw_rectangle(screen_middle_x-(room_width/size_change/2), 2,
							screen_middle_x+(room_width/size_change/2), room_height/size_change, true)
		
		
			//Draw player
			draw_set_alpha(1.0)
			draw_set_color(c_blue)
			draw_rectangle(screen_middle_x+(obj_player.x/size_change)-(size_change), obj_player.y/size_change,
						   1+screen_middle_x+(obj_player.x/size_change)-(size_change), (obj_player.y/size_change)+1, false)
			//Draw end-game marker
			_id = inst_21DA3DF7;
			draw_set_color(c_yellow)
			draw_rectangle(screen_middle_x+(_id.x/size_change)-(size_change), _id.y/size_change,
						1+screen_middle_x+(_id.x/size_change)-(size_change), (_id.y/size_change)+1, false)
			
			//Draw hot air ballons
			draw_set_color(c_red);
		
			for (var i = 0; i < ds_list_size(obj_game.map_marker_id); ++i) {
				var _id = ds_list_find_value(obj_game.map_marker_id, i)
			
			    draw_rectangle(screen_middle_x+(_id.x/size_change)-(size_change), _id.y/size_change,
						   1+screen_middle_x+(_id.x/size_change)-(size_change), (_id.y/size_change)+1, false)
			}
			
			//Draw M
			draw_set_alpha(.5)
			draw_set_halign(fa_middle)
			draw_set_font(fnt_textbox)
			draw_set_color(c_aqua)
			//draw_text(screen_middle_x, 4, "MAP")
			
			draw_set_halign(fa_left)
			
			//Draw all enemies	
			if global.debug_mode if keyboard_check(vk_shift) {
				draw_set_color(c_orange);
			
				for (var i = 0; i < instance_number(all); ++i) {
					var _id = instance_id_get(i)
			
				    draw_rectangle(screen_middle_x+(_id.x/size_change)-(size_change), _id.y/size_change,
							   1+screen_middle_x+(_id.x/size_change)-(size_change), (_id.y/size_change)+1, false)
				}
			
				//Draw screen on map
				draw_set_color(c_black)
				draw_rectangle(screen_middle_x+(camera_get_view_x(view)/size_change)-(size_change), camera_get_view_y(view)/size_change,
							1+screen_middle_x+((camera_get_view_x(view)+camera_get_view_width(view))/size_change)-(size_change), ((camera_get_view_y(view)+camera_get_view_height(view))/size_change)+1, true)
			
				//Draw player
				draw_set_color(c_blue)
				draw_rectangle(screen_middle_x+(obj_player.x/size_change)-(size_change), obj_player.y/size_change,
							   1+screen_middle_x+(obj_player.x/size_change)-(size_change), (obj_player.y/size_change)+1, false)
							   
			}
		
	
			draw_set_alpha(1);
		}
	} catch(i) {i = 0}
	#endregion
	
	#region //Draw objective marker in the screen corner
	if room == rm_world {
		if !global.paused {
			draw_set_color(c_black)
			draw_set_halign(fa_right)
			draw_set_font(fnt_textbox);
			
			var has_four_keys = false;
			if has_item("Key") {
				if ds_map_find_value(obj_items.item_key, "amount") >= 4 has_four_keys = true;
			}
			if !has_four_keys {
				draw_text(obj_camera.view_width-16, obj_camera.view_height-16, "Objective: Find All 4 Balloons");
			} else {
				draw_text(obj_camera.view_width-16, obj_camera.view_height-16, "Objective: Enter The Getaway Balloon Up North");
				
			}
			draw_set_halign(fa_left)
		}	
	}
	
	#endregion
	
	#region //Make the screen a differant color durring the first textbox
	if first_textbox_open {
		draw_set_color(start_game_background_color)
		draw_rectangle(0, 0, obj_camera.view_width, obj_camera.view_height, false);
		
		if !instance_exists(obj_textbox) {
			first_textbox_open = false
			audio_play_sound(snd_overworld_backround, 10, true);
			audio_play_sound(snd_cloud_city_backround, 10, true);
		}
	}
	#endregion
}
	

	
