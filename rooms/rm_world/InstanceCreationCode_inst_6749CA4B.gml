if (!has_item("Bucket")) {
	message[0] = "To unlock that gate you need a bucket of special purple water."
	message[1] = "There is a lake filled with the purple water you need west of here."
	message[2] = "Would you like me to give you a bucket? [choice]"
	
	choice_type[2] = 12;
	
} else {
	
	message[0] = "There is a lake west of here filled with purple water. If you put some in the bucket I gave you, you can unlock the gate to my left."
	
}
