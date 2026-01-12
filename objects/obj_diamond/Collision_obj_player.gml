if has_item("Diamond") {
	ds_map_replace(obj_items.item_diamond, "amount", ds_map_find_value(obj_items.item_diamond, "amount")+1)
	
	
} else {
	give_player(obj_items.item_diamond);
	
}

audio_play_sound(snd_pickup_coin, 0, 0)

instance_create_depth(x, y, 1000, obj_gem_counter)

ds_list_add(global.deleted_items, id)
instance_destroy();
