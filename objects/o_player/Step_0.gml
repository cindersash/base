////////////////////////////////// Movement
// Support either WASD or the arrow keys
leftKey = keyboard_check_direct(ord("A")) || keyboard_check_direct(vk_left);
rightKey = keyboard_check_direct(ord("D")) || keyboard_check_direct(vk_right);
upKey = keyboard_check_direct(ord("W")) || keyboard_check_direct(vk_up);
downKey = keyboard_check_direct(ord("S")) || keyboard_check_direct(vk_down);

// In Game Maker, the top-left of the screen is (0, 0)
horizontalMovement = rightKey - leftKey;
verticalMovement = downKey - upKey;

// Move the object one pixel at a time.
// This will prevent large speeds from allowing the player to "jump" over obstacles in the way.
if (horizontalMovement != 0 || verticalMovement != 0) {
	pointDirection = point_direction(0, 0, horizontalMovement, verticalMovement);

	horizontalVelocity = round(lengthdir_x(baseSpeed, pointDirection));
	verticalVelocity = round(lengthdir_y(baseSpeed, pointDirection));
	
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
}

///////////////////////////////// Weapons
leftMouseButton = mouse_check_button(mb_left);

if (leftMouseButton) {
	bulletX = x + lengthdir_x(gunDistance, gunAngle + mouse_point_direction);
	bulletY = y + lengthdir_y(gunDistance, gunAngle + mouse_point_direction);
	
	created_bullet = instance_create_layer(bulletX, bulletY, "Instances", o_bullet);
	created_bullet.direction = mouse_point_direction;
}

///////////////////////////////// Camera
// Center the camera on the player
camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));
