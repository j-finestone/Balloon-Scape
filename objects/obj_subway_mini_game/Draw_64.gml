//draw hearts
for (var i = 1; i <= max_health; ++i) {
	draw_sprite(spr_heart, !(_health >= i), 
	((8 * i) + i), 20)
}

if !start_state {
	draw_set_color(c_black)
	draw_set_font(fnt_textbox)
	draw_text(8, 4, "Distance to top:");
	draw_text(8+string_width("Distane to top:  "), 4, alarm[1]/room_speed);
}

