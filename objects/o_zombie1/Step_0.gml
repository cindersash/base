horizontalVelocity = round(lengthdir_x(baseSpeed, baseDirection));
verticalVelocity = round(lengthdir_y(baseSpeed, baseDirection));
	
// Move x and y separately to support "sliding" along walls
while(abs(horizontalVelocity) > 0 || abs(verticalVelocity) > 0) {
	if (abs(horizontalVelocity) > 0 && place_free(x + sign(horizontalVelocity), y)) {
		x += sign(horizontalVelocity);
	}
	horizontalVelocity -= sign(horizontalVelocity);
		
	if (abs(verticalVelocity) > 0 && place_free(x, y + sign(verticalVelocity))) {
		y += sign(verticalVelocity);
	}
	verticalVelocity -= sign(verticalVelocity);
}