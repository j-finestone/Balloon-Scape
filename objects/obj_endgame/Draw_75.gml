if started_screen_fade {
	draw_set_color(c_orange)
	draw_set_alpha(screen_alpha)


	draw_rectangle(0, 0, 1500, 1500, false);
	
	screen_alpha+=.005
}
if show_text = true {
	//Show "THE END" text
	draw_set_font(fnt_game_over);
	draw_set_color(c_black)
	draw_set_alpha(1)
	
	draw_set_halign(fa_center);
	draw_text(384/2, 216/3, "THE END");
	
	
	//Draw restart question
	if show_reset_game_text {
		draw_set_color(c_red);
		draw_set_font(fnt_money);
		draw_text(384/2, 216/3 + 100, "> Restart Game");	
		if keyboard_check_pressed(global.key_interact) game_restart();
		
	}
	
	draw_set_halign(fa_left);
}
