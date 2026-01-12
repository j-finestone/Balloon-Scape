if (dying) {

	//Draw death screen
	draw_set_color(c_black)
	draw_rectangle(0, 0, 1000, 1000, false)
	
	if showing_death_text == false {
		instance_activate_object(obj_player)
		var player_draw_x = obj_player.x-camera_get_view_x(view)
		var player_draw_y = obj_player.y-camera_get_view_y(view)
		instance_deactivate_object(obj_player);
		
		if room = rm_sumbway_surfers {
			instance_activate_object(obj_subway_player);
			var player_draw_x = obj_subway_player.x-camera_get_view_x(view);
			var player_draw_y = obj_subway_player.y-camera_get_view_y(view);
			instance_deactivate_object(obj_subway_player);
		}
	
		if dying_sprite_index >= 4 dying_sprite_index = 0;
	
		var dying_sprite = spr_player_down;
		switch (dying_sprite_index) {
		    case 0:
		        dying_sprite = spr_player_down
		        break;
		    case 1:
		        dying_sprite = spr_player_left
		        break;
		    case 2:
		        dying_sprite = spr_player_up
		        break;
		    case 3:
		        dying_sprite = spr_player_right
		        break;
		}
	
	
		draw_sprite(dying_sprite, 0, player_draw_x, player_draw_y)
	
		//Anitiate the alarm for the start of the spin 
		if !previously_dead { 
				alarm[0] = 1;
				spinning = true;
			
				audio_play_sound(snd_death_spin, 0, 0);
			
				previously_dead = true;
				alarm[1] = 2*room_speed
			
			}
	} else {
		//Draw game over text
		draw_set_halign(fa_center)
		draw_set_font(fnt_game_over)
		draw_set_color(c_white);
		var text_x = camera_get_view_width(view)/2
		var text_y = 25
		
		draw_text(text_x, text_y, "GAME OVER")
		
		//Draw restart question
		draw_set_color(c_red);
		draw_set_font(fnt_money);
		draw_text(text_x, 150, ">Restart");
		
		draw_set_halign(fa_left)
		
		if keyboard_check_pressed(global.key_interact) {
			//Respawning
			dying = false;
			dying_sprite_index = 0;
			previously_dead = false;
			spinning = false;
			showing_death_text = false;
			global.paused = false;
			global.heart_meter = 0
			health = global.player_max_health
			audio_play_sound(snd_inventory_select, 0, 0);
			reset_backround_sounds()
		
		
			instance_activate_object(obj_player);
			obj_player.xknockback = 0
			obj_player.yknockback = 0
			obj_player.knocking_back = false
			obj_player.invincibile = false
			
			if room == rm_world {
			obj_player.sprite_index = spr_player_up
			obj_player.x = 1904;
			obj_player.y = 1952;
			room = rm_world;
			}
			
			//Dying when in the Subway Surfers mini game
			if room == rm_sumbway_surfers {
				obj_player.sprite_index = spr_player_down
				room = rm_world;
				
				//Choose where to respawn
				switch (global.powers_to_recive) {
				    case powers_to_recive.blast:
				        obj_player.x = 1664;
						obj_player.y = 1120;
				        break;
				    case powers_to_recive.hearts:
				        obj_player.x = 4864;
						obj_player.y = 848;
				        break;
				    case powers_to_recive.shuriken:
				        obj_player.x = 144;
						obj_player.y = 1088;
				        break;
				    case powers_to_recive.swim:
				        obj_player.x = 3440;
						obj_player.y = 288;
				        break;
					default:
					    obj_player.x = 1904;
						obj_player.y = 1952;
					    break;
				}
			}
		}
	}
	
}
	
	
	
	
#region //Draw title screen
if title_screen_open {
	//Draw backround
	draw_set_color(start_game_background_color)
	draw_rectangle(0, 0, obj_camera.view_width, obj_camera.view_height, false);

	//Draw text
	draw_set_font(fnt_game_over)
	var text = "Start New Game";
	var text_x = (obj_camera.view_width/2)-(string_width(text)/2)
	
	//Backdrop border
	var border_size = 12
	draw_set_color(c_black)
	draw_rectangle(text_x-border_size, 48-border_size, text_x+string_width(text)+border_size, 48+string_height(text)+border_size, false)
	
	//Backdrop
	var border_size = 8
	draw_set_color(c_gray)
	draw_rectangle(text_x-border_size, 48-border_size, text_x+string_width(text)+border_size, 48+string_height(text)+border_size, false)
	
	//Draw text
	draw_set_color(c_red)
	draw_text(text_x, 48, text)
	
	//Draw "Press Z"
	draw_set_halign(fa_middle)
	draw_set_font(fnt_textbox)
	draw_set_color(c_black)
	draw_text(obj_camera.view_width/2, 145, "Press Z");
	draw_set_halign(fa_left)
	
	//On Key Press
	if keyboard_check_pressed(global.key_interact) {
		title_screen_open = false;
		
		
	}
}

#endregion
