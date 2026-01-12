#region //Draw box
//Outline
draw_set_color(outline_color)
draw_rectangle(screen_middle_x - size_x - outline_size,
				screen_middle_y + (ofset_y_from_top)*+size_y + outline_size,		   
				screen_middle_x + size_x + outline_size, 
				screen_middle_y + (ofset_y_from_top)*-size_y - outline_size, false)
//Actual box
draw_set_color(box_color)
draw_rectangle(screen_middle_x - size_x,
				screen_middle_y + (ofset_y_from_top)*+size_y,
				screen_middle_x + size_x, 
				screen_middle_y + (ofset_y_from_top)*-size_y, false)
		
#endregion

#region //Draw hearts and money
for (var i = 1; i <= global.player_max_health; i++) {
	draw_sprite(spr_heart, !(health >= i), 
	((8 * i) + i ) + 16, 24)
}
draw_sprite(spr_money, 0, 64, 16)
draw_set_font(fnt_money);
draw_set_color(c_black);
draw_text(86, 16, global.money);
#endregion

#region //Draw item boxes
var i = 0;
for (var _y = 0; _y <= box_array_length; _y++) {
	for (var _x = 0; _x <= box_array_width; _x++) {
			
		//Draw outline
		draw_set_color(outline_color)
		if selected_column == _y && selected_row == _x draw_set_color(#e03e28)
			
		draw_roundrect(32+(box_dimentiones*_x)+(box_spacing*_x)-(box_outline_thickness/2),
						48+(box_dimentiones*_y)+(box_spacing*_y)-(box_outline_thickness/2),
					    32+(box_dimentiones*(_x+1))+(box_spacing*_x)+(box_outline_thickness/2),
						48+(box_dimentiones*(_y+1))+(box_spacing*_y)+(box_outline_thickness/2),false)
						   
		//Draw main box	
		draw_set_color(c_white)
		//Make the backround of equiped items a different color
		if ds_map_find_value(obj_items.inventory[i], "equiped") draw_set_color(c_silver);
		
		draw_roundrect(32+(box_dimentiones*_x)+(box_spacing*_x),
						48+(box_dimentiones*_y)+(box_spacing*_y),
					    32+(box_dimentiones*(_x+1))+(box_spacing*_x),
						48+(box_dimentiones*(_y+1))+(box_spacing*_y),false)
		i++;
	}
}
	
#endregion

#region //Draw items in boxes
var i = 0;
for (var _y = 0; _y <= box_array_length; _y++) {
	for (var _x = 0; _x <= box_array_width; _x++) {
		
		#region //Have bucket be drawn differently if it is filled
		var index_to_draw = 0;
		if ds_map_find_value(obj_items.inventory[i], "name") == "Bucket" {
			var is_bucket_filled = ds_map_find_value(obj_items.item_bucket, "filled");
			if is_bucket_filled == true index_to_draw = 1;
		}
		#endregion
		
		
		draw_sprite(ds_map_find_value(obj_items.inventory[i], "sprite"), index_to_draw,
					32+(box_dimentiones*_x)+(box_spacing*_x)+3,
					48+(box_dimentiones*_y)+(box_spacing*_y)+3);
		
		if _x == selected_row && _y == selected_column selected_item_index = i;
		
		i++;
	}
}
	
#endregion

#region //Exit game question
draw_set_font(fnt_textbox);

if !input_method_selected {
	draw_set_color(c_black);
	draw_text(35, 170, "Input style: " + obj_game.keyboard_mode);
}
if input_method_selected {
	draw_set_color(c_red);
	draw_text(35, 170, ">Input style: " + obj_game.keyboard_mode);
}
#endregion

#region //Description box
//Size
var x1 = 220
var y1 = 32
var x2 = 340
var y2 = 142
//Outline
draw_set_color(outline_color)
draw_roundrect(x1 - outline_size, y1 - outline_size,
			   x2 + outline_size, y2 + outline_size, false)
//Actual box
draw_set_color(c_white)
draw_roundrect(x1, y1, x2, y2, false)
#endregion

#region //Use item box
//Size
var x1 = 220
var y1 = y2+16
var x2 = 340
var y2 = y1+32
//Outline
draw_set_color(outline_color)
draw_roundrect(x1 - outline_size, y1 - outline_size,
			   x2 + outline_size, y2 + outline_size, false)
//Actual box
draw_set_color(c_white)
draw_roundrect(x1, y1, x2, y2, false)
#endregion

#region //Draw description
if state == "defult" {
	draw_set_font(fnt_textbox);
	draw_set_color(c_black);
	var selected_item_description = ds_map_find_value(obj_items.inventory[selected_item_index], "description");
	draw_text_ext(226, 40, selected_item_description, 14, 110);
	
}
#endregion

#region //Bottom box text
if state == "defult" {

	draw_set_color(c_black);
	draw_set_font(fnt_textbox);
	var equipable = ds_map_find_value(obj_items.inventory[selected_item_index], "equipable");
	var unequipable = ds_map_find_value(obj_items.inventory[selected_item_index], "unequipable");
	var equiped = ds_map_find_value(obj_items.inventory[selected_item_index], "equiped");
	var item_name = ds_map_find_value(obj_items.inventory[selected_item_index], "name");
	
	if (!equipable) {
		if item_name != "Empty" {
			draw_text_ext(226, 165, "This item is not equipable.", 12, 110);
		}
	} else if equiped {
		if unequipable {
			draw_text_ext(226, 165, "You can't unequip this.", 12, 110);
		} else {
			draw_text_ext(226, 165, "Would you like to unequip this?.", 12, 110);	
		}
		
	} else {
		draw_text_ext(226, 165, "Would you like to equip this item?", 12, 110);
	}
}
#endregion

#region //Equip question
if state == "equip question" {
	draw_set_font(fnt_textbox);
	draw_set_color(c_black);
	draw_text_ext(226, 40, "Would you like to equip this item?", 12, 110);
	
	//Draw question
	if answer == true {
		
		draw_set_color(c_red)
		draw_text(226, 165, "Yes")	
		draw_set_color(c_black)
		draw_text(300, 165, "No")
		
	} else if answer == false {
		
		draw_set_color(c_black)
		draw_text(226, 165, "Yes")	
		draw_set_color(c_red)
		draw_text(300, 165, "No")
	}	
	
}
#endregion

#region //Unequip question
if state == "unequip question" {
	draw_set_font(fnt_textbox);
	draw_set_color(c_black);
	draw_text_ext(226, 40, "Would you like to unequip this item?", 12, 110);
	
	//Draw question
	if answer == true {
		
		draw_set_color(c_red)
		draw_text(226, 165, "Yes")	
		draw_set_color(c_black)
		draw_text(300, 165, "No")
		
	} else if answer == false {
		
		draw_set_color(c_black)
		draw_text(226, 165, "Yes")	
		draw_set_color(c_red)
		draw_text(300, 165, "No")
	}	
	
}
#endregion

// debug checking for quardanates 
//if global.debug_mode {
//	draw_set_color(c_orange)
//	draw_text(device_mouse_x_to_gui(0)+4, 
//			  device_mouse_y_to_gui(0),
//			  string(device_mouse_x_to_gui(0))+ ", " +
//			  string(device_mouse_y_to_gui(0)));
//}
