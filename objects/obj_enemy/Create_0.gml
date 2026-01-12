move_dir_x = 0
move_dir_y = 0
xknockback = 0
yknockback = 0
distance_from_player = 0
invincibile = false
alarm[3] = 3 * room_speed
if shoots_projectiles then alarm[4] = random_range(1, projecile_max_frequency)*room_speed

enum enemy_states {
	wandering,
	wandering_to_player,
	wander_back,
	chasing,
	dead
	
}
state = enemy_states.wandering;
