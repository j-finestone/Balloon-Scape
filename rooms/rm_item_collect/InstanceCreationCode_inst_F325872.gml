message[0] = "Do you touch the orb? [choice]"

choice_type[0] = 9;

//message[1] = "As you interact with the glowing orb, you feel a hard wave flash over you."

if global.powers_to_recive = powers_to_recive.blast {
	message[1] = "You received the blast power. If your meter in the corner is shaking, you can press " + chr(global.key_blast) + " to launch out a large blue blast.";
	
}
if global.powers_to_recive = powers_to_recive.shuriken {
	message[1] = "You received shurikens. If your meter in the corner has even a little juice in it, you can press " + chr(global.key_shuriken) + " to shoot out a shuriken.";
	
}
if global.powers_to_recive = powers_to_recive.swim {
	message[1] = "You have just received the ability to swim in water.";
	
}
if global.powers_to_recive = powers_to_recive.hearts {
	message[1] = "You have just recieved an extra 2 hearts!";
	
}

message[2] = "You have also just recieved 1 out of 4 special keys, which are together capable of opening the gate at the top of the map."


message[3] = "Would you like to return home? [choice]";
	

choice_type[3] = 8;


