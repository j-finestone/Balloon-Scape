//scrolling
if keyboard_check_pressed(global.key_down) selection_index += 1
if keyboard_check_pressed(global.key_up) selection_index -= 1

if selection_index < 0 selection_index = choice_number
if selection_index >= choice_number selection_index = 0

if type == 0 {
	//Error
	
} else if type == 2 {
	
	//Stoping you from buying things that cost too much money
	if global.money < 20 {
		obj_textbox.message[2] = "Sorry. You don't have enough money for that."
	}
	
	//Cancles buying something
	if keyboard_check_pressed(global.key_text_scrub) {
		
		global.paused = false;
		instance_destroy(obj_textbox)
		instance_destroy();
	}
}
