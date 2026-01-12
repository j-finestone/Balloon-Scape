draw_set_halign(fa_right);
draw_set_alpha(1);
draw_set_color(c_black);
draw_set_font(fnt_textbox);

var item_amount = string(ds_map_find_value(obj_items.item_diamond, "amount"))

draw_text(x-camera_get_view_x(view), y-camera_get_view_y(view), item_amount);


draw_set_halign(fa_left);

y-=1
