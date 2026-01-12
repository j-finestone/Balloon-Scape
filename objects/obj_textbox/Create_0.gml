#region //box prefrences
screen_middle_x = obj_camera.view_width/2
screen_middle_y = obj_camera.view_height/2
size_x = 175
size_y = 35
ofset_y_from_top = -65
outline_size = 3
line_max_width = size_x*2 - 16

//outline
outline_color = $061B42
box_color = c_white
//text
text_ofset_x = 5
text_ofset_y = 8

depth = -1000
x = obj_player.x
y = obj_player.y
#endregion
message[0] = "This is an error"

text_rapped = string_rap(message[0], line_max_width, 0, false)
message_length = string_length(text_rapped)
message_end = array_length(message) //how many messages are in the array

message_draw = "" //message thats actually being drawn
message_speed = .5 //speed at which charecters appear
message_current = 0 //the message in the array that is being shown
characters = 0 //how manny characters that are being shown from the message_current
pause_text = false //if the text is pauseing for stuff like camas and periods.

//so the text box goes on top when the player is on top
if (obj_player.y - view_yport[0] >= 260) {
		is_player_ontop = -1
	} else {
		is_player_ontop = -1
	}
	
global.paused = true
