//outline
show_debug_message(ofset_x_from_left)

draw_set_color(outline_color)
draw_rectangle(screen_middle_x - size_x - outline_size + ofset_x_from_left,
			   screen_middle_y + (ofset_y_from_top)+size_y + outline_size,		   
			   screen_middle_x + size_x + outline_size + ofset_x_from_left, 
			   screen_middle_y + (ofset_y_from_top)-size_y - outline_size, false)
//actual box
draw_set_color(box_color)
draw_rectangle(screen_middle_x - size_x + ofset_x_from_left,
			   screen_middle_y + (ofset_y_from_top) + size_y,
			   screen_middle_x + size_x + ofset_x_from_left,
			   screen_middle_y + (ofset_y_from_top) - size_y, false)
			 	 
//text
draw_set_color(c_black)
draw_set_font(fnt_textbox)

//Options
var i = 0;
repeat(choice_number) {
	var colomb = (i>2);
	
	if selection_index == i {
		//Draw selected options
		draw_set_color(c_red)
		draw_text(screen_middle_x - size_x + text_ofset_x + ofset_x_from_left + colomb*columb_offset,
				  screen_middle_y + (ofset_y_from_top) - size_y + text_ofset_y + (gap*i-(colomb*gap*3)), ">" + choice[i]);
	
	} else {
		//Draw non selected options
		draw_set_color(c_black);
		draw_text(screen_middle_x - size_x + text_ofset_x + ofset_x_from_left + colomb*columb_offset,
				  screen_middle_y + (ofset_y_from_top) - size_y + text_ofset_y + (gap*i-(colomb*gap*3)), choice[i]);
	
	}
	i++;
}
