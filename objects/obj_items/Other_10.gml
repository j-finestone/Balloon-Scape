/// @description Define items
#region //Empty item
item_empty = ds_map_create();
ds_map_add(item_empty, "name", "Empty");
ds_map_add(item_empty, "amount", 0);
ds_map_add(item_empty, "sprite", spr_empty);
ds_map_add(item_empty, "equipable", false);
ds_map_add(item_empty, "unequipable", true);
ds_map_add(item_empty, "equiped", false);
ds_map_add(item_empty, "description", "An empty inventory slot.");
#endregion

#region //Shield
item_shield = ds_map_create();
ds_map_add(item_shield, "name", "Shield");
ds_map_add(item_shield, "amount", 1);
ds_map_add(item_shield, "sprite", spr_sheild);
ds_map_add(item_shield, "equipable", true);
ds_map_add(item_shield, "unequipable", false);
ds_map_add(item_shield, "equiped", true);
ds_map_add(item_shield, "description", "A shield that goes out infront of you to block enemies and projectiles. you can use it by pressing " + chr(global.key_shield) + ".");
#endregion

#region //Staffs
#region //Short staff
item_short_staff = ds_map_create();
ds_map_add(item_short_staff, "name", "Short staff");
ds_map_add(item_short_staff, "amount", 1);
ds_map_add(item_short_staff, "sprite", spr_staff_horizontal);
ds_map_add(item_short_staff, "equipable", true);
ds_map_add(item_short_staff, "unequipable", true);
ds_map_add(item_short_staff, "equiped", true);
ds_map_add(item_short_staff, "description", "A staff capable of shooting magic blue rays at an enemy. you can use it by pressing " + chr(global.key_interact) + ".");
#endregion

#region //Long staff
item_long_staff = ds_map_create();
ds_map_add(item_long_staff, "name", "Long staff");
ds_map_add(item_long_staff, "amount", 1);
ds_map_add(item_long_staff, "sprite", spr_staff_horizontal);
ds_map_add(item_long_staff, "equipable", true);
ds_map_add(item_long_staff, "unequipable", true);
ds_map_add(item_long_staff, "equiped", false);
ds_map_add(item_long_staff, "description", "A staff capable of shooting rays far out in front of you. you can use it by pressing " + chr(global.key_interact) + ".");
#endregion

#region //Wide staff
item_wide_staff = ds_map_create();
ds_map_add(item_wide_staff, "name", "Wide staff");
ds_map_add(item_wide_staff, "amount", 1);
ds_map_add(item_wide_staff, "sprite", spr_staff_horizontal);
ds_map_add(item_wide_staff, "equipable", true);
ds_map_add(item_wide_staff, "unequipable", true);
ds_map_add(item_wide_staff, "equiped", false);
ds_map_add(item_wide_staff, "description", "A wide staff capable of shooting rays far out to the sides of you. you can use it by pressing " + chr(global.key_interact) + ".");
#endregion
#endregion

#region //Diamond item
item_diamond = ds_map_create();
ds_map_add(item_diamond, "name", "Diamond");
ds_map_add(item_diamond, "amount", 1);
ds_map_add(item_diamond, "sprite", spr_diamond);
ds_map_add(item_diamond, "equipable", false);
ds_map_add(item_diamond, "unequipable", true);
ds_map_add(item_diamond, "equiped", false);
ds_map_add(item_diamond, "description", "A shiny green dimond. I wonder what these can be used for. You have "+string(ds_map_find_value(item_diamond, "amount"))+" of these.");
#endregion

#region //Blast power
item_blast_power = ds_map_create();
ds_map_add(item_blast_power, "name", "Blast power");
ds_map_add(item_blast_power, "amount", 1);
ds_map_add(item_blast_power, "sprite", spr_blast_x);
ds_map_add(item_blast_power, "equipable", true);
ds_map_add(item_blast_power, "unequipable", false);
ds_map_add(item_blast_power, "equiped", true);
ds_map_add(item_blast_power, "description", "A magic blue orb. If your meter in the corner is shaking, you can use this by pressing "+chr(global.key_blast)+".");
#endregion

#region //Shurikens
item_shurikens = ds_map_create();
ds_map_add(item_shurikens, "name", "Shurikens");
ds_map_add(item_shurikens, "amount", 1);
ds_map_add(item_shurikens, "sprite", spr_shuriken_item);
ds_map_add(item_shurikens, "equipable", true);
ds_map_add(item_shurikens, "unequipable", false);
ds_map_add(item_shurikens, "equiped", true);
ds_map_add(item_shurikens, "description", "Gray shurikens. You can throw them out at the expense of a little charge in your meter by pressing "+chr(global.key_shuriken)+".");
#endregion

#region //Floaty
item_floaty = ds_map_create();
ds_map_add(item_floaty, "name", "Floaty");
ds_map_add(item_floaty, "amount", 1);
ds_map_add(item_floaty, "sprite", spr_floaty_item);
ds_map_add(item_floaty, "equipable", true);
ds_map_add(item_floaty, "unequipable", true);
ds_map_add(item_floaty, "equiped", true);
ds_map_add(item_floaty, "description", "A light greenish floaty. This allows you to swim in water.");
#endregion

#region //Key
item_key = ds_map_create();
ds_map_add(item_key, "name", "Key");
ds_map_add(item_key, "amount", 1);
ds_map_add(item_key, "sprite", spr_key_item);
ds_map_add(item_key, "equipable", false);
ds_map_add(item_key, "unequipable", true);
ds_map_add(item_key, "equiped", false);
ds_map_add(item_key, "description", "A special golden key. With four of them, you could open the gate at the top of the map. Right now you have "+string(ds_map_find_value(item_diamond, "amount"))+".");
#endregion

#region //Bucket
item_bucket = ds_map_create();
ds_map_add(item_bucket, "name", "Bucket");
ds_map_add(item_bucket, "amount", 1);
ds_map_add(item_bucket, "sprite", spr_bucket);
ds_map_add(item_bucket, "equipable", false);
ds_map_add(item_bucket, "unequipable", true);
ds_map_add(item_bucket, "equiped", false);
ds_map_add(item_bucket, "description", "A gray bucket. You can fill it up with purple water by going text to a purple lake");
ds_map_add(item_bucket, "filled", false);
#endregion

