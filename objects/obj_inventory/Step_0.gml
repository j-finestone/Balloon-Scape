var state_previous = state;
if state == "defult" {
	var row_dir =  keyboard_check_pressed(global.key_right)-keyboard_check_pressed(global.key_left);
	var column_dir =  keyboard_check_pressed(global.key_down)-keyboard_check_pressed(global.key_up);
	
	selected_row += row_dir;
	selected_column += column_dir;

	//Sound
	if row_dir != 0 || column_dir != 0 audio_play_sound(snd_inventory_move, 0, 0);

	//Clamping values
	if selected_row >= box_array_width+1 selected_row = 0
	if selected_row <= -1 selected_row = box_array_width

	if selected_column >= box_array_length+2 selected_column = 0
	if selected_column <= -1 selected_column = box_array_length

	input_method_selected = selected_column > box_array_length

	//change input meathod
	if keyboard_check_pressed(global.key_interact) && input_method_selected {
		if obj_game.keyboard_mode == "Defult" obj_game.keyboard_mode = "WASD"
		else if obj_game.keyboard_mode == "WASD" obj_game.keyboard_mode = "Defult";
		
		audio_play_sound(snd_inventory_select, 0, 0)
	}
}

if !global.paused instance_destroy();
	
	
#region //Update description of items to reflect the keys and amounts
if has_item("Diamond") {
	ds_map_replace(obj_items.inventory[find_item("Diamond")], "description", "A shiny green dimond. I wonder what these can be used for. You have "+string(ds_map_find_value(obj_items.item_diamond, "amount"))+" of these.");
}
if has_item("Blast power") { 
	ds_map_replace(obj_items.inventory[find_item("Blast power")], "description", "A magic blue orb. If your meter in the corner is shaking, you can use this by pressing "+chr(global.key_blast)+".");
}
if has_item("Shurikens") { 
	ds_map_replace(obj_items.inventory[find_item("Shurikens")], "description","Gray shurikens. You can throw them out at the expense of a little charge in your meter by pressing "+chr(global.key_shuriken)+".");
}
if has_item("Key") {
	ds_map_replace(obj_items.inventory[find_item("Key")], "description", "A special golden key. With four of them, you could open the gate at the top of the map. Right now you have "+string(ds_map_find_value(obj_items.item_key, "amount"))+".");
}
if has_item("Long staff") {
	ds_map_replace(obj_items.inventory[find_item("Long staff")], "description", "A staff capable of shooting rays far out in front of you. you can use it by pressing " + chr(global.key_interact) + ".");
}
if has_item("Wide staff") {
	ds_map_replace(obj_items.inventory[find_item("Wide staff")], "description", "A wide staff capable of shooting rays far out to the sides of you. you can use it by pressing " + chr(global.key_interact) + ".");
}
ds_map_replace(obj_items.inventory[find_item("Short staff")], "description", "A staff capable of shooting magic blue rays at an enemy. you can use it by pressing " + chr(global.key_interact) + ".");

if has_item("Shield") {
	if obj_game.keyboard_mode = "Defult" {
		ds_map_replace(obj_items.inventory[find_item("Shield")], "description", "A shield that goes out infront of you to block enemies and projectiles. you can use it by pressing " + "SHIFT" + ".")
	}
	else if obj_game.keyboard_mode = "WASD" {
		ds_map_replace(obj_items.inventory[find_item("Shield")], "description", "A shield that goes out infront of you to block enemies and projectiles. you can use it by pressing " + "[" + ".")
	}
	
}

//Canging the description of item_bucket to reflect if it's filled or not
if ds_map_find_value(obj_items.item_bucket, "filled") {
	ds_map_replace(obj_items.inventory[find_item("Bucket")], "description", "A gray bucket filled with a purple liquid.");
}
#endregion


//Changing to the "Do you want to use this item?" mode
var equipable = ds_map_find_value(obj_items.inventory[selected_item_index], "equipable");
var unequipable = ds_map_find_value(obj_items.inventory[selected_item_index], "unequipable");
var equiped = ds_map_find_value(obj_items.inventory[selected_item_index], "equiped");
var item_name = ds_map_find_value(obj_items.inventory[selected_item_index], "name");
	
//While being asked what you want to do
if (state == "equip question" || state = "unequip question") {
	//Changing your answer
	if keyboard_check_pressed(global.key_left) ||
	   keyboard_check_pressed(global.key_right) {
		   
		   answer = !answer;
		   audio_play_sound(snd_inventory_select, 0, 0);
	   }
	
}


//Start open equip question menu
if state == "defult" && state_previous == "defult" && equipable && !equiped {
	if keyboard_check_pressed(global.key_interact) { 
		
		audio_play_sound(snd_inventory_select, 0, 0);
		state = "equip question";
		answer = 1
	}
	
	//prevent you from trying to unequip unequipable items
	if equiped && unequipable {
		audio_stop_sound(snd_inventory_select);
		state = "defult"
		
	}
}

//Start to open unequip menu
if state == "defult" && state_previous == "defult" && !unequipable && equiped {
	if keyboard_check_pressed(global.key_interact) { 
		
		audio_play_sound(snd_inventory_select, 0, 0);
		state = "unequip question"
		answer = 1;
	}
}

//Trying to equip an item
if (state == "equip question") && state_previous == "equip question" && keyboard_check_pressed(global.key_interact) {
	//If you click that you want to equip the item
	if answer == true {
		audio_play_sound(snd_equip_item, 0, 0)
		
		if item_name == "Short staff" {
			
			if has_item("Long staff") {
				ds_map_replace(obj_items.inventory[find_item("Long staff")], "equiped", false);	
			}	
		
			if has_item("Wide staff"){
				ds_map_replace(obj_items.inventory[find_item("Wide staff")], "equiped", false);	
			}	
		
			ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
	}
		
		if item_name == "Long staff" {
			
			if has_item("Short staff") {
				ds_map_replace(obj_items.inventory[find_item("Short staff")], "equiped", false);	
			}	
		
			if has_item("Wide staff"){
				ds_map_replace(obj_items.inventory[find_item("Wide staff")], "equiped", false);	
			}	
		
			ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		}
		
		if item_name == "Wide staff" {
			
			if has_item("Short staff") {
				ds_map_replace(obj_items.inventory[find_item("Short staff")], "equiped", false);	
			}	
		
			if has_item("Long staff"){
				ds_map_replace(obj_items.inventory[find_item("Long staff")], "equiped", false);	
			}	
		
			ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		}
		
		if item_name == "Shield" {
			
			global.shield_unlocked = true;
		
			ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		}
		
		if item_name == "Blast power" {		
		ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		
		}
			
		if item_name == "Shurikens" {		
		ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		
		}
		
		if item_name == "Floaty" {		
		ds_map_replace(obj_items.inventory[selected_item_index], "equiped", true);	
		
		}
	}
	if answer == false {
		state = "defult"
		
	}
	
	
	
	
	state = "defult";
}
	
	
//Trying to enequip an item
if state == "unequip question" && state_previous == "unequip question" && keyboard_check_pressed(global.key_interact) {
	
	if answer = true {
		ds_map_replace(obj_items.inventory[selected_item_index], "equiped", false);
		
		audio_play_sound(snd_unequip_item, 0, 0);
	}
	state = "defult"
}
