if instance_number(obj_game) > 1 instance_destroy()

instance_create_depth(x, y, depth, obj_shadow_handler)
instance_create_depth(x, y, depth, obj_debug)
instance_create_depth(x, y, depth, obj_camera)

display_set_gui_size(obj_camera.view_width, obj_camera.view_height)
health = 4
global.gs = game_state.nm; //GS stands for game state
global.player_max_health = 4;
global.heart_meter_max = 10;
global.heart_meter = 0;
global.money = 0;
global.paused = false;
global.tilemap = layer_tilemap_get_id("Tiles_1");

//Abilities
global.can_swim = true;
global.can_blast = false;
global.has_shurikens = false;
global.shield_unlocked = false;
global.weapon = "defult"

meter_dispayed = 0;
paused_last = global.paused
heart_meter_previous = global.heart_meter
deleted_enemy_list = ds_list_create()
paused_instances = ds_list_create()
start_game_background_color = #45a5ba;

//Death variables
dying = false;
dying_sprite_index = 0;
previously_dead = false;
spinning = false;
showing_death_text = false;


//Options include blast, swim...
enum powers_to_recive {
	blast,
	swim,
	hearts,
	shuriken //Shoot out a 16 by 16 shurikin at the cost of a tiny bit of health meter.
}

global.powers_to_recive = powers_to_recive.blast;

//Map point IDs
map_marker_id = ds_list_create();


global.deleted_items = ds_list_create();


#region //Initialize keyboard layout
keyboard_mode = "Defult"

if keyboard_mode == "Defult" {
//Keys defult
global.key_right = vk_right;
global.key_down = vk_down;
global.key_left = vk_left;
global.key_up = vk_up;
global.key_interact = ord("Z");
global.key_text_scrub = ord("X");
global.key_attack = ord("Z");
global.key_shield = vk_shift;
global.key_blast = ord("C");
global.key_shuriken = ord("X");
global.key_recover = vk_space;
global.key_pause = vk_enter;
}

if keyboard_mode == "WASD" {
//Keys W A S D
global.key_right = ord("D");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_up = ord("W");
global.key_attack = ord("P");
global.key_interact = ord("P");
global.key_text_scrub = ord("O");
global.key_attack = ord("P");
global.key_shield = ord("[");
global.key_blast = ord("I");
global.key_shuriken = ord("O")
global.key_recover = vk_space;
global.key_pause = vk_enter;
}
#endregion

//Initialize obj_items. It has to be done here because it uses a 
//variable that's defined here
instance_create_depth(x, y, depth, obj_items)

//Music stuff
backround_song = snd_overworld_backround;
//Make music restart when changing rooms
function reset_backround_sounds() {
	audio_stop_sound(snd_overworld_backround);
	audio_stop_sound(snd_cloud_city_backround);
	
	audio_play_sound(snd_overworld_backround, 10, 1)
	audio_play_sound(snd_cloud_city_backround, 10, 1)
}

audio_stop_all();

title_screen_open = true;
global.paused = true;
first_textbox_open = true;

create_textbox("",
"This planet's inhabitants will pay for the crimes they have commited.", 
"I know you disagree, but it's too late, and the matter has been settled.",
"Your escape from this cataclysmic fate lies behind a locked gate north of here.", 
"Because I am unable to deliver the keys to open the gate to you directly, I have hidden them in cloud cities (accessed via hot air balloon).",
"Your mission is to find the 4 hot air balloons, retrieve the keys from them, and then head to the top of the map to escape from this planet before its fated destruction.",
"Good luck.")
