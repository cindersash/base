horizontalVelocity = lengthdir_x(baseSpeed, direction);
verticalVelocity = lengthdir_y(baseSpeed, direction);

horizontalIncrement = sign(horizontalVelocity) * 0.5;
verticalIncrement = sign(verticalVelocity) * 0.5;
	
while(abs(horizontalVelocity) > abs(horizontalIncrement) || abs(verticalVelocity) > abs(verticalIncrement)) {
	if (abs(horizontalVelocity) >= abs(horizontalIncrement)) {
		x += horizontalVelocity;
		horizontalVelocity -= horizontalIncrement;
	}
		
	if (abs(verticalVelocity) >= abs(verticalIncrement)) {
		y += verticalVelocity;
		verticalVelocity -= verticalIncrement;
	}

	if (instance_place(x, y, o_wall) != noone) {
		instance_destroy(id);
	}
}

if(x < 0 || x > room_width || y < 0 || y > room_height){
    instance_destroy(id);
}
