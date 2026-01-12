//its a begin step so i can use the regualar step event in its children
depth = -y

//damage and knockback
if (hittable && !invincibile && instance_exists(obj_staff)) {	
	if  (obj_staff.colliding_enemy_id == id) && (obj_staff.colliding_with_enemy) {
		invincibile = true;
		//invincibility
		alarm[2] = 10
		global.heart_meter += meter_strength
		switch(obj_player.sprite_index) {
			case spr_player_attack_down: yknockback = knockback_force; break;
			case spr_player_attack_up: yknockback = -knockback_force; break;
			case spr_player_attack_left: xknockback = -knockback_force; break;
			case spr_player_attack_right: xknockback = knockback_force; break;
			//swim
			case spr_player_swim_down: yknockback = knockback_force; break;
			case spr_player_swim_up: yknockback = -knockback_force; break;
			case spr_player_swim_left: xknockback = -knockback_force; break;
			case spr_player_swim_right: xknockback = knockback_force; break;
			
		}
	
		_health--
		
		//So the enemy doesn't shoot right after being hit
		if shoots_projectiles then alarm[4] = random_range(1, projecile_max_frequency)*room_speed
		
		//play hitting/death sound effects
		if _health > 0 {
			audio_play_sound(snd_take_damage_enemy, 0, 0)
		} else {
			
			audio_play_sound(snd_enemy_die, 0, 0)
			//Drops
			var does_drop = irandom_range(0, drop_rarity);
			
			if does_drop == 1 {
				instance_create_depth(x, y, depth, choose
				(obj_money, obj_heart))
			}
			
		}
	}
}	
//Getting damaged by the blast.
if hittable && !invincibile && instance_exists(obj_blast) {
	if  (obj_blast.colliding_enemy_id == id) && (obj_blast.colliding_with_enemy) {
		invincibile = true;
		//invincibility
		alarm[2] = 10
		if obj_blast.sprite_index = spr_blast_y && image_yscale = -1 yknockback = knockback_force; 
		if obj_blast.sprite_index = spr_blast_y && image_yscale = 1 yknockback = -knockback_force;
		if obj_blast.sprite_index = spr_blast_x && image_xscale = 1 xknockback = -knockback_force;
		if obj_blast.sprite_index = spr_blast_x && image_xscale = -1 xknockback = knockback_force;

		_health-=5;
		
		//So the enemy doesn't shoot right after being hit
		if shoots_projectiles then alarm[4] = random_range(1, projecile_max_frequency)*room_speed
		
		//play hitting/death sound effects
		if _health > 0 {
			audio_play_sound(snd_take_damage_enemy, 0, 0)
		} else {
			
			audio_play_sound(snd_enemy_die, 0, 0)
			//Drops
			var does_drop = irandom_range(0, drop_rarity);
			
			if does_drop == 1 {
				instance_create_depth(x, y, depth, choose
				(obj_money, obj_heart))
			}
			
		}
	}
}

//Getting damaged by the shuriken.
if hittable && !invincibile && instance_exists(obj_shuriken) {
	var shuriken_id = instance_place(x, y, obj_shuriken)
	
	if shuriken_id != noone {
		if  (shuriken_id.colliding_enemy_id == id) && (shuriken_id.colliding_with_enemy) {
			invincibile = true;
			//invincibility
			alarm[2] = 10
			if shuriken_id.dir == "down" yknockback = knockback_force; 
			if shuriken_id.dir == "up" yknockback = -knockback_force;
			if shuriken_id.dir == "left" xknockback = -knockback_force;
			if shuriken_id.dir == "right" xknockback = knockback_force;


			_health-=1
		
			//So the enemy doesn't shoot right after being hit
			if shoots_projectiles then alarm[4] = random_range(1, projecile_max_frequency)*room_speed
		
			//play hitting/death sound effects
			if _health > 0 {
				audio_play_sound(snd_take_damage_enemy, 0, 0)
				instance_destroy(shuriken_id);
			} else {
			
				audio_play_sound(snd_enemy_die, 0, 0)
				//Drops
				var does_drop = irandom_range(0, drop_rarity);
			
				if does_drop == 1 {
					instance_create_depth(x, y, depth, choose
					(obj_money, obj_heart))
				}
			
			}
		}
	}
}


x += xknockback
y += yknockback

//wandering
if state = enemy_states.wandering || state = enemy_states.wandering_to_player {
	if alarm[0] == -1 && alarm[1] == -1 {
		
		alarm[0] = random_range(1, max_movment_wait * room_speed)		
	}
	x += move_dir_x
	y += move_dir_y	
	
	if is_perpendicular(obj_player) and point_distance(obj_player.x,
		obj_player.y, x, y) > point_distance(obj_player.x,
		obj_player.y, x+move_dir_x, y+move_dir_y)  {
			
		move_dir_x = 0;
		move_dir_y = 0;
		
		alarm[0] = room_speed+10
		alarm[4] = room_speed
	}
}

//chasing
if (!invincibile && state = enemy_states.chasing) {
	var dx = obj_player.x -x;
	var dy = obj_player.y - y;
	distance_from_player = sqrt(dx*dx + dy*dy);
	if (distance_from_player > -3) {
			dx = dx * spd / distance_from_player;
			dy = dy * spd / distance_from_player;
	}
	if (uses_collision) {
		if !place_meeting(x + dx, y, obj_collision_marker) &&
		!tile_meeting(x + dx, y, global.tilemap) x += dx
		
		if !place_meeting(x, y + dy, obj_collision_marker) &&
		!tile_meeting(x, y + dy, global.tilemap) y += dy
		
	} else {
			x += dx
			y += dy
	}
}


//choosing the sprite
if (!invincibile) {
	switch(round(point_direction(xprevious,yprevious,x,y)/90)){
		case 0: sprite_index = spr_right; break;
		case 1:sprite_index = spr_up; break;
		case 2: sprite_index = spr_left; break;
		case 3: sprite_index = spr_down; break;
	}
}

if place_meeting(x, y, obj_collision_marker) or
	tile_meeting(x, y, global.tilemap) {
	if uses_collision {
		x = xprevious
		y = yprevious
		if wanders then alarm[0] = 0; alarm[1] = 1;
	}
}
	
	
//health/death
if _health <= 0 {
	sprite_index = spr_enemy_destroyed
	xknockback = 0
	yknockback = 0
}
if _health <= 0 && !invincibile {
		values[0] = xstart
		values[1] = ystart
		values[2] = object_index
		
		ds_list_add(obj_game.deleted_enemy_list, values)
		instance_destroy()
	
}