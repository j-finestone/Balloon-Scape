if keyboard_check_pressed(global.key_interact) {
	if type == 0 {
	
	
	
	} else
	
	#region Go to clouds
	if type == 1 {
		if choice[selection_index] == "Yes" {
		
			//Change room	
			var room_changer = instance_create_depth(x, y, 0, obj_room_changer);
			room_changer.xx = -80
			room_changer.yy = -32
			room_changer.target_room = rm_sumbway_surfers
		}
	
	} else 
	#endregion
	
	#region Shoping box 
	if type == 2 {
		//Buying stuff from the weapons shop
		if global.money >= 15 {
			var already_has_item = false;
			
			if choice[selection_index] == "Long staff" {
				if has_item("Long staff") {
					already_has_item = true;
				} else {
					give_player(obj_items.item_long_staff);
				}
			}
			
			else if choice[selection_index] == "Wide staff" {				
				if has_item("Wide staff") {
					already_has_item = true;
				} else {
					give_player(obj_items.item_wide_staff);
				}
			}
			
			else if choice[selection_index] == "Shield" {
				if has_item("Shield") {
					already_has_item = true;
				} else {
					give_player(obj_items.item_shield);
					global.shield_unlocked = true;
				}
		
			}
			//If the player tries to buy an item he has already purchased
			if already_has_item == true {
				obj_textbox.text_rapped = string_rap("You already have that!", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
				
			} else {
				
				obj_textbox.text_rapped = string_rap("Here you go! You can equip and unequip it in your inventory by pressing enter.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
				audio_play_sound(snd_purchase, 0, false)
				global.money -= 15;
			}
			
		}
		
	}
	#endregion
	
	#region //Hot air ballon hint 1 (Snow)
	if type == 3 {
		if choice[selection_index] = "Yes" {
			
			//Adding it to map
			if ds_list_find_index(obj_game.map_marker_id, inst_43909A09) == -1 {
				if global.money >= 5 {
					global.money -= 5
					audio_play_sound(snd_purchase, 0, 0);
					ds_list_add(obj_game.map_marker_id, inst_43909A09)
				
					obj_textbox.text_rapped = string_rap("Ok. I've marked the location of a hot air ballon in red on your map.", obj_textbox.line_max_width, 0, false)
					obj_textbox.message_length = string_length(obj_textbox.text_rapped)
				} else {
					
					obj_textbox.text_rapped = string_rap("But you don't have enough money.", obj_textbox.line_max_width, 0, false)
					obj_textbox.message_length = string_length(obj_textbox.text_rapped)
					
				}
			} else {
				//In the case the the player has already recived the hint
				obj_textbox.text_rapped = string_rap("But I've already given you a hint.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
				
			}
		} else if choice[selection_index] == "No" {
				obj_textbox.text_rapped = string_rap("Really? Ok, well if you ever need the hint, just ask me.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			
			
		}
	}
	#endregion
	#region //Hot air ballon hint 2 (Desert)
	if type == 4 {
		if choice[selection_index] = "Yes" {
			//Adding it to map
			if ds_list_find_index(obj_game.map_marker_id, inst_2D9A2C73) == -1 {
				
				ds_list_add(obj_game.map_marker_id, inst_2D9A2C73)
				
				obj_textbox.text_rapped = string_rap("Ok. I've marked the location of a hot air ballon in red on your map.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			} else {
				//In the case the the player has already recived the hint
				obj_textbox.text_rapped = string_rap("But I've already given you a hint.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			}
			
		} else if choice[selection_index] == "No" {
				obj_textbox.text_rapped = string_rap("Really? Ok, well if you ever need the hint, just ask me.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			
			
		}
	}
	#endregion
	#region //Hot air ballon hint 3 (Ocean)
	if type == 5 {
		if choice[selection_index] = "Yes" {
			//Adding it to map
			if ds_list_find_index(obj_game.map_marker_id, inst_7F913B3) == -1 {
				
				ds_list_add(obj_game.map_marker_id, inst_7F913B3)
				
				obj_textbox.text_rapped = string_rap("Ok. I've marked the location of a hot air ballon in red on your map.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			} else {
				//In the case the the player has already recived the hint
				obj_textbox.text_rapped = string_rap("But I've already given you a hint.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			}
			
		} else if choice[selection_index] == "No" {
				obj_textbox.text_rapped = string_rap("Really? Ok, well if you ever need the hint, just ask me.", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			
			
		}
	}
	#endregion
	
	#region //Return home from cloud cities
	if type == 8 {
		
		//Change room	
		var room_changer = instance_create_depth(x, y, 0, obj_room_changer);
		room_changer.xx = 1904;
		room_changer.yy = 1952;
		room_changer.target_room = rm_world;
	}
	#endregion
	
	#region //Give player power question
	if type == 9 {
	
			if choice[selection_index] == "Yes" {
				//Sound effect for recieving a power
			
				//Wait a few seconds 
				obj_textbox.pause_text = true 
				obj_textbox.alarm[0] = 500;
			
				//Start cutscene
				global.start_power_recieving_cutscene = true;
			
				//Give player their power
				if global.powers_to_recive = powers_to_recive.blast {
					give_player(obj_items.item_blast_power);
				}
				if global.powers_to_recive = powers_to_recive.shuriken {
					give_player(obj_items.item_shurikens);
				}
				if global.powers_to_recive = powers_to_recive.swim {
					give_player(obj_items.item_floaty);
				}
				if global.powers_to_recive = powers_to_recive.hearts {
					global.player_max_health = 6;
					health = 6;
				}
				//Give player the key
				if has_item("Key") {
					
					ds_map_replace(obj_items.item_key, "amount", ds_map_find_value(obj_items.item_key, "amount")+1)
				} else {
					give_player(obj_items.item_key);
				}
			}		
		
			if choice[selection_index] == "No" {	
				instance_destroy(obj_textbox);	
				global.paused = false;
			}
		//}
	}
	#endregion
	
	
	#region //Open desert gate
	if type == 10 {
		if choice[selection_index] == "Yes" {
			
			if (has_item("Bucket")) {
				
				var is_bucket_filled = ds_map_find_value(obj_items.item_bucket, "filled");
				if (is_bucket_filled == true) {
					
					global.paused = false;
			
					//Gate			
					instance_activate_object(inst_B4C633B);
					ds_list_add(global.deleted_items, inst_B4C633B);
					instance_destroy(inst_B4C633B);
					//Textbox marker
					instance_activate_object(inst_12BFA3B5);
					ds_list_add(global.deleted_items, inst_12BFA3B5)
					instance_destroy(inst_12BFA3B5)
					//Textbox
					instance_destroy(obj_textbox)


			
					//Play sound
					audio_play_sound(snd_gate_shuts_down, 0, 0)
				}
			}
		}
		
		if choice[selection_index] == "No" {
			instance_destroy(obj_textbox)
			global.paused = false;
			
		}
	}
	#endregion
	
	#region //Open ocean gate
	if type == 11 {
		
		if (has_item("Diamond")) {
			
			//ds_map_replace(obj_items.inventory[find_item("Diamond")], "amount", 20)
			var diamond_amount = ds_map_find_value(obj_items.item_diamond, "amount");
			if (diamond_amount >= 20) {
		
				if choice[selection_index] == "Yes" {
					global.paused = false;
			
			
					var gate_id = inst_5C6C5AE0;
					var textbox_marker_id = inst_2773562B;
					//Gate			
					instance_activate_object(gate_id);
					ds_list_add(global.deleted_items, gate_id);
					instance_destroy(gate_id);
					//Textbox marker
					instance_activate_object(textbox_marker_id);
					ds_list_add(global.deleted_items, textbox_marker_id)
					instance_destroy(textbox_marker_id)
					//Textbox
					instance_destroy(obj_textbox)


			
					//Play sound
					audio_play_sound(snd_gate_shuts_down, 0, 0);
				}
			}
		}
		
		if choice[selection_index] == "No" {
			instance_destroy(obj_textbox)
			global.paused = false;
			
		}
	}
	#endregion
	
	#region //Get bucket
	if type == 12 {
		
		if choice[selection_index] == "Yes" {
			give_player(obj_items.item_bucket)
			audio_play_sound(snd_recive_bucket, 0, 0)
			//Destroy and recreate textbox marker
			var _x = inst_6749CA4B.x
			var _y = inst_6749CA4B.y
			var x_scale = inst_6749CA4B.image_xscale;
			var y_scale = inst_6749CA4B.image_yscale;
			
			instance_destroy(inst_6749CA4B);
			var box_marker = instance_create_depth(_x, _y, depth, obj_textbox_marker);
			box_marker.image_xscale = x_scale;
			box_marker.image_yscale = y_scale;
			box_marker.message[0] = "There is a lake west of here filled with purple water. If you put some in the bucket I gave you, you can unlock the gate to my left."
		}
		
		if choice[selection_index] == "No" {
			
			
		}
	}
	#endregion
	
	#region //Fill up bucket
	if type == 13 {
		if choice[selection_index] == "Yes" {
			if (has_item("Bucket")) {
				var is_bucket_filled = ds_map_find_value(obj_items.item_bucket, "filled");
				
				if is_bucket_filled == true {
					
					obj_textbox.text_rapped = string_rap("Your bucket is already filled with water.", obj_textbox.line_max_width, 0, false)
					obj_textbox.message_length = string_length(obj_textbox.text_rapped)
					
					
				}
				
				if is_bucket_filled == false {
					
					obj_textbox.text_rapped = string_rap("You reach into the lake and fill up your bucket with purple water.", obj_textbox.line_max_width, 0, false)
					obj_textbox.message_length = string_length(obj_textbox.text_rapped)
					
					ds_map_replace(obj_items.item_bucket, "filled", true);
					audio_play_sound(snd_bucket_filling, 0, 0);
				}			
			} else {
				//Doesn't have bucket
				obj_textbox.text_rapped = string_rap("But you don't have a bucket to fill up!", obj_textbox.line_max_width, 0, false)
				obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			
			}
		}
		
		if choice[selection_index] == "No" {
			instance_destroy(obj_textbox) 
			global.paused = false;
			
			
		}
	}
	#endregion
	
	#region //Open end-game gate
	if type == 14 {
		
		if (has_item("Key")) {
			
			//ds_map_replace(obj_items.inventory[find_item("Diamond")], "amount", 20)
			var key_amount = ds_map_find_value(obj_items.item_key, "amount");
		
				if choice[selection_index] == "Yes" {
					if (key_amount >= 4) {
						global.paused = false;
			
			
						var gate_id = inst_13F68B99;
						var textbox_marker_id = inst_7A51100D;
						//Gate			
						instance_activate_object(gate_id);
						ds_list_add(global.deleted_items, gate_id);
						instance_destroy(gate_id);
						//Textbox marker
						instance_activate_object(textbox_marker_id);
						ds_list_add(global.deleted_items, textbox_marker_id)
						instance_destroy(textbox_marker_id)
						//Textbox
						instance_destroy(obj_textbox)


			
						//Play sound
						audio_play_sound(snd_gate_shuts_down, 0, 0);
				} else {
					//Doesn't have enough keys
					obj_textbox.text_rapped = string_rap("Sorry, you don't have enough keys. You need " + string(4-key_amount) + " more.", obj_textbox.line_max_width, 0, false)
					obj_textbox.message_length = string_length(obj_textbox.text_rapped)
				}
				
			}
		} else {
			//Doesn't have any keys
			obj_textbox.text_rapped = string_rap("Sorry, but you don't have any keys.", obj_textbox.line_max_width, 0, false)
			obj_textbox.message_length = string_length(obj_textbox.text_rapped)
			
		}
		
		
		if choice[selection_index] == "No" {
			instance_destroy(obj_textbox)
			global.paused = false;
			
		}
	}
	#endregion
	
	#region //end game
		if type == 15 {
			if choice[selection_index] == "Yes" {
				
			//Change room	
			var room_changer = instance_create_depth(x, y, 0, obj_room_changer);
			room_changer.xx = -48
			room_changer.yy = -48
			room_changer.target_room = rm_game_end_cutscene;
			}
	
		}
	#endregion
	
	instance_destroy();
}
