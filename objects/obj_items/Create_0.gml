event_user(0);

//Initializes items
for (var i = 0; i < 20; i++) {	
	inventory[i] = ds_map_create();
	ds_map_copy(inventory[i], item_empty);
	
}

//Give player the staff
give_player(item_short_staff);

