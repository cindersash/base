if (random(60) >= 59) {
	// TODO randomize spawn
	randomBool = choose(false, true);
	
	if (randomBool) {
		creationX = choose(0, room_width);
		creationY = random(room_height);
	} else {
		creationX = random(room_width);
		creationY = choose(0, room_height);
	}

	if (place_free(creationX, creationY)) {
		instance_create_layer(creationX, creationY, "Instances", o_zombie1);
	}
}
