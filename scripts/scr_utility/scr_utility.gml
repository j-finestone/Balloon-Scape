/// string_wordwrap_width(string,width,break,split)
function string_rap(argument0, argument1, argument2, argument3) {
	//
	//  Returns a given string, word wrapped to a pixel width,
	//  with line break characters inserted between words.
	//  Uses the currently defined font to determine text width.
	//
	//      string      text to word wrap, string
	//      width       maximum pixel width before a line break, real
	//      break       line break characters to insert into text, string
	//      split       split words that are longer than the maximum, bool
	//
	/// GMLscripts.com/license
	{
	    var pos_space, pos_current, text_current, text_output;
	    pos_space = -1;
	    pos_current = 1;
	    text_current = argument0;
	    if (is_real(argument2)) argument2 = "\n";
	    text_output = "";
	    while (string_length(text_current) >= pos_current) {
	        if (string_width(string_copy(text_current,1,pos_current)) > argument1) {
	            //if there is a space in this line then we can break there
	            if (pos_space != -1) {
	                text_output += string_copy(text_current,1,pos_space) + string(argument2);
	                //remove the text we just looked at from the current text string
	                text_current = string_copy(text_current,pos_space+1,string_length(text_current)-(pos_space));
	                pos_current = 1;
	                pos_space = -1;
	            } else if (argument3) {
	                //if not, we can force line breaks
	                text_output += string_copy(text_current,1,pos_current-1) + string(argument2);
	                //remove the text we just looked at from the current text string
	                text_current = string_copy(text_current,pos_current,string_length(text_current)-(pos_current-1));
	                pos_current = 1;
	                pos_space = -1;
	            }
	        }
	        if (string_char_at(text_current,pos_current) == " ") pos_space = pos_current;
	        pos_current += 1;
	    }
	    if (string_length(text_current) > 0) text_output += text_current;
	    return text_output;
	}


}

//creates textboxs (duh)
function create_textbox() {
	//create textbox
		var box = instance_create_depth(x, y, depth, obj_textbox) {
			
			//loops through every argument and adds it to the textboxs
			for (var i = 0; i < argument_count; ++i) {
				box.message[i] = argument[i]
		
			}	

			box.message_end = argument_count;
			box.text_rapped = string_rap(argument[0], 175*3-20, 0, false)
			box.message_length = string_length(box.text_rapped)
			
		}
	
}

function combine_arrays(array1, array2) {
for(var i = 0; i < array_length_1d(array2); i++) {
	array1[array_length_1d(array1)] = array2[i];
}

return array1;
}
	
	
function is_perpendicular(object) {
	
	if object.x == x || object.y == y return true else return false;
	
}

function update_weapon() {
	if has_item("Short staff") {
		if ds_map_find_value(obj_items.inventory[find_item("Short staff")], "equiped") {
			global.weapon = "defult";

		}
	}
	if has_item("Long staff") {
		if ds_map_find_value(obj_items.inventory[find_item("Long staff")], "equiped") {
			global.weapon = "long";

		}
	}
	if has_item("Wide staff") {
		if ds_map_find_value(obj_items.inventory[find_item("Wide staff")], "equiped") {
			global.weapon = "wide";

		}
	}	
}
