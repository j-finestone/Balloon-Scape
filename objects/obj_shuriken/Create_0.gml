switch (obj_player.sprite_index) {
    case obj_player.player_up:
        dir = "up";
		break;
	case obj_player.player_down:
        dir = "down";
        break;
	case obj_player.player_right:
        dir = "right";
        break;
	case obj_player.player_left:
        dir = "left";
        break;
}

spd = 6

if room != rm_sumbway_surfers && room != rm_game_end_cutscene {
	audio_play_sound(snd_shuriken_throw, 0, 0);
}
