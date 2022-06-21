// Enemy spawning
if (o_game_controller.constructionPhase) {
	return;
}

// Set a cap on the number of enemies that exist
if (instance_number(o_enemy) >= MAXIMUM_ENEMIES) {
	return;
}

if (random(10) >= 9) {
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
