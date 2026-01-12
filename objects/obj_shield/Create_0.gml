anim_location = 0;
anim_speed = 10;
var offset = 15;
//choose sprite
switch (obj_player.sprite_index) {
    case obj_player.player_up:
        anim_location = 0;
		y-=offset;
        break;
	case obj_player.player_down:
        anim_location = 2;
		y+=offset;
        break;
	case obj_player.player_right:
        anim_location = 4;
		x+=offset;
        break;
	case obj_player.player_left:
        anim_location = 6;
		x-=offset;
        break;
    default:	
        break;
}
image_speed = 0
image_index = anim_location;
alarm[0] = anim_speed;

if room != rm_sumbway_surfers && room != rm_game_end_cutscene {
	audio_play_sound(snd_shield, 0, 0)
}
