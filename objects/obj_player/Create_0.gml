xknockback = 0
yknockback = 0
knocking_back = false
invincibility_opacity = 0
invincibile = false
gs_previous = 0
scorpion_hit = false;
step_index = "step"



spd = 1.5
attack_length = 10
cooldown = 10
knockback_force = 3
invincibility_length = 1 * room_speed

function moving() {
	if x != xprevious || y != yprevious return true else return false
}
enum game_state {
	nm, //normal movement
	in_water,
	attack,
	shield,
	null
}

//walk sprites
player_down = spr_player_down
player_up = spr_player_up
player_left = spr_player_left
player_right = spr_player_right

//attack sprites
player_down_attack = spr_player_attack_down
player_up_attack = spr_player_attack_up
player_left_attack = spr_player_attack_left
player_right_attack = spr_player_attack_right

//swim sprites
player_down_swim = spr_player_swim_down
player_up_swim = spr_player_swim_up
player_left_swim = spr_player_swim_left
player_right_swim = spr_player_swim_right


randomize()	

