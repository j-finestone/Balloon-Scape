colliding_with_enemy = false
colliding_enemy_id = pointer_null
dir = "left"
spd = 7

//Correct for offset of origin being in the centure.
x+=8
y+=8

switch (obj_player.sprite_index) {
    case obj_player.player_up:
        dir = "up"
		sprite_index = spr_blast_y_wide
        break;
	case obj_player.player_down:
        dir = "down"
		sprite_index = spr_blast_y_wide
		image_yscale = -1
        break;
	case obj_player.player_right:
        dir = "right"
		sprite_index = spr_blast_x_wide
		image_xscale = -1
        break;
	case obj_player.player_left:
        dir = "left"
		sprite_index = spr_blast_x_wide
        break;
}


