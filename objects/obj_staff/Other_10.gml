/// @description Choose sprite
update_weapon();

#region //Different weapons
if global.weapon == "defult" {	
	switch (sprite) {
	    case "down":
	        sprite_index = spr_staff_down;
	        break;
	    case "horizontal":
	        sprite_index = spr_staff_horizontal;
	        break;
	    case "up":
	        sprite_index = spr_staff_up;
	        break;
	}
}

if global.weapon = "wide" {
	switch (sprite) {
	    case "down":
	        sprite_index = spr_staff_wide_down;
	        break;
	    case "horizontal":
	        sprite_index = spr_staff_wide_horizontal;
	        break;
	    case "up":
	        sprite_index = spr_staff_wide_up;
	        break;
	}
}
if global.weapon = "long" {
	switch (sprite) {
	    case "down":
	        sprite_index = spr_staff_long_down;
	        break;
	    case "horizontal":
	        sprite_index = spr_staff_long_horizontal;
	        break;
	    case "up":
	        sprite_index = spr_staff_long_up;
	        break;
	}
}
#endregion

