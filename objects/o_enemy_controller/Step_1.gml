if (random(120) >= 119) {
	// TODO randomize spawn
	creationX = 1000;
	creationY = 1000;
	if (place_free(creationX, creationY)) {
		instance_create_layer(creationX, creationY, "Instances", o_zombie1);
	}
}
