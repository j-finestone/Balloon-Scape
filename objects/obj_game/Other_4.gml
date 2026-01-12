ds_list_clear(deleted_enemy_list)

for (var i = 0; i < ds_list_size(global.deleted_items); ++i) {
    instance_destroy(ds_list_find_value(global.deleted_items, i));
}


