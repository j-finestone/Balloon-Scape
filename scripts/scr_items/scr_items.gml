function give_player(item_type) {
	var free_slot = 0;
	for (var i = 0; i < 20; i++) {
	    if ds_map_find_value(obj_items.inventory[i], "name") == "Empty" {
			
			free_slot = i
			break;
		}
	}
	
	
	ds_map_copy(obj_items.inventory[free_slot], item_type);
	
}

function has_item(item_type_string) {
	for (var i = 0; i < 20; i++) {
		if ds_map_find_value(obj_items.inventory[i], "name") == item_type_string {
			
			return true;
			exit;
			
		}
	}
	return false;
}
	
function find_item(item_type_string) {
		for (var i = 0; i < 20; i++) {
		if ds_map_find_value(obj_items.inventory[i], "name") == item_type_string {
			
			return i;
			exit;
			
		}
	}
	return 0;
}
