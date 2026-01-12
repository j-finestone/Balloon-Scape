//Remove choice thing from the text
if (string_pos("[choice]", text_rapped) != 0) {
	text_rapped = string_delete(text_rapped, string_pos("[choice]", text_rapped), 10) 
	message_length = string_length(text_rapped)
}

//outline
draw_set_color(outline_color)
draw_rectangle(screen_middle_x - size_x - outline_size,
			   screen_middle_y + (ofset_y_from_top)*is_player_ontop+size_y + outline_size,		   
			   screen_middle_x + size_x + outline_size, 
			   screen_middle_y + (ofset_y_from_top)*is_player_ontop-size_y - outline_size, false)
//actual box
draw_set_color(box_color)
draw_rectangle(screen_middle_x - size_x, screen_middle_y + (ofset_y_from_top)*is_player_ontop+size_y,
			   screen_middle_x + size_x, screen_middle_y + (ofset_y_from_top)*is_player_ontop-size_y, false)
		
//text
draw_set_color(c_black)
draw_set_font(fnt_textbox)
draw_text(screen_middle_x - size_x +text_ofset_x,
		  screen_middle_y + (ofset_y_from_top)*is_player_ontop-size_y + text_ofset_y, message_draw)
			