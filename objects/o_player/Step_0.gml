// Movement Keys
leftKey = keyboard_check_direct(ord("A")) || keyboard_check_direct(vk_left);
rightKey = keyboard_check_direct(ord("D")) || keyboard_check_direct(vk_right);
upKey = keyboard_check_direct(ord("W")) || keyboard_check_direct(vk_up);
downKey = keyboard_check_direct(ord("S")) || keyboard_check_direct(vk_down);

// In Game Maker, the top-left of the screen is (0, 0)
horizontalMovement = rightKey - leftKey;
verticalMovement = downKey - upKey;

if (horizontalMovement != 0 || verticalMovement != 0) {
	pointDirection = point_direction(0, 0, horizontalMovement, verticalMovement);

	horizontalVelocity = round(lengthdir_x(baseSpeed, pointDirection));
	verticalVelocity = round(lengthdir_y(baseSpeed, pointDirection));
	
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


// Camera
camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));
