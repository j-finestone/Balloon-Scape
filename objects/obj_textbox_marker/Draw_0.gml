/// @description Draw press Z button

if place_meeting(x,y, obj_player) {
	
	if obj_game.keyboard_mode == "Defult" {
		var interact_key_sprite = spr_press_z;
		
	} 
	else if obj_game.keyboard_mode == "WASD" {
		var interact_key_sprite = spr_press_e;
	}
	
	draw_sprite(interact_key_sprite, 0, obj_player.x+16, obj_player.y-16+ (frame*4))
	
	
	
}
