baseDirection = point_direction(x, y, o_base.x, o_base.y);
horizontalVelocity = lengthdir_x(movementStep, baseDirection);
verticalVelocity = lengthdir_y(movementStep, baseDirection);
	
// Move x and y separately to support "sliding" along walls
for (i=0; i<baseSpeed; i++) {
	if (horizontalVelocity != 0 && place_free(x + horizontalVelocity, y)) {
		x += horizontalVelocity;
	}
		
	if (verticalVelocity != 0 && place_free(x, y + verticalVelocity)) {
		y += verticalVelocity;
	}
}
