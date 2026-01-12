var msg_current = obj_textbox.message_current
type = obj_textbox.choice_type[msg_current];

choice[0] = "Yes"
choice[1] = "No"
choice_number = array_length(choice);

#region //box prefrences
screen_middle_x = obj_camera.view_width/2
screen_middle_y = obj_camera.view_height/2
size_x = 50
size_y = 25
ofset_y_from_top = -10
ofset_x_from_left = 115
outline_size = 3

//outline
outline_color = $061B42
box_color = c_white

//text
text_ofset_x = 5
text_ofset_y = 6
columb_offset = 48;
gap = 14;
selection_index = 0

depth = -1000
#endregion



//Type start
if type == 0 {
	//Error message
	instance_destroy()
	
} else if type == 1 {
	//Question to see if you want to go to up the hot air ballon
	choice_number = 2
	
	choice[0] = "Yes";
	choice[1] = "No";
	
} else if type == 2 {
	//Question to see if you want to buy something
	choice_number = 3;
	
	choice[0] = "Long staff";
	choice[1] = "Wide staff";
	choice[2] = "Shield";
	
} else if type = 3 {
	//Asking if you want the first hot air ballon hint
	choice_number = 2;
	
	choice[0] = "Yes";
	choice[1] = "No";
} else if type == 8 {
	//Asking if you want to return home from a cloud city
	choice_number = 1;
	
	choice[0] = "Yes";


} else if type == 9 {
	choice_number = 2
	
	choice[0] = "Yes";
	choice[1] = "No";
} else if type == 10 {
	choice_number = 2
	
	choice[0] = "Yes";
	choice[1] = "No";
}
