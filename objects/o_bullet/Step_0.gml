var horizontalVelocity = lengthdir_x(1, direction);
var verticalVelocity = lengthdir_y(1, direction);
	
for (var i = 0; i < baseSpeed; i++) {
	x += horizontalVelocity;
	y += verticalVelocity;
	
	enemyCollisionInstance = instance_place(x, y, o_enemy);
	if (enemyCollisionInstance != noone) {
		// TODO proper damage balancing
		enemyCollisionInstance.hp -= 10;
		instance_destroy(id);
	}

	if (instance_place(x, y, o_wall) != noone) {
		instance_destroy(id);
	}
}

if (x < 0 || x > room_width || y < 0 || y > room_height){
    instance_destroy(id);
}
