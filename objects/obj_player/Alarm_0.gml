///@description attack end
global.gs = game_state.nm
instance_destroy(obj_staff)

//switch sprite back to normal
switch (sprite_index) {
	case player_down_attack:
		sprite_index = player_down; break;
	case player_up_attack:
		sprite_index = player_up; break;
	case player_left_attack:
		sprite_index = player_left; break;
	case player_right_attack:
		sprite_index = player_right; break;	
	
}
//cooldown
alarm[1] = cooldown