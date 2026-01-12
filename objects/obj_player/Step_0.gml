if global.gs == game_state.nm || global.gs == game_state.in_water {
	
	#region Movement
	if (!knocking_back) {
		var x_at_begining = x
		var y_at_begining = y
		//movement
		xaxis = keyboard_check(global.key_right) - keyboard_check(global.key_left) 
		yaxis = keyboard_check(global.key_down) - keyboard_check(global.key_up)
		var _direction = point_direction(0,0,xaxis,yaxis)
		var _length = spd * (xaxis != 0 || yaxis != 0)
		xaxis = lengthdir_x(_length, _direction)
		yaxis = lengthdir_y(_length, _direction)
		
		if place_meeting(x+xaxis, y,obj_collision_marker) or tile_meeting(x+xaxis, y, global.tilemap) {
			
	        while (!place_meeting(x+sign(xaxis), y,obj_collision_marker) and !tile_meeting(x+sign(xaxis), y, global.tilemap)) {
	                 x += sign(xaxis);
	        }
			xaxis = 0;
		}
		x += xaxis;
		

		if place_meeting(x,y+yaxis,obj_collision_marker) or tile_meeting(x, y+yaxis, global.tilemap) {
			
			while (!place_meeting(x, y+sign(yaxis),obj_collision_marker) and !tile_meeting(x, y+sign(yaxis), global.tilemap)) {
	                 y += sign(yaxis);
	        }
			yaxis = 0;
		}
		y += yaxis		
	}
		#endregion
	
	#region Sprite animation
		//depth
		depth = -y
	if (!knocking_back) {
		//movement framerate control control
		if moving() then image_speed = 2 else image_speed = 0
		
		
		//regular sprites
		if (keyboard_check_pressed(global.key_up)) then sprite_index = player_up;
		if (keyboard_check_pressed(global.key_down)) then sprite_index = player_down;
		if (keyboard_check_pressed(global.key_right)) then sprite_index = player_right;
		if (keyboard_check_pressed(global.key_left)) then sprite_index = player_left;
	
		//to make sure the character still faces the right direction after relesing one of the keys
		if keyboard_check_released(global.key_up || global.key_down || global.key_right || global.key_left) {	
			if (abs(x_at_begining - x) > abs(y_at_begining - y)) {
				if (keyboard_check(global.key_right)) then sprite_index = player_right;
				if (keyboard_check(global.key_left)) then sprite_index = player_left;
			} else {
				if (keyboard_check(global.key_up)) then sprite_index = player_up;
				if (keyboard_check(global.key_down)) then sprite_index = player_down;
			}
		}
	}
	#endregion
		
	#region Walking sound
	if (!knocking_back && room == rm_world) {
		function footstep_is_playing() {
			if audio_is_playing(footstep_release_1) or
			   audio_is_playing(footstep_release_2) or
			   audio_is_playing(footstep_release_3) or
			   audio_is_playing(footstep_step_1) or
			   audio_is_playing(footstep_step_2) or
			   audio_is_playing(footstep_step_3) return true else return false;
		}
		if (!footstep_is_playing() && moving() && global.gs == game_state.nm) {
			if step_index == "step" {
				audio_play_sound(choose(footstep_release_1, footstep_release_2, footstep_release_3), 1, 0)
				step_index = "release"
			
			} else if step_index == "release" {
				audio_play_sound(choose(footstep_step_1, footstep_step_2, footstep_step_3), 1, 0)
				step_index = "step"
			}
		
		}
		if !moving() step_index = "step"
	}
	#endregion

	#region Atack
	//alarm[1] is the cooldown
	if global.gs = game_state.nm || global.gs == game_state.in_water || global.gs == game_state.shield && !knocking_back { 
		if keyboard_check_pressed(global.key_attack) and alarm[1] <= 1 and !instance_exists(obj_textbox) {
			alarm[0] = attack_length
			//Changes sprite and creates staff
				if sprite_index = player_down {
					if global.gs != game_state.in_water sprite_index = player_down_attack	
					var staff = instance_create_depth(x, y+12, depth, obj_staff)
					staff.sprite = "down"
			
				} else if sprite_index = player_up {
					if global.gs != game_state.in_water sprite_index = player_up_attack
					var staff = instance_create_depth(x, y-16, depth, obj_staff)
					staff.sprite = "up"
			
				} else if sprite_index = player_left {
					if global.gs != game_state.in_water sprite_index = player_left_attack
					var staff = instance_create_depth(x-16, y, depth, obj_staff)
					staff.sprite = "horizontal"
			
				} else if sprite_index = player_right {
					if global.gs != game_state.in_water sprite_index = player_right_attack
					var staff = instance_create_depth(x+32, y, depth, obj_staff)
					staff.sprite = "horizontal"
					staff.image_xscale = -1			
				}	
			global.gs = game_state.attack
			
			with(staff) { event_user(0) };
			}
	}
}
	#endregion
	
	#region Reciving damage	
	if (!invincibile && !knocking_back && global.gs != game_state.attack) {	
		var enemy_id = instance_place(x, y, obj_enemy)
		
		//For projectiles
		if enemy_id == noone {		
				enemy_id = instance_place(x, y, obj_projectile)
		}
		
		if (enemy_id != noone && enemy_id.sprite_index != spr_enemy_destroyed) {
			
			//scorpion effect
			scorpion_hit = false;
			if enemy_id.object_index == obj_scorpion scorpion_hit = true;
			
			//damage and knockback
			invincibile = true;
			//invincibility
			knocking_back = true
			alarm[2] = 10
			alarm[3] = invincibility_length
			
			//to get launched in the angle the enemy was going
			xknockback = (enemy_id.x - enemy_id.xprevious)
			yknockback = (enemy_id.y - enemy_id.yprevious)
				
			if (xknockback == 0 && yknockback == 0) {
				switch(sprite_index) {
					case player_left: xknockback = knockback_force; break;
					case player_right: xknockback = -knockback_force; break;
					case player_down: yknockback = -knockback_force; break;
					case player_up: yknockback = knockback_force; break;
					}
				}
				health--
				audio_play_sound(snd_take_damage, 1, false);
				alarm[0] = 1
				
				//make the enemy stop chasing the player
				if (enemy_id == obj_enemy) {
					with(enemy_id) {
						alarm[3] = 3 * room_speed
						state = enemy_states.wandering
					
						event_perform(ev_alarm, 0)
					}
				}
			}
		}
//so the knock back is also affected by collision
if (!place_meeting(x+xknockback, y+yknockback, obj_collision_marker)) {
	repeat(knockback_force) {
		if (!place_meeting(x+sign(xknockback), y, obj_collision_marker)) {
			//tile
			if !tile_meeting(x+sign(xknockback), y,global.tilemap) {
				x += sign(xknockback)	
			}
		}		
	}
	repeat(knockback_force) {
		if (!place_meeting(x, y+sign(yknockback), obj_collision_marker)) {
			//tiles
			if !tile_meeting(x, y+sign(yknockback), global.tilemap) {
				y += sign(yknockback)
			}
		}
	}
}
#endregion
	
	#region Sheild
	var shield_equiped = false
	try {
		if has_item("Shield") shield_equiped = ds_map_find_value(obj_items.inventory[find_item("Shield")], "equiped")
	} catch(filler) {filler=3};
	if (global.shield_unlocked && shield_equiped && !invincibile && !knocking_back && global.gs = game_state.nm or global.gs = game_state.shield) {
		if keyboard_check(global.key_shield) {
			
			global.gs = game_state.shield;
			image_speed = 0;
			
			//when its first created
			if !instance_exists(obj_shield) {
				instance_create_depth(x, y, depth, obj_shield)
			}
		}
		if keyboard_check_released(global.key_shield) or obj_game.paused_last {
			  
			
			global.gs = game_state.nm
		}
	}
	#endregion
	
	#region Blast
	if global.can_blast && !audio_is_playing(snd_blast) && keyboard_check_pressed(global.key_blast) && room != rm_sumbway_surfers && room != rm_game_end_cutscene {
		if global.heart_meter >= 5 {
			
			global.heart_meter-=5;
			instance_create_depth(x, y, depth+1, obj_blast);
			audio_play_sound(snd_blast, 0, 0);
		}
	}
	#endregion
	
	#region Shuriken
	if global.has_shurikens && keyboard_check_pressed(global.key_shuriken) && (global.gs == game_state.nm || global.gs == game_state.in_water) {
		if global.heart_meter >= 1 && !place_meeting(x, y, obj_collision_marker) {
			
			global.heart_meter-=1;
			instance_create_depth(x+8, y+8, depth+1, obj_shuriken);
		}
	}
	#endregion
	
	#region Water check
	var changed_state = true;
	if tile_meeting_water(x, y, global.tilemap) {
		if global.gs != game_state.attack {
			global.gs = game_state.in_water
			changed_state = true;
		}
	} else if gs_previous = game_state.in_water {
		global.gs = game_state.nm
		changed_state = true;
	}
	
if changed_state {
	//check if it should change to the swimming or normal sprite
	if global.gs == game_state.nm {
		//walk sprites
		player_down = spr_player_down
		player_up = spr_player_up
		player_left = spr_player_left
		player_right = spr_player_right

	} else if global.gs == game_state.in_water {
		//swim sprites
		player_down = player_down_swim
		player_up = player_up_swim
		player_left = player_left_swim
		player_right = player_right_swim
	}
	//redo the sprite checking
	switch(sprite_index) {
		case spr_player_down: sprite_index = player_down; break;
		case spr_player_up: sprite_index = player_up; break;
		case spr_player_left: sprite_index = player_left; break;
		case spr_player_right: sprite_index = player_right; break;
		//swim sprites
		case spr_player_swim_down: sprite_index = player_down; break;
		case spr_player_swim_up: sprite_index = player_up; break;
		case spr_player_swim_left: sprite_index = player_left; break;
		case spr_player_swim_right: sprite_index = player_right; break;
	}	
	if global.gs = game_state.in_water 
	if moving() {
		image_speed = 2
	} else {
		image_speed = 1
	}
}
gs_previous = global.gs
#endregion

depth = -y
