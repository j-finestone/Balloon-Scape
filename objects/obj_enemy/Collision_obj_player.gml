if (state != enemy_states.dead) {
	//makes the enemy walk away after hitting the player
	x = xprevious
	y = yprevious
	if wanders then alarm[0] = -1; alarm[1] = 1;
}